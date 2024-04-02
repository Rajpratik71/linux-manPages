LIBVIRT-MIGRATE-XEND-MANAGED-DOMAINS:(1)                                                        April 2014                                                       LIBVIRT-MIGRATE-XEND-MANAGED-DOMAINS:(1)

NAME
       libvirt-migrate-xend-managed-domains - program for migrating xend managed domains

DESCRIPTION
       Xend,  which  was  used together with the (deprecated) xm toolstack allowed to define managed domains. Those were kept in a separate place and could get automatically started on boot (as well as
       automatically suspended to disk on shutdown). However the new xl toolstack has no such support.  This script is intended to convert machine definitions in the xen-sxpr format over to xml defini‐
       tions in libvirt.

       Only machines which (their name) does not already exist in for the libxl driver are converted.

USAGE
       libvirt-migrate-xend-managed-domains

FILES
       /var/lib/libvirt/xend-migration-done

       Migration will not be done again as long as that file exists (the content does not matter).

       /var/lib/xend/domains

       That directory contains the original xend definitions. Each guest in a subdirectory named after its uuid. The uuid subdirectories can and should be deleted when the migration was successful.

BUGS
       Convertion can only be done when running as dom0, using the xl toolstack.

SEE ALSO
       virsh(1)

AUTHOR
       libvirt-migrate-xend-managed-domains is Copyright 2014, Canonical Ltd.

       by Stefan Bader <stefan.bader@canonical.com>.

April 2014                                                                                                                                                       LIBVIRT-MIGRATE-XEND-MANAGED-DOMAINS:(1)
