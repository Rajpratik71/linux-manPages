DUMPE2FS(8)                                                   System Manager's Manual                                                  DUMPE2FS(8)

NAME
       dumpe2fs - dump ext2/ext3/ext4 filesystem information

SYNOPSIS
       dumpe2fs [ -bfghixV ] [ -o superblock=superblock ] [ -o blocksize=blocksize ] device

DESCRIPTION
       dumpe2fs prints the super block and blocks group information for the filesystem present on device.

       Note: When used with a mounted filesystem, the printed information may be old or inconsistent.

OPTIONS
       -b     print the blocks which are reserved as bad in the filesystem.

       -o superblock=superblock
              use  the  block  superblock  when  examining the filesystem.  This option is not usually needed except by a filesystem wizard who is
              examining the remains of a very badly corrupted filesystem.

       -o blocksize=blocksize
              use blocks of blocksize bytes when examining the filesystem.  This option is not usually needed except by a filesystem wizard who is
              examining the remains of a very badly corrupted filesystem.

       -f     force  dumpe2fs to display a filesystem even though it may have some filesystem feature flags which dumpe2fs may not understand (and
              which can cause some of dumpe2fs's display to be suspect).

       -g     display the group descriptor information in a machine readable colon-separated value format.  The fields  displayed  are  the  group
              number;  the number of the first block in the group; the superblock location (or -1 if not present); the range of blocks used by the
              group descriptors (or -1 if not present); the block bitmap location; the inode bitmap location; and the range of blocks used by  the
              inode table.

       -h     only display the superblock information and not any of the block group descriptor detail information.

       -i     display the filesystem data from an image file created by e2image, using device as the pathname to the image file.

       -x     print the detailed group information block numbers in hexadecimal format

       -V     print the version number of dumpe2fs and exit.

BUGS
       You need to know the physical filesystem structure to understand the output.

AUTHOR
       dumpe2fs was written by Remy Card <Remy.Card@linux.org>.  It is currently being maintained by Theodore Ts'o <tytso@alum.mit.edu>.

AVAILABILITY
       dumpe2fs is part of the e2fsprogs package and is available from http://e2fsprogs.sourceforge.net.

SEE ALSO
       e2fsck(8), mke2fs(8), tune2fs(8).  ext4(5)

E2fsprogs version 1.44.1                                            March 2018                                                         DUMPE2FS(8)
