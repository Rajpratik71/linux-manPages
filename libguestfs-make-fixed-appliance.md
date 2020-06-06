libguestfs-make-fixed-appliance(1)                                                        Virtualization Support                                                       libguestfs-make-fixed-appliance(1)

NAME
       libguestfs-make-fixed-appliance - Make a "fixed appliance" for libguestfs

SYNOPSIS
        libguestfs-make-fixed-appliance [--options] OUTPUTDIR

        libguestfs-make-fixed-appliance [--options] --xz

DESCRIPTION
       libguestfs-make-fixed-appliance lets you make a pre-built binary appliance for libguestfs.

       Note that ordinary users should not need to run this tool.

       Some reasons why you might want to use this include:

       ·   You want to make a self-contained libguestfs appliance that can be copied to another machine or platform that doesn't support supermin(1).

       ·   You have multiple users on the same machine and want to avoid the storage duplication and start-up overhead of having multiple cached copies of the appliance.

       ·   You want to have very predictable performance from libguestfs (see guestfs-performance(1)).

       For deeper understanding of why you might need this tool, read "FIXED APPLIANCE" in guestfs(3).

       Instead of running this tool, you can download fixed appliances from http://libguestfs.org/download/binaries/appliance/.  These appliances were made using this tool.

       There are two ways to use this tool.

       ·   Specify an output directory, for example:

            libguestfs-make-fixed-appliance /usr/local/lib/guestfs/appliance

           The output directory is created if it does not exist.  Four files are created in this directory:

            <OUTPUTDIR>/kernel
            <OUTPUTDIR>/initrd
            <OUTPUTDIR>/root
            <OUTPUTDIR>/README.fixed

           Note that "OUTPUTDIR/root" is a sparse file, so take care when copying it.

           You can then run libguestfs (possibly after copying this directory to another machine) by setting the environment variable LIBGUESTFS_PATH to "OUTPUTDIR".

       ·   The alternative method is to use the --xz option to create a compressed tarball:

            libguestfs-make-fixed-appliance --xz

           This creates a tarball in the current directory called:

            appliance-<VERSION>.tar.xz

           (where "VERSION" is the version of libguestfs).  The tarball contains the four files:

            appliance/kernel
            appliance/initrd
            appliance/root
            appliance/README.fixed

           Note that "appliance/root" is a sparse file, so take care when copying it.

OPTIONS
       --help
           Display short usage information and exit.

       -V
       --version
           Display the version number and exit.

       --xz
           Instead of creating the appliance in an output directory, create a compressed tarball of the appliance in the current directory called appliance-VERSION.tar.xz where "VERSION" is the version
           of libguestfs.

           Using --xz can take some time.  If working normally, the tool is completely silent when it is running.

LICENSING
       The fixed appliance is a complete Linux binary distro.  If you distribute it, you may need to distribute corresponding source files to remain in legal compliance with the licenses of the
       software in the appliance (such as the GNU General Public License).

EXIT STATUS
       libguestfs-make-fixed-appliance returns 0 if the appliance was built without errors.

ENVIRONMENT VARIABLES
       For the full list of environment variables which may affect libguestfs, please see the guestfs(3) manual page.

SEE ALSO
       guestfs(3), supermin(1), xz(1), http://libguestfs.org/, http://qemu.org/.

AUTHORS
       Richard W.M. Jones ("rjones at redhat dot com")

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

libguestfs-1.32.2                                                                               2016-01-29                                                             libguestfs-make-fixed-appliance(1)
