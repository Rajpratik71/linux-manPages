virt-format(1)                                                                            Virtualization Support                                                                           virt-format(1)

NAME
       virt-format - Erase and make a blank disk

SYNOPSIS
        virt-format [--options] -a disk.img [-a disk.img ...]

WARNING
       Using "virt-format" on live virtual machines, or concurrently with other disk editing tools, can be dangerous, potentially causing disk corruption.  The virtual machine must be shut down before
       you use this command, and disk images must not be edited concurrently.

DESCRIPTION
       Virt-format takes an existing disk file (or it can be a host partition, LV etc), erases all data on it, and formats it as a blank disk.  It can optionally create partition tables, empty
       filesystems, logical volumes and more.

       To create a disk containing data, you may be better to use virt-make-fs(1).  If you are creating a blank disk to use in guestfish(1), you should instead use the guestfish -N option.

       Normal usage would be something like this:

        virt-format -a disk.qcow

       or this:

        virt-format -a /dev/VG/LV

       disk.qcow or /dev/VG/LV must exist already.  Any data on these disks will be erased by these commands.  These commands will create a single empty partition covering the whole disk, with no
       filesystem inside it.

       Additional parameters can be used to control the creation of partitions, filesystems, etc.  The most commonly used options are:

       --filesystem=[ext3|ntfs|vfat|...]
           Create an empty filesystem ("ext3", "ntfs" etc) inside the partition.

       --lvm[=/dev/VG/LV]
           Create a Linux LVM2 logical volume on the disk.  When used with --filesystem, the filesystem is created inside the LV.

       For more information about these and other options, see "OPTIONS" below.

       The format of the disk is normally auto-detected, but you can also force it by using the --format option (q.v.).  In situations where you do not trust the existing content of the disk, then it
       is advisable to use this option to avoid possible exploits.

OPTIONS
       --help
           Display brief help.

       -a file
       --add file
           Add file, a disk image, host partition, LV, external USB disk, etc.

           The format of the disk image is auto-detected.  To override this and force a particular format use the --format=.. option.

           Any existing data on the disk is erased.

       -a URI
       --add URI
           Add a remote disk.  See "ADDING REMOTE STORAGE" in guestfish(1).

       --filesystem=ext3|ntfs|vfat|...
           Create an empty filesystem of the specified type.  Many filesystem types are supported by libguestfs.

       --filesystem=none
           Create no filesystem.  This is the default.

       --format=raw|qcow2|..
       --format
           The default for the -a option is to auto-detect the format of the disk image.  Using this forces the disk format for -a options which follow on the command line.  Using --format with no
           argument switches back to auto-detection for subsequent -a options.

           For example:

            virt-format --format=raw -a disk.img

           forces raw format (no auto-detection) for disk.img.

            virt-format --format=raw -a disk.img --format -a another.img

           forces raw format (no auto-detection) for disk.img and reverts to auto-detection for another.img.

           If you have untrusted raw-format guest disk images, you should use this option to specify the disk format.  This avoids a possible security problem with malicious guests (CVE-2010-3851).

       --label=LABEL
           Set the filesystem label.

       --lvm=/dev/VG/LV
           Create a Linux LVM2 logical volume called /dev/VG/LV.  You can change the name of the volume group and logical volume.

       --lvm
           Create a Linux LVM2 logical volume with the default name (/dev/VG/LV).

       --lvm=none
           Create no logical volume.  This is the default.

       --partition
           Create either an MBR or GPT partition covering the whole disk.  MBR is chosen if the disk size is < 2 TB, GPT if ≥ 2 TB.

           This is the default.

       --partition=gpt
           Create a GPT partition.

       --partition=mbr
           Create an MBR partition.

       --partition=none
           Create no partition table.  Note that Windows may not be able to see these disks.

       -v
       --verbose
           Enable verbose messages for debugging.

       -V
       --version
           Display version number and exit.

       --wipe
           Normally virt-format does not wipe data from the disk (because that takes a long time).  Thus if there is data on the disk, it is only hidden and partially overwritten by virt-format, and it
           might be recovered by disk editing tools.

           If you use this option, virt-format writes zeroes over the whole disk so that previous data is not recoverable.

       -x  Enable tracing of libguestfs API calls.

EXIT STATUS
       This program returns 0 on success, or 1 on failure.

SEE ALSO
       guestfs(3), guestfish(1), virt-filesystems(1), virt-make-fs(1), virt-rescue(1), virt-resize(1), http://libguestfs.org/.

AUTHOR
       Richard W.M. Jones http://people.redhat.com/~rjones/

COPYRIGHT
       Copyright (C) 2012 Red Hat Inc.

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

libguestfs-1.32.2                                                                               2016-01-29                                                                                 virt-format(1)
