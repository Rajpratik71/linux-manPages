REALPATH(1)                                                                                     User Commands                                                                                     REALPATH(1)



NAME
       realpath - print the resolved path

SYNOPSIS
       realpath [OPTION]... FILE...

DESCRIPTION
       Print the resolved absolute file name; all but the last component must exist

       -e, --canonicalize-existing
              all components of the path must exist

       -m, --canonicalize-missing
              no components of the path need exist

       -L, --logical
              resolve '..' components before symlinks

       -P, --physical
              resolve symlinks as encountered (default)

       -q, --quiet
              suppress most error messages

       --relative-to=FILE
              print the resolved path relative to FILE

       --relative-base=FILE
              print absolute paths unless paths below FILE

       -s, --strip, --no-symlinks
              don't expand symlinks

       -z, --zero
              separate output with NUL rather than newline

       --help display this help and exit

       --version
              output version information and exit

       GNU coreutils online help: <http://www.gnu.org/software/coreutils/> Report realpath translation bugs to <http://translationproject.org/team/>

AUTHOR
       Written by Padraig Brady.

COPYRIGHT
       Copyright © 2013 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       readlink(1), readlink(2), realpath(3)

       The full documentation for realpath is maintained as a Texinfo manual.  If the info and realpath programs are properly installed at your site, the command

              info coreutils 'realpath invocation'

       should give you access to the complete manual.



GNU coreutils 8.22                                                                               August 2019                                                                                      REALPATH(1)
