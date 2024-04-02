rbldns-data(8)                                                System Manager's Manual                                               rbldns-data(8)

NAME
       rbldns-data - data tool for rbldns

DESCRIPTION
       rbldns-data  reads an IP address list from a file named data in the current directory.  It creates data.cdb in a binary format designed for
       fast access by rbldns(8).  It may also create some other files with names beginning with data.

       rbldns-data updates data.cdb atomically, so you can use it safely while rbldns(8) is running.  If anything goes wrong with the creation  of
       data.cdb, rbldns-data stops and leaves the old data.cdb in place.

Data format
       ip

       The IP address ip is on the list.

       ip/n

       All  IP  addresses that share the first n bits of the IP address ip are on the list.  For example, 1.2.3.0/24 means all 1.2.3.*  addresses.
       n must be at least 8, and all bits past the nth in ip must be 0.

       :a:txt

       DNS queries for addresses on the list will receive an A record of a and a TXT record of txt.  Typically a is 127.0.0.2 and txt is a pointer
       to a web page about the list.

       If txt ends with $, rbldns(8) replaces the $ with the IP address.

       #comment

       Comment line. The line is ignored.

SEE ALSO
       rbldns(8)

       http://cr.yp.to/djbdns.html

                                                                                                                                    rbldns-data(8)
