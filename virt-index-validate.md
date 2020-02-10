virt-index-validate(1)                                                                    Virtualization Support                                                                   virt-index-validate(1)

NAME
       virt-index-validate - Validate virt-builder index file

SYNOPSIS
        virt-index-validate index

DESCRIPTION
       virt-builder(1) uses an index file to store metadata about templates that it knows how to use.  This index file has a specific format which virt-index-validate knows how to validate.

       Note that virt-index-validate can validate either the signed or unsigned index file (ie. either index or index.asc).  It can only validate a local file, not a URL.

OPTIONS
       --compat-1.24.0
           Check for compatibility with virt-builder 1.24.0.  (Using this option implies --compat-1.24.1, so you don't need to use both.)

           In particular:

           ·   This version of virt-builder could not handle "[...]"  (square brackets) in field names (eg. "checksum[sha512]=...").

           ·   It required detached signatures ("sig=...").

       --compat-1.24.1
           Check for compatibility with virt-builder ≥ 1.24.1.

           In particular:

           ·   This version of virt-builder could not handle "." (period) in field names or "," (comma) in subfield names.

           ·   It could not handle comments appearing in the file.

       --help
           Display help.

       -V
       --version
           Display version number and exit.

EXIT STATUS
       This program returns 0 if the index file validates, or non-zero if there was an error.

SEE ALSO
       virt-builder(1), http://libguestfs.org/.

AUTHOR
       Richard W.M. Jones http://people.redhat.com/~rjones/

COPYRIGHT
       Copyright (C) 2013 Red Hat Inc.

LICENSE
       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the
       License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
       General Public License for more details.

       You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
       02110-1301 USA.

BUGS
       To get a list of bugs against libguestfs, use this link: https://bugzilla.redhat.com/buglist.cgi?component=libguestfs&product=Virtualization+Tools

       To report a new bug against libguestfs, use this link: https://bugzilla.redhat.com/enter_bug.cgi?component=libguestfs&product=Virtualization+Tools

       When reporting a bug, please supply:

       ·   The version of libguestfs.

       ·   Where you got libguestfs (eg. which Linux distro, compiled from source, etc)

       ·   Describe the bug accurately and give a way to reproduce it.

       ·   Run libguestfs-test-tool(1) and paste the complete, unedited output into the bug report.

libguestfs-1.32.2                                                                               2016-01-29                                                                         virt-index-validate(1)
