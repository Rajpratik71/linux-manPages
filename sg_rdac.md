SG_RDAC(8)                                                                                        SG3_UTILS                                                                                        SG_RDAC(8)



NAME
       sg_rdac - display or modify SCSI RDAC Redundant Controller mode page

SYNOPSIS
       sg_rdac [-a] [-f=LUN] [-v] [-V] DEVICE

DESCRIPTION
       sg_rdac  displays  or modifies the RDAC controller settings via the Redundant Controller mode page (0x2C). When modifying the settings it allows to transfer the ownership of individual drives to the
       controller the command was received on.

OPTIONS
       -a     Transfer all (visible) devices

       -f=LUN Transfer the device identified by LUN. This command will only work if the controller supports 'Dual Active Mode' (aka active/active mode).  LUN is a decimal number which cannot exceed 31 when
              the -6 option is given, otherwise is cannot exceed 255.

       -v     be verbose

       -V     print version string then exit

EXIT STATUS
       The exit status of sg_rdac is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

AUTHOR
       Written by Hannes Reinecke <hare at suse dot com>, based on sg_emc_trespass.

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2006-2016 Hannes Reinecke, Douglas Gilbert.
       This software is distributed under the GPL version 2. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.



sg3_utils-1.35                                                                                  November 2012                                                                                      SG_RDAC(8)
