update-pciids(8)                                                                           The PCI Utilities                                                                          update-pciids(8)

NAME
       update-pciids - download new version of the PCI ID list

SYNOPSIS
       update-pciids [-q]

DESCRIPTION
       update-pciids fetches the current version of the pci.ids file from the primary distribution site and installs it.

       This utility requires curl, wget or lynx to be installed. If gzip or bzip2 are available, it automatically downloads the compressed version of the list.

OPTIONS
       -q     Be quiet and do not report anything except errors.

FILES
       /usr/share/misc/pci.ids
              Here we install the new list.

SEE ALSO
       lspci(8), setpci(8)

AUTHOR
       The PCI Utilities are maintained by Martin Mares <mj@ucw.cz>.

pciutils-3.5.2                                                                              03 October 2016                                                                           update-pciids(8)
