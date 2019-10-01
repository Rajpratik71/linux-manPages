SHUF(1)                                                                                         User Commands                                                                                         SHUF(1)



NAME
       shuf - generate random permutations

SYNOPSIS
       shuf [OPTION]... [FILE]
       shuf -e [OPTION]... [ARG]...
       shuf -i LO-HI [OPTION]...

DESCRIPTION
       Write a random permutation of the input lines to standard output.

       Mandatory arguments to long options are mandatory for short options too.

       -e, --echo
              treat each ARG as an input line

       -i, --input-range=LO-HI
              treat each number LO through HI as an input line

       -n, --head-count=COUNT
              output at most COUNT lines

       -o, --output=FILE
              write result to FILE instead of standard output

       --random-source=FILE
              get random bytes from FILE

       -r, --repeat
              output lines can be repeated

       -z, --zero-terminated
              end lines with 0 byte, not newline

       --help display this help and exit

       --version
              output version information and exit

       With no FILE, or when FILE is -, read standard input.

       GNU coreutils online help: <http://www.gnu.org/software/coreutils/> Report shuf translation bugs to <http://translationproject.org/team/>

AUTHOR
       Written by Paul Eggert.

COPYRIGHT
       Copyright © 2013 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       The full documentation for shuf is maintained as a Texinfo manual.  If the info and shuf programs are properly installed at your site, the command

              info coreutils 'shuf invocation'

       should give you access to the complete manual.



GNU coreutils 8.22                                                                               August 2019                                                                                          SHUF(1)
