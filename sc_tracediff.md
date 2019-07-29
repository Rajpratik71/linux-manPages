SC_TRACEDIFF(1)                                             BSD General Commands Manual                                            SC_TRACEDIFF(1)

NAME
     sc_tracediff — display traceroute paths where the path has changed.

SYNOPSIS
     sc_tracediff [-a] [-m method] [-n] file1.warts file2.warts

DESCRIPTION
     The sc_tracediff utility displays pairs of traceroutes to a destination where the path has changed.  It takes two warts files as input and
     displays paths where a hop differs by its address.  The options are as follows:

     -a      dump all traceroute pairs regardless of whether they have changed.

     -m method
             specifies the method used to match pairs of traceroutes together.  If dst is specified, traceroutes are matched if the destination IP
             address of both traces are the same.  If userid is specified, traceroutes are matched if the userid field of both traces are the
             same.  If dstuserid is specified, traceroutes are matched if the destination IP address and userid fields are the same.  By default,
             the destination IP address is used.

     -n      names should be reported instead of IP addresses, where possible.

     sc_tracediff can be useful in network monitoring to identify when a forward IP path has changed.  In this scenario, it is recommended that
     Paris traceroute is used with the same UDP source and destination ports for each execution of scamper so that only paths that have changed
     are identified, not merely alternate paths visible due to per-flow load-balancing.  By default scamper uses a source port based on the
     process ID, which will change with each execution of scamper.

EXAMPLES
     The command:

        scamper -O warts -o file1.warts -c 'trace -P udp-paris -s 31337' -f list.txt

     collects the forward IP paths towards a set of IP addresses found in list.txt using 31337 as the UDP source port value.  If the above command
     is adjusted to subsequently collect file2.warts, then we can identify paths that have subsequently changed with the command:

        sc_tracediff file1.warts file2.warts

     If Paris traceroute with ICMP probes is preferred, then the following invocation of scamper is appropriate:

        scamper -O warts -o file1.warts -c 'trace -P icmp-paris -d 31337' -f list.txt

     In this case, scamper uses 31337 as the ICMP checksum value in each probe.

SEE ALSO
     scamper(1),

     B. Augustin, X. Cuvellier, B. Orgogozo, F. Viger, T. Friedman, M. Latapy, C. Magnien, and R. Teixeira, Avoiding traceroute anomalies with
     Paris traceroute, Proc. ACM/SIGCOMM Internet Measurement Conference 2006.

AUTHOR
     sc_tracediff is written by Matthew Luckie <mjl@luckie.org.nz>.

BSD                                                               April 21, 2011                                                               BSD
