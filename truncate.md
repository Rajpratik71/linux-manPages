TRUNCATE(1)                                                                                     User Commands                                                                                     TRUNCATE(1)



NAME
       truncate - shrink or extend the size of a file to the specified size

SYNOPSIS
       truncate OPTION... FILE...

DESCRIPTION
       Shrink or extend the size of each FILE to the specified size

       A FILE argument that does not exist is created.

       If a FILE is larger than the specified size, the extra data is lost.  If a FILE is shorter, it is extended and the extended part (hole) reads as zero bytes.

       Mandatory arguments to long options are mandatory for short options too.

       -c, --no-create
              do not create any files

       -o, --io-blocks
              treat SIZE as number of IO blocks instead of bytes

       -r, --reference=RFILE
              base size on RFILE

       -s, --size=SIZE
              set or adjust the file size by SIZE bytes

       --help display this help and exit

       --version
              output version information and exit

       SIZE is an integer and optional unit (example: 10M is 10*1024*1024).  Units are K, M, G, T, P, E, Z, Y (powers of 1024) or KB, MB, ... (powers of 1000).

       SIZE may also be prefixed by one of the following modifying characters: '+' extend by, '-' reduce by, '<' at most, '>' at least, '/' round down to multiple of, '%' round up to multiple of.

       GNU coreutils online help: <http://www.gnu.org/software/coreutils/> Report truncate translation bugs to <http://translationproject.org/team/>

AUTHOR
       Written by Padraig Brady.

COPYRIGHT
       Copyright © 2013 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       dd(1), truncate(2), ftruncate(2)

       The full documentation for truncate is maintained as a Texinfo manual.  If the info and truncate programs are properly installed at your site, the command

              info coreutils 'truncate invocation'

       should give you access to the complete manual.



GNU coreutils 8.22                                                                               August 2019                                                                                      TRUNCATE(1)
