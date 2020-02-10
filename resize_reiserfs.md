RESIZE_REISERFS(8)                                                                       System Manager's Manual                                                                       RESIZE_REISERFS(8)

NAME
       resize_reiserfs - resizer tool for the ReiserFS filesystem

SYNOPSIS
       resize_reiserfs [ -s [+|-]size[K|M|G] ] [ -j dev ] [ -fqv ] device

DESCRIPTION
       The resize_reiserfs tool resizes an unmounted reiserfs file system.  It enlarges or shrinks an reiserfs file system located on a device so that it will have size bytes or size=old_size +(-) size
       bytes if the + or - prefix is used.  If the -s option is not specified, the filesystem will be resized to fill the given device.  The size parameter may have one of the optional modifiers K,  M,
       G, which means the size parameter is given in kilo-, mega-, gigabytes respectively.

       The  resize_reiserfs  program  does  not manipulate the size of the device. If you wish to enlarge a filesystem, you must make sure you expand the underlying device first. This can be done using
       cfdisk(8) for partitions, by deleting the partition and recreating it with a larger size (assuming there is free space after the partition in question).  Make sure you re-create it with the same
       starting disk cylinder as before!  Otherwise, the resize operation will certainly not work, and you may lose your entire filesystem.

       The resize_reiserfs program allows to grow a reiserfs on-line if there is a free space on block device.

       If you wish to shrink a reiserfs partition, first use resize_reiserfs to shrink the file system. You may then use cfdisk(8) to shrink the device. When shrinking the size of the device, make sure
       you do not make it smaller than the reduced size of the reiserfs filesystem.

OPTIONS
       -s [+|-]size
              Set the new size in bytes.

       -j dev Set the journal device name.

       -f     Force, do not perform checks.

       -q     Do not print anything but error messages.

       -v     Turn on extra progress status messages (default).

RETURN VALUES
       0    Resizing successful.

       -1   Resizing not successful.

EXAMPLES
       The following example shows how to test resize_reiserfs.  Suppose 2Gb reiserfs filesystem is created on the device /dev/hda8 and is mounted on /mnt.  For shrinking the device we need to  unmount
       it first, then run resize_reiserfs with a size  parameter (in this case -1Gb):

            df
            umount /mnt
            resize_reiserfs -s -1G /dev/hda8
            mount /dev/hda8 /mnt
            df /mnt

AUTHOR
       This version of resize_reiserfs has been written by Alexander Zarochentcev <zam@namesys.com>.

BUGS
       Please  report  bugs to the ReiserFS developers <reiserfs-devel@vger.kernel.org>, providing as much information as possible--your hardware, kernel, patches, settings, all printed messages; check
       the syslog file for any related information.

SEE ALSO
       cfdisk(8), reiserfsck(8), debugreiserfs(8)

Reiserfsprogs-3.6.24                                                                           January 2009                                                                            RESIZE_REISERFS(8)
