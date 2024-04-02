J4-DMENU-DESKTOP(1)                                           General Commands Manual                                          J4-DMENU-DESKTOP(1)

NAME
       j4-dmenu-desktop - faster replacement for i3-dmenu-desktop

DESCRIPTION
       j4-dmenu-desktop is a faster replacement for i3-dmenu-desktop.

       It's purpose is to find .desktop files and offer you a menu to start an application using dmenu.

SYNOPSIS
              j4-dmenu-desktop [--dmenu="dmenu -i"] [--term="i3-sensible-terminal"]

OPTIONS
       --dmenu=<command>
              Determines the command used to invoke dmenu Executed with your shell ($SHELL) or /bin/sh

       --use-xdg-de
              Enables reading $XDG_CURRENT_DESKTOP to determine the desktop environment

       --display-binary
              Display binary name after each entry (off by default)

       --term=<command>
              Sets the terminal emulator used to start terminal apps

       --help Display this help message

SEE ALSO
       https://github.com/enkore/j4-dmenu-desktop

COPYRIGHT
       Copyright (C) 2013 enkore <public+j4-dmenu-desktop@enkore.de>

       This  program  is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY  WARRANTY;  without  even  the  implied  warranty  of  MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

       You should have received a copy of the GNU General Public License along with this program. If not, see <http://www.gnu.org/licenses/>.

                                                                                                                               J4-DMENU-DESKTOP(1)
