axfrdns(8)                                                    System Manager's Manual                                                   axfrdns(8)

NAME
       axfrdns - a DNS zone-transfer server.

DESCRIPTION
       axfrdns reads a zone-transfer request in DNS-over-TCP format from its standard input, and responds with locally configured information.

Configuration
       Normally axfrdns is set up by the axfrdns-conf(8) program.

       axfrdns  runs  chrooted  in the directory specified by the $ROOT environment variable, under the uid and gid specified by the $UID and $GID
       environment variables.

       Normally axfrdns runs under tcpserver(1) to handle TCP connections on port 53 of a local IP address.

       tcpserver(1) is responsible for rejecting connections from hosts not authorized to perform zone transfers.

       axfrdns can also run under secure connection tools offering an UCSPI-compliant interface.

       axfrdns looks up zone-transfer results in data.cdb, a binary file created by tinydns-data(8).  It also responds to normal  client  queries,
       such as SOA queries, which usually precede zone-transfer requests.

       axfrdns allows zone transfers for any zone listed in the $AXFR environment variable.

       $AXFR is a slash-separated list of domain names.  If $AXFR is not set, axfrdns allows zone transfers for all zones available in data.cdb.

       axfrdns  aborts if it runs out of memory, or has trouble reading data.cdb, or receives a request larger than 512 bytes, or receives a trun‐
       cated request, or receives a zone-transfer request disallowed by $AXFR, or receives a request not answered by data.cdb, or waits 60 seconds
       with nothing happening.

Further notes on zone transfers
       axfrdns  provides every record it can find inside the target domain.  This may include records in child zones.  Some of these records (such
       as glue inside a child zone) are essential; others are not.  It is up to the client to decide which out-of-zone records to keep.

       axfrdns does not provide glue records outside the target domain.

       The zone-transfer protocol does not support timestamps.  If a record is scheduled to be created in the future, axfrdns does  not  send  it;
       after  the  starting  time, the zone-transfer client will continue claiming that the record doesn't exist, until it contacts axfrdns again.
       Similarly, if a record is scheduled to die in the future, axfrdns sends it (with a 2-second TTL); after the ending time, the  zone-transfer
       client will continue providing the old record, until it contacts axfrdns again.

       Zone-transfer clients rely on zone serial numbers changing for every zone modification.

       tinydns-data(8) uses the modification time of the data file as its serial number for all zones.  Do not make more than one modification per
       second.

       BIND's zone-transfer client, named-xfer, converts zone-transfer data to zone-file format.  Beware that  zone-file  format  has  no  generic
       mechanism to express records of arbitrary types;

       named-xfer chokes if it does not recognize a record type used in data.cdb.

SEE ALSO
       axfrdns-conf(8), tinydns-data(8), tcpserver(1)

       http://cr.yp.to/djbdns.html

                                                                                                                                        axfrdns(8)
