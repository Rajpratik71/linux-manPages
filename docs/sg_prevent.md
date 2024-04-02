SG_PREVENT(8)                                                                                     SG3_UTILS                                                                                     SG_PREVENT(8)



NAME
       sg_prevent - send SCSI PREVENT ALLOW MEDIUM REMOVAL command

SYNOPSIS
       sg_prevent [--allow] [--help] [--prevent=PC] [--verbose] [--version] DEVICE

DESCRIPTION
       Sends  a SCSI PREVENT ALLOW MEDIUM REMOVAL command to DEVICE.  The default action of this utility is to prevent the removing or ejecting of the medium from a drive. This is done by ignoring the SCSI
       START STOP UNIT command (see sg_start) and ignoring the eject button on the drive when the user presses it. Drives that hold removable disks, tape cartridges or cd/dvd media typically implement this
       command.   The definition of the "prevent" codes for this command differ between disks and tapes (covered by SBC-3 and SSC-3) and cd/dvd drives (covered by MMC-5). The "prevent codes" described here
       are from MMC-5.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -a, --allow
              allow medium removal. This is equivalent to setting to '--prevent=2'.  Cannot be used with --prevent=PC option (i.e. either use no options (hence  prevent  removal),  this  option  or  --pre-
              vent=PC).

       -h, --help
              output the usage message then exit.

       -p, --prevent=PC
              where  PC  is  a  prevent code value. Defined values are: 0 allows removal, 1 prevents removal (default), 2 allows persistent removal while 3 prevents persistent removal. "Persistent" in this
              context means that the initiator (port) that successfully uses code 3 blocks other initiators (ports) from allowing removal. A "persistent prevent" state can be cleared by the owner  allowing
              persistent removal (code 2) or a power cycle (or anything that resets the device (LU)) or some special commands (e.g. various service actions of Persistent Reserve Out, see SPC-3).

       -v, --verbose
              increase the level of verbosity, (i.e. debug output).

       -V, --version
              print the version string and then exit.

EXIT STATUS
       The exit status of sg_prevent is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

AUTHORS
       Written by Douglas Gilbert.

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2004-2012 Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_start(sg3_utils), sg_persist(sg3_utils)



sg3_utils-1.35                                                                                  November 2012                                                                                   SG_PREVENT(8)
