UNEXPAND(1)                                                                                     User Commands                                                                                     UNEXPAND(1)



NAME
       unexpand - convert spaces to tabs

SYNOPSIS
       unexpand [OPTION]... [FILE]...

DESCRIPTION
       Convert blanks in each FILE to tabs, writing to standard output.  With no FILE, or when FILE is -, read standard input.

       Mandatory arguments to long options are mandatory for short options too.

       -a, --all
              convert all blanks, instead of just initial blanks

       --first-only
              convert only leading sequences of blanks (overrides -a)

       -t, --tabs=N
              have tabs N characters apart instead of 8 (enables -a)

       -t, --tabs=LIST
              use comma separated LIST of tab positions (enables -a)

       --help display this help and exit

       --version
              output version information and exit

       GNU coreutils online help: <http://www.gnu.org/software/coreutils/> Report unexpand translation bugs to <http://translationproject.org/team/>

AUTHOR
       Written by David MacKenzie.

COPYRIGHT
       Copyright © 2013 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       expand(1)

       The full documentation for unexpand is maintained as a Texinfo manual.  If the info and unexpand programs are properly installed at your site, the command

              info coreutils 'unexpand invocation'

       should give you access to the complete manual.



GNU coreutils 8.22                                                                               August 2019                                                                                      UNEXPAND(1)
