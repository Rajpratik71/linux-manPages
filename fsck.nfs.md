FSCK.NFS(8)                                                   System Manager's Manual                                                  FSCK.NFS(8)

NAME
       fsck.nfs - Dummy fsck.nfs script that always returns success.

SYNOPSIS
       fsck.nfs

DESCRIPTION
       Debian  GNU/Linux  need this for when the root file system is on NFS: there is no way to find out if root is NFS mounted and we really want
       to do a "fsck -a /".

EXIT CODE
       The exit code returned by mount.nfs is always zero, meaning successful completion.

SEE ALSO
       fsck(8), fstab(5).

Initscripts                                                          May 2004                                                          FSCK.NFS(8)
