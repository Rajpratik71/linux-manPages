XDG-SCREENSAVER(1)                                                                        xdg-screensaver Manual                                                                       XDG-SCREENSAVER(1)

NAME
       xdg-screensaver - command line tool for controlling the screensaver

SYNOPSIS
       xdg-screensaver suspend WindowID

       xdg-screensaver resume WindowID

       xdg-screensaver {activate | lock | reset | status}

       xdg-screensaver {--help | --manual | --version}

DESCRIPTION
       xdg-screensaver provides commands to control the screensaver.

       xdg-screensaver is for use inside a desktop session only. It is not recommended to use xdg-screensaver as root.

COMMANDS
       suspend WindowID
           Suspends the screensaver and monitor power management.  WindowID must be the X Window ID of an existing window of the calling application. The window must remain in existence for the
           duration of the suspension.

           WindowID can be represented as either a decimal number or as a hexadecimal number consisting of the prefix 0x followed by one or more hexadecimal digits.

           The screensaver can be suspended in relation to multiple windows at the same time. In that case screensaver operation is only restored once the screensaver has been resumed in relation to
           each of the windows

       resume WindowID
           Resume the screensaver and monitor power management after being suspended.  WindowID must be the same X Window ID that was passed to a previous call of xdg-screensaver suspend

       activate
           Turns the screensaver on immediately. This may result in the screen getting locked, depending on existing system policies.

       lock
           Lock the screen immediately.

       reset
           Turns the screensaver off immediately. If the screen was locked the user may be asked to authenticate first.

       status
           Prints enabled to stdout if the screensaver is enabled to turn on after a period of inactivity and prints disabled if the screensaver is not enabled.

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
           xdg-screensaver suspend 0x1c00007

       Causes the screensaver to be disabled till xdg-screensaver resume 0x1c00007 is called.  0x1c00007 must be the X Window ID of an existing window.

AUTHOR
       Bryce Harrington
           Author.

COPYRIGHT
       Copyright © 2006

xdg-utils 1.0                                                                                   05/21/2018                                                                             XDG-SCREENSAVER(1)
