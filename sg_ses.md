SG_SES(8)                                                                                         SG3_UTILS                                                                                         SG_SES(8)



NAME
       sg_ses - access a SCSI Enclosure Services (SES) device

SYNOPSIS
       sg_ses  [--byte1=B1]  [--clear=STR] [--control] [--data=H,H...] [--descriptor=DN] [--enumerate] [--filter] [--get=STR] [--help] [--hex] [--index=IIA | --index=TIA,II] [--inner-hex] [--join] [--list]
       [--nickname=SEN] [--nickid=SEID]  [--page=PG] [--raw] [--set=STR] [--status] [--verbose] [--version] DEVICE

DESCRIPTION
       Fetches management information from a SCSI Enclosure Service (SES) device.  This utility can also modify the state of a SES device. The DEVICE should be a SES device which may be a dedicated  enclo‐
       sure  services  processor in which case an INQUIRY response's Peripheral Device Type is 13 [0xd]. Alternatively it may be attached to another type of SCSI device (e.g. a disk) in which case the Enc‐
       Serv bit is set in its INQUIRY response.

       If no options are given (i.e. only the DEVICE argument is given) then the names of all diagnostic pages supported are listed. Most, but not necessarily all, of the named diagnostic pages are defined
       in  the  SES standards and drafts. The most recent reference for this utility is the draft SCSI Enclosure Services 3 document T10/2149-D Revision 6 at http://www.t10.org . Existing standards for SES
       and SES-2 are ANSI INCITS 305-1998 and ANSI INCITS 448-2008 respectively.

       Changing the state of an enclosure (e.g. requesting the "ident" (locate) LED to flash on a disk carrier in an array) is typically done using a read-modify-write cycle. See the  section  on  CHANGING
       STATE below.

       There is a web page discussing this utility at http://sg.danny.cz/sg/sg_ses.html .

       In the following sections "page" refers to a diagnostic page, either fetched with a SCSI RECEIVE DIAGNOSTIC RESULTS command or sent to the DEVICE with a SCSI SEND DIAGNOSTIC command.

