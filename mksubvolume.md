MKSUBVOLUME(8)                                                                          Filesystem Snapshot Management                                                                         MKSUBVOLUME(8)



NAME
       mksubvolume - Command-line program to create btrfs subvolume

SYNOPSIS
       mksubvolume [--nocow] [--verbose] {path}

DESCRIPTION
       Mksubvolume is a command-line program to create a btrfs subvolume including adding a fstab entry and mounting the subvolume at path.

OPTIONS
       --nocow
           Set the no-copy-on-write flag for the subvolume.

       -v, --verbose
           Increase verbosity.

AUTHORS
       Arvin Schnell <aschnell@suse.com>

SEE ALSO
       snapper(5), btrfs(8), fstab(5), mount(8)



0.5.0                                                                                             2015-09-17                                                                                   MKSUBVOLUME(8)
