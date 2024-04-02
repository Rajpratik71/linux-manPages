dnsname(1)                                                    General Commands Manual                                                   dnsname(1)

NAME
       dnsname - does a reverse lookup for the IP address

SYNOPSIS
       dnsname a.b.c.d

DESCRIPTION
       dnsname does a reverse lookup for the IP address a.b.c.d.  It prints the first domain name for that address.  If no domain names are listed
       in DNS, dnsname prints a blank line.  You can list several IP addresses; dnsname prints each result on a separate line.

       There is also a dnsfilter(1) program that reads IP addresses from its input and performs many reverse lookups in parallel.

       Normally dnsname exits 0.  If dnsname encounters a temporary problem that prevents it from determining the domain name, it prints an  error
       message and exits 111.

SEE ALSO
       dnsip(1), dnsipq(1), dnsmx(1), dnstxt(1), dnsqr(1), dnsq(1), dnstrace(1)

       http://cr.yp.to/djbdns.html

                                                                                                                                        dnsname(1)
