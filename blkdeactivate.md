BLKDEACTIVATE(8)                                             BLKDEACTIVATE(8)

NAME
       blkdeactivate — utility to deactivate block devices

SYNOPSIS
       blkdeactivate     [-d dm_options]     [-e]    [-h]    [-l lvm_options]
       [-m mpath_options] [-r mdraid_options] [-u] [-v] [device]

DESCRIPTION
       The blkdeactivate utility deactivates block devices. For mounted block
       devices,  it  attempts  to  unmount  it automatically before trying to
       deactivate. The utility currently supports device-mapper devices (DM),
       including  LVM  volumes  and software RAID MD devices. LVM volumes are
       handled directly using the lvm(8) command, the rest  of  device-mapper
       based  devices  are  handled using the dmsetup(8) command.  MD devices
       are handled using the mdadm(8) command.

OPTIONS
       -d, --dmoptions dm_options
              Comma  separated  list  of  device-mapper   specific   options.
              Accepted dmsetup(8) options are:

              retry  Retry removal several times in case of failure.

              force  Force device removal.

       -e, --errors
              Show  errors reported from tools called by blkdeactivate. With‐
              out this option, any error messages from these  external  tools
              are  suppressed  and  the  blkdeactivate itself provides only a
              summary message to indicate the device was skipped.

       -h, --help
              Display the help text.

       -l, --lvmoptions lvm_options
              Comma-separated list of LVM specific options:

              retry  Retry removal several times in case of failure.

              wholevg
                     Deactivate the whole LVM Volume Group when processing  a
                     Logical  Volume.   Deactivating  the  Volume  Group as a
                     whole is quicker than deactivating each  Logical  Volume
                     separately.

       -m, --mpathoptions mpath_options
              Comma-separated   list   of  device-mapper  multipath  specific
              options:

              disablequeueing
                     Disable queueing on all multipath devices before deacti‐
                     vation.  This avoids a situation where blkdeactivate may
                     end up waiting if all the paths are unavailable for  any
                     underlying device-mapper multipath device.

       -r, --mdraidoptions mdraid_options
              Comma-separated list of MD RAID specific options:

              wait   Wait  MD  device's resync, recovery or reshape action to
                     complete before deactivation.

       -u, --umount
              Unmount a mounted device before trying to deactivate it.  With‐
              out  this  option used, a device that is mounted is not deacti‐
              vated.

       -v, --verbose
              Run in verbose mode. Use --vv for even more verbose mode.

EXAMPLES
       Deactivate all supported block devices found in the  system,  skipping
       mounted devices.   # blkdeactivate

       Deactivate all supported block devices found in the system, unmounting
       any mounted devices first, if possible.   # blkdeactivate -u

       Deactivate the device /dev/vg/lvol0 together  with  all  its  holders,
       unmounting  any  mounted devices first, if possible.   # blkdeactivate
       -u /dev/vg/lvol0

       Deactivate all supported block devices found in  the  system.  If  the
       deactivation of a device-mapper device fails, retry it. Deactivate the
       whole Volume Group at once when processing an LVM Logical Volume.    #
       blkdeactivate -u -d retry -l wholevg

       Deactivate  all  supported  block  devices found in the system. If the
       deactivation of a device-mapper  device  fails,  retry  it  and  force
       removal.   # blkdeactivate -d force,retry

SEE ALSO
       dmsetup(8), lsblk(8), lvm(8), mdadm(8), multipathd(8), umount(8)

Red Hat, Inc          LVM TOOLS 2.02.176(2) (2017-11-03)     BLKDEACTIVATE(8)
