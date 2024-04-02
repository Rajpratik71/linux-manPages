SCSI_STOP(8)                                                                                      SG3_UTILS                                                                                      SCSI_STOP(8)



NAME
       scsi_stop - stop (spin down) one or more SCSI disks

SYNOPSIS
       scsi_stop [--help] [--verbose] [--wait] DEVICE [DEVICE]*

DESCRIPTION
       This bash shell script calls the sg_start utility on each given DEVICE. The purpose is to spin down (stop) each given DEVICE.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -h, --help
              print out the usage message then exit.

       -v, --verbose
              increase level or verbosity.

       -w, --wait
              wait for the spin down (stop) on each given DEVICE to complete.  The default action is to do each stop in immediate mode.

NOTES
       The sg_start utility calls the SCSI START STOP UNIT command and can either start (spin up) or stop (spin down) a SCSI disk depending on the given command line options.

EXIT STATUS
       The exit status of this script is 0 when it is successful. Otherwise the exit status is that of the last sg_start utility called. See the sg3_utils(8) man page.

AUTHORS
       Written by D. Gilbert

COPYRIGHT
       Copyright © 2009-2013 Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_start (sg3_utils)



sg3_utils-1.36                                                                                     May 2013                                                                                      SCSI_STOP(8)
