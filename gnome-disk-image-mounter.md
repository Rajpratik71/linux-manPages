GNOME-DISK-IMAGE-MOU(1)                                                                   gnome-disk-utility                                                                   GNOME-DISK-IMAGE-MOU(1)

NAME
       gnome-disk-image-mounter - Attach and mount disk images

SYNOPSIS
       gnome-disk-image-mounter [--writable] [URI...]

DESCRIPTION
       gnome-disk-image-mounter can be used to set up disk images. Both regular files and GVfs URIs (such as smb://filer/media/file.iso) can be used in the URI parameter. If no URIs are given and a
       window server is running, a graphical file chooser will be presented.

       Note that gnome-disk-image-mounter will not mount filesystems or unlock encrypted volumes in the disk image - this responsibility is left to the automounter in GNOME Shell to ensure that the
       same interactions happen as if the disk image was a regular physical device or disc.

       By default the disk images are attached read-only, use the option --writable to change this.

RETURN VALUE
       gnome-disk-image-mounter returns 0 on success and non-zero on failure.

AUTHOR
       Written by David Zeuthen <zeuthen@gmail.com> with a lot of help from many others.

BUGS
       Please send bug reports to either the distribution bug tracker or the upstream bug tracker at https://bugzilla.gnome.org/enter_bug.cgi?product=gnome-disk-utility.

SEE ALSO
       gnome-shell(1), gnome-disks(1), udisks(8), losetup(8)

GNOME                                                                                         March 2013                                                                       GNOME-DISK-IMAGE-MOU(1)
