DEBGET(1)                                                  Debian-goodies documentation                                                  DEBGET(1)

NAME
       debget - Fetch a .deb for a package in APT's database

SYNOPSIS
       debget package [package ...]

DESCRIPTION
       debget fetches a .deb for one or more packages from an Debian mirror.  It uses apt-get(8) to find out the URL so it will download the same
       version from the same server as apt-get(8) would do. The .deb will be downloaded with curl(1) and stored in your current working directory.

KNOWN BUGS
       debget will not work for packages that are available in apt-get(8)'s cache.  If you need that functionality please use the download option
       in aptitude(8).

AUTHOR
       Matt Zimmerman <mdz@debian.org>

       This manpage was written by Frank Lichtenheld <frank@lichtenheld.de>.

COPYRIGHT AND LICENCE
       Copyright (C) 2001 Matt Zimmerman <mdz@debian.org>.

       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation; either version 2, or (at your option) any later version.

       On Debian systems, a copy of the GNU General Public License version 2 can be found in /usr/share/common-licenses/GPL-2.

SEE ALSO
       apt-get(8), curl(1)

perl v5.20.1                                                        2015-01-22                                                           DEBGET(1)
