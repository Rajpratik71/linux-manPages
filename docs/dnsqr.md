dnsqr(1)                                                      General Commands Manual                                                     dnsqr(1)

NAME
       dnsqr - asks for records of type t under the domain name fqdn

SYNOPSIS
       dnsqr t fqdn

DESCRIPTION
       dnsqr  asks  for records of type t under the domain name fqdn.  It prints the results in a human-readable format, more compact than the dig
       output format.

       t may be a name or number.  Currently recognized names: any, a, ns, mx, ptr, txt, cname, soa, hinfo, rp, sig, key, aaaa, axfr.  Note  that,
       if you want to perform a zone transfer, you should use axfr-get(8), not dnsqr axfr.

       dnsqr is available in djbdns 1.01 and above.

SEE ALSO
       dnsip(1), dnsipq(1), dnsmx(1), dnstxt(1), dnsname(1), dnsq(1), dnstrace(1), tinydns-get(1)

       http://cr.yp.to/djbdns.html

                                                                                                                                          dnsqr(1)
