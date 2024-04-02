SCSI_SATL(8)                                                                                      SG3_UTILS                                                                                      SCSI_SATL(8)



NAME
       scsi_satl - check SCSI to ATA Translation (SAT) device support

SYNOPSIS
       scsi_satl [--help] [--log] [--quiet] [--verbose] DEVICE

DESCRIPTION
       This  bash  shell  script  calls  several  SCSI  commands  on the given DEVICE that is assumed to be an ATA device behind a SCSI to ATA Translation (SAT) layer (SATL). The results of each test and a
       pass/fail count are output.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -h, --help
              print out the usage message then exit.

       -L, --log
              the output to stderr (from each SCSI command executed) is appended to a file called 'scsi_satl.err' in the current working directory.

       -q, --quiet
              the amount of output is reduced and typically only the pass/fail count is output.

       -v, --verbose
              increase level or verbosity.

EXIT STATUS
       The exit status of this script is the number of "bad" errors found.  So an exit status of 0 means all mandatory SCSI commands worked as expected.

AUTHORS
       Written by D. Gilbert

COPYRIGHT
       Copyright © 2011-2013 Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_inq, sg_luns, sg_turs, sg_requests, sg_vpd, sg_senddiag, sg_modes, sg_sat_identify (sg3_utils)



sg3_utils-1.36                                                                                     May 2013                                                                                      SCSI_SATL(8)