OPTIONS
       Arguments to long options are mandatory for short options as well.  The options are arranged in alphabetical order based on the long option name.

       -b, --byte1=B1
              some  modifiable  pages  may  need byte 1 (i.e. the second byte) set. In the Enclosure Control page, byte 1 contains the INFO, NON-CRIT, CRIT and UNRECOV bits. In the Subenclosure String Out,
              Subenclosure Nickname Control and Download Microcode Control pages, byte 1 is the Subenclosure identifier.  Active when the --control and --data=H,H... options are used and the default  value
              is  0. If the --clear=STR or --set=STR option is used then the value read from byte 1 is written back to byte 1.  B1 is in decimal unless it is prefixed by '0x' or '0X' (or has a trailing 'h'
              or 'H').

       -C, --clear=STR
              Used to clear an element field in the Enclosure Control or Threshold Out page. Must be used together with a --descriptor=DN or --index=... option to specify which element is  to  be  changed.
              The Enclosure Control page is assumed if the --page=PG option is not given. See the STR FORMAT section below.

       -c, --control
              will  send  control  information  to the DEVICE via a SCSI SEND DIAGNOSTIC command. Cannot give both this option and --status.  The Enclosure Control, String Out, Threshold Out, Array Control
              (obsolete in SES-2), Subenclosure String Out, Subenclosure Nickname Control and Download Microcode pages can be set currently. This option is assumed if either the  --clear=STR  or  --set=STR
              option is given.

       -d, --data=H,H...
              permits  a  string  of  comma separated (ASCII) hex bytes to be specified (limit 1024). A (single) space separated string of hex bytes is also allowed but the list needs to be in quotes. This
              option allows the parameters to a control page to be specified. The string given should not include the first 4 bytes (i.e. page code and length).

       -d, --data=-
              reads a data string from stdin, limit 1024 bytes. stdin may provide ASCII hex as a comma separated list (i.e. as with the --data=H,H...  option).  Additionally spaces, tabs and line feeds are
              permitted as separators from stdin . Stops reading stdin when an EOF is detected.

       -D, --descriptor=DN
              where  DN  is  a  descriptor  name  (string) as found in the Element Descriptor page. If that page is supported then DN may be an alternative for TIA,II (in the --index=TIA,II option). If the
              descriptor name contains a space then DN needs to be surrounded by quotes (single or double) or the space escaped (e.g. preceded by a backslash).  Some elements (e.g.  overall  elements)  may
              not have descriptor names. Useful with the --clear=STR, --get=STR and --set=STR options.  If no other options are given then the --join option is assumed.

       -e, --enumerate
              enumerate  all  known  page  names  and  SES  elements when this option is given once. If --enumerate is given twice, then the recognised acronyms for the --clear=STR, --get=STR and --set=STR
              options are listed. The utility exits after listing this information (so most other options and DEVICE are ignored).

       -f, --filter
              cuts down on the amount of output from the Enclosure Status page and the Additional Element Status page. When this option is given, any line which has all its binary flags cleared (i.e. 0) is
              filtered  out (i.e.  ignored).  If a line has some other value on it (e.g. a temperature) then it is output.  The --filter option is also useful for reducing the amount of output generated by
              the --join option.

       -G, --get=STR
              Used to read a field in a status element. Must be used together with a --descriptor=DN or --index=... option to specify which element is to be read. By default the Enclosure  Status  page  is
              read, the only other pages that can be read are the Threshold In and Additional Element Status pages. If a value is found it is output in decimal to stdout (by default) or in hexadecimal pre‐
              ceded by "0x" if the --hex option is also given. See the STR FORMAT section below.

       -h, --help
              output the usage message then exit.

       -H, --hex
              If the --get=STR option is given then output the value found (if any) in hexadecimal, with a leading "0x". Otherwise output the response  in  hexadecimal.  Ignored  with  some  options  (e.g.
              --join).

       -I, --index=IIA
              where  IIA  is  either an individual index (II) or an Element type abbreviation (A). See the INDEXES section below. If the --page=PG option is not given then the Enclosure Status (or Control)
              page is assumed.  May be used with the --join option or one of the --clear=STR, --get=STR or --set=STR options. To enumerate the available  Element  type  abbreviations  use  the  --enumerate
              option.

       -I, --index=TIA,II
              where  TIA,II  is an type header index (TI) or Element type abbreviation (A) followed by an individual index (II). See the INDEXES section below. If the --page=PG option is not given then the
              Enclosure Status (or Control) page is assumed. May be used with the --join option or one of the --clear=STR, --get=STR or --set=STR options. To enumerate the available Element type  abbrevia‐
              tions use the --enumerate option.

       -i, --inner-hex
              the outer levels of a status page are decoded and printed out but the innermost level (e.g. the Element Status Descriptor) is output in hex. Also active with the Additional Element Status and
              Threshold In pages. Can be used with --index=... and/or --join options.

       -j, --join
              group elements from the Element Descriptor, Enclosure Status and Additional Element Status pages. If this option is given twice then elements from the Threshold In page are also grouped.  The
              order  is  dictated  by the Configuration page. All elements are output unless the --index= or --descriptor=DN option is given, in which case only the matching element is output. The --filter
              option can be added to reduce the amount of output generated by the option. See the INDEXES section below.

       -l, --list
              This option is equivalent to --enumerate. See that option.

       -n, --nickname=SEN
              where SEN is the new Subenclosure Nickname. Only the first 32 characters (bytes) of SEN are used, if more are given they are ignored. See the SETTING SUBENCLOSURE NICKNAME section below.

       -N, --nickid=SEID
              where SEID is the Subenclosure identifier that the new Nickname (SEN) will be applied to. The default value is 0 which is the main enclosure.

       -p, --page=PG
              where PG is a page abbreviation or code (a number). If PG starts with a digit it is assumed to be in decimal unless prefixed by 0x for hex. Valid range is 0 to 255 (0x0  to  0xff)  inclusive.
              Default is page 'sdp' which is page_code 0 (i.e. "Supported Diagnostic Pages") if no other options are given.

       -r, --raw
              outputs  the  chosen  status  page in ASCII hex in a format suitable for a later invocation using the --data= option. A page less its first 4 bytes (page code and length) is output. When used
              twice (e.g. -rr) the full page contents is output in binary to stdout.

       -S, --set=STR
              Used to set an element field in the Enclosure Control or Threshold Out page. Must be used together with a --descriptor=DN or --index=... option to specify which element is to be changed.  The
              Enclosure Control page is assumed if the --page=PG option is not given. See the STR FORMAT section below.

       -s, --status
              will  fetch  page  from  the  DEVICE via a SCSI RECEIVE DIAGNOSTIC RESULTS command. In the absence of other options that imply modifying a page (e.g.  --control or --set=STR) then --status is
              assumed.

       -v, --verbose
              increase the level of verbosity, (i.e. debug output).

       -V, --version
              print the version string and then exit.

