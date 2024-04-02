virt-p2v-make-disk(1)                                                                     Virtualization Support                                                                    virt-p2v-make-disk(1)

NAME
       virt-p2v-make-disk - Build the virt-p2v disk using virt-builder

SYNOPSIS
        virt-p2v-make-disk -o /dev/sdX os-version

DESCRIPTION
       virt-p2v(1) converts a physical machine to run virtualized on KVM, managed by libvirt, OpenStack, oVirt, Red Hat Enterprise Virtualisation (RHEV), or one of the other targets supported by
       virt-v2v(1).

       virt-p2v-make-disk is a script which creates a bootable disk image or USB key containing virt-p2v.  It uses virt-builder(1) to do this, and is just a small shell script around virt-builder.

       virt-p2v-make-disk has two required parameters:

       The -o parameter specifies where the output should go, for example to a USB key (eg. "-o /dev/sdX") or to a file.  If you pass a device name, then the existing contents of the device will be
       erased.

       The "os-version" parameter is the base Linux distro to use for the operating system on the ISO.  To list possible "os-version" combinations, do:

        virt-builder -l

   EXAMPLES
       Write a virt-p2v bootable USB key on /dev/sdX (any existing content is erased), using Fedora 20 as the base distribution:

        virt-p2v-make-disk -o /dev/sdX fedora-20

       Write a virt-p2v bootable virtual disk image, and boot it under qemu:

        virt-p2v-make-disk -o /var/tmp/p2v.img fedora-20
        qemu-kvm -m 1024 -boot c \
          -drive file=/var/tmp/p2v.img,if=virtio,index=0 \
          -drive file=/var/tmp/guest.img,if=virtio,index=1

       where /var/tmp/guest.img would be the disk image of some guest that you want to convert (for testing only).

ADDING AN SSH IDENTITY
       You can inject an SSH identity (private key) file to the image using the --inject-ssh-identity option.

       First create a key pair.  It must have an empty passphrase:

        ssh-keygen -t rsa -N '' -f id_rsa

       This creates a private key ("id_rsa") and a public key ("id_rsa.pub") pair.  The public key should be appended to the "authorized_keys" file on the virt-v2v conversion server (usually to
       "/root/.ssh/authorized_keys").

       The private key should be injected into the disk image and then discarded:

        virt-p2v-make-disk [...] --inject-ssh-identity id_rsa
        rm id_rsa

       When booting virt-p2v, specify the URL of the injected file like this:

        │         User name: [root_____________________________] │
        │                                                        │
        │          Password: [    <leave this field blank>     ] │
        │                                                        │
        │  SSH Identity URL: [file:///var/tmp/id_rsa___________] │

       or if using the kernel command line, add:

        p2v.identity=file:///var/tmp/id_rsa

       For more information, see "SSH IDENTITIES" in virt-p2v(1).

OPTIONS
       --help
           Display help.

       --inject-ssh-identity id_rsa
           Add an SSH identity (private key) file into the image.  See "ADDING AN SSH IDENTITY" above.

       -o OUTPUT
       --output OUTPUT
           Write output to "OUTPUT", which can be a local file or block device.  The existing contents of the device will be erased.

       -V
       --version
           Display version number and exit.

FILES
       $libexecdir/virt-p2v
           The virt-p2v(1) binary which is copied into the bootable disk image.

           The location of the binary can be changed by setting the "VIRT_P2V_DATA_DIR" environment variable.

       $datadir/virt-p2v/issue
       $datadir/virt-p2v/launch-virt-p2v.in
       $datadir/virt-p2v/p2v.service
           Various data files that are copied into the bootable disk image.

           The location of these files can be changed by setting the "VIRT_P2V_DATA_DIR" environment variable.

ENVIRONMENT VARIABLES
       "VIRT_P2V_DATA_DIR"
           The directory where virt-p2v-make-disk looks for data files (see "FILES" above).  If not set, a compiled-in location is used.

SEE ALSO
       virt-p2v(1), virt-p2v-make-kickstart(1), virt-v2v(1), http://libguestfs.org/.

AUTHORS
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

libguestfs-1.32.2                                                                               2016-01-29                                                                          virt-p2v-make-disk(1)
