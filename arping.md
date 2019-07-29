ARPING(8)                                                System Manager's Manual: iputils                                                ARPING(8)

NAME
       arping - send ARP REQUEST to a neighbour host

SYNOPSIS
       arping [-AbDfhqUV] [-c count] [-w deadline] [-s source] [-I interface] destination

DESCRIPTION
       Ping destination on device interface by ARP packets, using source address source.

OPTIONS
       -A     The same as -U, but ARP REPLY packets used instead of ARP REQUEST.

       -b     Send only MAC level broadcasts. Normally arping starts from sending broadcast, and switch to unicast after reply received.

       -c count
              Stop  after  sending count ARP REQUEST packets. With deadline option, instead wait for count ARP REPLY packets, or until the timeout
              expires.

       -D     Duplicate address detection mode (DAD). See RFC2131, 4.4.1.  Returns 0, if DAD succeeded i.e. no replies are received

       -f     Finish after the first reply confirming that target is alive.

       -I interface
              Name of network device where to send ARP REQUEST packets.

       -h     Print help page and exit.

       -q     Quiet output. Nothing is displayed.

       -s source
              IP source address to use in ARP packets.  If this option is absent, source address is:

              · In DAD mode (with option -D) set to 0.0.0.0.

              · In Unsolicited ARP mode (with options -U or -A) set to destination.

              · Otherwise, it is calculated from routing tables.

       -U     Unsolicited ARP mode to update neighbours' ARP caches.  No replies are expected.

       -V     Print version of the program and exit.

       -w deadline
              Specify a timeout, in seconds, before arping exits regardless of how many packets have been sent or received. In  this  case  arping
              does not stop after count packet are sent, it waits either for deadline expire or until count probes are answered.

SEE ALSO
       ping(8), clockdiff(8), tracepath(8).

AUTHOR
       arping was written by Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>.  It is now maintained by YOSHIFUJI Hideaki <yoshfuji@skbuff.net>.

SECURITY
       arping  requires  CAP_NET_RAW capability to be executed. It is not recommended to be used as set-uid root, because it allows user to modify
       ARP caches of neighbour hosts.

AVAILABILITY
       arping is part of iputils package and the latest versions are   available  in  source  form  at  http://www.skbuff.net/iputils/iputils-cur‐
       rent.tar.bz2.

iputils-161105                                                    29 October 2018                                                        ARPING(8)
