rbldns(8)                                                     System Manager's Manual                                                    rbldns(8)

NAME
       rbldns - an IP-address-listing DNS server

DESCRIPTION
       rbldns  is  an  IP-address-listing  DNS  server.   It  accepts iterative DNS queries from hosts around the Internet asking about various IP
       addresses.  It provides responses showing whether the addresses are on a locally configured list, such as RBL or DUL.

Configuration
       Normally rbldns is set up by the rbldns-conf(8) program.

       rbldns runs chrooted in the directory specified by the $ROOT environment variable, under the uid and gid specified by  the  $UID  and  $GID
       environment variables.

       rbldns listens for incoming UDP packets addressed to port 53 of $IP.  It does not listen for TCP queries.

       rbldns  handles  domains  of  the  form d.c.b.a.base where a.b.c.d is the IP address in question and base is given by the $BASE environment
       variable.

       rbldns rejects inverse queries, non-Internet-class queries, truncated packets, packets that contain anything other  than  a  single  query,
       query  types other than A, TXT, or *, and queries for domains outside $BASE.  It looks up other queries inside data.cdb, a binary file cre‐
       ated by rbldns-data(8).

SEE ALSO
       rbldns-conf(8), rbldns-data(8)

       http://cr.yp.to/djbdns.html

                                                                                                                                         rbldns(8)
