SG_RTPG(8)                                                                                        SG3_UTILS                                                                                        SG_RTPG(8)



NAME
       sg_rtpg - send SCSI REPORT TARGET PORT GROUPS command

SYNOPSIS
       sg_rtpg [--decode] [--help] [--hex] [--raw] [--verbose] [--version] DEVICE

DESCRIPTION
       Send a SCSI REPORT TARGET PORT GROUPS command to DEVICE and outputs the response.

       Target port group access is described in SPC-3 found at www.t10.org in section 5.8 (in rev 21c dated 2005/1/15). The Report Target Port Groups command is also described in that document.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -d, --decode
              decodes the status code and asymmetric access state from each target port group descriptor returned. The default action is not to decode these values.

       -e, --extended
              use extended header format for parameter data.

       -h, --help
              output the usage message then exit.

       -H, --hex
              output response in hex (rather than partially or fully decode it).

       -r, --raw
              output response in binary to stdout.

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
       Copyright © 2004-2012 Christophe Varoqui and Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_inq(sg3_utils)



sg3_utils-1.35                                                                                  November 2012                                                                                      SG_RTPG(8)
