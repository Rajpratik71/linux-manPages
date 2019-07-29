dnsipq(1)                                                     General Commands Manual                                                    dnsipq(1)

NAME
       dnsipq - dns lookup tool

SYNOPSIS
       dnsipq [ udn ]

DESCRIPTION
       dnsipq  feeds  the name udn through qualification(5).  It prints the fully qualified domain name and IP addresses on a single line.  If the
       fully qualified domain name does not exist, dnsipq prints no addresses.  You can list several udns; dnsipq prints each result on a separate
       line.

       Normally dnsipq exits 0.  If dnsipq encounters a temporary problem that prevents it from determining the list of IP addresses, it prints an
       error message and exits 111.

SEE ALSO
       qualification(5), dnsip(1), dnsname(1), dnsmx(1), dnstxt(1), dnsqr(1), dnsq(1), dnstrace(1)

       http://cr.yp.to/djbdns.html

                                                                                                                                         dnsipq(1)