INDEXES
       An enclosure can have information about its disk and tape drives plus other supporting components like power supplies spread across several pages.  Addressing a specific element (overall or individ‐
       ual) is complicated.

       The  Configuration  page  is key: it contains a list of "type headers", each of which contains an Element type (e.g. Array Device Slot), a Subenclosure identifier (0 for the primary enclosure) and a
       "Number of possible elements".  Corresponding to each type header, the Enclosure Status page has one "overall" element plus "Number of possible elements" individual elements all of  which  have  the
       given  Element  type.  For  some  Element types the "Number of possible elements" will be 0 so the Enclosure Status page has only one "overall" element corresponding to that type header. The Element
       Descriptor page and the Threshold (In and Out) pages follow the same pattern as the Enclosure Status page.

       The Additional Element Status page is a bit more complicated. It has entries for "Number of possible elements" of certain Element types. It does not have entries corresponding to the "overall"  ele‐
       ments.  To  make  the  correspondence  a little clearer each descriptor in this page optionally contains an "Element Index Present" (EIP) indicator. If EIP is set then each element's "Element Index"
       field refers to the position of the corresponding element in the Enclosure Status page.

       Addressing a single overall element or a single individual element is done with two indexes: TI and II. Both are origin 0. TI=0 corresponds to the first type header entry which must be a Device Slot
       or  Array  Device Slot Element type (according to the SES-2 standard). To address the corresponding overall instance, II is set to -1, otherwise II can be set to the individual instance index. As an
       alternative to the type header index (TI), an Element type abbreviation (A) optionally followed by a number (e.g. "ps" refers to the first Power Supply Element type; "ps1" refers to the second)  can
       be given.

       One  of two command lines variants can be used to specify indexes: --index=TIA,II where TIA is either an type header index (TI) or an Element type abbreviation (A) (e.g. "ps" or "ps1"). II is either
       an individual index or "-1" to specify the overall element. The second variant is --index=IIA where IIA is either an individual index (II) or an Element type abbreviation (A). When IIA is  an  indi‐
       vidual index then the option is equivalent to --index=0,II. When IIA is an Element type abbreviation then the option is equivalent to --index=A,-1.

       To  cope  with  vendor  specific  Element  types  (which  should  be  in the range 128 to 255) the Element type can be given as a number with a leading underscore.  For example these are equivalent:
       --index=arr and --index=_23 since the Array Device Slot Element type value is 23.  Also --index=ps1 and --index=_2_1 are equivalent.

       Another example: if the first type header in the Configuration page has Array Device Slot Element type then --index=0,-1 is equivalent to --index=arr. Also --index=arr,3 is equivalent to --index=3.

       Note that if the Element Descriptor page is available then the --descriptor=DN option may be an alternative to the --index=... option.

