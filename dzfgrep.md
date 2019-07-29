DGREP(1)                                                   Debian-goodies documentation                                                   DGREP(1)

NAME
       dgrep, degrep, dfgrep, dzgrep -- grep through files belonging to an installed Debian package

SYNOPSIS
       dgrep [most grep options] pattern package...

       dgrep --help

DESCRIPTION
       dgrep invokes grep(1) on each file in one or more installed Debian packages.

       It passes the package argument(s) to dglob(1) to retrieve a list of files in those packages. You can use POSIX regular expressions for the
       package names.

       If dgrep is invoked as degrep, dfgrep or dzgrep then egrep(1), fgrep(1) or zgrep(1) is used instead of grep(1).

OPTIONS
       dgrep supports most of grep(1)'s options. Please refer to your grep(1) documentation (i.e. the manpage or the texinfo manual) for a
       complete listing. Only a few options are excluded because they do not conform with the intended behaviour, see the list below.

   Options of grep that are not supported by dgrep
       -r, --recursive, -d recurse, --directories=recurse
       -d read, --directories=read
           dgrep searches only in the "normal" files of a package. It skips all directories and symlinks. Therefor the options of grep that are
           specific to directories are not supported.

AUTHOR
       Matt Zimmerman <mdz@debian.org>

       This manpage was written by Frank Lichtenheld <frank@lichtenheld.de>.

COPYRIGHT AND LICENCE
       Copyright (C) 2001 Matt Zimmerman <mdz@debian.org>.

       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation; either version 2, or (at your option) any later version.

       On Debian systems, a copy of the GNU General Public License version 2 can be found in /usr/share/common-licenses/GPL-2.

SEE ALSO
       grep(1), egrep(1), fgrep(1), zgrep(1), dglob(1), regex(7), dpkg(8)

perl v5.20.1                                                        2015-01-22                                                            DGREP(1)
