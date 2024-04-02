virt-tar-in(1)                                                                            Virtualization Support                                                                           virt-tar-in(1)

NAME
       virt-tar-in - Unpack a tarball into a virtual machine disk image.

SYNOPSIS
        virt-tar-in -a disk.img data.tar /destination

        virt-tar-in -d domain data.tar /destination

        zcat data.tar.gz | virt-tar-in -d domain - /destination

WARNING
       Using "virt-tar-in" on live virtual machines, or concurrently with other disk editing tools, can be dangerous, potentially causing disk corruption.  The virtual machine must be shut down before
       you use this command, and disk images must not be edited concurrently.

DESCRIPTION
       "virt-tar-in" unpacks an uncompressed tarball into a virtual machine disk image or named libvirt domain.

       The first parameter is the tar file.  Use "-" to read the tar file from standard input.  The second parameter is the absolute target directory to unpack into.

EXAMPLES
       Upload a home directory to a guest:

        virt-tar-in -d MyGuest homes.tar /home

JUST A SHELL SCRIPT WRAPPER AROUND GUESTFISH
       This command is just a simple shell script wrapper around the guestfish(1) "tar-in" command.  For anything more complex than a trivial copy, you are probably better off using guestfish directly.

OPTIONS
       Since the shell script just passes options straight to guestfish, read guestfish(1) to see the full list of options.

SEE ALSO
       guestfish(1), virt-cat(1), virt-copy-in(1), virt-copy-out(1), virt-edit(1), virt-make-fs(1), virt-tar-out(1), http://libguestfs.org/.

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

libguestfs-1.32.2                                                                               2016-01-29                                                                                 virt-tar-in(1)
