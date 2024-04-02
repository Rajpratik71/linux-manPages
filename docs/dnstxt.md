dnstxt(1)                                                     General Commands Manual                                                    dnstxt(1)

NAME
       dnstxt - prints the TXT record of fqdn

SYNOPSIS
       dnstxt fqdn

DESCRIPTION
       dnstxt prints the TXT record of fqdn on a single line.  If there is no TXT record, dnstxt prints a blank line.

       Normally  dnstxt  exits  0.   If dnstxt encounters a temporary problem that prevents it from determining the TXT record, it prints an error
       message and exits 111.

SEE ALSO
       dnsip(1), dnsname(1), dnsmx(1), dnsipq(1), dnsqr(1), dnsq(1), dnstrace(1)

       http://cr.yp.to/djbdns.html

                                                                                                                                         dnstxt(1)
