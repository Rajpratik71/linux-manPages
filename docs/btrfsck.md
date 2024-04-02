BTRFS-CHECK(8)                                                                                   Btrfs Manual                                                                                  BTRFS-CHECK(8)



NAME
       btrfs-check - check or repair an unmounted btrfs filesystem

SYNOPSIS
       btrfs check [options] <device>

DESCRIPTION
       The filesystem checker is used to verify structural integrity of a filesystem and attempt to repair it if requested. The filesystem must be unmounted.

       By default, btrfs check will not modify the device but you can reaffirm that by the option --readonly.

       btrfsck is an alias of btrfs check command and is now deprecated.

           Warning
           Do not use --repair unless you are adviced to by a developer, an experienced user or accept the fact that fsck cannot possibly fix all sorts of damage that could happen to a filesystem because
           of software and hardware bugs.

       The structural integrity check verifies if internal filesystem objects or data structures satisfy the constraints, point to the right objects or are correctly connected together.

       There are several cross checks that can detect wrong reference counts of shared extents, backrefrences, missing extents of inodes, directory and inode connectivity etc.

       The amount of memory required can be high, depending on the size of the filesystem, smililarly the run time.

SAFE OR ADVISORY OPTIONS
       -b|--backup
           use the first valid set of backup roots stored in the superblock

           This can be combined with --super if some of the superblocks are damaged.

       --check-data-csum
           verify checksums of data blocks

           This expects that the filesystem is otherwise OK, so this is basically and offline scrub but does not repair data from spare coipes.

       --chunk-root <bytenr>
           use the given offset bytenr for the chunk tree root

       -E|--subvol-extents <subvolid>
           show extent state for the given subvolume

       -p|--progress
           indicate progress at various checking phases

       --qgroup-report
           verify qgroup accounting and compare against filesystem accounting

       -r|--tree-root <bytenr>
           use the given offset bytenr for the tree root

       --readonly
           (default) run in read-only mode, this option exists to calm potential panic when users are going to run the checker

       -s|--super <superblock>
           use 'superblock’th superblock copy, valid values are 0, 1 or 2 if the respective superblock offset is within the device size

           This can be used to use a different starting point if some of the primary superblock is damaged.

DANGEROUS OPTIONS
       --repair
           enable the repair mode and attempt to fix problems where possible

       --init-csum-tree
           create a new checksum tree and recalculate checksums in all files

               Note
               Do not blindly use this option to fix checksum mismatch problems.

       --init-extent-tree
           build the extent tree from scratch

               Note
               Do not use unless you know what you’re doing.

EXIT STATUS
       btrfs check returns a zero exit status if it succeeds. Non zero is returned in case of failure.

AVAILABILITY
       btrfs is part of btrfs-progs. Please refer to the btrfs wiki http://btrfs.wiki.kernel.org for further details.

SEE ALSO
       mkfs.btrfs(8), btrfs-scrub(8), btrfs-rescue(8)



Btrfs v4.5.3+20160729                                                                             11/14/2016                                                                                   BTRFS-CHECK(8)
