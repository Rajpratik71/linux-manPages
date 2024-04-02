dnsmx(1)                                                      General Commands Manual                                                     dnsmx(1)

NAME
       dnsmx - prints the MX records of fqdn

SYNOPSIS
       dnsmx fqdn

DESCRIPTION
       dnsmx prints the MX records of fqdn.  If there are no MX records, dnsmx prints an artificial MX record, simulating the behavior of MTAs.

       Normally  dnsmx  exits  0.   If dnsmx encounters a temporary problem that prevents it from determining the list of MX records, it prints an
       error message and exits 111.

SEE ALSO
       dnsip(1), dnsname(1), dnsipq(1), dnstxt(1), dnsqr(1), dnsq(1), dnstrace(1)

       http://cr.yp.to/djbdns.html

                                                                                                                                          dnsmx(1)
