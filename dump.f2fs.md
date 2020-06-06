DUMP.F2FS(8)                           System Manager's Manual                           DUMP.F2FS(8)

NAME
       dump.f2fs - retrieve directory and file entries from an F2FS-formated image

SYNOPSIS
       dump.f2fs  [  -i  inode  number  ] [ -s SIT range ] [ -a SSA range ] [ -b block address ] [ -d
       debugging-level ] device

DESCRIPTION
       dump.f2fs is used to retrieve f2fs metadata (usually in a disk partition).  device is the spe‐
       cial file corresponding to the device (e.g.  /dev/sdXX).

       Currently,  it  can  retrieve 1) a file given its inode number, 2) SIT entries into a file, 3)
       SSA entries into a file, 4) reverse information from the given block address.

       The exit code returned by dump.f2fs is 0 on success and -1 on failure.

OPTIONS
       -i inode number
              Specify an inode number to dump out.

       -s SIT range
              Specify a range presented by segment numbers to dump SIT entries.

       -a SSA range
              Specify a range presented by segment numbers to dump SSA entries.

       -b block address
              Specify a block address to retrieve its metadata information.

       -d debug-level
              Specify the level of debugging options.  The default number is  0,  which  shows  basic
              debugging messages.

       AUTHOR
              Initial checking code was written by Byoung Geun Kim <bgbg.kim@samsung.com>.

AVAILABILITY
       dump.f2fs   is   available   from  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-
       tools.git.

SEE ALSO
       mkfs.f2fs(8), fsck.f2fs(8), defrag.f2fs(8), resize.f2fs(8), sload.f2fs(8).

                                                                                         DUMP.F2FS(8)
