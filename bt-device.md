bt-device(1)                                                        bluez-tools                                                       bt-device(1)

NAME
       bt-device - a bluetooth device manager

SYNOPSIS
       bt-device [OPTION...]

       Help Options:
         -h, --help

       Application Options:
         -a, --adapter=<name|mac>
         -l, --list
         -c, --connect=<mac>
         -d, --disconnect=<name|mac>
         -r, --remove=<name|mac>
         -i, --info=<name|mac>
         -s, --services <name|mac> [<pattern>]
         --set <name|mac> <property> <value>
         -v, --verbose

DESCRIPTION
       This utility is used to manage Bluetooth devices. You can list added devices, connect to a new device, disconnect device, remove added
       device, show info about device, discover remote device services or change device properties.

OPTIONS
       -h, --help
           Show help

       -a, --adapter <name|mac>
           Specify adapter to use by his Name or MAC address
           (if this option does not defined - default adapter used)

       -l, --list
           List added devices

       -c, --connect <mac>
           Connect to the remote device by his MAC, retrieve all SDP
           records and then initiate the pairing

       -d, --disconnect <name|mac>
           Disconnects a specific remote device by terminating the
           low-level ACL connection.

       -r, --remove
           Remove device (and also the pairing information)

       -i, --info
           Show information about device (returns all properties)

       -s, --services <name|mac> [<pattern>]
           Starts the service discovery to retrieve remote service records,
           the `pattern` parameter can be used to specify specific UUIDs

       --set <property> <value>
           Change device properties (see DEVICE PROPERTIES section for list
           of available properties)

       -v, --verbose
           Verbosely display remote service records (affect to service
           discovery mode)

DEVICE PROPERTIES
       string  Address [ro]
               The Bluetooth device address (MAC) of the remote device.

       string  Name [ro]
               The Bluetooth remote device name.

       string  Icon [ro]
               Proposed icon name according to the freedesktop.org
               icon naming specification.

       uint32  Class [ro]
               The Bluetooth class of device of the remote device.

       list    UUIDs [ro]
               List of 128-bit UUIDs that represents the available
               remote services.

       boolean Paired [ro]
               Indicates if the remote device is paired.

       boolean Connected [ro]
               Indicates if the remote device is currently connected.

       boolean Trusted [rw]
               Indicates if the remote is seen as trusted.

       boolean Blocked [rw]
               If set to true any incoming connections from the
               device will be immediately rejected.

       string Alias [rw]
               The name alias for the remote device. The alias can
               be used to have a different friendly name for the
               remote device.

               In case no alias is set, it will return the remote
               device name. Setting an empty string as alias will
               convert it back to the remote device name.

       boolean LegacyPairing [ro]
               Set to true if the device only supports the pre-2.1
               pairing mechanism.

AUTHOR
       Alexander Orlenko <zxteam@gmail.com>.

SEE ALSO
       bt-adapter(1) bt-agent(1) bt-network(1)

                                                                    2014-08-01                                                        bt-device(1)
