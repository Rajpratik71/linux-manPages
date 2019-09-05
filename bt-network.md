bt-network(1)                                                       bluez-tools                                                      bt-network(1)

NAME
       bt-network - a bluetooth network manager

SYNOPSIS
       bt-network [OPTION...]

       Help Options:
         -h, --help

       Application Options:
         -a, --adapter=<name|mac>
         -c, --connect <name|mac> <uuid>
         -s, --server <gn|panu|nap> <brige>

DESCRIPTION
       This utility is used to manage network services (client/server).  All servers will be automatically unregistered when the application
       terminates.

OPTIONS
       -h, --help
           Show help

       -a, --adapter <name|mac>
           Specify adapter to use by his Name or MAC address
           (if this option does not defined - default adapter used)

       -c, --connect <name|mac> <uuid>
           Connect to the network device and return the network interface
           name, uuid can be either one of "gn", "panu" or "nap"

       -s, --server <gn|panu|nap> <brige>
           Register server for the provided UUID, every new connection to
           this server will be added the bridge interface

AUTHOR
       Alexander Orlenko <zxteam@gmail.com>.

SEE ALSO
       bt-adapter(1) bt-agent(1) bt-device(1)

                                                                    2014-08-01                                                       bt-network(1)
