PCAT(1)                                                     BSD General Commands Manual                                                    PCAT(1)

NAME
     pcat — dump a packet capture in a line-based, parsable format

SYNOPSIS
     pcat [-h | -v]
     pcat [-o OUTPUT] [-] [INPUT ...]

DESCRIPTION
     The basic concept for this utility is to dump the contents of a packet capture in a line-based, parsable format.

     The available options are as follows:

     -h      usage information
     -v      the program's version
     -o OUTPUT
             sets the output filename to OUTPUT.  [default: stdout]
     INPUT ...
             INPUT files to read.  ‘-’ may be used to signify stdin.  [default: stdin]

IMPLEMENTATION NOTES
     The output format is as follows:

           TIMESTAMP PROTOCOL SOURCE DESTINATION PARTS PAYLOAD

     Each value may have attributes separated by commas.

     TIMESTAMP    epoch.microseconds

     PROTOCOL     {ARP, TCP4, UDP4, ICMP4, P# (where # is the IP protocol number)}

     SOURCE       ARP  : senderMac,senderIp
                  ICMP4: ipAddress,type
                  TCP4 : ipAddress,port
                  UDP4 : ipAddress,port
                  P#   : ipAddress

     DESTINATION  ARP  : targetMac,targetIp
                  ICMP4: ipAddress,code
                  TCP4 : ipAddress,port
                  UDP4 : ipAddress,port
                  P#   : ipAddress

     PARTS        ARP  : operation,payloadLen
                  ICMP4: quench0,quench1,payloadLen
                  TCP4 : sequence,ack,flags,opts,payloadLen
                  UDP4 : payloadLen
                  P#   : ipid,payloadLen

     PAYLOAD      a hexadecimal representation of the protocol's payload, or '-' if there is no payload

EXAMPLES
     As a filter:
           $ pmerge one.pcap two.pcap | pcat > output.txt

     In simple command form:
           $ pcat -o output.txt one.pcap

SEE ALSO
     p4split(1), puniq(1), pmerge(1)

AUTHORS
     Zephyr <zephyr@dirtbags.net>,
     pi-rho <pi-rho@tyr.cx>

BUGS
     Bugs may be submitted at ⟨https://bugs.launchpad.net/netre-tools⟩

Network RE Toolkit 1.1337                                        February 1, 2013                                        Network RE Toolkit 1.1337
