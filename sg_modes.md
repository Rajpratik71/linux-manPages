SG_MODES(8)                                                                                       SG3_UTILS                                                                                       SG_MODES(8)



NAME
       sg_modes - reads mode pages with SCSI MODE SENSE command

SYNOPSIS
       sg_modes [--all] [--control=PC] [--dbd] [--dbout] [--examine] [--flexible] [--help] [--hex] [--list] [--llbaa] [--maxlen=LEN] [--page=PG[,SPG]] [--raw] [-R] [--six] [--verbose] [--version] [DEVICE]

       sg_modes [-6] [-a] [-A] [-c=PC] [-d] [-D] [-e] [-f] [-h] [-H] [-l] [-L] [-m=LEN] [-p=PG[,SPG]] [-r] [-subp=SPG] [-v] [-V] [-?] [DEVICE]

DESCRIPTION
       This utility sends a MODE SENSE SCSI command to the DEVICE and outputs the response. There is a 6 byte and 10 byte (cdb) variant of the MODE SENSE command, this utility defaults to the 10 byte vari‐
       ant.

       This utility decodes mode page headers and block descriptors but outputs the contents of each mode page in hex. It also has no facility to change the mode page contents  or  block  descriptor  data.
       Mode page contents are decoded and can be changed by the sdparm utility.

       This  utility  supports  two command line syntaxes, the preferred one is shown first in the synopsis and explained in this section. A later section on the old command line syntax outlines the second
       group of options.

       If no page is given (and --list is not selected) then --all is assumed. The --all option requests all mode pages (but not subpages) in a single response.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -a, --all
              output all the mode pages reported by the DEVICE. This is what the page code 63 (0x3f) is defined to do. When used once, mode subpages are not fetched. When used twice (e.g. '-aa'), all  mode
              pages and subpages are requested which is equivalent to '--page=63,255'.

       -c, --control=PC
              PC is the page control value. Up to four different versions of each page are held by the device:
                0 : current values (i.e. those active at present)
                1 : changeable values
                2 : default values (i.e. the manufacturer's settings)
                3 : saved values
              The  changeable  values are bit masks showing which fields could be changed with a MODE SELECT. The saved values will be re-instated the next time the device is power cycled or reset. If this
              option is not given then current values [0] are assumed.

       -d, --dbd
              disable block descriptors. By default, block descriptors (usually one (for disks) or none) are returned in a MODE SENSE response. This option sets the "disable block descriptors" (DBD) bit in
              the cdb which instructs the device not to return any block descriptors in its response. Older devices may not support this setting and may return an "illegal request" sense key; alternatively
              they may ignore it. Oddly the Reduced Block Command set (RBC) requires this bit set.

       -D, --dbout
              disable outputting block descriptors. Irrespective of whether block descriptors are present in the response or not, they are not output.

       -e, --examine
              examine each mode page in the range 0 through to 62 (inclusive).  If some response is given then print out the mode page name or number (in hex) if the name is not known.

       -f, --flexible
              Some devices, bridges and/or drivers attempt crude translations between MODE SENSE 6 and 10 byte commands without correcting the response. This will cause the response to  be  mis-interpreted
              (usually  with  an  error  saying the response is malformed). With this option, the length of the response is checked, and if it looks wrong, the response is then decoded as if the other mode
              sense (cdb length) was sent.

       -h, --help
              print out the usage message then exit.

       -H, --hex
              The default action is to decode known mode page numbers (and subpage numbers) into text. When this option is used once, the response is output in hexadecimal. When this option is used  twice,
              mode page numbers and page control values are output in hex.

       -l, --list
              lists  all  common  page and subpage codes and their names that are found in the command set that matches the peripheral type of the given DEVICE.  If no DEVICE and no --page=PG is given then
              the common page and subpage codes and their names are listed for SBC (e.g. a disk). If no DEVICE is given and a --page=PG is given then the common page and subpage codes and their  names  are
              listed  for the command set whose peripheral device type matches the value given to PG. For example 'sg_mode --list --page=1' lists the command mode pages and subpages for tape devices. Addi‐
              tionally if a sub_page_code is given then it is interpreted as a transport identifier and command transport specific mode page codes and their names are listed following the  main  mode  page
              list.  Other options are ignored.

       -L, --llbaa
              set  the  Long LBA Accepted (LLBAA) bit in the MODE SENSE (10) cdb. This bit is not defined in the MODE SENSE (6) cdb so setting the '-L' and '--six' options is reported as an error. When set
              the DEVICE may respond with 16 byte block descriptors as indicated by the 'LongLBA' field in the response. In most cases setting this option is not needed.

       -m, --maxlen=LEN
              The LEN argument is the maximum response length in bytes. It is the 'allocation length' field in the cdb. When not given (or LEN is zero) then the allocation length field is set to  4096  for
              MODE SENSE (10) or 252 for MODE SENSE (6). The LEN argument must be non-negative and no greater than 65535 for MODE SENSE (10) and not greater than 255 for MODE SENSE (6).

       -O, --old
              Switch to older style options. Please use as first option.

       -p, --page=PG
              page  code  to fetch. The PG is assumed to be a decimal value unless prefixed by '0x' or has a trailing 'h'. It should be a value between 0 and 63 (inclusive). When not given and a default is
              required then a value of 63 (0x3f), which fetches all mode pages, is used.

       -p, --page=PG,SPG
              page code and subpage code values to fetch. Both arguments are assumed to be decimal unless flagged as hexadecimal. The page code should be between 0 and 63 inclusive. The subpage code should
              be between 0 and 255 inclusive. The default value for the subpage code is 0.

       -r, --raw
              output the response in binary to stdout. Error messages and warnings, if any, are sent to stderr. When this option is used twice (e.g. '-rr') then has the same action as '-R'

       -R     output the selected mode page to stdout a byte per line. Each line contains two hexadecimal digits (e.g. "3e"). Useful as input (after editing) to the sg_wr_mode(8) utility.

       -6, --six
              by  default  this  utility sends a 10 byte MODE SENSE command to the DEVICE. However some SCSI devices only support 6 byte MODE SENSE commands (e.g. SCSI-2 tape drives). This parameter forces
              the use of 6 byte MODE SENSE commands.

       -v, --verbose
              increase level of verbosity. Can be used multiple times.

       -V, --version
              print out version string then exit.

NOTES
       If the normal sg_modes utility fails with "illegal command operation code" then try the '--six' (or '-6') option.

       This utility performs a SCSI INQUIRY command to determine the peripheral type of the device (e.g. 0 -> Direct Access Device (disk)) prior to sending a MODE SENSE command. This helps in decoding  the
       block descriptor and mode pages.

       In  the  2.4  series  of Linux kernels the DEVICE must be a SCSI generic (sg) device. In the 2.6 series block devices (e.g. SCSI disks and DVD drives) can also be specified. For example "sg_modes -a
       /dev/sda" will work in the 2.6 series kernels.

EXIT STATUS
       The exit status of sg_modes is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

OLDER COMMAND LINE OPTIONS
       The options in this section were the only ones available prior to sg3_utils version 1.23 . In sg3_utils  version  1.23  and  later  these  older  options  can  be  selected  by  either  setting  the
       SG3_UTILS_OLD_OPTS environment variable or using '--old' (or '-O) as the first option.

       -6     by default this utility sends a 10 byte MODE SENSE command to the DEVICE. This parameter forces the use of 6 byte MODE SENSE commands.  See --six in the main description.

       -a     see --all in the main description.

       -A     output all the mode pages and subpages supported by the DEVICE. Same as '--all --all' in the new syntax.

       -c=PC  PC is the page control value. See --control=PC in the main description.

       -d     see --dbd in the main description.

       -D     see --dbout in the main description.

       -e     see --examine in the main description.

       -f     see --flexible in the main description.

       -h     The default action is to decode known mode page numbers (and subpage numbers) into text. With this option mode page numbers (and subpage numbers) are output in hexadecimal.

       -H     same action as the '-h' option.

       -l     see --list in the main description.

       -L     see --llbaa in the main description.

       -N, --new
              Switch to the newer style options.

       -m=LEN see --maxlen=LEN in the main description.

       -p=PG  PG is page code to fetch. Should be a hexadecimal number between 0 and 3f inclusive (0 to 63 decimal). The default value when required is 3f (fetch all mode pages).

       -p=PG,SPG
              page  code  and  subpage code values to fetch. The page code should be a hexadecimal number between 0 and 3f inclusive. The subpage code should be a hexadecimal number between 0 and ff inclu‐
              sive. The default value for the subpage code is 0.

       -r     output the selected mode page to stdout a byte per line. Each line contains two hexadecimal digits (e.g. "3e"). Useful as input (after editing) to the sg_wr_mode(8) utility.

       -subp=SPG
              sub page code to fetch. Should be a hexadecimal number between 0 and 0xff inclusive. The default value is 0.

       -v     increase verbosity of output.

       -V     print out version string then exit.

       -?     output usage message then exit. Ignore all other parameters.

AUTHOR
       Written by Douglas Gilbert

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2000-2012 Douglas Gilbert
       This software is distributed under the GPL version 2. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sdparm(8), sg_wr_mode(8), sginfo(8), sgmode(scsirastools), scsiinfo(net), scu(net), seatools(seagate)

       All these utilities offer some facility to change mode page (or block descriptor) parameters.



sg3_utils-1.35                                                                                  December 2012                                                                                     SG_MODES(8)
