VMWARE2LIBVIRT:(1)                 System Administration Utilities                 VMWARE2LIBVIRT:(1)

NAME
       vmware2libvirt - vmware vmx to libvirt xml converter

SYNOPSIS
       vmware2libvirt [-q] -f FILE

DESCRIPTION
       This program outputs a libvirt xml file based on an existing vmware vmx file

OPTIONS
       --version
              show program's version number and exit

       -h, --help
              show this help message and exit

       -q, --qemu
              use qemu instead of kvm

       -f FILE, --file=FILE
              vmware vmx file to convert

USAGE
       To  start using a pre-existing vmware image with libvirt, you simply copy the vmware .vmx file
       and .vmdk file to a new directory. Then do:

         vmware2libvirt -f ./file.vmx > file.xml
         virsh -c qemu:///system define file.xml

       At this point, your vmware image should be available to libvirt.

CAVEATS
       vmware2libvirt currently will use the first scsi disk if found, otherwise the first ide  disk.
       It will also use the first ethernet interface found.

SEE ALSO
        virsh(1), kvm(1), qemu(1)

AUTHOR
       vmware2libvirt is (C) 2008, Canonical Ltd.

       This manual page was originally written by Jamie Strandboge <jamie@canonical.com>

vmware2libvirt: 0.1                         February 2008                          VMWARE2LIBVIRT:(1)
