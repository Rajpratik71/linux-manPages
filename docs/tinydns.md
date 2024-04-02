tinydns(8)                                                    System Manager's Manual                                                   tinydns(8)

NAME
       tinydns - a DNS server.

DESCRIPTION
       tinydns accepts iterative DNS queries from hosts around the Internet, and responds with locally configured information.

Configuration
       This is a reference page.  For tutorial information, see the instructions for
       running a DNS server (http://cr.yp.to/djbdns/run-server.html).

       Normally tinydns is set up by the tinydns-conf(8) program.

       tinydns  runs  chrooted  in the directory specified by the $ROOT environment variable, under the uid and gid specified by the $UID and $GID
       environment variables.

       tinydns listens for incoming UDP packets addressed to port 53 of $IP.  It does not listen for TCP queries.

       tinydns answers queries as specified by data.cdb, a binary file created by tinydns-data(8).

Further details
       tinydns rejects zone-transfer requests, inverse queries, non-Internet-class queries, truncated packets, and packets that  contain  anything
       other than a single query.

       tinydns, like BIND, includes NS records with answers to most queries.  This increases DNS packet sizes, but it draws queries away from par‐
       ent servers, and reduces the frequency of long DNS delays.  With the default tinydns-data(8) cache times,  a  client  that  uses  a  normal
       record at least once every day will always have the corresponding NS records cached and will never have to talk to parent servers.

SEE ALSO
       tinydns-conf(8), tinydns-data(8)

       http://cr.yp.to/djbdns.html

                                                                                                                                        tinydns(8)
