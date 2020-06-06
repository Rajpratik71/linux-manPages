FIPVLAN(8)                                                                                     Open-FCoE Tools                                                                                     FIPVLAN(8)



NAME
       fipvlan - Fibre Channel over Ethernet VLAN Discovery

SYNOPSIS
       fipvlan [-c|--create] [-d|--debug] [-s|--start] [-m|--mode fabric|vn2vn] [-u|--link-up] interfaces

       fipvlan -a|--auto [-c|--create] [-d|--debug] [-s|--start] [-m|--mode fabric|vn2vn] [-l|--link-retry count] [-u|--link-up]

       fipvlan -h|--help

       fipvlan -v|--version

DESCRIPTION
       The  fipvlan  command  performs  Fibre Channel over Ethernet (FCoE) Initialization Protocol (FIP) VLAN Discovery over Ethernet interfaces. fipvlan can be used as a diagnostic tool to determine which
       VLANs have FCoE services available on a network, prior to configuring VLAN interfaces and the Open-FCoE initiator. fipvlan can also be used to create VLAN interfaces as they are discovered,  and  to
       start  the  Open-FCoE  initiator.  The --create and --start options are primarily intended to be used as part of an Open-FCoE boot solution. FCoE instances started in this way cannot be destroyed or
       reset by fcoeadm.

       fipvlan takes a list of network interface names to run the VLAN discovery protocol over, or the --auto option to use all available Ethernet interfaces.

       fipvlan will enable any interface which is found disabled. If no response is received on that interface it will be shutdown again when fipvlan terminates.

OPTIONS
       -a, --auto
           Use all Ethernet interfaces currently available

       -c, --create
           Create network interfaces for discovered FCoE VLANs. If a VLAN device already exists for a discovered VLAN, a new VLAN device will not be created.

       -d, --debug
           Enable debugging output

       -s, --start
           Start the Open-FCoE initiator on discovered FCoE VLANs

       -m, --mode
           fabric|vn2vn Specify whether VLAN discovery is performed in the default fabric mode, or in VN2VN mode.

       -f, --suffix suffix
           Append the specified string suffix to VLAN interface names.

       -l, --link-retry count
           Retry check for link up to count times. The link state is checked every 1000 ms. The default number of retries is 20.

       -u, --link-up
           Leave link up if a FIP response has been received.

       -h, --help
           Display a help message with basic usage instructions

       -v, --version
           Display the fipvlan version string

VLAN NAMING CONVENTIONS
       If a new VLAN device is created, it will have the name dev.vlan; where dev is the name of the Ethernet parent device and vlan is the discovered VLAN ID number. An optional suffix may be appended  to
       this with the the -f command line option.

EXAMPLES
       Display all discoverable VLANs with FCoE services

           fipvlan --auto

       Discover FCoE VLANs on interface eth2, create VLAN devices and start the Open-FCoE initiator

           fipvlan --create --start eth2

       In this example if FCoE services were available on VLAN 101 of network interface eth2, then a VLAN interface eth2.101 would be created and used as the parent device for the initiator.

SEE ALSO
       fcoeadm(8) fcoemon(8)

SUPPORT
       fipvlan is part of the fcoe-utils package, maintained through the Open-FCoE project. Resources for both developers and users can be found at the Open-FCoE website http://open-fcoe.org/



Open-FCoE                                                                                         12/02/2013                                                                                       FIPVLAN(8)
