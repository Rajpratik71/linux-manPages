TCTRACE(1)                                                    General Commands Manual                                                   TCTRACE(1)

NAME
       tctrace - similar to traceroute, yet uses TCP SYN packets

DESCRIPTION
       This manual page documents briefly the tctrace command.  This manual page was written for the Debian distribution because the original pro‐
       gram does not have a manual page.

       TCtrace is like itrace a traceroute(1) brother - but it uses TCP SYN packets to trace.

       This makes it possible for you to trace through firewalls if you know one TCP service that is allowed to pass from the outside.

       Typical Usage:

       tctrace -i eth0 -d www.phenoelit.de

       -v              verbose

       -n              reverse lookup answering IPs (slow!)

       -p x            send x probes per hop (default=3)

       -m x            set TTL max to x (default=30)

       -t x            timeout after x seconds (default=3)

       -D x            destination port x (default=80)

       -S x            source port x (default=1064)

       -i interface    the normal eth0 stuff

       -d destination  Name or IP of destination

       Note there have been bugs reported on tctrace.  It sometimes has a mind of its own.

AUTHOR
       This manual page was written by Vince Mulhollon <vlm@debian.org>, for the Debian GNU/Linux system (but may be used by others).

                                                                 January 13, 2003                                                       TCTRACE(1)
