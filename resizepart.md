RESIZEPART(8)               System Administration               RESIZEPART(8)

NAME
       resizepart - tell the kernel about the new size of a partition

SYNOPSIS
       resizepart device partition length

DESCRIPTION
       resizepart  tells the Linux kernel about the new size of the specified
       partition.  The command is a simple wrapper around the "resize  parti‐
       tion" ioctl.

       This command doesn't manipulate partitions on a block device.

PARAMETERS
       device The disk device.

       partition
              The partition number.

       length The new length of the partition (in 512-byte sectors).

SEE ALSO
       addpart(8), delpart(8), fdisk(8), parted(8), partprobe(8), partx(8)

AVAILABILITY
       The resizepart command is part of the util-linux package and is avail‐
       able from https://www.kernel.org/pub/linux/utils/util-linux/.

util-linux                       January 2015                   RESIZEPART(8)
