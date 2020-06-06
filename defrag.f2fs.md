DEFRAG.F2FS(8)                         System Manager's Manual                         DEFRAG.F2FS(8)

NAME
       defrag.f2fs - relocate blocks in a given area to the specified region

SYNOPSIS
       defrag.f2fs  [  -s start block address ] [ -l number of blocks ] [ -t target block address ] [
       -i direction ] [ -d debugging-level ] device

DESCRIPTION
       defrag.f2fs is used to move specified number of blocks starting from a given block address  to
       the  target  block  address with a direction.  device is the special file corresponding to the
       device (e.g.  /dev/sdXX).

       For example, # defrag.f2fs -s 0x4000 -l 0x100 -t 0x10000 -i /dev/sdb1

       This moves blocks between 0x4000 and 0x4100 to the left-hand area of 0x10000.

       The exit code returned by defrag.f2fs is 0 on success and -1 on failure.

OPTIONS
       -s start block address
              Specify the starting block address.

       -l number of blocks
              Specifiy the number of blocks to move.

       -t target block address
              Specify the destination block address.

       -i direction
              Set the direction to left. If it is not set, the direction becomes right by default.

       -d debug-level
              Specify the level of debugging options.  The default number is  0,  which  shows  basic
              debugging messages.

       AUTHOR
              This version of defrag.f2fs has been written by Jaegeuk Kim <jaegeuk@kernel.org>.

AVAILABILITY
       defrag.f2fs   is  available  from  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-
       tools.git.

SEE ALSO
       mkfs.f2fs(8), dump.f2fs(8), fsck.f2fs(8), resize.f2fs(8), sload.f2fs(8).

                                                                                       DEFRAG.F2FS(8)
