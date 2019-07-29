FSCK_HFS(8)                                                 BSD System Manager's Manual                                                FSCK_HFS(8)

NAME
     fsck.hfs — HFS file system consistency check

SYNOPSIS
     fsck.hfs -q [-df] special ...
     fsck.hfs -p [-df] special ...
     fsck.hfs [-n | -y | -r] [-dfgl] [-m mode] [-c size] special ...

DESCRIPTION
     The fsck.hfs utility verifies and repairs standard HFS and HFS+ file systems.

     The first form of fsck.hfs quickly checks the specified file systems to determine whether they were cleanly unmounted.

     The second form of fsck.hfs preens the specified file systems.  It is normally started by fsck(8) during systen boot, when a HFS file system
     is detected.  When preening file systems, fsck.hfs will fix common inconsistencies for file systems that were not unmounted cleanly.  If more
     serious problems are found, fsck.hfs does not try to fix them, indicates that it was not successful, and exits.

     The third form of fsck.hfs checks the specified file systems and tries to repair all detected inconsistencies.

     If no options are specified fsck.hfs will always check and attempt to fix the specified file systems.

     The options are as follows:

           -c size Specify the size of the cache used by fsck.hfs internally.  Bigger size can result in better performance but can result in
                   deadlock when used with -l option.  Size can be specified as a decimal, octal, or hexadecimal number.  If the number ends with
                   a ``k'', ``m'', or ``g'', the number is multiplied by 1024 (1K), 1048576 (1M), or 1073741824 (1G), respectively.

           -d      Display debugging information.  This option may provide useful information when fsck.hfs cannot repair a damaged file system.

           -f      When used with the -p option, force fsck.hfs to check `clean' file systems, otherwise it means force fsck.hfs to check and
                   repair journaled HFS+ file systems.

           -g      Causes fsck.hfs to generate its output strings in GUI format.  This option is used when another application with a graphical
                   user interface (like Mac OS X Disk Utility) is invoking the fsck.hfs tool.

           -l      Lock down the file system and perform a test-only check.  This makes it possible to check a file system that is currently
                   mounted, although no repairs can be made.

           -m mode Mode is an octal number that will be used to set the permissions for the lost+found directory when it is created.  The
                   lost+found directory is only created when a volume is repaired and orphaned files or directories are detected.  fsck.hfs places
                   orphaned files and directories into the lost+found directory (located at the root of the volume).  The default mode is 01777.

           -p      Preen the specified file systems.

           -q      Causes fsck.hfs to quickly check whether the volume was unmounted cleanly.  If the volume was unmounted cleanly, then the exit
                   status is 0.  If the volume was not unmounted cleanly, then the exit status will be non-zero.  In either case, a message is
                   printed to standard output describing whether the volume was clean or dirty.

           -y      Always attempt to repair any damage that is found.

           -n      Never attempt to repair any damage that is found.

           -r      Rebuild the catalog file on the specified file system.  This option currently will only work if there is enough contiguous
                   space on the specified file system for a new catalog file and if there is no damage to the leaf nodes in the existing catalog
                   file.

SEE ALSO
     fsck(8)

BUGS
     fsck.hfs is not able to fix some inconsistencies that it detects.

HISTORY
     The fsck.hfs command appeared in Mac OS X Server 1.0 .

Mac OS X                                                         November 21, 2002                                                        Mac OS X