STR FORMAT
       The STR operands of the --clear=STR, --get=STR and --set=STR options all have the same structure. There are two forms:
             <acronym>[=<value>]
             <start_byte>:<start_bit>[:<num_bits>][=<value>]

       The <acronym> is one of a list of common fields (e.g. "ident" and "fault") that the utility converts internally into the second form. The <start_byte> is usually in the range 0 to 3, the <start_bit>
       must  be  in the range 0 to 7 and the <num_bits> must be in the range 1 to 64 (default 1). The number of bits are read in the left to right sense of the element tables shown in the various SES draft
       documents. For example the 8 bits of byte 2 would be represented as 2:7:8 with the most significant bit being 2:7 and the least sugnificant bit being 2:0 .

       The <value> is optional but is ignored if provided to --get=STR.  For --set=STR the default <value> is 1 while for --clear=STR the default value is 0 .

       The supported list of <acronym>s can be viewed by using the --enumerate option twice (or "-ee").

CHANGING STATE
       This utility has various techniques for changing the state of a SES device.  As noted above this is typically a read-modify-write type operation.  Most modifiable pages have  a  "status"  (or  "in")
       page that can be read, and a corresponding "control" (or "out") page that can be written back to change the state of the enclosure.

       The  lower  level  technique  provided  by  this  utility  involves outputting a "status" page in hex with --raw. Then a text editor can be used to edit the hex (note: to change an Enclosure Control
       descriptor the SELECT bit needs to be set). Next the control page data can fed back with the --data=H,H... option together with the --control option; the --byte1=B1 option may need to  be  given  as
       well.

       Changes  to the Enclosure Control page (and the Threshold Out page) can be done at a higher level. This involves choosing a page (the default in this case is the Enclosure Control page). Next choose
       an individual or overall element index (or name it with its Element Descriptor string). Then give the element's name (e.g. "ident" for RQST IDENT) or its position within that  element  (e.g.  in  an
       Array Device Slot Control element RQST IDENT is byte 2, bit 1 and 1 bit long ("2:1:1")). Finally a value can be given, if not the value for --set=STR defaults to 1 and for --clear=STR defaults to 0.

SETTING SUBENCLOSURE NICKNAME
       The  format  of  the Subenclosure Nickname control page is different from its corresponding status page. The status page reports all Subenclosure Nicknames (and Subenclosure identifier 0 is the main
       enclosure) while the control page allows only one of them to be changed. Therefore using the --data option technique to change a Subenclosure nickname is difficult (but still possible).

       To simplify changing a Subenclosure nickname the --nickname=SEN and --nickid=SEID options have been added. If the SEN string contains spaces or other punctuation, it should be quoted: surrounded  by
       single  or  double quotes (or the offending characters escaped). If the --nickid=SEID is not given then a Subenclosure identifier of 0 is assumed. As a guard the --control option must also be given.
       If the --page=PG option is not given then --page=snic is assumed.

       When --nickname=SEN is given then the Subenclosure Nickname Status page is read to obtain the Generation Code field. That Generation Code together with no more than 32 bytes from the Nickname  (SEN)
       and the Subenclosure Identifier (SEID) are written to the Subenclosure Nickname Control page.

       There is an example of changing a nickname in the EXAMPLES section below.

NOTES
       This  utility  can  be  used  to fetch arbitrary (i.e. non SES) diagnostic pages (using the SCSI READ DIAGNOSTIC command). To this end the --page=PG and --hex options would be appropriate. Arbitrary
       diagnostic pages can be sent to a device with the sg_senddiag utility.

       The most troublesome part of the join operation is associating Additional Element Status descriptors correctly. At least one SES device vendor has misinterpreted the SES-2 standard with its "element
       index"  field.  The code in this utility interprets the "element index" field as per the SES-2 standard and if that yields an inappropriate Element type, adjusts its indexing to follow that vendor's
       misinterpretation.

       In draft SES-3 revision 5 the "Door Lock" element name was changed to the "Door" (and an OPEN field was added to the status element). As a consequence the former 'dl' element type  abbreviation  has
       been changed to 'do'.

       There  is  a related command set called SAF-TE (SCSI attached fault-tolerant enclosure) for enclosure (including RAID) status and control. SCSI devices that support SAF-TE report "Processor" periph‐
       eral device type (0x3) in their INQUIRY response. See the sg_safte utility in this package or safte-monitor on the Internet.

