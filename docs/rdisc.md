RDISC(8)                                                                               System Manager's Manual: iputils                                                                              RDISC(8)



NAME
       rdisc - network router discovery daemon

SYNOPSIS
       rdisc [-abdfrstvV] [-p preference] [-T max_interval] [send_address] [receive_address]


DESCRIPTION
       rdisc implements client side of the ICMP router discover protocol.  rdisc is invoked at boot time to populate the network routing tables with default routes.

       rdisc listens on the ALL_HOSTS (224.0.0.1) multicast address (or receive_address provided it is given) for ROUTER_ADVERTISE messages from routers. The received messages are handled by first ignoring
       those listed router addresses with which the host does not share a network. Among the remaining addresses the ones with the highest preference are selected as default routers and a default route  is
       entered in the kernel routing table for each one of them.

       Optionally, rdisc can avoid waiting for routers to announce themselves by sending out a few ROUTER_SOLICITATION messages to the ALL_ROUTERS (224.0.0.2) multicast address (or send_address provided it
       is given) when it is started.

       A timer is associated with each router address and the address will no longer be considered for inclusion in the the routing tables if the timer expires before a new advertise  message  is  received
       from the router.  The address will also be excluded from consideration if the host receives an advertise message with the preference being maximally negative.

       Server side of router discovery protocol is supported by Cisco IOS and by any more or less complete UNIX routing daemon, f.e gated.  Or, rdisc can act as responder, if compiled with -DRDISC_SERVER.

OPTIONS
       -a     Accept all routers independently of the preference they have in their advertise messages.  Normally rdisc only accepts (and enters in the kernel routing tables) the router or routers with the
              highest preference.

       -b     Opposite to -a, i.e. install only router with the best preference value. It is default behaviour.

       -d     Send debugging messages to syslog.

       -f     Run rdisc forever even if no routers are found.  Normally rdisc gives up if it has not received any advertise message after after soliciting three times, in which case it exits  with  a  non-
              zero exit code.  If -f is not specified in the first form then -s must be specified.

       -r     Responder mode, available only if compiled with -DRDISC_SERVER.

       -s     Send  three  solicitation  messages  initially  to  quickly  discover the routers when the system is booted.  When -s is specified rdisc exits with a non-zero exit code if it can not find any
              routers.  This can be overridden with the -f option.

       -p preference
              Set preference in advertisement.  Available only with -r option.

       -T max_interval
              Set maximum advertisement interval in seconds.  Default is 600 secs.  Available only with -r option.

       -t     Test mode. Do not go to background.

       -v     Be verbose i.e. send lots of debugging messages to syslog.

       -V     Print version and exit.

HISTORY
       This program was developed by Sun Microsystems (see copyright notice in source file). It was ported to Linux by Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>.  It is now maintained  by  YOSHIFUJI  Hideaki
       <yoshfuji@skbuff.net>.

SEE ALSO
       icmp(7), inet(7), ping(8).

REFERENCES
       Deering, S.E.,ed "ICMP Router Discovery Messages", RFC1256, Network Information Center, SRI International, Menlo Park, Calif., September 1991.

SECURITY
       rdisc requires CAP_NET_RAW to listen and send ICMP messages and capability CAP_NET_ADMIN to update routing tables.

AVAILABILITY
       rdisc is part of iputils package and the latest versions are  available in source form at http://www.skbuff.net/iputils/iputils-current.tar.bz2.



iputils-160308                                                                                                                                                                                       RDISC(8)
