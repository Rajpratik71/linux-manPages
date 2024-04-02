virt-tar-out(1)                                                                           Virtualization Support                                                                          virt-tar-out(1)

NAME
       virt-tar-out - Pack a virtual machine disk image directory into a tarball.

SYNOPSIS
        virt-tar-out -a disk.img /dir files.tar

        virt-tar-out -d domain /dir files.tar

        virt-tar-out -d domain /dir - | gzip --best > files.tar.gz

DESCRIPTION
       "virt-tar-out" packs a virtual machine disk image directory into a tarball.

       The first parameter is the absolute path of the virtual machine directory.  The second parameter is the tar file to write.  Use "-" to write to standard output.

EXAMPLES
       Download the home directories from a guest:

        virt-tar-out -d MyGuest /home - | gzip --best > homes.tar.gz

JUST A SHELL SCRIPT WRAPPER AROUND GUESTFISH
       This command is just a simple shell script wrapper around the guestfish(1) "tar-out" command.  For anything more complex than a trivial copy, you are probably better off using guestfish
       directly.

OPTIONS
       Since the shell script just passes options straight to guestfish, read guestfish(1) to see the full list of options.

SEE ALSO
       guestfish(1), virt-cat(1), virt-copy-in(1), virt-copy-out(1), virt-edit(1), virt-tar-in(1), http://libguestfs.org/.

AUTHORS
       Richard W.M. Jones ("rjones at redhat dot com")

COPYRIGHT
       Copyright (C) 2011-2012 Red Hat Inc.

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

libguestfs-1.32.2                                                                               2016-01-29                                                                                virt-tar-out(1)
