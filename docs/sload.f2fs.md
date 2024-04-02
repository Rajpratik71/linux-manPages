SLOAD.F2FS(8)                          System Manager's Manual                          SLOAD.F2FS(8)

NAME
       sload.f2fs - load directories and files into the device directly

SYNOPSIS
       sload.f2fs [ -f source directory path ] [ -t mount point ] [ -d debugging-level ] device

DESCRIPTION
       sload.f2fs is used to load directories and files into a disk partition.  device is the special
       file corresponding to the device (e.g.  /dev/sdXX).

       The exit code returned by sload.f2fs is 0 on success and -1 on failure.

OPTIONS
       -f source directory path
              Specify the source directory path to be loaded.

       -t mount point path
              Specify the mount point path in the partition to load.

       -d debug-level
              Specify the level of debugging options.  The default number is  0,  which  shows  basic
              debugging messages.

       AUTHOR
              This  version  of sload.f2fs has been written by Hou Pengyang <houpengyang@huawei.com>,
              Liu Shuoran <liushuoran@huawei.com>, Jaegeuk Kim <jaegeuk@kernel.org>

AVAILABILITY
       sload.f2fs  is  available   from   git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-
       tools.git.

SEE ALSO
       mkfs.f2fs(8), fsck.f2fs(8), dump.f2fs(8), defrag.f2fs(8), resize.f2fs(8).

                                                                                        SLOAD.F2FS(8)
