TEREDO-MIRE(1)                                                     User Commands                                                    TEREDO-MIRE(1)

NAME
       teredo-mire - Stateless Teredo IPv6 responder

SYNOPSIS
       teredo-mire

DESCRIPTON
       Teredo-Mire  is  a  test  back-end  for the Teredo IPv6 tunneling protocol. It listens for requests from other Teredo clients or IPv6 nodes
       (through Teredo relays) and answers to them statelessly. Currently only ICMPv6 Echo Requests ("pings") are handled.

OPTIONS
       -h or --help
              Display some help and exit.

       -V or --version
              Display program version and exit.

DIAGNOSTICS
       To contact a teredo-mire responder, a valid Teredo IPv6 address must be determined for it. The server IPv4 address and mapped  client  IPv4
       address  parts should both represent the IPv4 address of the host running teredo-mire.  The mapped UDP port number must be 3545. The Teredo
       prefix and Teredo flags are ignored.

BUGS
       teredo-mire uses UDP ports 3544 and 3545, and assumes it has a public IPv4 address.

       Neither RFC 2460 nor RFC 4380 are properly implemented.

SECURITY
       teredo-mire does not require any privilege to run.

SEE ALSO
       ping6(8), miredo(8), ipv6(7)

AUTHOR
       Rémi Denis-Courmont <remi at remlab dot net>

       http://www.remlab.net/miredo/

miredo                                                             February 2008                                                    TEREDO-MIRE(1)
