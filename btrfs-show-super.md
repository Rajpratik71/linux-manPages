BTRFS-SHOW-SUPER(8)                                                                            Btrfs Manual                                                                           BTRFS-SHOW-SUPER(8)

NAME
       btrfs-show-super - show btrfs superblock information stored in devices

SYNOPSIS
       btrfs-show-super [options] <dev> [<dev>...]

DESCRIPTION
       btrfs-show-super is used to print the information of superblock, you can specify which mirror to print out.

       By default, every device’s first superblock will be printed out.

       Mainly used for debug purpose.

OPTIONS
       -f
           Print full superblock information.

           Including the system chunk array and backup roots.

       -a
           Print information of all superblocks.

           If this option is given, -i option will be ignored.

       -i <super_mirror>
           Specify which mirror to print out.

           <super_mirror> is between 0 and 2. If several -i <super_mirror> are given, only the last one is valid.

       -F
           Attempt to print the superblock even if no superblock magic is found. May end badly.

       -s <bytenr>
           specifiy offset to a superblock in a non-standard location at bytenr, useful for debugging (disables the -f option)

EXIT STATUS
       btrfs-show-super will return 0 if no error happened. If any problems happened, 1 will be returned.

SEE ALSO
       mkfs.btrfs(8)

Btrfs v4.4                                                                                      08/13/2019                                                                            BTRFS-SHOW-SUPER(8)
