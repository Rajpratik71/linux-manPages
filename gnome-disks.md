GNOME-DISKS(1)                                                                            gnome-disk-utility                                                                            GNOME-DISKS(1)

NAME
       gnome-disks - the GNOME Disks application

SYNOPSIS
       gnome-disks [OPTIONS]

DESCRIPTION
       gnome-disks is the command to launch the GNOME Disks application. Disks provides a way to inspect, format, partition and configure disks and block devices.

       The Disks application is single-instance. What this means is that if the application is not already running when the gnome-disks command is invoked, it will get launched and the command
       invocation will block until the application exits. Otherwise the existing application instance will be used and the gnome-disks command will exit immediately.

OPTIONS
       The following options are understood:

       --block-device DEVICE
           Switches to the Disks application and selects the block device given by DEVICE (for example, /dev/sda).

       --block-device DEVICE --format-device [--xid WINDOW-ID]
           Shows the “Format Volume” dialog for the block device given by DEVICE (for example, /dev/sdb1). If WINDOW-ID is given, makes the dialog transient to the given XID.

       --restore-disk-image FILE
           Shows the “Restore Disk Image” dialog for the file given by FILE (for example, /home/user/Downloads/SuperOS.iso) and prompts the user to choose a disk to restore the image unto.

       -h, --help
           Prints a short help text and exits.

AUTHOR
       Written by David Zeuthen <zeuthen@gmail.com> with a lot of help from many others.

BUGS
       Please send bug reports to either the distribution bug tracker or the upstream bug tracker at https://bugzilla.gnome.org/enter_bug.cgi?product=gnome-disk-utility.

SEE ALSO
       gnome-disk-image-mounter(1), udisks(8)

GNOME                                                                                         March 2013                                                                                GNOME-DISKS(1)
