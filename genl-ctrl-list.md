genl-ctrl-list(8)                                                                          System Manager's Manual                                                                          genl-ctrl-list(8)



NAME
       genl-ctrl-list - List available kernel-side Generic Netlink families

SYNOPSIS
       genl-ctrl-list [-d]


DESCRIPTION
       Queries the Generic Netlink controller in kernel and prints a list of all registered Generic Netlink families including the version of the interface that has been registered.


OPTIONS
       -h or --help
              Print help text to console and exit.

       -v or --version
              Print versioning information to console and exit.

       -d or --details
              Include additional detailed information for each Generic Netlink family that is printed.

              The information includes:


              hdrsize N
                     The size of the user specific header.


              maxattr N
                     The maximum Netlink attribute identifier expected by the interface.


              op NAME (ID) <FLAGS>
                     A list of available operations including their name, numeric identifier and the flags indicating the capabilities of the opertion.

                     Available flags:

                     admin-perm
                            Requires administrative privileges


                     has-doit
                            Command can handle request


                     has-dump
                            Command can handle a dump request


                     has-policy
                            Command enforces attribute validation policy


              grp NAME (ID)
                     A list of registered multicast groups including name (if available) and identifier.

              Example:
                     0x0010 nlctrl version 2
                         hdrsize 0 maxattr 7
                           op GETFAMILY (0x03) <has-doit,has-dump,has-policy>
                           grp notify (0x10)



EXAMPLE
       $ genl-ctrl-list
       0x0010 nlctrl version 2
       0x0011 NLBL_MGMT version 3
       0x0012 NLBL_CIPSOv4 version 3
       0x0013 NLBL_UNLBL version 3
       0x0014 acpi_event version 1
       0x0015 thermal_event version 1
       0x0016 VFS_DQUOT version 1
       0x0017 TASKSTATS version 1
       0x0018 NET_DM version 2


AUTHOR
       Thomas Graf is the original author and current maintainer of libnl and libnl tools. Many people have contributed to it since.



libnl                                                                                           20 April 2012                                                                               genl-ctrl-list(8)
