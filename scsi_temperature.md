SCSI_TEMPERATURE(8)                                                                               SG3_UTILS                                                                               SCSI_TEMPERATURE(8)



NAME
       scsi_temperature - fetch the temperature of a SCSI device

SYNOPSIS
       scsi_temperature [--help] [--verbose] DEVICE [DEVICE]*

DESCRIPTION
       This  bash shell script calls the sg_logs utility on each given DEVICE in order to find the device's temperature. The Temperature log page is checked first and if it is not available then the Infor‐
       mational Exceptions log page is checked.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -h, --help
              print out the usage message then exit.

       -v, --verbose
              increase level or verbosity.

EXIT STATUS
       The exit status of this script is 0 when it is successful. Otherwise the exit status is that of the last sg_logs utility called. See the sg3_utils(8) man page.

AUTHORS
       Written by D. Gilbert

COPYRIGHT
       Copyright © 2011-2013 Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_logs (sg3_utils)



sg3_utils-1.36                                                                                     May 2011                                                                               SCSI_TEMPERATURE(8)
