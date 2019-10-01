MKDUMRD(8)                                                                                 System Manager's Manual                                                                                 MKDUMRD(8)



NAME
       mkdumprd - creates initial ramdisk images for kdump crash recovery

SYNOPSIS
       mkdumprd [OPTION]


DESCRIPTION
       mkdumprd creates an initial ram file system for use in conjunction with the booting of a kernel within the kdump framework for crash recovery.  mkdumprds purpose is to create an initial ram filesys‐
       tem capable of copying the crashed systems vmcore image to a location specified in /etc/kdump.conf

       mkdumprd interrogates the running system to understand what modules need to be loaded in the initramfs (based on configuration retrieved from /etc/kdump.conf)

       mkdumprd add a new dracut module 99kdumpbase and use dracut utility to generate the initramfs.

       mkdumprd was not intended for casual use outside of the service initialization script for the kdump utility, and should not be run manually.  If you require a custom kdump  initramfs  image,  it  is
       suggested that you use the kdump service infrastructure to create one, and then manually unpack, modify and repack the image.



OPTIONS
       All options here are passed to dracut directly, please refer dracut docs
              for the info.


SEE ALSO
       dracut(8)



                                                                                                Fri Feb 9 2007                                                                                     MKDUMRD(8)
