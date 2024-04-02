MCVIEW(1)                                                     GNU Midnight Commander                                                     MCVIEW(1)

NAME
       mcview - Internal file viewer of GNU Midnight Commander.

USAGE
       mcview [-bcCdfhstVx?] file

DESCRIPTION
       mcview  is a link to mc, the main GNU Midnight Commander executable.  Executing GNU Midnight Commander under this name requests staring the
       internal viewer and opening the file specified on the command line.

OPTIONS
       -b     Force black and white display.

       -c     Force color mode on terminals where mcview defaults to black and white.

       -C <keyword>=<fgcolor>,<bgcolor>,<attributes>:<keyword>= ...
              Specify a different color set.  See the Colors section in mc(1) for more information.

       -d     Disable mouse support.

       -f     Display the compiled-in search paths for Midnight Commander files.

       -t     Used only if the code was compiled with S-Lang and terminfo: it makes Midnight Commander use the value of the TERMCAP  variable  for
              the terminal information instead of the information on the system wide terminal database

       -V     Displays the version of the program.

       -x     Forces xterm mode.  Used when running on xterm-capable terminals (two screen modes, and able to send mouse escape sequences).

COLORS
       The  default  colors may be changed by appending to the MC_COLOR_TABLE environment variable.  Foreground and background colors pairs may be
       specified for example with:

       MC_COLOR_TABLE="$MC_COLOR_TABLE:\
       normal=lightgray,black:\
       selected=black,green"

FILES
       /usr/share/mc/mc.hlp

              The help file for the program.

       /usr/share/mc/mc.ini

              The default system-wide setup for GNU Midnight Commander, used only if the user's own ~/.config/mc/ini file is missing.

       /usr/share/mc/mc.lib

              Global settings for Midnight Commander. Settings in this file affect all users, whether they have ~/.config/mc/ini or not.

       ~/.config/mc/ini

              User's own setup.  If this file is present, the setup is loaded from here instead of the system-wide startup file.

LICENSE
       This program is distributed under the terms of the GNU General Public License as published  by  the  Free  Software  Foundation.   See  the
       built-in help of Midnight Commander for details on the License and the lack of warranty.

AVAILABILITY
       The latest version of this program can be found at http://ftp.midnight-commander.org/.

SEE ALSO
       mc(1), mcedit(1)

BUGS
       Bugs should be reported to http://www.midnight-commander.org/.

MC Version 4.8.18                                                 September 2016                                                         MCVIEW(1)
