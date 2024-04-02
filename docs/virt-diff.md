virt-diff(1)                                                                              Virtualization Support                                                                             virt-diff(1)

NAME
       virt-diff - Differences between files in two virtual machines

SYNOPSIS
        virt-diff [--options] -d domain1 -D domain2

        virt-diff [--options] -a disk1.img [-a ...] -A disk2.img [-A ...]

DESCRIPTION
       "virt-diff" lists the differences between files in two virtual machines or disk images.  The usual use case is to show the changes in a VM after it has been running for a while, by taking a
       snapshot, running the VM, and then using this tool to show what changed between the new VM state and the old snapshot.

       This tool will find differences in filenames, file sizes, checksums, extended attributes, file content and more from a virtual machine or disk image.  However it does not look at the boot
       loader, unused space between partitions or within filesystems, "hidden" sectors and so on.  In other words, it is not a security or forensics tool.

       To specify two guests, you have to use the -a or -d option(s) for the first guest, and the -A or -D option(s) for the second guest.  The common case is:

        virt-diff -a old.img -A new.img

       or using names known to libvirt:

        virt-diff -d oldguest -D newguest

OPTIONS
       --help
           Display brief help.

       -a file
       --add file
           Add file which should be a disk image from the first virtual machine.  If the virtual machine has multiple block devices, you must supply all of them with separate -a options.

           The format of the disk image is auto-detected.  To override this and force a particular format use the --format=.. option.

       -a URI
       --add URI
           Add a remote disk.  See "ADDING REMOTE STORAGE" in guestfish(1).

       --all
           Same as --extra-stats --times --uids --xattrs.

       --atime
           The default is to ignore changes in file access times, since those are unlikely to be interesting.  Using this flag shows atime differences as well.

       -A file
       -A URI
           Add a disk image from the second virtual machine.

       --checksum
       --checksum=crc|md5|sha1|sha224|sha256|sha384|sha512
           Use a checksum over file contents to detect when regular files have changed content.

           With no argument, this defaults to using md5.  Using an argument, you can select the checksum type to use.  If the flag is omitted then file times and size are used to determine if a file
           has changed.

       -c URI
       --connect URI
           If using libvirt, connect to the given URI.  If omitted, then we connect to the default libvirt hypervisor.

           If you specify guest block devices directly (-a), then libvirt is not used at all.

       --csv
           Write out the results in CSV format (comma-separated values).  This format can be imported easily into databases and spreadsheets, but read "NOTE ABOUT CSV FORMAT" below.

       --dir-links
           The default is to ignore changed in the number of links in directory entries, since those are unlikely to be interesting.  Using this flag shows changes to the nlink field of directories.

       --dir-times
           The default is to ignore changed times on directory entries, since those are unlikely to be interesting.  Using this flag shows changes to the time fields of directories.

       -d guest
       --domain guest
           Add all the disks from the named libvirt guest, as the first guest.  Domain UUIDs can be used instead of names.

       -D guest
           Add all the disks from the named libvirt guest, as the second guest.  Domain UUIDs can be used instead of names.

       --echo-keys
           When prompting for keys and passphrases, virt-diff normally turns echoing off so you cannot see what you are typing.  If you are not worried about Tempest attacks and there is no one else in
           the room you can specify this flag to see what you are typing.

       --extra-stats
           Display extra stats.

       --format=raw|qcow2|..
       --format
           The default for the -a/-A option is to auto-detect the format of the disk image.  Using this forces the disk format for -a/-A options which follow on the command line.  Using --format with
           no argument switches back to auto-detection for subsequent -a/-A options.

           For example:

            virt-diff --format=raw -a disk.img [...]

           forces raw format (no auto-detection) for disk.img.

            virt-diff --format=raw -a disk.img --format -a another.img [...]

           forces raw format (no auto-detection) for disk.img and reverts to auto-detection for another.img.

           If you have untrusted raw-format guest disk images, you should use this option to specify the disk format.  This avoids a possible security problem with malicious guests (CVE-2010-3851).

       -h
       --human-readable
           Display file sizes in human-readable format.

       --keys-from-stdin
           Read key or passphrase parameters from stdin.  The default is to try to read passphrases from the user by opening /dev/tty.

       --times
           Display time fields.

       --time-days
           Display time fields as days before now (negative if in the future).

           Note that 0 in output means "up to 1 day before now", or that the age of the file is between 0 and 86399 seconds.

       --time-relative
           Display time fields as seconds before now (negative if in the future).

       --time-t
           Display time fields as seconds since the Unix epoch.

       --uids
           Display UID and GID fields.

       -v
       --verbose
           Enable verbose messages for debugging.

       -V
       --version
           Display version number and exit.

       -x  Enable tracing of libguestfs API calls.

       --xattrs
           Display extended attributes.

NOTE ABOUT CSV FORMAT
       Comma-separated values (CSV) is a deceptive format.  It seems like it should be easy to parse, but it is definitely not easy to parse.

       Myth: Just split fields at commas.  Reality: This does not work reliably.  This example has two columns:

        "foo,bar",baz

       Myth: Read the file one line at a time.  Reality: This does not work reliably.  This example has one row:

        "foo
        bar",baz

       For shell scripts, use "csvtool" (http://merjis.com/developers/csv also packaged in major Linux distributions).

       For other languages, use a CSV processing library (eg. "Text::CSV" for Perl or Python's built-in csv library).

       Most spreadsheets and databases can import CSV directly.

EXIT STATUS
       This program returns 0 if successful, or non-zero if there was an error.

SEE ALSO
       guestfs(3), guestfish(1), virt-cat(1), virt-copy-out(1), virt-ls(1), virt-tar-out(1), http://libguestfs.org/.

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

libguestfs-1.32.2                                                                               2016-01-29                                                                                   virt-diff(1)
