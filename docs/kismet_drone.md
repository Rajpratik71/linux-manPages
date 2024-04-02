kismet_drone(1)                                                                                                                    kismet_drone(1)

NAME
       kismet_drone - Wireless sniffing and monitoring remote drone

SYNOPSIS
       kismet_drone [-svh] [-f config-file] [-c capture-source]
       [-C enable-capture-sources] [-p port] [-a allowed-hosts]
       [-N server-name]

DESCRIPTION
       kismet_drone  supports  all the capture sources available to Kismet.  Instead of processing packets locally, kismet_drone makes them avail‐
       able via TCP to a remote kismet_server using the 'drone' capture source.

USAGE
       kismet_drone should be configured as you would kismet_server.  All logging, packet dissection, etc will take place  on  the  remote  kismet
       server using the 'drone' capture source.

       kismet_monitor should be used to place capture sources into rfmonitor mode as needed, and kismet_hopper should be used for channel hopping.

       kismet_drone is controlled by the kismet_drone.conf config file.

ENCRYPTION
       It  may  be  desirable  to  encrypt the packet stream between the remote drone and the kismet system.  Standard SSH packet tunneling or any
       other tunneling/forwarding system may be used, and is recommended.

SEE ALSO
       kismet(1), kismet_drone.conf(5)

AUTHOR
       Mike Kershaw

                                                                 February 24, 2002                                                 kismet_drone(1)
