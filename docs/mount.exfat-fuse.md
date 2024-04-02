EXFAT-FUSE(8)                                                                    System Manager's Manual                                                                    EXFAT-FUSE(8)

NAME
       mount.exfat-fuse - mount an exFAT file system

SYNOPSIS
       mount.exfat-fuse [ -d ] [ -n ] [ -o options ] [ -V ] [ -v ] device dir

DESCRIPTION
       mount.exfat-fuse  is a free exFAT file system implementation with write support. exFAT is a simple file system created by Microsoft. It is intended to replace FAT32 removing some
       of its limitations. exFAT is a standard FS for SDXC memory cards.

COMMAND LINE OPTIONS
       Command line options available:

       -d     Enable debug logging and do not detach from shell.

       -n     Ignored.

       -o options
              File system specific options. For more details see FILE SYSTEM OPTIONS section below.

       -V     Print version and copyright.

       -v     Ignored.

FILE SYSTEM OPTIONS
       umask=value
              Set the umask (the bitmask of the permissions that are not present, in octal).  The default is 0.

       dmask=value
              Set the umask for directories only.

       fmask=value
              Set the umask for files only.

       uid=n  Set the owner for all files and directories.  The default is the owner of the current process.

       gid=n  Set the group for all files and directories.  The default is the group of the current process.

       ro     Mount the file system in read only mode.

       noatime
              Do not update access time when file is read.

EXIT CODES
       Zero is returned on successful mount. Any other code means an error.

BUGS
       exFAT is a case-insensitive file system. Some things can behave unexpectedly, e.g. directory renaming that changes only case of some characters:

            $ mv FOO Foo
            mv: cannot move ’FOO’ to a subdirectory of itself, ’Foo/FOO’

       This happens because mv finds that destination exists (for case-insensitive file systems FOO and Foo are the same thing) and adds source basename to  the  destination.  The  file
       system gets rename("FOO", "Foo/FOO") syscall and returns an error.

AUTHOR
       Andrew Nayenko

SEE ALSO
       mount(8)

                                                                                      November 2015                                                                         EXFAT-FUSE(8)
