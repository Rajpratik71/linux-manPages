SCSI_START(8)                                                                                     SG3_UTILS                                                                                     SCSI_START(8)



NAME
       scsi_start - start one or more SCSI disks

SYNOPSIS
       scsi_start [--help] [--verbose] [--wait] DEVICE [DEVICE]*

DESCRIPTION
       This bash shell script calls the sg_start utility on each given DEVICE. The purpose is to spin up (start) each given DEVICE.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -h, --help
              print out the usage message then exit.

       -v, --verbose
              increase level or verbosity.

       -w, --wait
              wait for the spin up (start) on each given DEVICE to complete.  The default action is to do each start in immediate mode.

NOTES
       If a large number of disks are spun up at the same time (i.e. without the --wait option) then the power supply may be overloaded.

EXIT STATUS
       The exit status of this script is 0 when it is successful. Otherwise the exit status is that of the last sg_start utility called. See the sg3_utils(8) man page.

AUTHORS
       Written by D. Gilbert

COPYRIGHT
       Copyright © 2009-2013 Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_start (sg3_utils)



sg3_utils-1.36                                                                                     May 2013                                                                                     SCSI_START(8)
