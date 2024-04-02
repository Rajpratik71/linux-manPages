ICMPINFO(1)                                                                                General Commands Manual                                                                                ICMPINFO(1)



NAME
       icmpinfo - interpret ICMP messages


SYNOPSIS
       icmpinfo [-v[v[v]]] [-n] [-p] [-s] [-l] [-k]


DESCRIPTION
       Icmpinfo is a tool for looking at the ICMP messages received on the running host.  It can be used to detect and record 'bombs' as well as various network problems.

       The output format is as follows (all on one line):

         MMM DD HH:MM:SS ICMP_type[sub-type]
            < sender_ip [sender_name] > unreach_ip [unreach_name]
            sp=source_port dp=dest_port seq=sequence sz=packet_size

       In normal operation, icmpinfo will only report on "weird" packets, mainly icmp_unreachable.


OPTIONS
       -v     Give information about all icmp packets, excepts pings.


       -vv    Give about pings too (i.e. icmp_echo_reply).


       -vvv   Include an ascii/hex dump of each packet


       -n     Avoid name queries - just give IP addresses.  (use this option when running unattended on name server hosts (to avoid possible looping))


       -p     Avoid port number to service name decoding.


       -s     Show  the  interface  ip that received the packet. Usefull only if your host has several network interfaces. In this case an '- my_ip [my_name]' is added between the sender and unreach ip and
              name fields.


       -l     Forks and use the syslog(3) facility to record events (recomended use).  (root only option).


       -k     Kills the background process started with the -l option.


WARNINGS
       The packet decoding is planned for ICMP Unreachable outputs and might not be significant for all other Icmp types. Output can be shorter when implied by the packet size or the icmp type.


AUTHOR
       Laurent Demailly <dl@hplyot.obspm.fr>. Free software.



dl's free utilities                                                                         V1.11 - 17 August 1995                                                                                ICMPINFO(1)
