DPIGS(1)                                                   Debian-goodies documentation                                                   DPIGS(1)

NAME
       dpigs - Show which installed packages occupy the most space

SYNOPSIS
       dpigs [options]

DESCRIPTION
       dpigs sorts the installed packages by size and outputs the largest ones. Per default dpigs displays the largest 10 packages. You can change
       this value by using the -n option (see "OPTIONS"). The information is taken from the dpkg status file with grep-status(1).

OPTIONS
       -n, --lines=N
           Display the N largest packages on the system (default 10).

       -s, --status=FILE
           Use FILE instead of the default dpkg status file (which is /var/lib/dpkg/status currently).

       -S, --source
           Display the largest source packages of binary packages installed on the system.

       -H, --human-readable
           Display package sizes in human-readable format (like ls -lh or du -h)

       -h, --help
           Display some usage information and exit.

AUTHOR
       Matt Zimmerman <mdz@debian.org>

       This manpage was written by Frank Lichtenheld <frank@lichtenheld.de>.

COPYRIGHT AND LICENCE
       Copyright (C) 2001 Matt Zimmerman <mdz@debian.org>.

       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation; either version 2, or (at your option) any later version.

       On Debian systems, a copy of the GNU General Public License version 2 can be found in /usr/share/common-licenses/GPL-2.

SEE ALSO
       dpkg(8), grep-status(1)

perl v5.20.1                                                        2015-01-22                                                            DPIGS(1)
