DELPART(8)                  System Administration                  DELPART(8)

NAME
       delpart - tell the kernel to forget about a partition

SYNOPSIS
       delpart device partition

DESCRIPTION
       delpart  asks the Linux kernel to forget about the specified partition
       (a number) on the specified device.  The command is a  simple  wrapper
       around the "del partition" ioctl.

       This command doesn't manipulate partitions on a block device.

SEE ALSO
       addpart(8), fdisk(8), parted(8), partprobe(8), partx(8)

AVAILABILITY
       The delpart command is part of the util-linux package and is available
       from https://www.kernel.org/pub/linux/utils/util-linux/.

util-linux                       January 2015                      DELPART(8)
