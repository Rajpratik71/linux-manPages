PRINTENV(1)                                                                                     User Commands                                                                                     PRINTENV(1)



NAME
       printenv - print all or part of environment

SYNOPSIS
       printenv [OPTION]... [VARIABLE]...

DESCRIPTION
       Print the values of the specified environment VARIABLE(s).  If no VARIABLE is specified, print name and value pairs for them all.

       -0, --null
              end each output line with 0 byte rather than newline

       --help display this help and exit

       --version
              output version information and exit

       NOTE: your shell may have its own version of printenv, which usually supersedes the version described here.  Please refer to your shell's documentation for details about the options it supports.

       GNU coreutils online help: <http://www.gnu.org/software/coreutils/> Report printenv translation bugs to <http://translationproject.org/team/>

AUTHOR
       Written by David MacKenzie and Richard Mlynarik.

COPYRIGHT
       Copyright © 2013 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       The full documentation for printenv is maintained as a Texinfo manual.  If the info and printenv programs are properly installed at your site, the command

              info coreutils 'printenv invocation'

       should give you access to the complete manual.



GNU coreutils 8.22                                                                               August 2019                                                                                      PRINTENV(1)
