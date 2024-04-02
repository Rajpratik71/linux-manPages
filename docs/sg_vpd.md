SG_VPD(8)                                                                                         SG3_UTILS                                                                                         SG_VPD(8)



NAME
       sg_vpd - fetch SCSI VPD page and/or decode its response

SYNOPSIS
       sg_vpd [--all] [--enumerate] [--help] [--hex] [--ident] [--inhex=FN] [--long] [--maxlen=LEN] [--page=PG] [--quiet] [--raw] [--vendor=VP] [--force] [--verbose] [--version] [DEVICE]

DESCRIPTION
       This utility, when DEVICE is given, fetches a Vital Product Data (VPD) page and decodes it or outputs it in ASCII hexadecimal or binary. VPD pages are fetched with a SCSI INQUIRY command.

       Alternatively  the  --inhex=FN option can be given. In this case FN is assumed to be a file name ('-' for stdin) containing ASCII hexadecimal representing a VPD page response. If the --raw option is
       also given then binary input is assumed (rather than ASCII hexadecimal).

       Probably the most important page is the Device Identification VPD page (page number: 0x83). Since SPC-3, support for this page has been flagged as mandatory. This page can be fetched  by  using  the
       --ident option.

       The  reference  document  used for interpreting VPD pages (and the INQUIRY standard response) is T10/BSR INCITS 502 Revision 08 which is draft SPC-5 revision 08, 25 January 2016). It can be found at
       http://www.t10.org .

       When no options are given, other than a DEVICE, then the "Supported VPD pages" (0x0) VPD page is fetched and decoded.

