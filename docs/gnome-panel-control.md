GNOME-PANEL-CONTROL(1)                                         Openbox documentation                                        GNOME-PANEL-CONTROL(1)

NAME
       Openbox - standards compliant, fast, light-weight, extensible window manager.

SYNOPSIS
       gnome-panel-control <option>

DESCRIPTION
       As of GNOME 2.4, gnome-panel no longer manages its own key bindings, and requires that the window manager provide its own key bindings for
       showing the Main Menu and Run dialog. Openbox does this through the bundled gnome-panel-control tool, which can be used in keybindings to
       access the gnome-panel. Use the --main-menu option to display gnome-panel's menu, and the --run-dialog to display its Run dialog.

OPTIONS
       --help
            Display some help and exit.

       --main-menu
            Show the main menu.

       --run-dialog
            Show the run dialog.

AUTHORS
       Openbox was written by Mikael Magnusson <mangosoft@comhem.se> and Ben Jansens <ben@openbox.org>, aided by several contributors; for a full
       list read the file AUTHORS.

       This manual page was written by Tore Anderson <tore@debian.org>.

COPYRIGHT
       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation; either version 2, or (at your option) any later version.

       On Debian GNU/Linux systems, the complete text of the GNU General Public License can be found in `/usr/share/common-licenses/GPL'.

3.6.1                                                               2018-01-22                                              GNOME-PANEL-CONTROL(1)
