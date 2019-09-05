URLSNARF(8)                                                   System Manager's Manual                                                  URLSNARF(8)

NAME
       urlsnarf - sniff HTTP requests in Common Log Format

SYNOPSIS
       urlsnarf [-n] [-i interface | -p pcapfile]  [[-v] pattern [expression]]

DESCRIPTION
       urlsnarf outputs all requested URLs sniffed from HTTP traffic in CLF (Common Log Format, used by almost all web servers), suitable for off‐
       line post-processing with your favorite web log analysis tool (analog, wwwstat, etc.).

OPTIONS
       -n     Do not resolve IP addresses to hostnames.

       -i interface
              Specify the interface to listen on.

       -p pcapfile
              Process packets from the specified PCAP capture file instead of the network.

       -v     "Versus" mode. Invert the sense of matching, to select non-matching URLs.  Specify the interface to listen on.

       pattern
              Specify regular expression for URL matching.

       expression
              Specify a tcpdump(8) filter expression to select traffic to sniff.

SEE ALSO
       dsniff(8)

AUTHOR
       Dug Song <dugsong@monkey.org>

                                                                                                                                       URLSNARF(8)
