GPHOTOFS(1)                                                   Debian GNU/Linux manual                                                  GPHOTOFS(1)

NAME
       gphotofs - filesystem to mount digital cameras

DESCRIPTION
       GPhotoFS is a filesystem client based on libgphoto2 that exposes supported cameras as filesystems; while some cameras implement the USB
       Mass Storage class and already appear as filesystems (making this program redundant), many use the Picture Transfer Protocol (PTP) or some
       other custom protocol. But as long as the camera is supported by libgphoto2, it can be mounted as a filesystem using this program.

       As libgphoto2 is a userspace library for interacting with cameras, it is natural that if one to build a filesystem ontop of it, one should
       use FUSE, and that is what I have done.

SYNOPSIS
       mounting
           gphotofs <mountpoint>

       unmounting
           fusermount -u <mountpoint>

NOTES
       You must have permission to read and write the device.  By default, devices recognized by libgphoto2 are created with read/write access for
       group "plugdev", so users must be added to this group to use GPhotoFS.

LIMITATIONS
       GPhotoFS currently can't add or remove directories, rename files or directories, add or modify files and get space information.

SEE ALSO
       fusermount(1)

AUTHOR
       This manpage was written by Florian Ragwitz <rafl@debian.org> for the Debian GNU/Linux distribution, but may be used by others under the
       terms of the GNU General Public License version 2.

Debian Project                                                      2014-01-21                                                         GPHOTOFS(1)
