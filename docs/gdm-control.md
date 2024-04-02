GDM-CONTROL(1)                                                 Openbox documentation                                                GDM-CONTROL(1)

NAME
       Openbox - standards compliant, fast, light-weight, extensible window manager.

SYNOPSIS
       gdm-control <option>

DESCRIPTION
       gdm-control lets you control gdm from within an X session.  It enables you to change GDM's behaviour for when you end the current sesson.
       For instance, you can tell GDM to reboot, and then immediately log out of the current session, and the computer will be rebooted.

OPTIONS
       --help
            Display some help and exit.

       --none
            Do nothing special when the current session ends.

       --shutdown
            Shutdown the computer when the current session ends.

       --reboot
            eboot the computer when the current session ends.

       --suspend
            Suspend the computer when the current session ends.

       --switch-user
            Log in as a new user (this works immediately).

AUTHORS
       Openbox was written by Mikael Magnusson <mangosoft@comhem.se> and Dana Jansens <danakj@orodu.net>, aided by several contributors; for a
       full list read the file AUTHORS.

       This manual page was written by Nico Golde <nion@debian.org>

COPYRIGHT
       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation; either version 2, or (at your option) any later version.

       On Debian GNU/Linux systems, the complete text of the GNU General Public License can be found in `/usr/share/common-licenses/GPL'.

3.6.1                                                               2018-01-22                                                      GDM-CONTROL(1)
