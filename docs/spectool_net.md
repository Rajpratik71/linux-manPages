SPECTOOLS(1)                                                  General Commands Manual                                                 SPECTOOLS(1)

NAME
       spectool_net — Network server for the spectool_gtk program

SYNOPSIS
       spectool_net [-b secs]  [-p port]  [-a bind address]

DESCRIPTION
       spectool_net is network server to which spectool_gtk can connect.

OPTIONS
       This program follows the usual GNU command line syntax, with long options starting with two dashes (`-').  A summary of options is included
       below.

       -h           --help
                 Show summary of options.

       -b secs           --broadcast secs
                 Send broadcast announce.

       -p port           --port port
                 Use alternate port.

       -a address           --bindaddr address
                 Bind to specific address.

SEE ALSO
       spectool_gtk (1), spectool_curses (1), spectool_raw (1).

AUTHOR
       This manual page was written by Francois Marier <francois@debian.org> for the Debian system (but may be used  by  others).   Permission  is
       granted to copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 3 any later version pub‐
       lished by the Free Software Foundation.

       On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

                                                                                                                                      SPECTOOLS(1)
