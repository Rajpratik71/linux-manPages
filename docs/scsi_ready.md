SCSI_READY(8)                                                                                     SG3_UTILS                                                                                     SCSI_READY(8)



NAME
       scsi_ready - do SCSI TEST UNIT READY on devices

SYNOPSIS
       scsi_ready [--brief] [--help] [--verbose] DEVICE [DEVICE]*

DESCRIPTION
       This  bash shell script calls the sg_turs utility on each given DEVICE. This will send a SCSI TEST UNIT READY command to each DEVICE. Disks, tape drives and DVD/BD players amongst others may respond
       to this SCSI command.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -b, --brief
              for each DEVICE given output a line containing either '    ready' or '    device not ready'. If DEVICE is not found or there is another  serious  error  then  an  error  message  will  appear
              instead.

       -h, --help
              print out the usage message then exit.

       -v, --verbose
              increase level or verbosity.

EXIT STATUS
       The exit status of this script is 0 when it is successful. Otherwise the exit status is that of the last sg_turs utility called. See the sg3_utils(8) man page.

AUTHORS
       Written by D. Gilbert

COPYRIGHT
       Copyright © 2009-2013 Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_turs (sg3_utils)



sg3_utils-1.36                                                                                     May 2013                                                                                     SCSI_READY(8)
