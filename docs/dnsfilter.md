dnsfilter(1)                                                  General Commands Manual                                                 dnsfilter(1)

NAME
       dnsfilter - reverse-resolves IP addresses, converting them to host names.

SYNOPSIS
       dnsfilter [ opts ]

DESCRIPTION
       dnsfilter  reads  a series of lines from stdin, converts an IP address to a host name at the beginning of each line, and prints the results
       to stdout.

       If a line does not begin with an IP address, dnsfilter leaves the line alone.  If an IP address does not have a host name  listed  in  DNS,
       dnsfilter leaves the line alone.  If an IP address has a host name listed in DNS, dnsfilter inserts an equals sign and the host name before
       the first space or tab in the line.  If a DNS lookup fails temporarily, dnsfilter inserts a colon and a dash-separated error message before
       the first space or tab in the line.

       While dnsfilter is looking up an address in DNS, it reads ahead in the input and looks for more addresses to look up in parallel.

OPTIONS
       opts is a series of getopt-style options:

       -c n   Do at most n DNS queries in parallel.  Default: 10.

       -l n   Read ahead at most n lines.  Default: 1000.

SEE ALSO
       dnsip(1), dnsipq(1), dnsname(1), dnsmx(1), dnstxt(1), dnsqr(1), dnsq(1), dnstrace(1)

       http://cr.yp.to/djbdns.html

                                                                                                                                      dnsfilter(1)
