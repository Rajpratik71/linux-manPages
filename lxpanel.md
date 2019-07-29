LXPANEL(1)                                                        http://LXDE.org                                                       LXPANEL(1)

NAME
       lxpanel - a lightweight GTK2-based panel for the LXDE desktop.

SYNOPSIS
       lxpanel

DESCRIPTION
       This manual page documents briefly the lxpanel command.

       lxpanel is a program that provides a panel for the desktop, usually for LXDE. It is a lightweight GTK+ 2.x based desktop panel.

       Features

       ·   User-friendly application menu automatically generated from .desktop files on the system.

       ·   Launcher bar (small icons clicked to launch apps)

       ·   Task bar supporting ICCCM/EWMH `urgency' hint (Pidgin IM windows can flash on new incoming messages)

       ·   Notification area (system tray)

       ·   Digital clock

       ·   Run dialog (type command to run, without opening a terminal )

       ·   Net status icon plug-in (optional)

       ·   Volume control plug-in (optional)

       ·   lxpanelctl, an external controller lets you control lxpanel in other programs. For example, "lxpanelctl run" will show the Run dialog
           in lxpanel, and "lxpanelctl menu" will show the application menu. This is useful in key bindings provided by window managers.

OPTIONS
       This program follows the usual GNU command line syntax, with long options starting with two dashes (`-'). A summary of options is included
       below.

       -h --help
           Print help on the options.

       -v --version
           Print the program version.

       --log level
           Set the logging level in the range 0 (silent) through 5 (verbose).

       -p NAME, --profile NAME
           Set the profile to be loaded.

FILES
       ~/.config/lxpanel/PROFILE
           config file, can be edited by preference dialog.

SEE ALSO
       lxsession (1), lxpanelctl (1).

AUTHOR
       This manual page was written by paulliu grandpaul@gmail.com for the Debian system (but may be used by others). Permission is granted to
       copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 2 any later version published by
       the Free Software Foundation.

       On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

AUTHOR
       Ying-Chun Liu
           Author.

COPYRIGHT
       Copyright © 2008 paulliu

http://LXDE.org                                                    March 2, 2008                                                        LXPANEL(1)