OPTIONS
       Arguments to long options are mandatory for short options as well.  The options are arranged in alphabetical order based on the long option name.

       -a, --all
              decode all VPD pages. When used with DEVICE the pages to be decoded are found in the "Supported VPD pages" VPD page. Pages that cannot be decoded are displayed in hex; add the  --long  option
              to have ASCII displayed to the right of each line of hex.
              If  this  option is used with the --inhex=FN option then the file FN is assumed to contain 1 or more VPD pages (in ASCII hex or binary).  Decoding continues until the file is exhausted (or an
              error occurs). Sanity checks are aplied on each VPD page's length and the ascending order of VPD page numbers (required by SPC-4) so bad data may be detected.
              If the --page=PG option is also given then no VPD page whose page number is greater than PG (or its numeric equivalent) is decoded.

       -e, --enumerate
              list the names of the known VPD pages, first the standard pages (i.e.  those defined by T10), then the vendor specific pages. Each group is sorted in abbreviation order. The DEVICE  and  most
              other options are ignored and this utility exits after listing the VPD page names. May be used together with --page=PG where PG is numeric. If so, it searches for the summary lines of all VPD
              pages whose number matches PG. May be used with --vendor=VP to restrict output to known vendor specific pages for vendor/product VP.

       -f, --force
              As a sanity check, the normal action when fetching VPD pages other than page 0x0 (the "Supported VPD pages" VPD page), is to first fetch page 0x0 and only if the requested page is one of  the
              supported pages, to go ahead and fetch the requested page.
              When this option is given, skip checking of VPD page 0x0 before accessing the requested VPD page. The prior check of VPD page 0x0 is known to crash certain USB devices, so use with care.

       -h, --help
              outputs the usage message summarizing command line options then exits.  Ignores DEVICE if given.

       -H, --hex
              outputs the requested VPD page in ASCII hexadecimal. Can be used multiple times, see section on the ATA information vpd page.
              To  generate output suitable for placing in a file that can be used by a later invocation with the --inhex=FN option, use the '-HHHH' option (e.g. 'sg_vpd -p di -HHHH /dev/sg3 > dev_id.hex').
              The reason '-HHHH' is used is to flag that unadorned hexadecimal (without other text or address offsets) is sent to stdout.

       -i, --ident
              decode the device identification (0x83) VPD page. When used once this option has the same effect as '--page=di'. When use twice then the short form of the  device  identification  VPD  page's
              logical unit designator is decoded. In the latter case this option has the same effect as '--quiet --page=di_lu'.

       -I, --inhex=FN
              FN  is  expected  to  be a file name (or '-' for stdin) which contains ASCII hexadecimal or binary representing a VPD page (or a standard INQUIRY) response. This utility will then decode that
              response. It is preferable to also supply the --page=PG option, if not this utility will attempt to guess which VPD page (or standard INQUIRY) the response is associated with. The hexadecimal
              should  be  arranged  as  1 or 2 digits representing a byte each of which is whitespace or comma separated. Anything from and including a hash mark to the end of line is ignored. If the --raw
              option is also given then FN is treated as binary.

       -l, --long
              when decoding some VPD pages, give a little more output. For example the ATA Information VPD page only shows the signature (in hex) and the IDENTIFY (PACKET) DEVICE (in hex) when this  option
              is given.

       -m, --maxlen=LEN
              where  LEN  is  the (maximum) response length in bytes. It is placed in the cdb's "allocation length" field. If not given (or LEN is zero) then 252 is used (apart from the ATA Information VPD
              page which defaults to 572) and, if the response indicates this value is insufficient, another INQUIRY command is sent with a larger value in the cdb's "allocation  length"  field.   If  this
              option  is  given and LEN is greater than 0 then only one INQUIRY command is sent. Since many simple devices implement the INQUIRY command badly (and do not support VPD pages) then the safest
              value to use for LEN is 36. See the sg_inq man page for the more information.

       -p, --page=PG
              where PG is the VPD page to be decoded or output. The PG argument can either be an abbreviation, a number or a pair or numbers/abbreviations separated by a comma. The VPD  page  abbreviations
              can  be  seen  by using the --enumerate option. If a number is given it is assumed to be decimal unless it has a hexadecimal indicator which is either a leading '0x' or a trailing 'h'. If one
              number is given then it is assumed to be a VPD page number. If two numbers (or abbreviations) are given then the second one is the same as VP (see the --vendor=VP option). If this  option  is
              not given (nor '-i', '-l' nor '-V') then the "Supported VPD pages" (0x0) VPD page is fetched and decoded. If PG is '-1' or 'sinq' then the standard INQUIRY response is output. This option may
              also be used with the --enumerate (see its description).

       -q, --quiet
              suppress the amount of decoding output.

       -r, --raw
              if not used with --inhex=FN then output requested VPD page in binary.  The output should be piped to a file or another utility when this option is used. The binary  is  sent  to  stdout,  and
              errors are sent to stderr.
              if used with --inhex=FN then the contents of FN is treated as binary.

       -M, --vendor=VP
              where  VP  is a vendor (e.g. "sea" for Seagate) or vendor/product acronym (e.g. "hp3par" for the 3PAR array from HP). Many vendors have re-used the numbers at the beginning of the vendor spe-
              cific VPD page range (e.g.  page 0xc0) and this option is a way of selecting only those which are of interest. Using a VP of "xxx" will list the available acronyms.
              If this option is used with --page=PG and PG is an acronym then this option is ignored. If PG is a number (e.g. 0xc0) then VP is used to choose the which vendor specific  page  (e.g.  sharing
              page number 0xc0) to decode.

       -v, --verbose
              increases the level or verbosity.

       -V, --version
              print out version string then exit.

