RUNCON(1)                                                                                       User Commands                                                                                       RUNCON(1)



NAME
       runcon - run command with specified SELinux security context

SYNOPSIS
       runcon CONTEXT COMMAND [args]
       runcon [ -c ] [-u USER] [-r ROLE] [-t TYPE] [-l RANGE] COMMAND [args]

DESCRIPTION
       Run COMMAND with completely-specified CONTEXT, or with current or transitioned security context modified by one or more of LEVEL, ROLE, TYPE, and USER.

       If none of -c, -t, -u, -r, or -l, is specified, the first argument is used as the complete context.  Any additional arguments after COMMAND are interpreted as arguments to the command.

       Note that only carefully-chosen contexts are likely to successfully run.

       Run a program in a different SELinux security context.  With neither CONTEXT nor COMMAND, print the current security context.

       Mandatory arguments to long options are mandatory for short options too.

       CONTEXT
              Complete security context

       -c, --compute
              compute process transition context before modifying

       -t, --type=TYPE
              type (for same role as parent)

       -u, --user=USER
              user identity

       -r, --role=ROLE
              role

       -l, --range=RANGE
              levelrange

       --help display this help and exit

       --version
              output version information and exit

       GNU coreutils online help: <http://www.gnu.org/software/coreutils/> Report runcon translation bugs to <http://translationproject.org/team/>

AUTHOR
       Written by Russell Coker.

COPYRIGHT
       Copyright © 2013 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       The full documentation for runcon is maintained as a Texinfo manual.  If the info and runcon programs are properly installed at your site, the command

              info coreutils 'runcon invocation'

       should give you access to the complete manual.



GNU coreutils 8.22                                                                               August 2019                                                                                        RUNCON(1)
