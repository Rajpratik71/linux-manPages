ITRACE(1)                                                     General Commands Manual                                                    ITRACE(1)

NAME
       itrace - similar to traceroute, yet uses ICMP echo

DESCRIPTION
       This  manual page documents briefly the itrace command.  This manual page was written for the Debian distribution because the original pro‐
       gram does not have a manual page.

       Itrace is a program that implements traceroute(1) functionality using ICMP echo request packets.

       Therefore, it looks like you are just pinging your target while you traceroute there.

       It often helps tracing behind firewalls.

       Typical Usage:

       itrace -i eth0 -d www.phenoelit.de

       -v              verbose

       -n              reverse lookup answering IPs (slow!)

       -p x            send x probes per hop (default=3)

       -m x            set TTL max to x (default=30)

       -t x            timeout after x seconds (default=3)

       -i interface    the normal eth0 stuff

       -d destination  Name or IP of destination

AUTHOR
       This manual page was written by Vince Mulhollon <vlm@debian.org>, for the Debian GNU/Linux system (but may be used by others).

                                                                 January 13, 2003                                                        ITRACE(1)
