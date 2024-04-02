LXTERMINAL(1)                                                     http://LXDE.org                                                    LXTERMINAL(1)

NAME
       lxterminal - a lightweight terminal emulator based on GTK+ for the LXDE desktop.

SYNOPSIS
       lxterminal [options...]

DESCRIPTION
       This manual page documents briefly the lxterminal command.

       lxterminal is a program that provides a terminal emulator for the desktop, usually for LXDE.

OPTIONS
       This program follows the usual GNU command line syntax, with long options starting with two dashes (`-'). A summary of options is included
       below.

       -e STRING --command=STRING --command STRING
           This option specifies the program (and its command line arguments) to be run in the terminal. Except in the --command= form, this must
           be the last option on the command line.

       --geometry=CHARACTERSxLINES
           Set the terminal's size in characters and lines.

       -l --loginshell
           Executes login shell.

       -t NAME[,NAME[,NAME[...]]] --title=NAME[,NAME[,NAME[...]]] --tabs=NAME[,NAME[,NAME[...]]]
           Set the terminal's title. Use comma for multiple tabs.

       --working-directory=DIRECTORY
           Set the terminal's working directory.

AUTHOR
       This manual page was written by paulliu <grandpaul@gmail.com> for the Debian system (but may be used by others). Permission is granted to
       copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 2 any later version published by
       the Free Software Foundation.

       On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

AUTHOR
       Ying-Chun Liu
           Author.

COPYRIGHT
       Copyright © 2008 paulliu

http://LXDE.org                                                    Jun 28, 2008                                                      LXTERMINAL(1)
