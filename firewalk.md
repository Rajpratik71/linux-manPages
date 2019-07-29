FIREWALK(8)                                                   System Manager's Manual                                                  FIREWALK(8)

NAME
       firewalk - Active Reconnaissance Network Security Tool with Extreme Prejudice

SYNOPSIS
       firewalk [-dhinprSsTtvx] target_gateway metric

DESCRIPTION
       Firewalk  is an active reconnaissance network security tool that attempts to determine what layer 4 protocols a  given IP forwarding device
       will pass.  Firewalk  works  by sending out TCP or UDP packets with a TTL one greater than the targeted gateway.  If the gateway allows the
       traffic,  it  will  forward  the  packets to the next hop where they will expire and elicit an ICMP_TIME_EXCEEDED  message.  If the gateway
       hostdoes not allow the traffic, it will likely drop the packets on  the floor and we will see no response.

       To get  the  correct  IP  TTL that will result in expired packets one beyond the gateway we need  to  ramp  up  hop-counts.   We  do   this
       in  the  same manner that traceroute works.  Once we have the gateway hopcount (at  that point the scan is said to be `bound`) we can begin
       our scan.

       It is significant to note the fact that the ultimate destination host does not have to be reached.  It just  needs to  be  somewhere  down‐
       stream,  on  the  other side of the gateway, from the scanning host.  Please see http://www.wiley.com/cda/product/0,,0471205443,00.html for
       more information on Firewalking and networking security tools in general.

COMMAND-LINE OPTIONS
       If an option takes an argument, it procedes the option letter, with the default in parenthesis.

       -d 1-65535 (34434)
                      Specify the initial destination port to use during the network discovery (aka TTL ramping) phase.

       -h             Program help.

       -i interface_name
                      Specify interface to use.  Only neccessary on multi-homed machines.

       -n             Do not resolve IP addresses into hostnames.  This saves a DNS lookup and speeds the scans (mainly during network discovery).

       -P 1-2000 (0)  Set a network writing pause which may be neccessary to keep the program from flooding the network.

       -p TCP, UDP (UDP)
                      Type of scan to perform.

       -r             Strict RFC 793 compliance.  This only comes into play when doing a TCP scan when your packets have an expire vector  of  one
                      and your metric host is one hop from your gateway.  Since the packets will reach their destination, they will not expire, so
                      we look for terminal responses.  For a TCP port in the listen state, we will get back a SYN|ACK with the ACK as our SEQ + 1.
                      However,  for  a closed port, the response is stack dependent.  If the host is RFC compliant we will receive an RST|ACK with
                      the ACK as our SEQ + 1.  However, if the host is not compliant (ie: microsoft) then the best we  can  do  is  inverse  tuple
                      matching (which is the default).

       -S 1-65535,... (1-130,139,1025)
                      Specify  the  ports  for the scan.  Ports may be specified in ranges, delimited by dashes, and multiple ranges may be speci‐
                      fied, delimited by commas.  Ommiting the terminating port number is shorthand for 65535.

       -s 1-65535 (53)
                      Specify the source port for the scan (both phases).

       -T 1-2000 (2)  Network packet reading timeout.  This is the time firewalk will spend waiting for a response before timing out.

       -t 1-25 (1)    Set the initial IP time to live (TTL) value.  If a target gateway is known to be (at least) n hops from the source host, the
                      TTL can be preloaded to facilitate a faster scan.

       -v             Dump program version and exit.

       -x expire vector (1)
                      The  expire  vector is the number of hops that the scanning probes will expire, past the gateway host.  The binding hopcount
                      is the hopcount of the gateway + the expire vector.

       COMMAND-LINE EXAMPLES

CAVEATS
SEE ALSO
       traceroute(8), tracerx(8), pcap(3), libnet(3), dnet(3)

AUTHOR
       Mike D. Schiffman <mike@infonexus.com>

BUGS
       Please send bug reports to mike@infonexus.com

firewalk                                                            04.20.2002                                                         FIREWALK(8)
