virt-log(1)                                                                               Virtualization Support                                                                              virt-log(1)

NAME
       virt-log - Display log files from a virtual machine

SYNOPSIS
        virt-log [--options] -d domname

        virt-log [--options] -a disk.img [-a disk.img ...]

DESCRIPTION
       "virt-log" is a command line tool to display the log files from the named virtual machine (or disk image).

       This tool understands and displays both plain text log files (eg. /var/log/messages) and binary formats such as the systemd journal.

       To display other types of files, use virt-cat(1).  To copy files out of a virtual machine, use virt-copy-out(1).  To display the contents of the Windows Registry, use virt-win-reg(1).

EXAMPLES
       Display the complete logs from a guest:

        virt-log -d mydomain | less

       Find out what DHCP IP address a VM acquired:

        virt-log -d mydomain | grep 'dhclient.*bound to'

OPTIONS
       --help
           Display brief help.

       -a file
       --add file
           Add file which should be a disk image from a virtual machine.  If the virtual machine has multiple block devices, you must supply all of them with separate -a options.

           The format of the disk image is auto-detected.  To override this and force a particular format use the --format=.. option.

       -a URI
       --add URI
           Add a remote disk.  See "ADDING REMOTE STORAGE" in guestfish(1).

       -c URI
       --connect URI
           If using libvirt, connect to the given URI.  If omitted, then we connect to the default libvirt hypervisor.

           If you specify guest block devices directly (-a), then libvirt is not used at all.

       -d guest
       --domain guest
           Add all the disks from the named libvirt guest.  Domain UUIDs can be used instead of names.

       --echo-keys
           When prompting for keys and passphrases, virt-log normally turns echoing off so you cannot see what you are typing.  If you are not worried about Tempest attacks and there is no one else in
           the room you can specify this flag to see what you are typing.

       --format=raw|qcow2|..
       --format
           The default for the -a option is to auto-detect the format of the disk image.  Using this forces the disk format for -a options which follow on the command line.  Using --format with no
           argument switches back to auto-detection for subsequent -a options.

           For example:

            virt-log --format=raw -a disk.img

           forces raw format (no auto-detection) for disk.img.

            virt-log --format=raw -a disk.img --format -a another.img

           forces raw format (no auto-detection) for disk.img and reverts to auto-detection for another.img.

           If you have untrusted raw-format guest disk images, you should use this option to specify the disk format.  This avoids a possible security problem with malicious guests (CVE-2010-3851).

       --keys-from-stdin
           Read key or passphrase parameters from stdin.  The default is to try to read passphrases from the user by opening /dev/tty.

       -v
       --verbose
           Enable verbose messages for debugging.

       -V
       --version
           Display version number and exit.

       -x  Enable tracing of libguestfs API calls.

EXIT STATUS
       This program returns 0 if successful, or non-zero if there was an error.

SEE ALSO
       guestfs(3), guestfish(1), virt-cat(1), virt-copy-out(1), virt-tar-out(1), virt-win-reg(1), http://libguestfs.org/.

AUTHOR
       Richard W.M. Jones http://people.redhat.com/~rjones/

COPYRIGHT
       Copyright (C) 2010-2016 Red Hat Inc.

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

libguestfs-1.32.2                                                                               2016-01-29                                                                                    virt-log(1)
