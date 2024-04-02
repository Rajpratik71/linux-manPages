MOUNT.NFS(8)                                                                               System Manager's Manual                                                                               MOUNT.NFS(8)



NAME
       mount.nfs, mount.nfs4 - mount a Network File System

SYNOPSIS
       mount.nfs remotetarget dir [-rvVwfnsh ] [-o options]

DESCRIPTION
       mount.nfs is a part of nfs(5) utilities package, which provides NFS client functionality.

       mount.nfs is meant to be used by the mount(8) command for mounting NFS shares. This subcommand, however, can also be used as a standalone command with limited functionality.

       mount.nfs4  is  used  for  mounting  NFSv4  file  system,  while  mount.nfs  is  used  to  mount  NFS  file  systems  versions  3 or 2.  remotetarget is a server share usually in the form of server-
       name:/path/to/share.  dir is the directory on which the file system is to be mounted.


OPTIONS
       -r     Mount file system readonly.

       -v     Be verbose.

       -V     Print version.

       -w     Mount file system read-write.

       -f     Fake mount. Don't actually call the mount system call.

       -n     Do not update /etc/mtab.  By default, an entry is created in /etc/mtab for every mounted file system. Use this option to skip making an entry.

       -s     Tolerate sloppy mount options rather than fail.

       -h     Print help message.

       nfsoptions
              Refer to nfs(5) or mount(8) manual pages.


NOTE
       For further information please refer nfs(5) and mount(8) manual pages.


FILES
       /etc/fstab        file system table

       /etc/mtab         table of mounted file systems


SEE ALSO
       nfs(5), mount(8),


AUTHOR
       Amit Gud <agud@redhat.com>



                                                                                                  5 Jun 2006                                                                                     MOUNT.NFS(8)
