OBXPROP(1)                                                    General Commands Manual                                                   OBXPROP(1)

NAME
       openbox — A minimalistic, highly configurable, next generation window manager with extensive standards support.

SYNOPSIS
       openbox [--help]  [--display DISPLAY]  [--id ID]  [--root]  [--]  [PROPERTY ...]

DESCRIPTION
       obxprop is a tool for displaying the properties on an x window.

       This tool has a similar functionality to xprop, but obxprop allows you to see UTF-8 strings as text.

       You may use the --id option to specify a window identifier, otherwise obxprop will allow you to select a window by clicking on it.

       Primarily,  this  tool exists for Openbox users to see the value of the _OB_APP_NAME, _OB_APP_CLASS, _OB_APP_ROLE, and _OB_APP_TYPE proper‐
       ties, which Openbox uses for matching windows against user-defined application rules.

OPTIONS
       These are the possible options that openbox accepts:

       --help    Show a summary of the options available.

       --display DISPLAY
                 Specify the X display to use.

       --id ID   Specify the window identifier for the window whose properties will be displayed.

       Similar to xprop, you may pass one or more property names to have openbox limit its output to only the properties requested.

SEE ALSO
       openbox (1), openbox-session(1), openbox-gnome-session(1), openbox-kde-session(1).

       Please report bugs to: http://bugzilla.icculus.org/

                                                                                                                                        OBXPROP(1)
