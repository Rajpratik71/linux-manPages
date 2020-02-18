UMOUNT.NFS(8)            System Manager's Manual           UMOUNT.NFS(8)

NAME
       umount.nfs, umount.nfs4 - unmount a Network File System

SYNOPSIS
       umount.nfs dir [-fvnrlh ]

DESCRIPTION
       umount.nfs  and  umount.nfs4 are a part of nfs(5) utilities pack‐
       age, which provides NFS client functionality.

       umount.nfs4 and umount.nfs are meant to be used by the  umount(8)
       command  for unmounting NFS shares. This subcommand, however, can
       also be used as a standalone command with limited functionality.

       dir is the directory on which the file system is mounted.

OPTIONS
       -f     Force unmount the file system in case of  unreachable  NFS
              system.

       -v     Be verbose.

       -n     Do  not update /etc/mtab.  By default, an entry is created
              in /etc/mtab for  every  mounted  file  system.  Use  this
              option to skip deleting an entry.

       -r     In case unmounting fails, try to mount read-only.

       -l     Lazy  unmount. Detach the file system from the file system
              hierarchy now, and cleanup all references to the file sys‐
              tem as soon as it is not busy anymore.

       -h     Print help message.

NOTE
       For  further information please refer nfs(5) and umount(8) manual
       pages.

FILES
       /etc/fstab        file system table

       /etc/mtab         table of mounted file systems

SEE ALSO
       nfs(5), umount(8),

AUTHOR
       Amit Gud <agud@redhat.com>

                               6 Jun 2006                  UMOUNT.NFS(8)
