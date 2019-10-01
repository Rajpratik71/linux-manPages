IPRDBG(8)                                                                                          IPRUTILS                                                                                         IPRDBG(8)



NAME
       iprdbg - IBM Power RAID storage adapter debug utility

SYNOPSIS
       This executable is part of the package 'iprutils': Utilities for the IBM Power Linux RAID Adapters

DESCRIPTION
       iprdbg is used to debug IBM Power RAID storage adapters.

EXIT STATUS
       -EINVAL
              Invalid input.

       -ENXIO No IOA devices.

              Or an exit status of specified command.

FILES
       /etc/iprdbg.conf

       /var/log/iprdbg

NOTES
       iprdbg is part of iprutils package

SEE ALSO
       iprconfig(8), iprdump(8), iprinit(8), iprupdate(8)

AUTHOR
       Wayne Boyer <wayneb@linux.vnet.ibm.com>



IPRUTILS                                                                                          2010-02-09                                                                                        IPRDBG(8)
