install-menu(1)                                                                         Debian GNU/Linux manual                                                                        install-menu(1)

NAME
       install-menu - Process a menu method and generate the menu files for a window manager or a menu-aware application.

DESCRIPTION
       update-menus(1)  computes  the list of menu entries and passes it in turn to the menu methods in /etc/menu-methods/. The task of a menu methods is to generate menus for a specific window man‐
       ager.  install-menu provides a generic and customizable way to do that. The documentation of the install-menu definition language is available in the Debian Menu manual, a  local  copy  being
       available in /usr/share/doc/menu/html.

SYNOPSIS
       install-menu [-vh] [--remove] <menu-method>

       Read menu entries from stdin in update-menus --stdout format and generate menu files using the specified menu-method.

       Normally used in menu method scripts as #! /usr/bin/install-menu.

OPTIONS
       -h,--help
              Show the help message and exit.

       --remove
              Remove the menu files instead of generating them.

       -v,--verbose
              Output messages about what the program is doing.

COPYING
       install-menu is distributed under the term of the GNU General Public License version 2, or (at your option) any later version.

AUTHOR
       Written by Joost Witteveen <joostje@debian.org>.  Now maintained by Bill Allombert <ballombe@debian.org>.

SEE ALSO
       update-menus(1), menufile(5), /usr/share/doc/menu/html

Debian Project                                                                             28 November 2005                                                                            install-menu(1)
