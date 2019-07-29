TRACEROUTE6(8)                                           System Manager's Manual: iputils                                           TRACEROUTE6(8)

NAME
       traceroute6 - traces path to a network host

SYNOPSIS
       traceroute6 [-dnrvV] [-i interface] [-m max_ttl] [-p port] [-q max_probes] [-s source] [-w wait time] destination [size]

DESCRIPTION
       Description can be found in traceroute(8), all the references to IP replaced to IPv6. It is needless to copy the description from there.

SEE ALSO
       traceroute(8), tracepath(8), ping(8).

HISTORY
       This program has long history. Author of traceroute is Van Jacobson and it first appeared in 1988. This clone is based on a port of tracer‐
       oute to IPv6 published in NRL IPv6 distribution in 1996. In turn, it was ported to Linux by Pedro Roque. After this it was kept in sync  by
       Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>. And eventually entered iputils package.

SECURITY
       tracepath6 requires CAP_NET_RAW capability to be executed. It is safe to be used as set-uid root.

AVAILABILITY
       traceroute6  is part of iputils package and the latest versions are  available in source form at http://www.skbuff.net/iputils/iputils-cur‐
       rent.tar.bz2.

iputils-161105                                                    29 October 2018                                                   TRACEROUTE6(8)
