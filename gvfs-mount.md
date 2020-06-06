GVFS-MOUNT(1)                                                                                 User Commands                                                                                 GVFS-MOUNT(1)

NAME
       gvfs-mount - Mounts the locations

SYNOPSIS
       gvfs-mount [OPTION...] [LOCATION...]

       gvfs-mount --unmount-scheme=SCHEME

       gvfs-mount --list [OPTION...]

       gvfs-mount --monitor [OPTION...]

DESCRIPTION
       gvfs-mount provides commandline access to various aspects of GIOs mounting functionality.

       Mounting refers to the traditional concept of arranging multiple file systems and devices in a single tree, rooted at /. Classical mounting happens in the kernel and is controlled by the mount
       utility. GIO expands this concept by introducing mount daemons that can make file systems available to GIO applications without kernel involvement.

OPTIONS
       The following options are understood:

       -h, --help
           Prints a short help text and exits.

       --version
           Shows the version number and exits.

       -m, --mountable
           Mount as a mountable.

       -d, --device=DEVICE
           Mount the volume with the given device file.

       -u, --unmount
           Unmount the locations.

       -e, --eject
           Eject the locations.

       -s, --unmount-scheme=SCHEME
           Unmount all mounts with the given scheme.

       -f, --force
           Ignore outstanding file operations when unmounting or ejecting.

       -a, --anonymous
           Use an anonymous user when authenticating

       -l, --list
           List all known mounts.

       -o, --monitor
           Monitor mount and unmount events.

       -i, --detail
           Show extra information for --list and --monitor.

EXIT STATUS
       On success 0 is returned, a non-zero failure code otherwise.

SEE ALSO
       ls(1), gvfs-info(1)

gvfs                                                                                                                                                                                        GVFS-MOUNT(1)
