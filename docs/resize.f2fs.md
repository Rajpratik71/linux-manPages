RESIZE.F2FS(8)                         System Manager's Manual                         RESIZE.F2FS(8)

NAME
       resize.f2fs - resize filesystem size

SYNOPSIS
       resize.f2fs [ -t target sectors ] [ -d debugging-level ] device

DESCRIPTION
       resize.f2fs  is  used  to resize an f2fs file system (usually in a disk partition).  device is
       the special file corresponding to the device (e.g.  /dev/sdXX).

       Current version only supports expanding the prebuilt filesystem.

       The exit code returned by resize.f2fs is 0 on success and -1 on failure.

OPTIONS
       -t target sectors
              Specify the size in sectors.

       -d debug-level
              Specify the level of debugging options.  The default number is  0,  which  shows  basic
              debugging messages.

       AUTHOR
              This version of resize.f2fs has been written by Jaegeuk Kim <jaegeuk@kernel.org>.

AVAILABILITY
       resize.f2fs   is  available  from  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-
       tools.git.

SEE ALSO
       mkfs.f2fs(8), fsck.f2fs(8), dump.f2fs(8), defrag.f2fs(8), sload.f2fs(8).

                                                                                       RESIZE.F2FS(8)
