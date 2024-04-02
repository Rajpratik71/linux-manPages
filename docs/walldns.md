walldns(8)                                                    System Manager's Manual                                                   walldns(8)

NAME
       walldns - a reverse DNS wall

DESCRIPTION
       walldns  is  a  reverse  DNS  wall.  It accepts iterative DNS queries for in-addr.arpa domains from hosts around the Internet, and supplies
       generic responses that avoid revealing local host information.

       For example, walldns provides a PTR record for 4.3.2.1.in-addr.arpa showing 4.3.2.1.in-addr.arpa as the name of IP address 1.2.3.4,  and  a
       matching A record showing 1.2.3.4 as the IP address of 4.3.2.1.in-addr.arpa.

Configuration
       Normally walldns is set up by the walldns-conf(8) program.

       walldns  runs  chrooted  in the directory specified by the $ROOT environment variable, under the uid and gid specified by the $UID and $GID
       environment variables.

       walldns listens for incoming UDP packets addressed to port 53 of $IP.  It does not listen for TCP queries.

Further details
       walldns rejects inverse queries, non-Internet-class queries, truncated packets, packets that contain anything other than a single question,
       queries for domains outside in-addr.arpa, and request types other than A, PTR, and *.

       walldns does not include NS or SOA records with its responses.

       walldns uses TTLs slightly over one week.

SEE ALSO
       walldns-conf(8)

       http://cr.yp.to/djbdns.html

                                                                                                                                        walldns(8)
