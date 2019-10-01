RESIZEPART(8)                                                                               System Administration                                                                               RESIZEPART(8)



NAME
       resizepart - simple wrapper around the "resize partition" ioctl

SYNOPSIS
       resizepart device partition length

DESCRIPTION
       resizepart is a program that informs the Linux kernel of new partition size.

       This command doesn't manipulate partitions on hard drive.


PARAMETERS
       device Specify the disk device.

       partition
              Specify the partition number.

       length Specify the length of the partition (in 512-byte sectors).


SEE ALSO
       addpart(8), delpart(8), fdisk(8), parted(8), partprobe(8), partx(8)

AVAILABILITY
       The resizepart command is part of the util-linux package and is available from ftp://ftp.kernel.org/pub/linux/utils/util-linux/.



util-linux                                                                                      February 2012                                                                                   RESIZEPART(8)
