tinydns-get(1)                                                General Commands Manual                                               tinydns-get(1)

NAME
       tinydns-get - is like dnsq(1), but obtains its results from data.cdb in the current directory

SYNOPSIS
       tinydns-get t fqdn [ ip ]

DESCRIPTION
       tinydns-get  is  like  dnsq(1), but obtains its results from data.cdb in the current directory, in exactly the same way that tinydns(8) and
       axfrdns(8) obtain results from data.cdb in their root directories. If ip is provided, it simulates the results of a query from  IP  address
       ip; this matters if data.cdb differentiates among clients in different locations.

SEE ALSO
       dnsq(1), dnsip(1), dnsipq(1), dnsmx(1), dnstxt(1), dnsqr(1), dnsname(1), dnstrace(1)

       http://cr.yp.to/djbdns.html

                                                                                                                                    tinydns-get(1)
