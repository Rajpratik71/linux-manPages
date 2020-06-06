virt-copy-out(1)                                                                          Virtualization Support                                                                         virt-copy-out(1)

NAME
       virt-copy-out - Copy files and directories out of a virtual machine disk image.

SYNOPSIS
        virt-copy-out -a disk.img /file|dir [/file|dir ...] localdir

        virt-copy-out -d domain /file|dir [/file|dir ...] localdir

DESCRIPTION
       "virt-copy-out" copies files and directories out of a virtual machine disk image or named libvirt domain.

       You can give one of more filenames and directories on the command line.  Directories are copied out recursively.

EXAMPLES
       Download the home directories from a virtual machine:

        mkdir homes
        virt-copy-out -d MyGuest /home homes

JUST A SHELL SCRIPT WRAPPER AROUND GUESTFISH
       This command is just a simple shell script wrapper around the guestfish(1) "copy-out" command.  For anything more complex than a trivial copy, you are probably better off using guestfish
       directly.

OPTIONS
       Since the shell script just passes options straight to guestfish, read guestfish(1) to see the full list of options.

SEE ALSO
       guestfish(1), virt-cat(1), virt-copy-in(1), virt-edit(1), virt-tar-in(1), virt-tar-out(1), http://libguestfs.org/.

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

libguestfs-1.32.2                                                                               2016-01-29                                                                               virt-copy-out(1)