ATA INFORMATION VPD PAGE
       This  VPD  page (0x89 or 'ai') is defined by the SCSI to ATA Translation standard. It contains information about the SAT layer, the "signature" of the ATA device and the response to the ATA IDENTIFY
       (PACKET) DEVICE command. The latter part has 512 bytes of identity, capability and settings data which the hdparm utility is capable of decoding (so this utility doesn't decode it).

       To unclutter the output for this page, the signature and the IDENTIFY (PACKET) DEVICE response are not output unless the --long option (or --hex or --raw) are given. When the --long option is  given
       the IDENTIFY (PACKET) DEVICE response is output as 256 (16 bit) words as is the fashion for ATA devices. To see that response as a string of bytes use the '-HH' option. To format the output suitable
       for hdparm to decode use either the '-HHH' or '-rr' option. For example if 'dev/sdb' is a SATA disk behind a SAT layer then this command: 'sg_vpd -p ai -HHH /dev/sdb | hdparm --Istdin' should decode
       the ATA IDENTIFY (PACKET) DEVICE response.

NOTES
       Since some VPD pages (e.g. the Extended INQUIRY page) depend on settings in the standard INQUIRY response, then the standard INQUIRY response is output as a pseudo VPD page when PG is set to '-1' or
       'sinq'. Also the decoding of some fields (e.g. the Extended INQUIRY page's SPT field) is expanded when the '--long' option is given using the standard INQUIRY response information (e.g. the PDT  and
       the PROTECT fields).

       In  the  2.4  series  of Linux kernels the DEVICE must be a SCSI generic (sg) device. In the 2.6 series block devices (e.g. disks and ATAPI DVDs) can also be specified. For example "sg_inq /dev/sda"
       will work in the 2.6 series kernels. From lk 2.6.6 other SCSI "char" device names may be used as well (e.g. "/dev/st0m").

       The DEVICE is opened with a read-only flag (e.g. in Unix with the O_RDONLY flag).

EXIT STATUS
       The exit status of sg_vpd is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

EXAMPLES
       The examples in this page use Linux device names. For suitable device names in other supported Operating Systems see the sg3_utils(8) man page.

       To see the VPD pages that a device supports, use with no options. The command line invocation is shown first followed by a typical response:

          # sg_vpd /dev/sdb
       Supported VPD pages VPD page:
         Supported VPD pages [sv]
         Unit serial number [sn]
         Device identification [di]
         Extended inquiry data [ei]
         Block limits (SBC) [bl]

       To see the VPD page numbers associated with each supported page then add the '--long' option to the above command line. To view a VPD page either its number or  abbreviation  can  be  given  to  the
       '--page=' option. The page name abbreviations are shown within square brackets above. In the next example the Extended inquiry data VPD page is listed:

          # sg_vpd --page=ei /dev/sdb
       extended INQUIRY data VPD page:
         ACTIVATE_MICROCODE=0 SPT=0 GRD_CHK=0 APP_CHK=0 REF_CHK=0
         UASK_SUP=0 GROUP_SUP=0 PRIOR_SUP=0 HEADSUP=1 ORDSUP=1 SIMPSUP=1
         WU_SUP=0 CRD_SUP=0 NV_SUP=0 V_SUP=0
         P_I_I_SUP=0 LUICLR=0 R_SUP=0 CBCS=0
         Multi I_T nexus microcode download=0
         Extended self-test completion minutes=0
         POA_SUP=0 HRA_SUP=0 VSA_SUP=0

       To check if any protection types are supported by a disk use the '--long' option on the Extended inquiry data VPD page:

          # sg_vpd --page=ei --long /dev/sdb
          extended INQUIRY data VPD page:
            ACTIVATE_MICROCODE=0
            SPT=1 [protection types 1 and 2 supported]
            GRD_CHK=1
            ....

       Search for the name (and acronym) of all pages that share VPD page number 0xb0 .

          # sg_vpd --page=0xb0 --enumerate
          Matching standard VPD pages:
            bl         0xb0      Block limits (SBC)
            oi         0xb0      OSD information
            sad        0xb0      Sequential access device capabilities (SSC)

       Some examples follow using the "--all" option. Send an ASCII hexadecimal representation of all VPD pages to a file:

          # sg_vpd --all -HHHH /dev/sg3 > all_vpds.hex

       At some later time that file could be decoded with:

          # sg_vpd --all --inhex=all_vpds.hex

       To do the equivalent as the previous example but use a file containing binary:

          # sg_vpd --all --raw /dev/sg3 > all_vpds.bin
          # sg_vpd --all --raw --inhex=all_vpds.bin

       Notice  that  "--raw"  must  be  given with the second (--inhex) invocation to alert the utility that all_vpds.bin contains binary as it assumes ASCII hexadecimal by default. Next we only decode T10
       specified VPD pages excluding vendor specific VPD pages that start at page number 0xc0:

          # sg_vpd --all --page=0xbf --raw --inhex=all_vpds.bin

       Further examples can be found on the http://sg.danny.cz/sg/sg3_utils.html web page.

AUTHOR
       Written by Douglas Gilbert

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2006-2016 Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_inq(sg3_utils), sg3_utils(sg3_utils), sdparm(sdparm), hdparm(hdparm)



sg3_utils-1.43                                                                                    April 2016                                                                                        SG_VPD(8)
