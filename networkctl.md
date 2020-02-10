NETWORKCTL(1)                                                                                   networkctl                                                                                  NETWORKCTL(1)

NAME
       networkctl - Query the status of network links

SYNOPSIS
       networkctl [OPTIONS...] COMMAND [LINK...]

DESCRIPTION
       networkctl may be used to introspect the state of the network links as seen by systemd-networkd. Please refer to systemd-networkd.service(8) for an introduction to the basic concepts,
       functionality, and configuration syntax.

OPTIONS
       The following options are understood:

       -a --all
           Show all links with status.

       -h, --help
           Print a short help text and exit.

       --version
           Print a short version string and exit.

       --no-legend
           Do not print the legend, i.e. column headers and the footer with hints.

       --no-pager
           Do not pipe output into a pager.

COMMANDS
       The following commands are understood:

       list
           Show a list of existing links and their status. Produces output similar to

               IDX LINK         TYPE     OPERATIONAL SETUP
                 1 lo           loopback carrier     unmanaged
                 2 eth0         ether    routable    configured
                 3 virbr0       ether    no-carrier  unmanaged
                 4 virbr0-nic   ether    off         unmanaged

               4 links listed.

       status [LINK...]
           Show information about the specified links: type, state, kernel module driver, hardware and IP address, configured DNS servers, etc.

           When no links are specified, routable links are shown. Also see the option --all.

           Produces output similar to

               ●      State: routable
                    Address: 10.193.76.5 on eth0
                             192.168.122.1 on virbr0
                             169.254.190.105 on eth0
                             fe80::5054:aa:bbbb:cccc on eth0
                    Gateway: 10.193.11.1 (CISCO SYSTEMS, INC.) on eth0
                        DNS: 8.8.8.8
                             8.8.4.4

       lldp
           Show LLDP (Link Layer Discovery Protocol) status.

EXIT STATUS
       On success, 0 is returned, a non-zero failure code otherwise.

SEE ALSO
       systemd-networkd.service(8), systemd.network(5), systemd.netdev(5)

systemd 229                                                                                                                                                                                 NETWORKCTL(1)
