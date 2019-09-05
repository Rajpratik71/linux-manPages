IGRP(1)                                                       General Commands Manual                                                      IGRP(1)

NAME
       igrp - igrp route injector

SYNOPSIS
       igrp -i <interface> -v -f <routes file> -a <as number> -S <spoofed source ip addrs> -D <destination router ip addrs>

DESCRIPTION
       This manual page documents briefly the igrp command.  This manual page was written for the Debian distribution because the original program
       does not have a manual page.

       IGRP is a tool for route injection. The routing protocol IGRP is no longer really widely used in the  outside  world,  but  for  the  first
       steps, we decided to use this one as a starting point.

       The whole purpose is to define a routing table with all possible parameters by hand without having your system actually running any kind of
       dynamic routing and sending this information out to the routers.  Since IGRP is a broadcast based protocol, the default behavior is to send
       these  messages  to  the  ip  broadcast  address  (255.255.255.255). If you want to inject a route to a system remote from you, you have to
       address the 'update' accordingly and make sure that you send the packet(s) with the right source address, so the router accepts the update.

       Before using the tool, you have to design your routing table you want to inject in the target router. It should contain  data  which  makes
       your route the preferred one for the victim. The format is:

       destination:delay:bandwidth:mtu:reliability:load:hopcount

       where destination is the network (192.168.1.0), delay is in ms/10, bandwidth in MBit per second, MTU is the maximum transfer unit (1500 for
       ethernet), reliability and load are in percent (255=100%, 1=0%) and hopcount just in hops.

       Empty lines and lines beginning with # are ignored.

       -i <interface> interface

       -v verbose

       -f <routes file> file, which contains the routes  (as much as you like)

       -a <autonomous system> autonomous system the IGRP process is running on, use ASS to find it out or specify a range to use with -a START  -b
       STOP to send updates to all AS from START to STOP (I highly recommend using ASS for this!!)

       -S <spoofed source IP> maybe you need this

       -D <destination IP> If you don't specify this, the broadcast address is used

       If  you want the routes to be persistent (after some testing around), make up a shell loop and run the program within this loop every 25-30
       seconds, to keep the router beliving your routes.

AUTHOR
       This manual page was written by Vince Mulhollon <vlm@debian.org>, for the Debian GNU/Linux system (but may be used by others).

                                                                  January 1, 2003                                                          IGRP(1)
