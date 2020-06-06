virt-get-kernel(1)                                                                        Virtualization Support                                                                       virt-get-kernel(1)

NAME
       virt-get-kernel - Extract kernel and ramdisk from guests

SYNOPSIS
        virt-get-kernel [--options] -d domname

        virt-get-kernel [--options] -a disk.img

DESCRIPTION
       This option extracts the kernel and initramfs from a guest.

       The format of the disk image is automatically detected unless you specify it by using the --format option.

       In the case where the guest contains multiple kernels, the one with the highest version number is chosen.  To extract arbitrary kernels from the disk image, see guestfish(1).  To extract the
       entire "/boot" directory of a guest, see virt-copy-out(1).

OPTIONS
       --help
           Display help.

       -a file
       --add file
           Add file which should be a disk image from a virtual machine.

           The format of the disk image is auto-detected.  To override this and force a particular format use the --format option.

       -a URI
       --add URI
           Add a remote disk.  The URI format is compatible with guestfish.  See "ADDING REMOTE STORAGE" in guestfish(1).

       -c URI
       --connect URI
           If using libvirt, connect to the given URI.  If omitted, then we connect to the default libvirt hypervisor.

           If you specify guest block devices directly (-a), then libvirt is not used at all.

       -d guest
       --domain guest
           Add all the disks from the named libvirt guest.  Domain UUIDs can be used instead of names.

       --format raw|qcow2|..
       --format auto
           The default for the -a option is to auto-detect the format of the disk image.  Using this forces the disk format for the -a option on the command line.

           If you have untrusted raw-format guest disk images, you should use this option to specify the disk format.  This avoids a possible security problem with malicious guests (CVE-2010-3851).

       --machine-readable
           This option is used to make the output more machine friendly when being parsed by other programs.  See "MACHINE READABLE OUTPUT" below.

       -o directory
       --output directory
           This option specifies the output directory where kernel and initramfs from the guest are written.

           If not specified, the default output is the current directory.

       --prefix prefix
           This option specifies a prefix for the extracted files.

           If a prefix is specified, then there will be a dash ("-") after the prefix and before the rest of the file name; for example, a kernel in the guest like "vmlinuz-3.19.0-20-generic" is saved
           as "mydistro-vmlinuz-3.19.0-20-generic" when the prefix is "mydistro".

           See also --unversioned-names.

       -q
       --quiet
           Don't print ordinary progress messages.

       --unversioned-names
           This option affects the destination file name of extracted files.

           If enabled, files will be saved locally just with the base name; for example, kernel and ramdisk in the guest like "vmlinuz-3.19.0-20-generic" and "initrd.img-3.19.0-20-generic" are saved
           respectively as "vmlinuz" and "initrd.img".

           See also --prefix.

       -v
       --verbose
           Enable verbose messages for debugging.

       -V
       --version
           Display version number and exit.

       -x  Enable tracing of libguestfs API calls.

MACHINE READABLE OUTPUT
       The --machine-readable option can be used to make the output more machine friendly, which is useful when calling virt-get-kernel from other programs, GUIs etc.

       Use the option on its own to query the capabilities of the virt-get-kernel binary.  Typical output looks like this:

        $ virt-get-kernel --machine-readable
        virt-get-kernel

       A list of features is printed, one per line, and the program exits with status 0.

ENVIRONMENT VARIABLES
       For other environment variables which affect all libguestfs programs, see "ENVIRONMENT VARIABLES" in guestfs(3).

EXIT STATUS
       This program returns 0 if successful, or non-zero if there was an error.

SEE ALSO
       guestfs(3), guestfish(1), guestmount(1), virt-copy-out(1), http://libguestfs.org/.

AUTHOR
       Richard W.M. Jones http://people.redhat.com/~rjones/

COPYRIGHT
       Copyright (C) 2013-2016 Red Hat Inc.

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

libguestfs-1.32.2                                                                               2016-01-29                                                                             virt-get-kernel(1)
