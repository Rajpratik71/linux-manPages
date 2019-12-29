VIRT-SANLOCK-CLEANUP(8)                 Virtualization Support                 VIRT-SANLOCK-CLEANUP(8)

NAME
       virt-sanlock-cleanup - remove stale sanlock resource lease files

SYNOPSIS
       virt-sanlock-cleanup

DESCRIPTION
       This tool removes any resource lease files created by the sanlock lock manager plugin. The
       resource lease files only need to exist on disks when a guest using the resource is active.
       This script reclaims the disk space used by resources which are not currently active.

EXIT STATUS
       Upon successful processing of leases cleanup, an exit status of 0 will be set. Upon fatal error
       a non-zero status will be set.

AUTHOR
       Daniel Berrange

BUGS
       Report any bugs discovered to the libvirt community via the mailing list
       <https://libvirt.org/contact.html> or bug tracker <https://libvirt.org/bugs.html>.
       Alternatively report bugs to your software distributor / vendor.

COPYRIGHT
       Copyright (C) 2011, 2013 Red Hat, Inc.

LICENSE
       virt-sanlock-cleanup is distributed under the terms of the GNU GPL v2+.  This is free software;
       see the source for copying conditions. There is NO warranty; not even for MERCHANTABILITY or
       FITNESS FOR A PARTICULAR PURPOSE

SEE ALSO
       virsh(1), online instructions <https://libvirt.org/locking.html>

libvirt-3.9.0                                 2017-10-30                       VIRT-SANLOCK-CLEANUP(8)
