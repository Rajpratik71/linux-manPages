SG_MAP26(8)                                                                                       SG3_UTILS                                                                                       SG_MAP26(8)



NAME
       sg_map26 - map SCSI generic (sg) device to corresponding device names

SYNOPSIS
       sg_map26 [--dev_dir=DIR] [--given_is=0|1] [--help] [--result=0|1|2|3] [--symlink] [--verbose] [--version] DEVICE

DESCRIPTION
       Maps  a  special  file  (block  or  char) associated with a SCSI device to the corresponding SCSI generic (sg) device, or vice versa.  Can also be given a sysfs file, for example '/sys/block/sda' or
       '/sys/block/sda/dev'.

       Rather than map to or from a sg device, the sysfs file name matching a given device special file (or vice versa) can be requested. This is done with  '--result=2'  and  '--result=3'.   This  feature
       works on ATA devices (e.g. 'dev/hdc') as well as SCSI devices.

       In  this  utility,  "mapped" refers to finding the relationship between a SCSI generic (sg) node and the higher level SCSI device name; or vice versa. For example '/dev/sg0' may "map" to '/dev/sda'.
       Mappings may not exist, if a relevant module is not loaded, for example. Also there are SCSI devices that can only be accessed via a sg node (e.g. SAF-TE and some SES devices).

       In this utility, "matching" refers to different representations of the same device accessed via the same driver. For example, '/dev/hdc' and '/sys/block/hdc' usually refer to  the  same  device  and
       thus would be considered matching. A related example is that '/dev/cdrom' and '/dev/hdc' are also considered matching if '/dev/cdrom' is a symlink to '/dev/hdc'.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -d, --dev_dir=DIR
              where  DIR is the directory to search for resultant device special files in (or symlinks to same). Only active when '--result=0' (the default) or '--result=2'. If this option is not given and
              DEVICE is a device special file then the directory part of DEVICE is assumed.  If this option is not given and DEVICE is a sysfs name, then if necessary '/dev' is assumed as the directory.

       -g, --given_is=0 | 1
              specifies the DEVICE is either a device special file (when the argument is 0), or a sysfs 'dev' file (when the argument is 1). The parent directory of a sysfs  'dev'  file  is  also  accepted
              (e.g.   either  '/sys/block/sda/dev'  or '/sys/block/sda' are accepted). Usually there is no need to give this option since this utility first checks for special files (or symlinks to special
              files) and if not, assumes it has been given a sysfs 'dev' file (or its parent). Generates an error if given and disagrees with variety of DEVICE.

       -h, --help
              output the usage message then exit.

       -r, --result=0 | 1 | 2 | 3
              specifies what variety of file (or files) that this utility tries to find.  The default is a "mapped" device special file, when the argument is 0.  When the argument is 1, this utility  tries
              to  find the "mapped" sysfs node name. When the argument is 2, this utility tries to find the "matching" device special file. When the argument is 3, this utility tries to find the "matching"
              sysfs node name.

       -s, --symlink
              when a device special file is being sought (i.e. when '--result=0' (the default) or '--result=2') then also look for symlinks to that device special file in the same directory.

       -v, --verbose
              increase the level of verbosity, (i.e. debug output).

       -V, --version
              print the version string and then exit.

NOTES
       This utility is designed for the Linux 2.6 (and later) kernel series.  It uses special file major and minor numbers (and whether the special is block or character) together with sysfs to do its map‐
       ping  or  matching.  In the absence of any other information, device special files are assumed to be in the '/dev' directory while sysfs is assumed to be mounted at '/sys'. Device names in sysfs are
       predictable, given the corresponding major and minor number of the device. However, due to udev rules, the name of device special files can be anything the user desires  (e.g.  '/dev/sda'  could  be
       named  '/dev/my_boot_disk').  When  trying  to find a resultant device special file, this utility uses the major and minor numbers (and whether a block or char device is sought) to search the device
       directory.

       This utility only shows one relationship at a time. To get an overview of all SCSI devices, with special file names and optionally the "mapped" sg device name, see the lsscsi utility.

EXAMPLES
       Assume sg2 maps to sdb while dvd, cdrom and hdc are all matching.

         # sg_map26 /dev/sg2
         /dev/sdb

         # sg_map26 /dev/sdb
         /dev/sg2

         # sg_map26 --result=0 /dev/sdb
         /dev/sg2

         # sg_map26 --result=3 /dev/sdb
         /sys/block/sda

         # sg_map26 --result=1 /dev/sdb
         /sys/class/scsi_generic/sg0

       Now look at '/dev/hdc' and friends

         # sg_map26 /dev/hdc
         <error: a hd device does not map to a sg device>

         # sg_map26 --result=3 /dev/hdc
         /sys/block/hdc

         # sg_map26 --result=2 /dev/hdc
         /dev/hdc

         # sg_map26 --result=2 --symlink /dev/hdc
         /dev/cdrom
         /dev/dvd
         /dev/hdc

         # sg_map26 --result=2 --symlink /sys/block/hdc
         /dev/cdrom
         /dev/dvd
         /dev/hdc

EXIT STATUS
       The exit status of sg_map26 is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

AUTHORS
       Written by Douglas Gilbert.

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2005-2012 Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       udev(7), lsscsi(lsscsi)



sg3_utils-1.35                                                                                  November 2012                                                                                     SG_MAP26(8)
