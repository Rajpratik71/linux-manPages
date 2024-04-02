FCOEADM(8)                                                                                     Open-FCoE Tools                                                                                     FCOEADM(8)



NAME
       fcoeadm - The Open-FCoE Administration Tool

SYNOPSIS
       fcoeadm [-m|--mode fabric|vn2vn] -c|--create ethX

       fcoeadm -d|--destroy ethX

       fcoeadm -r|--reset ethX

       fcoeadm -S|--Scan [ethX]

       fcoeadm -i|--interface [ethX]

       fcoeadm -f|--fcf [ethX]

       fcoeadm -t|--target [ethX]

       fcoeadm -l|--lun [ethX]

       fcoeadm -s|--stats ethX [interval]

       fcoeadm -b|--lesb ethX [interval]

       fcoeadm -h|--help

       fcoeadm -v|--version

DESCRIPTION
       The  fcoeadm  utility  is  the  Fibre  Channel  over  Ethernet (FCoE) management tool for the Open-FCoE project. fcoeadm may be used to create, destroy, and reset an FCoE instance on a given network
       interface. For these operations fcoeadm sends a command to a running fcoemon process, via a socket interface. fcoemon will then perform the requested operation.

       fcoeadm also provides operations to query information about FCoE instances, including interface information, target information, LUN information, and port statistics. For much of  this  information,
       fcoeadm relies on the libhbalinux implementation of the HBA API. Only one operation may be given on a command.

OPTIONS
       -m, --mode fabric|vn2vn
           Used together with the create option to control the FCoE mode of operation. The mode defaults to fabric but this option allows the selection of vn2vn mode.

OPERATIONS
       -c, --create ethX
           Creates  an  FCoE instance based on the specified network interface. Note that if there is not an fcoemon configuration file for the interface (/etc/fcoe/cfg-ethX, see fcoemon), then the created
           FCoE instance will not require DCB.

       -d, --destroy ethX
           Destroys the FCoE instance on the specified network interface. This will not destroy FCoE instances created by fipvlan.

       -r, --reset ethX
           Resets the FCoE instance on the specified network interface. This will not reset FCoE instances created by fipvlan.

       -S, --Scan ethX
           Rescan for new targets and LUNs on the provided instance. This command will not rescan any NPIV instances created on the same port. This will not rescan any FCoE instance created by fipvlan.

       -i, --interface [ethX]
           Show information about the FCoE instance on the specified network interface, or all FCoE instances if no network interface is specified.

       -f, --fcf [ethX]
           Show information about the discovered Fibre Channel Forwarders (FCFs) on the specified network interface, or all discovered FCFs if no network interface is specified.

       -t, --target [ethX]
           Show information about the discovered targets associated with the FCoE instance on the specified network interface. If no network interface is specified,  information  about  discovered  targets
           from all FCoE instances will be shown.

       -l, --lun [ethX]
           Show  detailed  information about the discovered SCSI LUNs associated with the FCoE instance on the specified network interface. If no network interface is specified, information about SCSI LUNs
           from all FCoE instances will be shown.

       -s, --stats ethX [interval]
           Show the statistics (including FC4 statistics) of the FCoE connection on the specified network interface. The information will be displayed repeatedly until the user  cancels  the  command.  The
           statistics  will  be printed every specified interval (in seconds).  interval should be specified as a whole number greater than 0. If interval is not specified, a default interval of one second
           is used.

       -b, --lesb ethX [interval]
           Show the Link Error Statistics Block (LESB) of the FCoE connection on the specified network interface. The information will be displayed repeatedly until the user cancels the command.  The  LESB
           statistics  will  be  printed  every  specified interval (in seconds).  interval should be specified in whole integers greater than 0. If the interval is not specified, a default interval of one
           second is used.

       -h, --help
           Displays the usage message of the fcoeadm command.

       -v, --version
           Displays the version of the fcoeadm command.

INTERFACE NAMES
       The actual name for ethX depends on the AUTO_VLAN setting in the fcoemon interface configuration (/etc/fcoe/cfg-ethX, see fcoemon).

       If AUTO_VLAN is set to yes, the interface name ethX references the network device itself. If AUTO_VLAN is set to no, the interface name ethX references the VLAN device.

EXAMPLES
       Creates an FCoE instance on eth2.101

           fcoeadm -c eth2.101

       Creates an FCoE VN2VN instance on eth2.101

           fcoeadm -m vn2vn -c eth2.101

       Destroys the FCoE instance on eth2.101

           fcoeadm -d eth2.101

       Resets the FCoE instance on eth2.101

           fcoeadm -r eth2.101

       Show the information of all the adapters and their ports having FCoE instances created

           fcoeadm -i

       Show the information of all FCoE instances on interface eth3.

           fcoeadm -i eth3

       Show the information of all the discovered targets from all the ports having FCoE instances created (they may be on different adapter cards). A brief listing of discovered LUNs are listed after  the
       target they are associated with, if any

           fcoeadm -t

       Show the information of all the discovered targets from a given port (eth3) having FCoE instance created. A brief listing of discovered LUNs are listed after each target they are associated with, if
       any

           fcoeadm -t eth3

       Show the detailed information of all the LUNs discovered on all FCoE connections

           fcoeadm -l

       Show the detailed information of all the LUNs associated with a specific interface

           fcoeadm -l eth3.101

       Show the statistics information of a specific port eth3 having FCoE instances created. The statistics are displayed one line per time interval. The default interval is one second if an  interval  is
       not specified

           fcoeadm -s eth3

           fcoeadm -s eth3 3

SEE ALSO
       fcoemon(8)

SUPPORT
       fcoeadm is part of the fcoe-utils package, maintained through the Open-FCoE project. Resources for both developers and users can be found at the Open-FCoE website http://open-fcoe.org/



Open-FCoE                                                                                         10/14/2013                                                                                       FCOEADM(8)
