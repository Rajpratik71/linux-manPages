virt-copy-in(1)                                                                           Virtualization Support                                                                          virt-copy-in(1)

NAME
       virt-copy-in - Copy files and directories into a virtual machine disk image.

SYNOPSIS
        virt-copy-in -a disk.img file|dir [file|dir ...] /destination

        virt-copy-in -d domain file|dir [file|dir ...] /destination

WARNING
       Using "virt-copy-in" on live virtual machines, or concurrently with other disk editing tools, can be dangerous, potentially causing disk corruption.  The virtual machine must be shut down before
       you use this command, and disk images must not be edited concurrently.

DESCRIPTION
       "virt-copy-in" copies files and directories from the local disk into a virtual machine disk image or named libvirt domain.

       You can give one of more filenames and directories on the command line.  Directories are copied in recursively.  The final parameter must be the destination directory in the disk image which
       must be an absolute path starting with a / character.

EXAMPLES
       Update /etc/resolv.conf in a guest:

        virt-copy-in -d MyGuest resolv.conf /etc

       Upload a home directory to a guest:

        virt-copy-in -d MyGuest skel /home

JUST A SHELL SCRIPT WRAPPER AROUND GUESTFISH
       This command is just a simple shell script wrapper around the guestfish(1) "copy-in" command.  For anything more complex than a trivial copy, you are probably better off using guestfish
       directly.

OPTIONS
       Since the shell script just passes options straight to guestfish, read guestfish(1) to see the full list of options.

SEE ALSO
       guestfish(1), virt-cat(1), virt-copy-out(1), virt-edit(1), virt-tar-in(1), virt-tar-out(1), http://libguestfs.org/.

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

libguestfs-1.32.2                                                                               2016-01-29                                                                                virt-copy-in(1)
