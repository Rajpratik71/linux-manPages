SPECTOOLS(1)                                                  General Commands Manual                                                 SPECTOOLS(1)

NAME
       spectool_curses — Utility for developing other tools using the Wi-Spy

SYNOPSIS
       spectool_curses [-n network server]  [-b]

DESCRIPTION
       spectool_curses is a simple tool which extracts data from the Wi-Spy device. It can be used to create other tools or scripts.

OPTIONS
       This program follows the usual GNU command line syntax, with long options starting with two dashes (`-').  A summary of options is included
       below.

       -h           --help
                 Show summary of options.

       -n tcp://host:port           --net tcp://host:port
                 Connect to network server instead of local USB devices.

SEE ALSO
       spectool_gtk (1), spectool_raw (1), spectool_net (1).

AUTHOR
       This manual page was written by Francois Marier <francois@debian.org> for the Debian system (but may be used  by  others).   Permission  is
       granted to copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 3 any later version pub‐
       lished by the Free Software Foundation.

       On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

                                                                                                                                      SPECTOOLS(1)
