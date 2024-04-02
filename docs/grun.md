GRUN(1x)                                                                                                                                  GRUN(1x)

NAME
       gRun - X/GTK based application launcher.

SYNOPSIS
       gRun [filename] [-v] [--version] [-h] [--help]

DESCRIPTION
       gRun  launches  applications  in  X Windows without the need for an xterm session at all. gRun provides three methods of launching applica‐
       tions, entering the command directly into the text field, browsing the tree for the application and running an application specified on the
       command line. In all cases gRun exits completely after launching the application and the application is left running as a full child of the
       X process, as if it were launched from a WM menu. If gRun is launched from an xterm or shell, the shell will be freed for further use after
       gRun exits. No more wasting an xterm for the duration of the application.

       gRun  will attempt to complete a command automatically from the history as it is typed in, hopefully saving some time. Pressing the Tab key
       will try to find an executable file in the path that starts with the characters already entered into the entry box.

       gRun also includes a facility for checking if the command is in a list of console mode apps, eg telnet. If it  finds  the  command  in  the
       file, gRun launches a xterm with the command as the -e parameter.

       gRun  now  has a facility for associating file extensions with a command, ala Windows. If an extension is found, the associated application
       is launched with the command entry as the parameter.

   Options
       filename
              Application name for command line launching from a xterm. The filename must exist within either the default path  or  have  a  fully
              qualified path. Any options passed after the filename are passed down to the application if not removed by gtk_init()

       --persist
              gRun dialog does not close after launching application

       --notips
              Tooltips are not displayed

       --version
              Display the current version number of grun.

       --help Display a short usage guide.

       gRun also recognizes all standard X Windows and GTK options, eg -display and -geometry.

Bugs
       None currently known.

AUTHOR
       Bruce A. Smith <tangomanrulz@geocities.com>

COPYING
       Copyright (C) 1998,1999
        Bruce A. Smith <tangomanrulz@geocities.com>

       This  program  is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation; either version 2 of the License, or (at your option) any later version.
        This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;  without  even  the  implied  warranty  of  MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
        You  should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation,
       Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

gRun Version 0.9.22                                                Jan 15, 1999                                                           GRUN(1x)
