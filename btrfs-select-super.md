BTRFS-SELECT-SUPER(8)                                                                          Btrfs Manual                                                                         BTRFS-SELECT-SUPER(8)

NAME
       btrfs-select-super - overwrite superblock with a backup

SYNOPSIS
       btrfs-select-super -s number dev

DESCRIPTION
       btrfs-select-super destructively overwrites all copies of the superblock with a specified copy. This helps with certain cases of damage, especially when barriers were disabled during a power
       failure. You can find a valid copy of the superblock with btrfs check -s.

       The filesystem specified by dev must not be mounted.

OPTIONS
       -s|--super <superblock>
           use <superblock>th superblock copy, valid values are 0 up to 2 if the respective superblock offset is within the filesystem

SEE ALSO
       btrfsck check(8)

Btrfs v4.4                                                                                      08/13/2019                                                                          BTRFS-SELECT-SUPER(8)
