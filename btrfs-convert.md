BTRFS-CONVERT(8)                                                                               Btrfs Manual                                                                              BTRFS-CONVERT(8)

NAME
       btrfs-convert - convert from ext2/3/4 filesystem to btrfs

SYNOPSIS
       btrfs-convert [options] <device>

DESCRIPTION
       btrfs-convert is used to convert existing ext2/3/4 filesystem image to a btrfs filesystem in-place. The original filesystem image is accessible subvolume named ext2_saved as file image.

           Warning
           If you are going to perform rollback to ext2/3/4, you should not execute btrfs balance command on the converted filesystem. This will change the extent layout and make btrfs-convert unable
           to rollback.

       The conversion utilizes free space of the original filesystem. The exact estimate of the required space cannot be foretold. The final btrfs metadata might occupy several gigabytes on a
       hundreds-gigabyte filesystem.

       If you decide not to rollback anymore, it is recommended to perform a few more steps to transform the btrfs filesystem to a more compact layout. The conversion inherits the original data block
       fragmentation and the metadata blocks are bound to the original free space layout.

       REMOVE THE ORIGINAL FILESYSTEM METADATA

       By removing the ext2_saved subvolume, all metadata of the original filesystem will be removed:

           # btrfs subvolume delete /mnt/ext2_saved

       At this point it’s not possible to do rollback. The filesystem is usable but may be impacted by the fragmentation.

       MAKE FILE DATA MORE CONTIGUOUS

       An optional but recommended step is to run defragmentation on the entire filesystem. This will attempt to make file extents more contiguous.

           # btrfs filesystem defrag -v -r -f -t 32M /mnt/btrfs

       Verbose recursive defragmentation (-v, -r), flush data per-file (-f) with target extent size 32M (-t).

       ATTEMPT TO MAKE BTRFS METADATA MORE COMPACT

       Optional but recommended step.

       The metadata block groups after conversion may be smaller than the default size (256MiB or 1GiB). Running a balance will attempt to merge the block groups. This depends on the free space layout
       (and fragmentation) and may fail. This is a soft error leaving the filesystem usable but the block group layout may remain unchanged.

       Note that balance operation takes a lot of time.

           # btrfs balance start -m /mnt/btrfs

OPTIONS
       -d|--no-datasum
           disable data checksum calculations and set NODATASUM file flag, this can speed up the conversion

       -i|--no-xattr
           ignore xattrs and ACLs of files

       -n|--no-inline
           disable inlining of small files to metadata blocks, this will decrease the metadata consumption and may help to convert a filesystem with low free space

       -N|--nodesize <SIZE>
           set filesystem nodesize, the tree block size in which btrfs stores its metadata. The default value is 16KB (16384) or the page size, whichever is bigger. Must be a multiple of the
           sectorsize, but not larger than 65536. Se mkfs.btrfs(8) for more details.

       -r|--rollback
           rollback to the original ext2/3/4 filesystem if possible

       -l|--label <LABEL>
           set filesystem label during conversion

       -L|--copy-label
           use label from the converted filesystem

       -p|--progress
           show progress of conversion, on by default

       --no-progress
           disable detailed progress and show only the main phases of conversion

EXIT STATUS
       btrfs-convert will return 0 if no error happened. If any problems happened, 1 will be returned.

SEE ALSO
       mkfs.btrfs(8)

Btrfs v4.4                                                                                      08/13/2019                                                                               BTRFS-CONVERT(8)