EXAMPLES
       These examples use Linux device names. For suitable device names in other supported Operating Systems see the sg3_utils(8) man page.

       To view the supported pages:

          sg_ses /dev/bsg/6:0:2:0

       To view the Configuration page:

          sg_ses --page=cf /dev/bsg/6:0:2:0

       To view the Enclosure Status page:

          sg_ses --page=es /dev/bsg/6:0:2:0

       To get the (attached) SAS address of that device (which is held in the Additional Element Sense page (page 10)) printed on hex:

          sg_ses -p aes -D ArrayDevice07 -G at_sas_addr -H /dev/sg3

       To collate the information in the Enclosure Status, Element Descriptor and Additional Element Status pages the --join option can be used:

          sg_ses --join /dev/sg3

       This will produce a lot of output. To filter out lines that don't contain much information add the --filter option:

          sg_ses --join --filter /dev/sg3

       Fields in the various elements of the Enclosure Control and Threshold pages can be changed with the --clear=STR and --set=STR options. [All modifiable  pages  can  be  changed  with  the  --raw  and
       --data=H,H... options.] The following example looks at making the "ident" LED (also called "locate") flash on "ArrayDevice07" which is a disk (or more precisely the carrier drawer the disk is in):

          sg_ses --index=7 --set=2:1:1 /dev/sg3

       If the Element Descriptor diagnostic page shows that "ArrayDevice07" is the descriptor name associated with element index 7 then this invocation is equivalent to the previous one:

          sg_ses --descriptor=ArrayDevice07 --set=2:1:1 /dev/sg3

       Further  the  byte 2, bit 1 (for 1 bit) field in the Array Device Slot Control element is RQST IDENT for asking a disk carrier to flash a LED so it can be located. In this case "ident" (or "locate")
       is accepted as an acronym for that field:

          sg_ses --descriptor=ArrayDevice07 --set=ident /dev/sg3

       To stop that LED flashing:

          sg_ses --descriptor=ArrayDevice07 --clear=ident /dev/sg3

       Now for an example of a more general but lower level technique for changing a modifiable diagnostic page. The String (In and Out) diagnostics page is relatively simple (compared with  the  Enclosure
       Status/Control page). However the use of this lower level technique is awkward involving three steps: read, modify then write. First check the current String (In) page contents:

          sg_ses --page=str /dev/bsg/6:0:2:0

       Now the "read" step. The following command will send the contents of the String page (from byte 4 onwards) to stdout. The output will be in ASCII hex with pairs of hex digits representing a byte, 16
       pairs per line, space separated. The redirection puts stdout in a file called "t":

          sg_ses --page=str --raw /dev/bsg/6:0:2:0 > t

       Then with the aid of the SES-3 document (in revision 3: section 6.1.6) use your favourite editor to change t. The changes can be sent to the device with:

          sg_ses --page=str --control --data=- /dev/bsg/6:0:2:0 < t

       If the above is successful, the String page should have been changed. To check try:

          sg_ses --page=str /dev/bsg/6:0:2:0

       To change the nickname on the main enclosure:

          sg_ses --nickname='1st enclosure' --control /dev/bsg/6:0:2:0

EXIT STATUS
       The exit status of sg_ses is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

AUTHORS
       Written by Douglas Gilbert.

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2004-2013 Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_inq, sg_safte, sg_senddiag, sg3_utils (in sg3_utils package); safte-monitor (Internet)



sg3_utils-1.37                                                                                  September 2013                                                                                      SG_SES(8)
