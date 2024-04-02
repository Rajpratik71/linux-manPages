DGLOB(1)                                                   Debian-goodies documentation                                                   DGLOB(1)

NAME
       dglob - Expand package names or files matching a pattern

SYNOPSIS
       dglob [-a] pattern

       dglob [-0] -f pattern

DESCRIPTION
       dglob lists packages names matching a pattern. It can also list all the files they contain. By default dglob only searches installed
       packages; the -a and -n switch widens the search (see "OPTIONS"). The list is written to stdout, one name per line.

       grep-dctrl(1) and grep-aptavail(1) are used to search the list of packages, so you should refer to its documentation for information on how
       patterns are matched.  By default, all packages whose name contains the given string will be matched, but several options are available to
       modify this behavior (see "OPTIONS").

       If you use dglob with the -f option, all files in the matched packages are listed instead of their names. If you do not use de -a switch,
       only existing, plain (i.e. no symlinks, directories or other special ones) files are listed. If the -a switch is use then all files will be
       listed both for installed and non-installed packages. The filenames are written to stdout, one file per line. You can use the -0 option to
       get the filenames separated by '\0' instead of a newline.

OPTIONS
       dglob supports the following options:

       -a  Search through all available packages, not just installed ones.  If set, grep-aptavail(1) is used.

       -n  Search through all the available packages but not including installed ones.  If set, grep-aptavail(1) is used.

       -f  List all files in the matched packages. By default, this lists only installed (i.e.  locally existing) files from installed packages.
           If used together with -a then it will list all files both of installed and non-installed packages by mean of apt-file(1). If apt-file
           is not installed, using -f together with -a is rather pointless.

       -0  When listing files (with -f) use '\0' as a separator instead of a newline. When specified without -f, this options does nothing.

       -r, -e, -i, -X, -v
           These options are passed directly to grep-dctrl(1) or to grep-aptavail(1) to modify how the pattern is matched.  See grep-dctrl(1).

FILES
       /var/lib/dpkg/status
           dpkg(8) status file, which serves as source for the list of available and installed packages.

AUTHOR
       Matt Zimmerman <mdz@debian.org>

       This manpage was written by Frank Lichtenheld <frank@lichtenheld.de>, and further enhanced by Javier Fernandez-Sanguino <jfs@debian.org>.

COPYRIGHT AND LICENCE
       Copyright (C) 2001 Matt Zimmerman <mdz@debian.org>.

       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation; either version 2, or (at your option) any later version.

       On Debian systems, a copy of the GNU General Public License version 2 can be found in /usr/share/common-licenses/GPL-2.

SEE ALSO
       grep-dctrl(1), grep-available(1), apt-file(1), dpkg(8)

perl v5.20.1                                                        2015-01-23                                                            DGLOB(1)
