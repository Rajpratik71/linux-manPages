virt-df(1)                                                                                Virtualization Support                                                                               virt-df(1)

NAME
       virt-df - Display free space on virtual filesystems

SYNOPSIS
       All guests:

        virt-df [--options]

       Single guest:

        virt-df [--options] -d domname

        virt-df [--options] -a disk.img [-a disk.img ...]

       Old style:

        virt-df [--options] domname

        virt-df [--options] disk.img [disk.img ...]

DESCRIPTION
       "virt-df" is a command line tool to display free space on virtual machine filesystems.  Unlike other tools, it doesn't just display the size of disk allocated to a virtual machine, but can look
       inside disk images to see how much space is really being used.

       If used without any -a or -d arguments, "virt-df" checks with libvirt to get a list of all active and inactive guests, and performs a "df"-type operation on each one in turn, printing out the
       results.

       If any -a or -d arguments are specified, "virt-df" performs a "df"-type operation on either the single named libvirt domain, or on the disk image(s) listed on the command line (which must all
       belong to a single VM).  In this mode (with arguments), "virt-df" will only work for a single guest.  If you want to run on multiple guests, then you have to invoke "virt-df" multiple times.

       Use the --csv option to get a format which can be easily parsed by other programs.  Other options are similar to the standard df(1) command.

EXAMPLES
       Show disk usage for a single libvirt guest called "F14x64".  Make the output human-readable:

        # virt-df -d F14x64 -h
        Filesystem                       Size     Used  Available  Use%
        F14x64:/dev/sda1                 484M      66M       393M   14%
        F14x64:/dev/vg_f13x64/lv_root    7.4G     3.4G       4.0G   46%

       Show disk usage for a disk image file called test.img:

        $ virt-df -a test1.img
        Filesystem                  1K-blocks     Used  Available  Use%
        test1.img:/dev/sda1             99099     1551      92432    2%

       If a single guest has multiple disks, use the -a option repeatedly.  A plus sign ("+") is displayed for each additional disk.  Note: Do not do this with unrelated guest disks.

        $ virt-df -a Win7x32TwoDisks-a -a Win7x32TwoDisks-b
        Filesystem                   1K-blocks    Used  Available  Use%
        Win7x32TwoDisks-a+:/dev/sda1    102396   24712      77684   25%
        Win7x32TwoDisks-a+:/dev/sda2  12478460 7403416    5075044   60%
        Win7x32TwoDisks-a+:/dev/sdb1    521212   55728     465484   11%

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

       --csv
           Write out the results in CSV format (comma-separated values).  This format can be imported easily into databases and spreadsheets, but read "NOTE ABOUT CSV FORMAT" below.

       -d guest
       --domain guest
           Add all the disks from the named libvirt guest.  Domain UUIDs can be used instead of names.

       --format=raw|qcow2|..
       --format
           The default for the -a option is to auto-detect the format of the disk image.  Using this forces the disk format for -a options which follow on the command line.  Using --format with no
           argument switches back to auto-detection for subsequent -a options.

           For example:

            virt-df --format=raw -a disk.img

           forces raw format (no auto-detection) for disk.img.

            virt-df --format=raw -a disk.img --format -a another.img

           forces raw format (no auto-detection) for disk.img and reverts to auto-detection for another.img.

           If you have untrusted raw-format guest disk images, you should use this option to specify the disk format.  This avoids a possible security problem with malicious guests (CVE-2010-3851).

       -h
       --human-readable
           Print sizes in human-readable format.

           You are not allowed to use -h and --csv at the same time.

       -i
       --inodes
           Print inodes instead of blocks.

       --one-per-guest
           Since libguestfs 1.22, this is the default.  This option does nothing and is left here for backwards compatibility with older scripts.

       -P nr_threads
           Since libguestfs 1.22, virt-df is multithreaded and examines guests in parallel.  By default the number of threads to use is chosen based on the amount of free memory available at the time
           that virt-df is started.  You can force virt-df to use at most "nr_threads" by using the -P option.

           Note that -P 0 means to autodetect, and -P 1 means to use a single thread.

       --uuid
           Print UUIDs instead of names.  This is useful for following a guest even when the guest is migrated or renamed, or when two guests happen to have the same name.

           Note that only domains that we fetch from libvirt come with UUIDs.  For disk images, we still print the disk image name even when this option is specified.

       -v
       --verbose
           Enable verbose messages for debugging.

       -V
       --version
           Display version number and exit.

       -x  Enable tracing of libguestfs API calls.

STATVFS NUMBERS
       "virt-df" (and df(1)) get information by issuing a statvfs(3) system call.  You can get the same information directly, either from the host (using libguestfs) or inside the guest:

       From the host
           Run this command:

            guestfish --ro -d GuestName -i statvfs /

           (change / to see stats for other filesystems).

       From inside the guest
           Run this command:

            python -c 'import os; s = os.statvfs ("/"); print s'

           (change / to see stats for other filesystems).

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
       df(1), guestfs(3), guestfish(1), virt-filesystems(1), http://libguestfs.org/.

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

libguestfs-1.32.2                                                                               2016-01-29                                                                                     virt-df(1)
