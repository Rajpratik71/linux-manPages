SG_RTPG(8)                                                                                        SG3_UTILS                                                                                        SG_RTPG(8)



NAME
       sg_rtpg - send SCSI REPORT TARGET PORT GROUPS command

SYNOPSIS
       sg_rtpg [--decode] [--help] [--hex] [--raw] [--readonly] [--verbose] [--version] DEVICE

DESCRIPTION
       Send a SCSI REPORT TARGET PORT GROUPS command to DEVICE and outputs the response.

       Target port group access is described in SPC-3 and SPC-4 found at www.t10.org . The most recent draft of SPC-4 is revision 37 in which target port groups are described in section 5.15 .

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -d, --decode
              decodes the status code and asymmetric access state from each target port group descriptor returned. The default action is not to decode these values.

       -e, --extended
              use extended header format for parameter data. This sets the PARAMETER DATA FORMAT field in the cdb to 1.

       -h, --help
              output the usage message then exit.

       -H, --hex
              output response in hex (rather than partially or fully decode it).

       -r, --raw
              output response in binary to stdout.

       -R, --readonly
              open the DEVICE read-only (e.g. in Unix with the O_RDONLY flag).  The default is to open it read-write.

       -v, --verbose
              increase the level of verbosity, (i.e. debug output).

       -V, --version
              print the version string and then exit.

NOTES
       The Report Target Port Groups command should be supported whenever the TPGS bits in a standard INQUIRY response are greater than zero. [View with sg_inq utility.]

EXIT STATUS
       The exit status of sg_rtpg is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

AUTHORS
       Written by Douglas Gilbert.

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2004-2014 Christophe Varoqui and Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_inq(sg3_utils)



sg3_utils-1.39                                                                                     May 2014                                                                                        SG_RTPG(8)
