SYNC(1)                         User Commands                         SYNC(1)

NAME
       sync - Synchronize cached writes to persistent storage

SYNOPSIS
       sync [OPTION] [FILE]...

DESCRIPTION
       Synchronize cached writes to persistent storage

       If  one or more files are specified, sync only them, or their contain‐
       ing file systems.

       -d, --data
              sync only file data, no unneeded metadata

       -f, --file-system
              sync the file systems that contain the files

       --help display this help and exit

       --version
              output version information and exit

BUGS
       Persistence guarantees vary per system.  See the  system  calls  below
       for more details.

AUTHOR
       Written by Jim Meyering and Giuseppe Scrivano.

REPORTING BUGS
       GNU coreutils online help: <http://www.gnu.org/software/coreutils/>
       Report sync translation bugs to <http://translationproject.org/team/>

COPYRIGHT
       Copyright  ©  2017 Free Software Foundation, Inc.  License GPLv3+: GNU
       GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to  change  and  redistribute  it.
       There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       fdatasync(2), fsync(2), sync(2), syncfs(2)

       Full documentation at: <http://www.gnu.org/software/coreutils/sync>
       or available locally via: info '(coreutils) sync invocation'

GNU coreutils 8.28               January 2018                         SYNC(1)
