RANDPKT(1)                          The Wireshark Network Analyzer                          RANDPKT(1)

NAME
       randpkt - Random packet generator

SYNOPSIS
       randpkt [ -b <maxbytes> ] [ -c <count> ] [ -t <type> ] <filename>

DESCRIPTION
       randpkt is a small utility that creates a pcap trace file full of random packets.

       By creating many randomized packets of a certain type, you can test packet sniffers to see how
       well they handle malformed packets.  The sniffer can never trust the data that it sees in the
       packet because you can always sniff a very bad packet that conforms to no standard.  randpkt
       produces very bad packets.

       When creating packets of a certain type, randpkt uses a sample packet that is stored internally
       to randpkt. It uses this as the starting point for your random packets, and then adds extra
       random bytes to the end of this sample packet.

       For example, if you choose to create random ARP packets, randpkt will create a packet which
       contains a predetermined Ethernet II header, with the Type field set to ARP. After the Ethernet
       II header, it will put a random number of bytes with random values.

OPTIONS
       -b <maxbytes>
           Default 5000.

           Defines the maximum number of bytes added to the sample packet.  If you choose a maxbytes
           value that is less than the size of the sample packet, then your packets would contain only
           the sample packet... not much variance there! randpkt exits on that condition.

       -c <count>
           Default 1000.

           Defines the number of packets to generate.

       -t <type>
           Default Ethernet II frame.

           Defines the type of packet to generate:

                   arp             Address Resolution Protocol
                   bgp             Border Gateway Protocol
                   bvlc            BACnet Virtual Link Control
                   dns             Domain Name Service
                   eth             Ethernet
                   fddi            Fiber Distributed Data Interface
                   giop            General Inter-ORB Protocol
                   icmp            Internet Control Message Protocol
                   ip              Internet Protocol
                   ipv6            Internet Protocol Version 6
                   llc             Logical Link Control
                   m2m             WiMAX M2M Encapsulation Protocol
                   megaco          MEGACO
                   nbns            NetBIOS-over-TCP Name Service
                   ncp2222         NetWare Core Protocol
                   sctp            Stream Control Transmission Protocol
                   syslog          Syslog message
                   tds             TDS NetLib
                   tcp             Transmission Control Protocol
                   tr              Token-Ring
                   udp             User Datagram Protocol
                   usb             Universal Serial Bus
                   usb-linux       Universal Serial Bus with Linux specific header

EXAMPLES
       To see a description of the randpkt options use:

           randpkt

       To generate a capture file with 1000 DNS packets use:

           randpkt -b 500 -t dns rand_dns.pcap

       To generate a small capture file with just a single LLC frame use:

           randpkt -b 100 -c 1 -t llc single_llc.pcap

SEE ALSO
       pcap(3), editcap(1)

3.3.0                                         2019-12-19                                    RANDPKT(1)
