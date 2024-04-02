dnsip(1)                                                      General Commands Manual                                                     dnsip(1)

NAME
       dnsip - lookup IP addresses

SYNOPSIS
       dnsip [ fqdn ]

DESCRIPTION
       dnsip resolves fqdn and prints the IP addresses of fqdn on a single line.  If fqdn does not exist, dnsip prints a blank line.  You can list
       several fqdns; dnsip prints each result on a separate line.

       Normally dnsip exits 0.  If dnsip encounters a temporary problem that prevents it from determining the list of IP addresses, it  prints  an
       error message and exits 111.  The same comments apply to the other programs described here.

SEE ALSO
       dnsipq(1), dnsname(1), dnsmx(1), dnstxt(1), dnsqr(1), dnsq(1), dnstrace(1)

       http://cr.yp.to/djbdns.html

                                                                                                                                          dnsip(1)
