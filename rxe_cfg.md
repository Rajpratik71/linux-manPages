RXE_CFG(8)                                                                                 System Manager's Manual                                                                                 RXE_CFG(8)



NAME
       rxe_cfg - rxe configuration tool for RXE (Soft RoCE)

SYNOPSIS
       rxe_cfg [status]
       rxe_cfg start [-p proto]
       rxe_cfg stop
       rxe_cfg persistent
       rxe_cfg add [-n] ethN
       rxe_cfg remove [-n] ethN|rxeN
       rxe_cfg crc enable|disable
       rxe_cfg mtu [-f] [rxeN] mtu_size

DESCRIPTION
       rxe_cfg is the configuration tool for the RXE software implementation of the RoCE protocol.

       The RXE kernel modules are loaded, configured, reconfigured and unloaded via the various rxe_cfg command options, documented below.


PARAMETERS
       proto  Ethertype field. Default value is 0x8915. This value must be changed to use RXE on Mellanox ConnectX adapters.


       ethN   Network device name as listed in /sys/class/net. Only Ethernet devices are supported; ie. eth0 or eth0.1234 for VLANs.


       rxeN   RXE device name as listed in /sys/class/infiniband/. Examples are rxe0 or rxe1.


       mtu_size
              RoCE mtu. For RoCE the mtu represents the payload excluding headers and has the possible values: 256, 512, 1024, 2048 and 4096.


COMMANDS
       [status]
              The status command prints a table of information on available Ethernet devices and configured RXE instances.  The status display is the default if no options are provided.


       start [-p proto]
              The  start  command  loads  the  RXE  modules and configures any persistent instances.  If the -p proto option is included, the RXE modules will be configured to use Ethertype = proto.  (This
              allows testing RXE on devices, like Mellanox ConnectX, that already support the default RoCE Ethertype in hardware.)


       stop   The stop command unconfigures all RXE instances and attempts to unload the kernel modules.


       persistent
              The persistent command prints the list of Ethernet devices for which a RXE instance is persistently configured.


       add [-n] ethN
              The add command will configure a RXE instance on Ethernet device ethN (e.g. eth0).  The RXE modules must have already been loaded via rxe_cfg start.

              The default behavior is to add ethN to a file of persistent configurations and the same RXE device will be configured the next time that rxe_cfg start is run.  If the -n  option  is  included
              the device is not added to the persistence file.


       remove [-n] ethN|rxeN
              The remove command will remove the specified RXE instance.  The parameter must match a currently active ethN or rxeN name.

              If the -n option is included the RXE device will be removed but not removed from the persistent state. So it will be recreated the next time that rxe_cfg start is run.


       mtu [-f] [rxeN] mtu_size
              The  mtu  command will set the RoCE MTU of all RXE devices to mtu_size, provided that the underlying Ethernet MTU is sufficiently large.  If the Ethernet MTU is not large enough, RXE will use
              the largest MTU that fits; the driver remembers the requested RoCE MTU and will increase the currently active MTU if the Ethernet MTU is later changed up to the requested MTU.

              If the -f option is included the underlying Ethernet MTUs will be increased if necessary to the minimum size to accommodate a RoCE MTU of size.

              If a rxeN instance is specified then only that instance will be affected by the command.


       crc enable|disable
              The crc command will enable or disable RoCE ICRC calculation.  Valid ICRCs are be required to communicate hardware RoCE NICs, but when  a  RXE  instance  is  communicating  with  another  RXE
              instance the performance will be better with the CRC disabled.

              This option is global to all RXE instances.


FILES
       [PREFIX]/etc/rxe.conf
              RXE  configuration  file.  Contains  the  list of persistent RXE instances.  All persistent RXE instances can be removed by deleting this file (note this will take effect on the next "rxe_cfg
              start" -- to remove actively configured instances, you must "rxe_cfg stop").


SEE ALSO
       rxe(7),

AUTHORS
       Written by John Groves, Frank Zago and Bob Pearson at System Fabric Works.



1.0.0                                                                                             2011-06-29                                                                                       RXE_CFG(8)
