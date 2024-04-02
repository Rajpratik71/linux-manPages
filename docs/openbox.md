OPENBOX(1)                                                     Openbox documentation                                                    OPENBOX(1)

NAME
       Openbox - standards compliant, fast, light-weight, extensible window manager.

SYNOPSIS
       openbox [options]

DESCRIPTION
       Openbox works with your applications, and makes your desktop easier to manage.  This is because the approach to its development was the
       opposite of what seems to be the general case for window managers. Openbox was written first to comply with standards and to work properly.
       Only when that was in place did the team turn to the visual interface.

       Openbox is fully functional as a stand-alone working environment, or can be used as a drop-in replacement for the default window manager in
       the GNOME or KDE desktop environments.

       Openbox 3 is a completely new breed of window manager. It is not based upon any existing code base, although the visual appearance has been
       based upon that of Blackbox. Openbox 2 was based on the Blackbox 0.65.0 codebase.

OPTIONS
       --sm-disable
            Disable connection to session manager.

       --sm-client-id <ID>
            Specify session management ID.

       --sm-save-file <FILE>
            Specify file to load a saved session from.

       --replace
            Replace the currently running window manager.

       --help
            Display some help and exit.

       --version
            Display the version and exit.

       --sync
            Run in synchronous mode (this is slow and meant for debugging X routines).

       --debug
            Display debugging output.

AUTHORS
       Openbox was written by Mikael Magnusson <mangosoft@comhem.se> and Ben Jansens <ben@openbox.org>, aided by several contributors; for a full
       list read the file AUTHORS.

       This manual page was written by Tore Anderson <tore@debian.org>.

COPYRIGHT
       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation; either version 2, or (at your option) any later version.

       On Debian GNU/Linux systems, the complete text of the GNU General Public License can be found in `/usr/share/common-licenses/GPL'.

3.6.1                                                               2018-01-22                                                          OPENBOX(1)
