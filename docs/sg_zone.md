SG_ZONE(8)                                                                                        SG3_UTILS                                                                                        SG_ZONE(8)



NAME
       sg_zone - send SCSI OPEN, CLOSE or FINISH ZONE command

SYNOPSIS
       sg_zone [--all] [--close] [--finish] [--help] [--open] [--verbose] [--version] [--zone=ID] DEVICE

DESCRIPTION
       Sends a SCSI OPEN ZONE, CLOSE ZONE or FINISH ZONE command to the DEVICE.  These commands are found in the ZBC draft standard revision 4c (zbc-r04c.pdf).

       One and only one of the --open, --close and --finish options can be chosen.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -a, --all
              sets the ALL field in the cdb.

       -c, --close
              causes the CLOSE ZONE command to be sent to the DEVICE.

       -f, --finish
              causes the FINISH ZONE command to be sent to the DEVICE.

       -h, --help
              output the usage message then exit.

       -o, --open
              causes the OPEN ZONE command to be sent to the DEVICE.

       -v, --verbose
              increase the level of verbosity, (i.e. debug output).

       -V, --version
              print the version string and then exit.

       -z, --zone=ID
              where ID is placed in the cdb's ZONE ID field. A zone id is a zone start logical block address (LBA). The default value is 0. ID is assumed to be in decimal unless prefixed with '0x' or has a
              trailing 'h' which indicate hexadecimal.

EXIT STATUS
       The exit status of sg_zone is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

AUTHORS
       Written by Douglas Gilbert.

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2014-2015 Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_rep_zones,sg_reset_wp(sg3_utils)



sg3_utils-1.42                                                                                  November 2015                                                                                      SG_ZONE(8)
