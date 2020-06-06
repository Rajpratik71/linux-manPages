NAUTILUS-SCRIPTS-MANAGER(1)            General Commands Manual            NAUTILUS-SCRIPTS-MANAGER(1)

NAME
       nautilus-scripts-manager - easy tool for nautilus scripts management

SYNOPSIS
       nautilus-scripts-manager [options]

DESCRIPTION
       This manual page documents briefly the nautilus-scripts-manager command.

       nautilus-scripts-manager is a program that allows any user to easily manage installed Nautilus
       scripts.

GENERAL OPTIONS
       -h, --help
              Show summary of options.

       -v, --version
              Show version of program.

COMMANDS
       One (and only one) of the following commands can be passed:

       -e, --enable=ENABLE
              Enable script ENABLE.

       -d, --disable=DISABLE
              Disable script DISABLE.

       -l, --list-enabled
              List enabled scripts.

       -a, --list-available
              List available scripts.

       If no command is provided, the graphical interface is started.

OPTIONS
       -e, --position=POSITION
              In conjunction with -e or -d: establish the position of the script (can be just a name,
              or a path with slashes - quote it if it contains spaces).

SEE ALSO
       nautilus(1),

AUTHOR
       nautilus-scripts-manager  and this manual page were written by Pietro Battiston <me@pietrobat‐
       tiston.it>.

       This manual page was written for the Debian project (but may be used by others).

                                            July 14, 2009                 NAUTILUS-SCRIPTS-MANAGER(1)
