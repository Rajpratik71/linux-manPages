TRANSSET(1)                             General Commands Manual                            TRANSSET(1)

NAME
       transset - Set transparency on a window

SYNOPSIS
       transset [-options ...] [opacity]

DESCRIPTION
       transset  is a simple program for X servers supporting the XFIXES, DAMAGE, and COMPOSITE exten‐
       sions.  It lets the user set the transparency on a window.

       The opacity value is a number from 0 to 1, with zero being fully transparent and 1 being  fully
       opaque.   If  no  opacity  argument  is  given, a default value of 0.75 is used for the opacity
       value.  If neither --inc nor --dec are given, the opacity is treated as an absolute  value  and
       set to the given opacity value.  If --inc or --dec is specified, then the opacity is treated as
       a relative value to increase or decrease the current opacity by.

OPTIONS
       -display display
               This option specifies the server to use; see X(7).

       -h, --help
               This option displays a help message and exits.

       -t, --toggle
               This option forces a toggle of opacity.  If the current opacity is  not  set  to  fully
               opaque (opacity 1.0), it will be reset to fully opaque.  If the window is already fully
               opaque, the opacity will be set normally.

       -c, --click
               This option selects the target window by waiting for the user to click the mouse -  the
               topmost  window  under the mouse cursor when the mouse click occurs will be used as the
               target.

       -p, --point
               This option selects the window currently under the cursor to be the target.

       -a, --actual
               This option selects the window that currently has input focus to be the target.

       -n, --name name
               This option selects the target window by name, where name is matched as a  regular  ex‐
               pression, unless --no-regex is also specified.

       --no-regex
               This option disables treating the name argument to --name as a regular expression.

       -i, --id
               This option selects the target window by window id.

       --inc   This option increases the window opacity by the given opacity argument.

       --dec   This option decreases the window opacity by the given opacity argument.

       -m, --min opacity
               This  option  sets the minimum possible opacity value.  It defaults to 0 if this option
               is not given.

       -x, --max opacity
               This option sets the maximum possible opacity value.  It defaults to 1 if  this  option
               is not given.

       -v, --verbose
               This option prints some additional debug info as the program operates.

       -V, --version
               This option prints the program version number and exits.

BUGS
       Probably.   Please  report  any  you  find  to https://bugs.freedesktop.org/enter_bug.cgi?prod‐
       uct=xorg.

AUTHORS
       Matthew Hawn

X Version 11                                transset 1.0.2                                 TRANSSET(1)
