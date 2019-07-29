ADDPART(8)                  System Administration                  ADDPART(8)

NAME
       addpart - tell the kernel about the existence of a partition

SYNOPSIS
       addpart device partition start length

DESCRIPTION
       addpart  tells  the  Linux kernel about the existence of the specified
       partition.  The command is a simple wrapper around the "add partition"
       ioctl.

       This command doesn't manipulate partitions on a block device.

PARAMETERS
       device The disk device.

       partition
              The partition number.

       start  The beginning of the partition (in 512-byte sectors).

       length The length of the partition (in 512-byte sectors).

SEE ALSO
       delpart(8), fdisk(8), parted(8), partprobe(8), partx(8)

AVAILABILITY
       The addpart command is part of the util-linux package and is available
       from https://www.kernel.org/pub/linux/utils/util-linux/.

util-linux                       January 2015                      ADDPART(8)
