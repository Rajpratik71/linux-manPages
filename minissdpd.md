minissdpd(1)             General Commands Manual            minissdpd(1)

NAME
       minissdpd - daemon keeping track of UPnP devices up

SYNOPSIS
       minissdpd  [-d]  [-s socket] [-p pidfile] -i address [-i address]
       ...

DESCRIPTION
       minissdpd listen for SSDP traffic and keeps track of what are the
       UPnP  devices up on the network.  The list of the UPnP devices is
       accessed by programs looking for devices, skipping the UPnP  dis‐
       covery process.

OPTIONS
       -d     debug  :  do not go to background, output messages to con‐
              sole and do not filter out low priority messages.

       -6     IPv6 : Enable IPv6 in addition to IPv4.

       -s socket
              path of the unix socket open for communicating with  other
              processes.  By default /var/run/minissdpd.sock is used.

       -p pidfile
              path  of  the  file  where  pid is written at startup.  By
              default /var/run/minissdpd.pid is used.

       -i interface
              name or IP address of the interface used to listen to SSDP
              packets   comming   on   port   1900,   multicast  address
              239.255.255.250.

SEE ALSO
       miniupnpd(1) miniupnpc(3)

BUGS
       No known bugs.

                                                            minissdpd(1)
