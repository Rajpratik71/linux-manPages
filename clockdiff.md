CLOCKDIFF(8)                                                                           System Manager's Manual: iputils                                                                          CLOCKDIFF(8)



NAME
       clockdiff - measure clock difference between hosts

SYNOPSIS
       clockdiff [-o] [-o1] destination


DESCRIPTION
       clockdiff Measures clock difference between us and destination with 1 msec resolution using ICMP TIMESTAMP [2] packets or, optionally, IP TIMESTAMP option [3] option added to ICMP ECHO.  [1]

OPTIONS
       -o     Use IP TIMESTAMP with ICMP ECHO instead of ICMP TIMESTAMP messages. It is useful with some destinations, which do not support ICMP TIMESTAMP (f.e. Solaris <2.4).

       -o1    Slightly different form of -o, namely it uses three-term IP TIMESTAMP with prespecified hop addresses instead of four term one.  What flavor works better depends on target host. Particularly,
              -o is better for Linux.

WARNINGS
       · Some nodes (Cisco) use non-standard timestamps, which is allowed by RFC, but makes timestamps mostly useless.

       · Some nodes generate messed timestamps (Solaris>2.4), when run xntpd. Seems, its IP stack uses a corrupted clock source, which is synchronized to time-of-day clock periodically and  jumps  randomly
         making timestamps mostly useless. Good news is that you can use NTP in this case, which is even better.

       · clockdiff shows difference in time modulo 24 days.

SEE ALSO
       ping(8), arping(8), tracepath(8).

REFERENCES
       [1] ICMP ECHO, RFC0792, page 14.

       [2] ICMP TIMESTAMP, RFC0792, page 16.

       [3] IP TIMESTAMP option, RFC0791, 3.1, page 16.

AUTHOR
       clockdiff was compiled by Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>. It was based on code borrowed from BSD timed daemon.  It is now maintained by YOSHIFUJI Hideaki <yoshfuji@skbuff.net>.

SECURITY
       clockdiff requires CAP_NET_RAW capability to be executed. It is safe to be used as set-uid root.

AVAILABILITY
       clockdiff is part of iputils package and the latest versions are  available in source form at http://www.skbuff.net/iputils/iputils-current.tar.bz2.



iputils-121221                                                                                20 September 2014                                                                                  CLOCKDIFF(8)
