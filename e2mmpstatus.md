E2MMPSTATUS(8)                          System Manager's Manual                         E2MMPSTATUS(8)

NAME
       e2mmpstatus - Check MMP status of an ext4 filesystem

SYNOPSIS
       e2mmpstatus [-i] <filesystem>

OPTIONS
       -i     prints out the MMP information rather than check it.

DESCRIPTION
       e2mmpstatus  is used to check Multiple-Mount Protection (MMP) status of an ext4 filesystem with
       the mmp feature enabled.  The specified filesystem can  be  a  device  name  (e.g.   /dev/hdc1,
       /dev/sdb2),     or     an     ext4     filesystem     label     or     UUID,     for    example
       UUID=8868abf6-88c5-4a83-98b8-bfc24057f7bd or LABEL=root.  By default, the  e2mmpstatus  program
       checks  whether  it is safe to mount the filesystem without taking the risk of mounting it more
       than once.

       MMP (multiple-mount protection) is a feature that adds protection against the filesystem  being
       modified  simultaneously  by more than one node.  It is NOT safe to mount a filesystem when one
       of the following conditions is true:
            1. e2fsck is running on the filesystem.
            2. the filesystem is in use by another node.
            3. The MMP block is corrupted or cannot be read for some reason.
       The e2mmpstatus program might wait for some time to see whether the MMP block is being  updated
       by  any node during this period.  The time taken depends on how frequently the MMP block is be‐
       ing written by the other node.

EXIT CODE
       The exit code returned by e2mmpstatus is 0 when it is safe to mount the filesystem, 1 when  the
       MMP  block  shows  the  filesystem  is  in  use on another node and it is NOT safe to mount the
       filesystem, and 2 if some other failure occurred that prevents the check from properly  detect‐
       ing the current MMP status.

SEE ALSO
       dumpe2fs(8), e2fsck(8), fstab(5), fsck(8),

E2fsprogs version 1.45.3                       July 2019                                E2MMPSTATUS(8)
