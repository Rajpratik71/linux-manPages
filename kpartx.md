KPARTX(8)                               System Manager's Manual                              KPARTX(8)

NAME
       kpartx - Create device maps from partition tables.

SYNOPSIS
       kpartx [-a|-d|-u|-l] [-r] [-p] [-f] [-g] [-s] [-v] wholedisk

DESCRIPTION
       This  tool, derived from util-linux' partx, reads partition tables on specified device and cre‐
       ate device maps over partitions segments detected. It is called from hotplug upon  device  maps
       creation and deletion.

OPTIONS
       -a     Add partition mappings.

       -d     Delete partition mappings.

       -u     Update partition mappings.

       -l     List partition mappings that would be added -a.

       -r     Read-only partition mappings.

       -p     Set device name-partition number delimiter.

       -f     Force creation of mappings; overrides 'no_partitions' feature.

       -g     Force GUID partition table (GPT).

       -s     Sync mode. Don't return until the partitions are created.

       -v     Operate verbosely.

EXAMPLE
       To mount all the partitions in a raw disk image:

              kpartx -av disk.img

       This will output lines such as:

              add map loop1p1 (254:4): 0 409597 linear 7:1 3

       The loop1p1 is the name of a device file under /dev/mapper which you can use to access the par‐
       tition, for example to fsck it:

              fsck /dev/mapper/loop1p1

       When you're done, you need to remove the devices:

              kpartx -d disk.img

SEE ALSO
       multipath(8) multipathd(8) hotplug(8)

AUTHORS
       This man page was assembled By Patrick Caulfield for the Debian project.

       multipath-tools was developed by Christophe Varoqui <christophe.varoqui@opensvc.com>  and  oth‐
       ers.

Linux                                         2016-10-28                                     KPARTX(8)
