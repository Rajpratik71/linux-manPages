SG_EMC_TRESPASS(8)                                                                                SG3_UTILS                                                                                SG_EMC_TRESPASS(8)



NAME
       sg_emc_trespass - change ownership of SCSI LUN from another Service-Processor to this one

SYNOPSIS
       sg_emc_trespass [-d] [-hr] [-s] [-V] DEVICE

DESCRIPTION
       sg_emc_trespass  sends an EMC-specific Trespass Command to the DEVICE with the selected options. This Mode Select changes the ownership of the LUN of the device from another Service-Processor to the
       one the command was received on.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -d     outputs some extra debug information associated with executing this command

       -hr    Sets the 'Honor Reservation' bit in the command. If set, the trespass will only succeed to change the ownership from the Peer SP if the Peer SP does not have an outstanding  SCSI  reservation
              for the LUN. By default, the reservation state will be ignored.

       -s     Send the short version of the trespass command instead of the long version. The short version is supported on the EMC FC5300, FC4500 and FC4700. The long version (default) is supported on the
              CLARiiON CX and AX family arrays.

       -V     print out version string then exit.

       In the 2.4 series of Linux kernels the DEVICE must be a SCSI generic (sg) device. In the 2.6 series block devices (e.g. SCSI disks and DVD drives) can also be  specified.  For  example  "sg_start  0
       /dev/sda" will work in the 2.6 series kernels.

EXIT STATUS
       The exit status of sg_emc_trespass is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

AUTHOR
       Written by Lars Marowsky-Bree, based on sg_start.

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2004-2012 Lars Marowsky-Bree, Douglas Gilbert.
       This software is distributed under the GPL version 2. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.



sg3_utils-1.35                                                                                  December 2012                                                                              SG_EMC_TRESPASS(8)
