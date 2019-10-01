USERS(1)                                                                                        User Commands                                                                                        USERS(1)



NAME
       users - print the user names of users currently logged in to the current host

SYNOPSIS
       users [OPTION]... [FILE]

DESCRIPTION
       Output who is currently logged in according to FILE.  If FILE is not specified, use /var/run/utmp.  /var/log/wtmp as FILE is common.

       --help display this help and exit

       --version
              output version information and exit

       GNU coreutils online help: <http://www.gnu.org/software/coreutils/> Report users translation bugs to <http://translationproject.org/team/>

AUTHOR
       Written by Joseph Arceneaux and David MacKenzie.

COPYRIGHT
       Copyright © 2013 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       The full documentation for users is maintained as a Texinfo manual.  If the info and users programs are properly installed at your site, the command

              info coreutils 'users invocation'

       should give you access to the complete manual.



GNU coreutils 8.22                                                                               August 2019                                                                                         USERS(1)
