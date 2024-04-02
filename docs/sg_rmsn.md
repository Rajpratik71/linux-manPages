SG_RMSN(8)                                                                                        SG3_UTILS                                                                                        SG_RMSN(8)



NAME
       sg_rmsn - send SCSI READ MEDIA SERIAL NUMBER command

SYNOPSIS
       sg_rmsn [--help] [--raw] [--readonly] [--verbose] [--version] DEVICE

DESCRIPTION
       Send a SCSI READ MEDIA SERIAL NUMBER command to DEVICE and outputs the response.

       This  command  is  described  in SPC-3 found at www.t10.org . It was originally added to SPC-3 in revision 11 (2003/2/12). It is not an mandatory command and the author has not seen any SCSI devices
       that support it.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -h, --help
              output the usage message then exit.

       -r, --raw
              sends the serial number (if found) to stdout. This output may contain non-printable characters (e.g. the serial number is padded with NULLs at the end so its length is a multiple of  4).  The
              default action is to print the serial number out in ASCII-HEX with ASCII characters to the right. All error messages are sent to stderr.

       -R, --readonly
              opens  the DEVICE read-only rather than read-write which is the default. The Linux sg driver needs read-write access for the SCSI READ MEDIA SERIAL NUMBER command but other access methods may
              require read-only access.

       -v, --verbose
              increase the level of verbosity, (i.e. debug output).

       -V, --version
              print the version string and then exit.

NOTES
       Device identification information is also found in a standard INQUIRY response and its VPD pages (see sg_vpd). The relevant VPD pages are the "device identification page" (VPD  page  0x83)  and  the
       "unit serial number" page (VPD page 0x80).

       The MMC-4 command set for CD/DVD/HD-DVD/BD drives has a "media serial number" feature (0x109) [and a "logical unit serial number" feature]. These can be viewed with sg_get_config.

EXIT STATUS
       The exit status of sg_rmsn is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

AUTHORS
       Written by Douglas Gilbert.

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2005-2012 Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_vpd(sg3_utils), sg_get_config(sg3_utils)



sg3_utils-1.31                                                                                  November 2012                                                                                      SG_RMSN(8)
