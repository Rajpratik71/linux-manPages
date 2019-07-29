PVRESIZE(8)                                                   System Manager's Manual                                                  PVRESIZE(8)

NAME
       pvresize — resize a disk or partition in use by LVM2

SYNOPSIS
       pvresize  [--commandprofile  ProfileName]  [-d|--debug]  [-h|--help]  [-t|--test]  [-v|--verbose] [--version] [--reportformat {basic|json}]
       [--setphysicalvolumesize size] PhysicalVolume [PhysicalVolume...]

DESCRIPTION
       pvresize resizes PhysicalVolume which may already be in a volume group and have active logical volumes allocated on it.

OPTIONS
       See lvm(8) for common options.

       --setphysicalvolumesize size
              Overrides the automatically-detected size of the PV.  Use with care, or prior to reducing the physical size of the device.

EXAMPLES
       Expand the PV on /dev/sda1 after enlarging the partition with fdisk:

       pvresize /dev/sda1

       Shrink the PV on /dev/sda1 prior to shrinking the partition with fdisk (ensure that the PV size is appropriate for your intended new parti‐
       tion size):

       pvresize --setphysicalvolumesize 40G /dev/sda1

RESTRICTIONS
       pvresize  will refuse to shrink PhysicalVolume if it has allocated extents after where its new end would be. In the future, it should relo‐
       cate these elsewhere in the volume group if there is sufficient free space, like pvmove does.

       pvresize won't currently work correctly on LVM1 volumes.

SEE ALSO
       lvm(8), pvmove(8), lvresize(8), fdisk(8)

Sistina Software UK                                     LVM TOOLS 2.02.168(2) (2016-11-30)                                             PVRESIZE(8)
