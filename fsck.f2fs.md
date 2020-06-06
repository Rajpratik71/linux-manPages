FSCK.F2FS(8)                           System Manager's Manual                           FSCK.F2FS(8)

NAME
       fsck.f2fs - check a Linux F2FS file system

SYNOPSIS
       fsck.f2fs  [  -a  enable auto fix ] [ -f enable force fix ] [ -p enable preen mode ] [ -t show
       stored directory tree ] [ -d debugging-level ] device

DESCRIPTION
       fsck.f2fs is used to check an f2fs file system (usually in a disk partition).  device  is  the
       special file corresponding to the device (e.g.  /dev/sdXX).

       The exit code returned by fsck.f2fs is 0 on success and -1 on failure.

OPTIONS
       -a enable auto fix
              Enable  to  run file system check only if a bug was reported by the F2FS kernel module.
              It is disabled by default.

       -f enable force fix
              Enable to fix all the inconsistency in the partition.

       -p enable preen mode
              Same as "-a" to support general fsck convention.

       -t show stored directory tree
              Enable to show every directory entries in the partition.

       -d debug-level
              Specify the level of debugging options.  The default number is  0,  which  shows  basic
              debugging messages.

       AUTHOR
              Initial  checking  code was written by Byoung Geun Kim <bgbg.kim@samsung.com>.  Jaegeuk
              Kim <jaegeuk@kernel.org> reworked most parts of the codes to support  fixing  any  cor‐
              rupted images.

AVAILABILITY
       fsck.f2fs   is   available   from  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-
       tools.git.

SEE ALSO
       mkfs.f2fs(8), dump.f2fs(8), defrag.f2fs(8), resize.f2fs(8), sload.f2fs(8).

                                                                                         FSCK.F2FS(8)
