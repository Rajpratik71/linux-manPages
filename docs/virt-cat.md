virt-cat(1)                                                                               Virtualization Support                                                                              virt-cat(1)

NAME
       virt-cat - Display files in a virtual machine

SYNOPSIS
        virt-cat [--options] -d domname file [file ...]

        virt-cat [--options] -a disk.img [-a disk.img ...] file [file ...]

       Old-style:

        virt-cat domname file

        virt-cat disk.img file

DESCRIPTION
       "virt-cat" is a command line tool to display the contents of "file" where "file" exists in the named virtual machine (or disk image).

       Multiple filenames can be given, in which case they are concatenated together.  Each filename must be a full path, starting at the root directory (starting with '/').

       "virt-cat" can be used to quickly view a file.  To edit a file, use "virt-edit".  For more complex cases you should look at the guestfish(1) tool (see "USING GUESTFISH" below).

EXAMPLES
       Display /etc/fstab file from inside the libvirt VM called "mydomain":

        virt-cat -d mydomain /etc/fstab

       Find out what packages were recently installed:

        virt-cat -d mydomain /var/log/yum.log | tail

       Find out who is logged on inside a virtual machine:

        virt-cat -d mydomain /var/run/utmp > /tmp/utmp
        who /tmp/utmp

       or who was logged on:

        virt-cat -d mydomain /var/log/wtmp > /tmp/wtmp
        last -f /tmp/wtmp

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
           When prompting for keys and passphrases, virt-cat normally turns echoing off so you cannot see what you are typing.  If you are not worried about Tempest attacks and there is no one else in
           the room you can specify this flag to see what you are typing.

       --format=raw|qcow2|..
       --format
           The default for the -a option is to auto-detect the format of the disk image.  Using this forces the disk format for -a options which follow on the command line.  Using --format with no
           argument switches back to auto-detection for subsequent -a options.

           For example:

            virt-cat --format=raw -a disk.img file

           forces raw format (no auto-detection) for disk.img.

            virt-cat --format=raw -a disk.img --format -a another.img file

           forces raw format (no auto-detection) for disk.img and reverts to auto-detection for another.img.

           If you have untrusted raw-format guest disk images, you should use this option to specify the disk format.  This avoids a possible security problem with malicious guests (CVE-2010-3851).

       --keys-from-stdin
           Read key or passphrase parameters from stdin.  The default is to try to read passphrases from the user by opening /dev/tty.

       -m dev[:mountpoint[:options[:fstype]]]
       --mount dev[:mountpoint[:options[:fstype]]]
           Mount the named partition or logical volume on the given mountpoint.

           If the mountpoint is omitted, it defaults to /.

           Specifying any mountpoint disables the inspection of the guest and the mount of its root and all of its mountpoints, so make sure to mount all the mountpoints needed to work with the
           filenames given as arguments.

           If you don't know what filesystems a disk image contains, you can either run guestfish without this option, then list the partitions, filesystems and LVs available (see "list-partitions",
           "list-filesystems" and "lvs" commands), or you can use the virt-filesystems(1) program.

           The third (and rarely used) part of the mount parameter is the list of mount options used to mount the underlying filesystem.  If this is not given, then the mount options are either the
           empty string or "ro" (the latter if the --ro flag is used).  By specifying the mount options, you override this default choice.  Probably the only time you would use this is to enable ACLs
           and/or extended attributes if the filesystem can support them:

            -m /dev/sda1:/:acl,user_xattr

           Using this flag is equivalent to using the "mount-options" command.

           The fourth part of the parameter is the filesystem driver to use, such as "ext3" or "ntfs". This is rarely needed, but can be useful if multiple drivers are valid for a filesystem (eg:
           "ext2" and "ext3"), or if libguestfs misidentifies a filesystem.

       -v
       --verbose
           Enable verbose messages for debugging.

       -V
       --version
           Display version number and exit.

       -x  Enable tracing of libguestfs API calls.

OLD-STYLE COMMAND LINE ARGUMENTS
       Previous versions of virt-cat allowed you to write either:

        virt-cat disk.img [disk.img ...] file

       or

        virt-cat guestname file

       whereas in this version you should use -a or -d respectively to avoid the confusing case where a disk image might have the same name as a guest.

       For compatibility the old style is still supported.

LOG FILES
       To list out the log files from guests, see the related tool virt-log(1).  It understands binary log formats such as the systemd journal.

WINDOWS PATHS
       "virt-cat" has a limited ability to understand Windows drive letters and paths (eg. E:\foo\bar.txt).

       If and only if the guest is running Windows then:

       ·   Drive letter prefixes like "C:" are resolved against the Windows Registry to the correct filesystem.

       ·   Any backslash ("\") characters in the path are replaced with forward slashes so that libguestfs can process it.

       ·   The path is resolved case insensitively to locate the file that should be displayed.

       There are some known shortcomings:

       ·   Some NTFS symbolic links may not be followed correctly.

       ·   NTFS junction points that cross filesystems are not followed.

USING GUESTFISH
       guestfish(1) is a more powerful, lower level tool which you can use when "virt-cat" doesn't work.

       Using "virt-cat" is approximately equivalent to doing:

        guestfish --ro -i -d domname download file -

       where "domname" is the name of the libvirt guest, and "file" is the full path to the file.  Note the final "-" (meaning "output to stdout").

       The command above uses libguestfs's guest inspection feature and so does not work on guests that libguestfs cannot inspect, or on things like arbitrary disk images that don't contain guests.  To
       display a file from a disk image directly, use:

        guestfish --ro -a disk.img -m /dev/sda1 download file -

       where disk.img is the disk image, /dev/sda1 is the filesystem within the disk image, and "file" is the full path to the file.

EXIT STATUS
       This program returns 0 if successful, or non-zero if there was an error.

SEE ALSO
       guestfs(3), guestfish(1), virt-copy-out(1), virt-edit(1), virt-log(1), virt-tar-out(1), http://libguestfs.org/.

AUTHOR
       Richard W.M. Jones http://people.redhat.com/~rjones/

COPYRIGHT
       Copyright (C) 2010-2012 Red Hat Inc.

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

libguestfs-1.32.2                                                                               2016-01-29                                                                                    virt-cat(1)
