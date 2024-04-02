SG_RESET_WP(8)                                                                                    SG3_UTILS                                                                                    SG_RESET_WP(8)



NAME
       sg_reset_wp - send SCSI RESET WRITE POINTER command

SYNOPSIS
       sg_reset_wp [--all] [--help] [--verbose] [--version] [--zone=ID] DEVICE

DESCRIPTION
       Sends a SCSI RESET WRITE POINTER command to the DEVICE. This command is found in the ZBC draft standard revision 4c (zbc-r04c.pdf).

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -a, --all
              sets the ALL field in the cdb. This causes a reset write pointer operation of all open zones and full zones. When this option is given then the --zone=ID option is ignored. Either this option
              or the --zone=ID option is required.

       -h, --help
              output the usage message then exit.

       -v, --verbose
              increase the level of verbosity, (i.e. debug output).

       -V, --version
              print the version string and then exit.

       -z, --zone=ID
              where ID is placed in the cdb's ZONE ID field. A zone id is a zone start logical block address (LBA). This causes a reset write pointer operation on the zone identified by the ZONE ID  field.
              The default value is 0. Either this option or the --all option is required.  ID is assumed to be in decimal unless prefixed with '0x' or has a trailing 'h' which indicate hexadecimal.

EXIT STATUS
       The exit status of sg_reset_wp is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

AUTHORS
       Written by Douglas Gilbert.

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2014-2015 Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_rep_zones,sg_zone(sg3_utils)



sg3_utils-1.42                                                                                  November 2015                                                                                  SG_RESET_WP(8)
