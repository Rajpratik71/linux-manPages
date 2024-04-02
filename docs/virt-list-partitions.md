virt-list-partitions(1)                                                                   Virtualization Support                                                                  virt-list-partitions(1)

NAME
       virt-list-partitions - List partitions in a virtual machine or disk image

SYNOPSIS
        virt-list-partitions [--options] domname

        virt-list-partitions [--options] disk.img [disk.img ...]

OBSOLETE
       This tool is obsolete.  Use virt-filesystems(1) as a more flexible replacement.

DESCRIPTION
       "virt-list-partitions" is a command line tool to list the partitions that are contained in a virtual machine or disk image.  It is mainly useful as a first step to using virt-resize(1).

       "virt-list-partitions" is just a simple wrapper around libguestfs(3) functionality.  For more complex cases you should look at the guestfish(1) tool.

OPTIONS
       --help
           Display brief help.

       --version
           Display version number and exit.

       -c URI
       --connect URI
           If using libvirt, connect to the given URI.  If omitted, then we connect to the default libvirt hypervisor.

           If you specify guest block devices directly, then libvirt is not used at all.

       --format raw
           Specify the format of disk images given on the command line.  If this is omitted then the format is autodetected from the content of the disk image.

           If disk images are requested from libvirt, then this program asks libvirt for this information.  In this case, the value of the format parameter is ignored.

           If working with untrusted raw-format guest disk images, you should ensure the format is always specified.

       -h
       --human-readable
           Show sizes in human-readable form (eg. "1G").

       -l
       --long
           With this option, "virt-list-partitions" displays the type and size of each partition too (where "type" means "ext3", "pv" etc.)

       -t
       --total
           Display the total size of each block device (as a separate row or rows).

SEE ALSO
       guestfs(3), guestfish(1), virt-filesystems(1), virt-list-filesystems(1), virt-resize(1), Sys::Guestfs(3), Sys::Virt(3), http://libguestfs.org/.

AUTHOR
       Richard W.M. Jones http://people.redhat.com/~rjones/

COPYRIGHT
       Copyright (C) 2009-2016 Red Hat Inc.

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

libguestfs-1.32.2                                                                               2016-01-29                                                                        virt-list-partitions(1)
