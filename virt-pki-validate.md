VIRT-PKI-VALIDATE(1)                                          Virtualization Support                                          VIRT-PKI-VALIDATE(1)

NAME
       virt-pki-validate - validate libvirt PKI files are configured correctly

SYNOPSIS
       virt-pki-validate [OPTION]

DESCRIPTION
       This tool validates that the necessary PKI files are configured for a secure libvirt server or client using the TLS encryption protocol.
       It will report any missing certificate or key files on the host. It should be run as root to ensure it can read all the necessary files

OPTIONS
       -h, --help
           Display command line help usage then exit.

       -V, --version
           Display version information then exit.

EXIT STATUS
       Upon successful validation, an exit status of 0 will be set. Upon failure a non-zero status will be set.

AUTHOR
       Richard Jones

BUGS
       Report any bugs discovered to the libvirt community via the mailing list <https://libvirt.org/contact.html> or bug tracker
       <https://libvirt.org/bugs.html>.  Alternatively report bugs to your software distributor / vendor.

COPYRIGHT
       Copyright (C) 2006-2012 by Red Hat, Inc.

LICENSE
       virt-pki-validate is distributed under the terms of the GNU GPL v2+.  This is free software; see the source for copying conditions. There
       is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE

SEE ALSO
       virsh(1), online PKI setup instructions <https://libvirt.org/remote.html>

libvirt-3.9.0                                                       2017-10-30                                                VIRT-PKI-VALIDATE(1)
