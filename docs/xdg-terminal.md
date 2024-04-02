XDG-TERMINAL(1)                                                                              xdg-terminal Manual                                                                              XDG-TERMINAL(1)



NAME
       xdg-terminal - opens the user's preferred terminal emulator application

SYNOPSIS
       xdg-terminal [command]

       xdg-terminal {--help | --manual | --version}

DESCRIPTION
       xdg-terminal opens the user's preferred terminal emulator application. If a command is provided the command will be executed by the shell within the newly opened terminal window.

       xdg-terminal is for use inside a desktop session only. It is not recommended to use xdg-terminal as root.

OPTIONS
       --help
           Show command synopsis.

       --manual
           Show this manual page.

       --version
           Show the xdg-utils version information.

EXIT CODES
       An exit code of 0 indicates success while a non-zero exit code indicates failure. The following failure codes can be returned:

       1
           Error in command line syntax.

       3
           A required tool could not be found.

       4
           The action failed.

EXAMPLES
           xdg-terminal

       Opens the user's default terminal emulator, just starting an interactive shell.

           xdg-terminal top

       Opens the user's default terminal emulator and lets it run the top executable.

AUTHOR
       Kevin Krammer
           Author.

COPYRIGHT
       Copyright © 2006



xdg-terminal Technology Previe                                                                    01/24/2015                                                                                  XDG-TERMINAL(1)
