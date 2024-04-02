USERMOUNT(1)                                                  General Commands Manual                                                 USERMOUNT(1)

NAME
       usermount - A graphical tool to mount, unmount and format filesystems.

SYNOPSIS
       usermount [ options ]

       userformat [ device ] [ options ]

DESCRIPTION
       usermount is a graphical tool to allow users to easily manage removable media, such as floppy disks or zip disks.  When the tool starts up,
       it scans /etc/fstab for all filesystems that have been configured to allow users to mount and unmount them.  The filesystem can be  mounted
       or unmounted by pressing the toggle button labeled Mount.

       Also,  if  the user has the appropriate permissions for the device, the Format button will be active.  This allows the user to format disks
       using fdformat and create a new filesystem of the type listed (using mkfs with the  appropriate  option).   Naturally,  the  user  will  be
       prompted for confirmation before actually destroying data on the device.

       Note that if a device is already mounted, the format button is inactive for all entries that share the same device.

       When run as root, usermount displays all of the entries in /etc/fstab rather than just the ones with the user option.

       Invoking userformat device allows formatting device, as if by selecting device in the userformat window, and by clicking the Format button.

OPTIONS
       This program has no command line options of it's own, but it does take the standard X program options like -display and such.  See the X(1)
       man page for some of the common options.

FILES
       /etc/fstab               The system file describing the mountable filesystems.

SEE ALSO
       mount(8), fdformat(8), mkfs(8), fstab(5) X(1)

BUGS
       Mount entries with a filesystem type of iso9660 are outright considered CD-ROMs and the format button is always disabled.

       Mount entries for swap files or partitions are also ignored.  A nice feature might be to allow root to turn swap on and off for swap parti‐
       tions.

AUTHOR
       Otto Hammersmith <otto@redhat.com>

Red Hat                                                            March 13 2007                                                      USERMOUNT(1)
