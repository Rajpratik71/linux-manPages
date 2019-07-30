SLEEP(1)                                                                              User Commands                                                                              SLEEP(1)

NAME
       sleep - delay for a specified amount of time

SYNOPSIS
       sleep NUMBER[SUFFIX]...
       sleep OPTION

DESCRIPTION
       Pause  for  NUMBER  seconds.   SUFFIX may be 's' for seconds (the default), 'm' for minutes, 'h' for hours or 'd' for days.  Unlike most implementations that require NUMBER be an
       integer, here NUMBER may be an arbitrary floating point number.  Given two or more arguments, pause for the amount of time specified by the sum of their values.

       --help display this help and exit

       --version
              output version information and exit

AUTHOR
       Written by Jim Meyering and Paul Eggert.

REPORTING BUGS
       GNU coreutils online help: <https://www.gnu.org/software/coreutils/>
       Report sleep translation bugs to <https://translationproject.org/team/>

COPYRIGHT
       Copyright © 2018 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       sleep(3)

       Full documentation at: <https://www.gnu.org/software/coreutils/sleep>
       or available locally via: info '(coreutils) sleep invocation'

GNU coreutils 8.30                                                                     August 2018                                                                               SLEEP(1)
