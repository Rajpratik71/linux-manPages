TRACEPATH(8)                                                                         System Manager's Manual: iputils                                                                        TRACEPATH(8)

NAME
       tracepath, tracepath6 - traces path to a network host discovering MTU along this path

SYNOPSIS
       tracepath [-n] [-b] [-l pktlen] [-m max_hops] [-p port] destination

DESCRIPTION
       It  traces  path  to  destination discovering MTU along this path.  It uses UDP port port or some random port.  It is similar to traceroute, only does not require superuser privileges and has no
       fancy options.

       tracepath6 is good replacement for traceroute6 and classic example of application of Linux error queues.  The situation with IPv4 is worse, because commercial IP routers  do  not  return  enough
       information in ICMP error messages.  Probably, it will change, when they will be updated.  For now it uses Van Jacobson's trick, sweeping a range of UDP ports to maintain trace history.

OPTIONS
       -n     Print primarily IP addresses numerically.

       -b     Print both of host names and IP addresses.

       -l     Sets the initial packet length to pktlen instead of 65535 for tracepath or 128000 for tracepath6.

       -m/term>
              Set maximum hops (or maximum TTLs) to max_hops instead of 30.

       -p     Sets the initial destination port to use.

OUTPUT
       root@mops:~ # tracepath6 3ffe:2400:0:109::2
        1?: [LOCALHOST]                              pmtu 1500
        1:  dust.inr.ac.ru                   0.411ms
        2:  dust.inr.ac.ru        asymm  1   0.390ms pmtu 1480
        2:  3ffe:2400:0:109::2               463.514ms reached
            Resume: pmtu 1480 hops 2 back 2

       The  first  column shows TTL of the probe, followed by colon.  Usually value of TTL is obtained from reply from network, but sometimes reply does not contain necessary information and we have to
       guess it. In this case the number is followed by ?.

       The second column shows the network hop, which replied to the probe.  It is either address of router or word [LOCALHOST], if the probe was not sent to the network.

       The rest of line shows miscellaneous information about path to the correspinding network hop. As rule it contains value of RTT.  Additionally, it can show Path MTU, when it changes.  If the path
       is  asymmetric or the probe finishes before it reach prescribed hop, difference between number of hops in forward and backward direction is shown following keyword async. This information is not
       reliable.  F.e. the third line shows asymmetry of 1, it is because the first probe with TTL of 2 was rejected at the first hop due to Path MTU Discovery.

       The last line summarizes information about all the path to the destination, it shows detected Path MTU, amount of hops to the destination and our guess about amount of hops from the  destination
       to us, which can be different when the path is asymmetric.

SEE ALSO
       traceroute(8), traceroute6(8), ping(8).

AUTHOR
       tracepath was written by Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>.

SECURITY
       No security issues.

       This lapidary deserves to be elaborated.  tracepath is not a privileged program, unlike traceroute, ping and other beasts of this kind.  tracepath may be executed by everyone who has some access
       to network, enough to send UDP datagrams to investigated destination using given port.

AVAILABILITY
       tracepath is part of iputils package and the latest versions are  available in source form at http://www.skbuff.net/iputils/iputils-current.tar.bz2.

iputils-121221                                                                                 07 May 2014                                                                                   TRACEPATH(8)
