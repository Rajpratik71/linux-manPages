FUSERMOUNT(1)                                                                         Filesystem in Userspace (FUSE)                                                                        FUSERMOUNT(1)

NAME
       fusermount - unmount FUSE filesystems

SYNOPSIS
       fusermount [OPTIONS] MOUNTPOINT

DESCRIPTION
       Filesystem  in  Userspace (FUSE) is a simple interface for userspace programs to export a virtual filesystem to the Linux kernel. It also aims to provide a secure method for non privileged users
       to create and mount their own filesystem implementations.

       fusermount is a program to unmount FUSE filesystems.

OPTIONS
       -h  print help.

       -V  print version.

       -o OPTION[,OPTION...]
           mount options.

       -u  unmount.

       -q  quiet.

       -z  lazy unmount.

SEE ALSO
       mount(8), mount.fuse(8), ulockmgr_server(1).

HOMEPAGE
       More information about fusermount and the FUSE project can be found at <http://fuse.sourceforge.net/>.

AUTHOR
       FUSE was written by Miklos Szeredi <miklos@szeredi.hu>.

       This manual page was written by Daniel Baumann <daniel.baumann@progress-technologies.net>.

2.8.6                                                                                           2011-10-23                                                                                  FUSERMOUNT(1)
