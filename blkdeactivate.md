BLKDEACTIVATE(8)                                                                                                                                                                             BLKDEACTIVATE(8)



NAME
       blkdeactivate — utility to deactivate block devices

SYNOPSIS
       blkdeactivate [-d dm_options] [-e] [-h] [-l lvm_options] [-u] [-v] [device]

DESCRIPTION
       blkdeactivate  utility  deactivates block devices. If a device is mounted, the utility can unmount it automatically before trying to deactivate. The utility currently supports device-mapper devices,
       including LVM volumes.  LVM volumes are handled directly using the lvm(8) command.  Other device-mapper based devices are handled using the dmsetup(8) command.

OPTIONS
       -d, --dmoption dm_options
              Comma separated list of device-mapper specific options.  Accepted dmsetup(8) options are:

              retry  Retry removal several times in case of failure.

              force  Force device removal.

       -e, --errors
              Show errors reported from tools called by blkdeactivate. Without this option, any error messages from these external tools are suppressed and the blkdeactivate itself provides only a  summary
              message about device being skipped or not.

       -h, --help
              Display the help text.

       -l, --lvmoption lvm_options
              Comma separated list of LVM specific options:

              retry  Retry removal several times in case of failure.

              wholevg
                     Deactivate the whole LVM Volume Group when processing a Logical Volume.  Deactivating Volume Group as a whole takes less time than deactivating each Logical Volume separately.

       -u, --umount
              Unmount a mounted device before trying to deactivate it.  Without this option used, a device that is mounted is not deactivated.

       -v, --verbose
              Run in verbose mode. Use --vv for even more verbose mode.

EXAMPLES
       Deactivate all supported block devices found in the system. If a device is mounted, skip its deactivation.

       blkdeactivate

       Deactivate all supported block devices found in the system. If a device is mounted, unmount it first if possible.

       blkdeactivate -u

       Deactivate supplied device together with all its holders. If any of the devices processed is mounted, unmount it first if possible.

       blkdeactivate -u /dev/vg/lvol0

       Deactivate  all  supported block devices found in the system. Retry deactivation of device-mapper devices in case the deactivation fails. Deactivate the whole Volume Group at once when processing an
       LVM Logical Volume.

       blkdeactivate -u -d retry -l wholevg

       Deactivate all supported block devices found in the system. Retry deactivation of device-mapper devices in case the deactivation fails and force removal.

       blkdeactivate -d force,retry


SEE ALSO
       dmsetup(8), lsblk(8), lvm(8), umount(8)



Red Hat, Inc                                                                          LVM TOOLS 2.02.120(2) (2015-05-15)                                                                     BLKDEACTIVATE(8)
