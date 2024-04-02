E2SCRUB(8)                              System Manager's Manual                             E2SCRUB(8)

NAME
       e2scrub - check the contents of a mounted ext[234] filesystem

SYNOPSYS
       e2scrub [OPTION] MOUNTPOINT | DEVICE

DESCRIPTION
       e2scrub attempts to check (but not repair) all metadata in a mounted ext[234] filesystem if the
       filesystem resides on an LVM logical volume.  The block device of the LVM  logical  volume  can
       also be passed in.

       This program snapshots the volume and runs a file system check on the snapshot to look for cor‐
       ruption errors.  The LVM volume group must have at least 256MiB of unallocated space  to  dedi‐
       cate  to  the  snapshot  or the logical volume will be skipped.  The snapshot will be named lv‐
       name.e2scrub and udev will not create symbolic links to it under /dev/disk.  Every attempt will
       be  made  to  remove  the snapshots prior to running e2scrub, but in a dire situation it may be
       necessary to remove the snapshot manually.

       If no errors are found, fstrim can be called on the file system if it is  mounted.   If  errors
       are  found,  the  file  system will be marked as having errors.  The filesystem should be taken
       offline and e2fsck run as soon as possible, because e2scrub does not fix corruptions.   If  the
       filesystem is not repaired, e2fsck will be run before the next mount.

OPTIONS
       -n     Print what commands e2scrub would execute to check the file system.  (Note: the commands
              will not actually be executed; however, since e2scrub needs  to  run  some  commands  to
              query  the system to determine what commands would be executed, it still needs to be run
              as root.)

       -r     Remove the e2scrub snapshot and exit without checking anything.

       -t     Run fstrim(1) on the mounted filesystem if no errors are found.

       -V     Print version information and exit.

EXIT CODE
       The exit codes are the same as in e2fsck(8)

SEE ALSO
       e2fsck(8)

AUTHOR
       Darrick J. Wong <darrick.wong@oracle.com>

COPYRIGHT
       Copyright ©2018 Oracle.  License is GPLv2+. <http://www.gnu.org/licenses/gpl-2.0.html>

E2fsprogs version 1.45.3                       July 2019                                    E2SCRUB(8)
