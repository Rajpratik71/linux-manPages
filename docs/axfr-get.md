axfr-get(8)                                                   System Manager's Manual                                                  axfr-get(8)

NAME
       axfr-get - a DNS zone-transfer client.

       It  sends  a  zone-transfer request in DNS-over-TCP format to descriptor 7, reads the results from descriptor 6, and saves the results in a
       file.

SYNOPSIS
       Normally axfr-get is run under tcpclient(1), which sets up descriptors 6 and 7 as a TCP connection to a remote host.

       axfr-get z fn fn.tmp

DESCRIPTION
       axfr-get performs a zone transfer for domain z.  It writes the results to fn.tmp in a format that can be used as input to  tinydns-data(8).
       If the zone transfer completes successfully, axfr-get atomically renames fn.tmp as fn.

       fn.tmp and fn must be on the same filesystem.

       axfr-get  writes  the  zone  serial  number as a comment at the top of fn.tmp.  It skips the zone transfer, leaving fn alone, if fn already
       exists,

       fn has a serial number matching the zone serial number, and both serial numbers are nonzero.

       Zone transfers often include duplicate records.  You should feed the axfr-get results through sort -u.

       axfr-get discards all records outside the domain z.  It accepts records in child zones, but it marks all child zones as  non-authoritative,
       so tinydns(8) will not report those records except as glue.  If you plan to merge the axfr-get results for a domain and a child of the same
       domain, creating a file authoritative for both zones, make sure to eliminate records in the first output that are within the child zone.

       axfr-get will accept arbitrarily large zone transfers.  To limit the maximum file size to 1  megabyte,  run  axfr-get  under  softlimit  -f
       1048576.

Compatibility notes
       axfr-get handles BIND's RFC-1034-violating multiple-answers zone-transfer format.

       axfr-get  does  not  precisely simulate BIND's handling of *.dom.  Under BIND, records for *.dom do not apply to y.dom or anything.y.dom if
       there is a normal record for x.y.dom.  With axfr-get and tinydns(8), the records apply to y.dom and anything.y.dom except x.y.dom.

       axfr-get does not precisely simulate BIND's handling of multiple IP addresses for a single name.  When there are  more  than  8  addresses,
       tinydns(8) selects a random set of 8 for each query.

SEE ALSO
       axfrdns(8), tinydns(8), tinydns-data(8), tcpclient(1), softlimit(8) http://cr.yp.to/djbdns.html

                                                                                                                                       axfr-get(8)
