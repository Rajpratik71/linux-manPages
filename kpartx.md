KPARTX(8)                                                  Linux Administrator's Manual                                                  KPARTX(8)

NAME
       kpartx - Create device maps from partition tables

SYNOPSIS
       kpartx [-a | -d | -l] [-v] wholedisk

DESCRIPTION
       This  tool,  derived  from  util-linux'  partx,  reads partition tables on specified device and create device maps over partitions segments
       detected. It is called from hotplug upon device maps creation and deletion.

OPTIONS
       -a     Add partition mappings

       -r     Read-only partition mappings

       -d     Delete partition mappings

       -u     Update partition mappings

       -l     List partition mappings that would be added -a

       -p     set device name-partition number delimiter

       -f     force creation of mappings; overrides 'no_partitions' feature

       -g     force GUID partition table (GPT)

       -v     Operate verbosely

       -s     Sync mode. Don't return until the partitions are created

EXAMPLE
       To mount all the partitions in a raw disk image:

              kpartx -av disk.img

       This will output lines such as:

              loop3p1 : 0 20964762 /dev/loop3 63

       The loop3p1 is the name of a device file under /dev/mapper which you can use to access the partition, for example to fsck it:

              fsck /dev/mapper/loop3p1

       When you're done, you need to remove the devices:

              kpartx -d disk.img

SEE ALSO
       multipath(8) multipathd(8) hotplug(8)

AUTHORS
       This man page was assembled By Patrick Caulfield for the Debian project. From documentation provided by  the  multipath  author  Christophe
       Varoqui, <christophe.varoqui@opensvc.com> and others.

                                                                     July 2006                                                           KPARTX(8)
