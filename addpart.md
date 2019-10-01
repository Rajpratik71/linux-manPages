ADDPART(8)                                                                                  System Administration                                                                                  ADDPART(8)



NAME
       addpart - simple wrapper around the "add partition" ioctl

SYNOPSIS
       addpart device partition start length

DESCRIPTION
       addpart is a program that informs the Linux kernel of new partition.

       This command doesn't manipulate partitions on hard drive.


PARAMETERS
       device Specify the disk device.

       partition
              Specify the partition number.

       start  Specify the begin of the partition (in 512-byte sectors).

       length Specify the length of the partition (in 512-byte sectors).


SEE ALSO
       delpart(8), fdisk(8), parted(8), partprobe(8), partx(8)

AVAILABILITY
       The addpart command is part of the util-linux package and is available from ftp://ftp.kernel.org/pub/linux/utils/util-linux/.



util-linux                                                                                       January 2007                                                                                      ADDPART(8)
