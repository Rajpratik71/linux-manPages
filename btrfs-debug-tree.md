BTRFS-DEBUG-TREE(8)                                                                            Btrfs Manual                                                                           BTRFS-DEBUG-TREE(8)

NAME
       btrfs-debug-tree - dump btrfs filesystem metadata into stdout

SYNOPSIS
       btrfs-debug-tree [options] <device>

DESCRIPTION
       btrfs-debug-tree is used to dump the whole tree of the given device.

       This is maybe useful for analyzing filesystem state or inconsistence and has a positive educational effect on understanding the internal structure. <device> is the device file where the
       filesystem is stored.

OPTIONS
       -e
           Print detailed extents info.

       -d
           Print info of btrfs device and root tree dirs only.

       -r
           Print info of roots only.

       -b <block_num>
           Print info of the specified block only.

EXIT STATUS
       btrfs-debug-tree will return 0 if no error happened. If any problems happened, 1 will be returned.

SEE ALSO
       mkfs.btrfs(8)

Btrfs v4.4                                                                                      08/13/2019                                                                            BTRFS-DEBUG-TREE(8)
