virt-v2v-copy-to-local(1)                                                                 Virtualization Support                                                                virt-v2v-copy-to-local(1)

NAME
       virt-v2v-copy-to-local - Copy a remote guest to the local machine

SYNOPSIS
        virt-v2v-copy-to-local -ic LIBVIRT_URI GUEST

        virt-v2v-copy-to-local -ic xen+ssh://root@xen.example.com xen_guest

        virt-v2v-copy-to-local -ic esx://root@esxi.example.com vmware_guest

DESCRIPTION
       "virt-v2v-copy-to-local" copies a guest from a remote hypervisor to the local machine, in preparation for conversion by virt-v2v(1).  Note this tool alone does not do the virt-v2v conversion.

   When to use this tool
       This tool is not usually necessary, but there are a few special cases (see list below) where you might need it.

       If your case does not fit one of these special cases, then ignore this tool and read virt-v2v(1) instead.  The virt-v2v-copy-to-local process is slower than using virt-v2v directly, because it
       has to copy unused parts of the guest disk.

       ·   You have a Xen guest using host block devices.  Virt-v2v cannot convert such guests directly.

           See "XEN OR SSH CONVERSIONS FROM BLOCK DEVICES" in virt-v2v(1).

       ·   You have VMware ESXi hypervisors, and are not using VMware vCenter to manage them.  Virt-v2v cannot directly access ESXi hypervisor, so you either have to export the guest as an OVA (eg.
           using VMware's "ovftool"); or you can use this tool to copy the guest to a local file on the conversion server, from where virt-v2v will be able to access it.

           See "INPUT FROM VMWARE ESXi HYPERVISOR" in virt-v2v(1).

   How this tool works
       This tool uses libvirt to get the libvirt XML (metadata) of the remote guest, essentially equivalent to running "virsh dumpxml guest".

       It then uses the XML to locate the remote guest disks, which are copied over using a hypervisor-specific method.  It uses ssh for remote Xen hypervisors, and HTTPS (curl) for remote ESXi
       hypervisors.

       It then modifies the libvirt XML so that it points at the local copies of the guest disks.

       The libvirt XML is output to a file called guest.xml (where guest is the name of the guest).  The disk(s) are output to file(s) called guest-disk1, guest-disk2 and so on.

       After copying the guest locally, you can convert it using:

        virt-v2v -i libvirtxml guest.xml [-o options ...]

       Virt-v2v finds the local copies of the disks by looking in the XML.

EXAMPLES
   Copy and convert from Xen hypervisor that uses host block devices
       For full instructions, see "XEN OR SSH CONVERSIONS FROM BLOCK DEVICES" in virt-v2v(1).

        virt-v2v-copy-to-local -ic xen+ssh://root@xen.example.com xen_guest
        virt-v2v -i libvirtxml xen_guest.xml -o local -os /var/tmp
        rm xen_guest.xml xen_guest-disk*

   Copy and convert from ESXi hypervisor
       For full instructions, see "INPUT FROM VMWARE ESXi HYPERVISOR" in virt-v2v(1).

        virt-v2v-copy-to-local -ic esx://root@esxi.example.com?no_verify=1 vmware_guest
        virt-v2v -i libvirtxml vmware_guest.xml -o local -os /var/tmp
        rm vmware_guest.xml vmware_guest-disk*

OPTIONS
       --help
           Display help.

       -ic libvirtURI
           Specify a libvirt connection URI

       --password-file file
           Instead of asking for password(s) interactively, pass the password through a file.  Note the file should contain the whole password, without any trailing newline, and for security the file
           should have mode 0600 so that others cannot read it.

           Currently this option does not have any effect on xen+ssh transfers, but that is a bug.

       -q
       --quiet
           This disables progress bars and other unnecessary output.

       -v
       --verbose
           Enable verbose messages for debugging.

       -V
       --version
           Display version number and exit.

SEE ALSO
       virt-v2v(1), virsh(1), http://libguestfs.org/, https://libvirt.org/uri.html, https://libvirt.org/remote.html, https://libvirt.org/drvesx.html.

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

libguestfs-1.32.2                                                                               2016-01-29                                                                      virt-v2v-copy-to-local(1)
