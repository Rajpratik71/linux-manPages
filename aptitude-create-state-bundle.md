APTITUDE-CREATE-ST(1)                   Command-line reference                   APTITUDE-CREATE-ST(1)

NAME
       aptitude-create-state-bundle - bundle the current aptitude state

SYNOPSIS
       aptitude-create-state-bundle [<options>...] <output-file>

DESCRIPTION
           Note
           This command is mostly for internal use and bug reporting in exceptional cases, it is not
           intended for end-users under normal circumstances.

       aptitude-create-state-bundle produces a compressed archive storing the files that are required
       to replicate the current package archive state. The following files and directories are
       included in the bundle:

       •   $HOME/.aptitude

       •   /var/lib/aptitude

       •   /var/lib/apt

       •   /var/cache/apt/*.bin

       •   /etc/apt

       •   /var/lib/dpkg/status

       The output of this program can be used as an argument to aptitude-run-state-bundle(1).

OPTIONS
       --force-bzip2
           Override the autodetection of which compression algorithm to use. By default,
           aptitude-create-state-bundle uses bzip2(1) if it is available, and gzip(1) otherwise.
           Passing this option forces the use of bzip2 even if it doesn't appear to be available.

       --force-gzip
           Override the autodetection of which compression algorithm to use. By default,
           aptitude-create-state-bundle uses bzip2(1) if it is available, and gzip(1) otherwise.
           Passing this option forces the use of gzip even if bzip2 is available.

       --help
           Print a brief usage message, then exit.

       --print-inputs
           Instead of creating a bundle, display a list of the files and directories that the program
           would include if it generated a bundle.

FILE FORMAT
       The bundle file is simply a tar(1) file compressed with bzip2(1) or gzip(1), with each of the
       input directory trees rooted at “.”.

SEE ALSO
       aptitude-run-state-bundle(1), aptitude(8), apt(8)

AUTHORS
       Daniel Burrows <dburrows@debian.org>
           Main author of the document.

       Manuel A. Fernandez Montecelo <mafm@debian.org>
           Main maintainer after Daniel Burrows, documentation about new features, corrections and
           formatting.

COPYRIGHT
       Copyright 2007 Daniel Burrows.

       This manual page is free software; you can redistribute it and/or modify it under the terms of
       the GNU General Public License as published by the Free Software Foundation; either version 2
       of the License, or (at your option) any later version.

       This manual page is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
       without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
       the GNU General Public License for more details.

       You should have received a copy of the GNU General Public License along with this program; if
       not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
       02110-1301 USA.

aptitude-create-state-bundle 0                01/19/2018                         APTITUDE-CREATE-ST(1)
