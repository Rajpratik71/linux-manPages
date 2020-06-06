BTRFS-CHECK(8)                                                                                 Btrfs Manual                                                                                BTRFS-CHECK(8)

NAME
       btrfs-check - check or repair an unmounted btrfs filesystem

SYNOPSIS
       btrfs check [options] <device>

DESCRIPTION
       btrfs check is used to check or repair an unmounted btrfs filesystem.

           Note
           Since btrfs is under development, the btrfs check capabilities are continuously enhanced. It’s highly recommended to read the following btrfs wiki before executing btrfs check with --repair
           option: https://btrfs.wiki.kernel.org/index.php/Btrfsck

       btrfsck is an alias of btrfs check command and is now deprecated.

OPTIONS
       -s|--super <superblock>
           use <superblock>th superblock copy, valid values are 0 up to 2 if the respective superblock offset is within the fileystem

       --repair
           try to repair the filesystem

       --init-csum-tree
           create a new CRC tree and recalculate all checksums

       --init-extent-tree
           create a new extent tree

       --check-data-csum
           verify checkums of data blocks

       -p|--progress
           indicate progress at various checking phases

       --qgroup-report
           verify qgroup accounting and compare against filesystem accounting

       --subvol-extents <subvolid>
           show extent state for a subvolume

       --tree-root <bytenr>
           use the given bytenr for the tree root

EXIT STATUS
       btrfs check returns a zero exit status if it succeeds. Non zero is returned in case of failure.

AVAILABILITY
       btrfs is part of btrfs-progs. Please refer to the btrfs wiki http://btrfs.wiki.kernel.org for further details.

SEE ALSO
       mkfs.btrfs(8), btrfs-scrub(8), btrfs-rescue(8)

Btrfs v4.4                                                                                      08/13/2019                                                                                 BTRFS-CHECK(8)
