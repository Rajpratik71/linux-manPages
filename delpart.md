DELPART(8)                                                                                  System Administration                                                                                  DELPART(8)



NAME
       delpart - simple wrapper around the "del partition" ioctl

SYNOPSIS
       delpart device partition

DESCRIPTION
       delpart is a program that asks the Linux kernel to remove a partition.

       This command doesn't manipulate partitions on hard drive.


OPTIONS
       device Specify the disk device.

       partition
              Specify the partition number.


SEE ALSO
       addpart(8), fdisk(8), parted(8), partprobe(8), partx(8)

AVAILABILITY
       The delpart command is part of the util-linux package and is available from ftp://ftp.kernel.org/pub/linux/utils/util-linux/.



util-linux                                                                                       January 2007                                                                                      DELPART(8)
