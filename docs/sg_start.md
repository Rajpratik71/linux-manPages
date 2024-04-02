SG_START(8)                                                                                       SG3_UTILS                                                                                       SG_START(8)



NAME
       sg_start - send SCSI START STOP UNIT command: start, stop, load or eject medium

SYNOPSIS
       sg_start [0] [1] [--eject] [--help] [--fl=FL] [--immed] [--load] [--loej] [--mod=PC_MOD] [--noflush] [--pc=PC] [--readonly] [--start] [--stop] [--verbose] [--version] DEVICE

       sg_start [--eject] [--fl=FL] [-i] [--imm=0|1] [--load] [--loej] [--mod=PC_MOD] [--noflush] [--pc=PC] [-r] [--start] [--stop] [-v] [-V] [0|1] DEVICE

DESCRIPTION
       sg_start  sends  a  SCSI  START STOP UNIT command to the DEVICE with the selected options. The most used options are --stop to spin down a disk and --start to spin up a disk. Using --start on a disk
       that is already spinning is harmless. There is also finer grain control with "power condition": active, idle or standby. This is set with the --pc=PC option. In some contexts the "stop" state can be
       considered an additional power condition.

       Devices  that  contain removable media such as cd/dvds can use the --loej option to load the medium when used in conjunction with --start (i.e. load medium then spin up). Alternatively --loej may be
       used to eject the medium when used in conjunction with --stop (i.e. spin down then eject medium). More simply, the loading or ejecting of a removable medium can  be  requested  with  the  --load  or
       --eject' option.

       If no option or argument is given then a --start is assumed; as the utility's name suggests.

       This  utility  supports  two command line syntaxes, the preferred one is shown first in the synopsis and explained in this section. A later section on the old command line syntax outlines the second
       group of options.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       0      same action as --stop.

       1      same action as --start.

       -e, --eject
              stop the medium and eject it from the drive. Only appropriate for a device with removable medium. Might be ignored (prevented), see below.

       -h, --help
              print out the usage message then exit.

       -f, --fl=FL
              sets the format layer number for the disc to "jump" to (defined in MMC-5).  Values of FL can be 0 to 3. When this option is chosen, the FL, LoEj and Start bits are set in the cdb as  required
              by MMC-5; thus the user does not need to set the --start and/or --load options.

       -i, --immed
              sets  the IMM bit on the START STOP UNIT command so this utility will return immediately and not wait for the media to complete the requested action. The default is to wait until the media to
              complete the requested action before returning.

       -l, --load
              load the medium in the drive and start it. Only appropriate for a removable medium.

       -L, --loej
              sets the LOEJ bit on the START STOP UNIT command. This loads the media when the unit is started or eject it when the unit is stopped (i.e.  works in conjunction with START bit in  cdb).  This
              option is ignored if 'pc > 0'.  Default is off (i.e. don't attempt to load or eject media). If a start/start indication is not given (i.e. neither --start nor --stop) and this option is given
              then a load and start action is assumed.

       -m, --mod=PC_MOD
              where PC_MOD is the 'power condition modifier' value. 0 to 15 (inclusive) are valid and 0 is the default. This  'power condition modifier' field in the cdb was added after sbc3r13.

       -n, --noflush
              do not perform a flush to media (e.g. like SYNCHRONIZE CACHE does) before a variant of this utility that limits access to the media. Using the --stop option is an example  of  something  that
              limits access to the media. This 'noflush' field in the cdb was added after sbc3r13.

       -O, --old
              switch to older style options.

       -p, --pc=PC
              where PC is the 'power conditions' value. 0 to 15 (inclusive) are valid.  Default value is 0. When '--pc=0' then --eject, --load, --loej, --start and --stop are active. Some common values are
              1 for the "active" power condition (SBC); 2 for the idle power condition; 3 for the standby power condition; 5 for sleep power condition (MMC); 7 for LU_CONTROL (SBC), 0xa  (decimal  10)  for
              FORCE_IDLE_0 (SBC) and 0xb (decimal 11) for FORCE_STANDBY_0 (SBC). See recent SBC-3, MMC-5 and SAS drafts at www.t10.org for more information.

       -r, --readonly
              open  the  DEVICE  in  read-only  mode. Maybe required in Linux to stop a nuisance spin-up if the DEVICE is an ATA disk. The nuisance spin-up may occur at the end of this command negating the
              effect of the --stop option.

       -s, --start
              start (spin-up) the DEVICE. This sets the START bit in the cdb. Using this option on an already started device is harmless. In the absence of other options, this option defaults (i.e. set the
              START cdb bit).

       -S, --stop
              stop (spin-down) the DEVICE. This clears the START bit in the cdb.

       -v, --verbose
              increase the level of verbosity. Can be used multiple times.

       -V, --version
              print out version string then exit.

NOTES
       To avoid confusion, only one of 0, 1 --eject, --load, --start and --stop should be given.

       There  is  an associated "power condition" mode page (0x1a) in which timer values can be set for transitioning to either idle or standby state after a period of inactivity. The sdparm utility can be
       used to view the power condition mode page and if required change it. If a DEVICE is in either idle or standby power condition state then a REQUEST SENSE command (see the sg_requests utility) should
       yield a sense key of "no sense" and an additional sense code of "Low power condition on" on recent SCSI devices.

       Ejection  of  removable  media (e.g. 'sg_start --eject /dev/hdd' where the DEVICE is an ATAPI cd/dvd drive) may be prevented by a prior SCSI PREVENT ALLOW MEDIUM REMOVAL command (see sg_prevent). In
       this case this utility should fail with an error generated by the device: illegal request / medium removal prevented. This can  be  overridden  using  sg_prevent  or,  for  example,  'sdparm  --com-
       mand=unlock /dev/hdd'.

       The  SCSI  TEST UNIT READY command can be used to find out whether a DEVICE is ready to transfer data. If rotating media is stopped or still coming up to speed, then the TEST UNIT READY command will
       yield a "not ready" sense key and an more informative additional sense code. See the sg_turs utility.

       In the 2.4 series of Linux kernels the DEVICE must be a SCSI generic (sg) device. In the 2.6 series block devices (e.g. SCSI disks and DVD drives) can also be  specified.  For  example  "sg_start  0
       /dev/sda" will work in the 2.6 series kernels.

       In the Linux 2.6 series, especially with ATA disks, using this utility to stop (spin down) a disk may not be sufficient and other mechanisms will start the disk again some time later. The user might
       additionally mark the disk as "offline" with 'echo offline > /sys/block/sda/device/state' where sda is the block name of the disk. To restart the disk "offline" can be replaced with "running".  Note
       that  once  the  'state'  is  set  to  offline,  no  SCSI  commands  can  be  sent  to the device until it is set back to running. Also stopping a disk via a pass-through interface (e.g. /dev/sg1 or
       /dev/bsg/1:0:0:0) may reduce unwanted side effects (such as restarting it again when this utility completes).

EXIT STATUS
       The exit status of sg_start is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

OLDER COMMAND LINE OPTIONS
       The options in this section were the only ones available prior to sg3_utils version 1.23 . In sg3_utils  version  1.23  and  later  these  older  options  can  be  selected  by  either  setting  the
       SG3_UTILS_OLD_OPTS environment variable or using '--old' (or '-O) as the first option.

       Note  that the action of --loej is slightly different in the older interface: when neither --start nor --stop (nor proxies for them) are given, --loej performs an eject operation. In the same situa-
       tion the newer interface will perform a load operation.

       Earlier versions of sg_start had a '-s' option to perform a SYNCHRONIZE CACHE command before the START STOP UNIT command was issued. According to recent SBC-2  drafts  this  is  done  implicitly  if
       required. Hence the '-s' option has been dropped.

       All options, other than '-v' and '-V', can be given with a single "-".  For example: "sg_start -stop /dev/sda" and "sg_start --stop /dev/sda" are equivalent. The single "-" form is for backward com-
       patibility.

       0      stop (spin-down) DEVICE.

       1      start (spin-up) DEVICE.

       --eject
              stop the medium and eject it from the drive.

       --fl=FL
              sets the format layer number for the disc to "jump" to (defined in MMC-5).

       -i     sets the IMM bit on the START STOP UNIT command so this utility will return immediately and not wait for the media to spin down. Same effect as '--imm=1'. The  default  action  (without  this
              option or a '--imm=1' option) is to wait until the media spins down before returning.

       --imm=0|1
              when  the immediate bit is 1 then this utility returns immediately after the DEVICE has received the command. When this option is 0 (the default) then the utility returns once the command has
              completed its action (i.e. it waits until the device is started or stopped).

       --load load the medium in the drive and start it.

       --loej sets the LOEJ bit in the START STOP UNIT cdb. When a "start" operation is indicated, then a load and start is performed. When a "stop" operation is indicated, then a stop and  eject  is  per-
              formed.  When  neither a "start" or "stop" operation is indicated does a stop and eject. [Note that the last action differs from the new interface in which the option of this name defaults to
              load and start.]

       -N     switch to the newer style options.

       --mod=PC_MOD
              where PC_MOD is the 'power condition modifier' value. 0 to 15 (inclusive) are valid and 0 is the default. This field was added after sbc3r13.

       --noflush
              do not perform a flush to media (e.g. like SYNCHRONIZE CACHE does) before a variant of this utility that limits access to the media. Using the --stop option is an example  of  something  that
              limits access to the media. This field was added after sbc3r13.

       --pc=PC
              where PC is the 'power condition' value (in hex). 0 to f (inclusive) are valid. Default value is 0.

       -r     see the --readonly option above. May be useful for ATA disks.

       --start
              start (spin-up) DEVICE.

       --stop stop (spin-down) DEVICE. Same meaning as "0" argument.

       -v     verbose: outputs SCSI command in hex to console before with executing it. '-vv' and '-vvv' are also accepted yielding greater verbosity.

       -V     print out version string then exit.

AUTHOR
       Written by K. Garloff and D. Gilbert

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2002-2012 Kurt Garloff, Douglas Gilbert
       This software is distributed under the GPL version 2. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_prevent(sg3_utils), sg_requests(sg3_utils), sg_turs(sg3_utils) sdparm(sdparm)



sg3_utils-1.35                                                                                  November 2012                                                                                     SG_START(8)
