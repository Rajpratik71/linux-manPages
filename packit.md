PACKIT(8)                                               Packet analysis and injection tool                                               PACKIT(8)

NAME
       Packit - Packet analysis and injection tool

SYNOPSIS
       Packet capture:
       packit -m capture [-cGHnvsX] [-i interface] [-r|-w file] expression

       Packet injection:
       packit -m inject [-t protocol] [-aAbcCdDeFgGhHjJkKlLmMnNoOpPqQrRsSTuUvwWxXyYzZ] [-i interface]

DESCRIPTION
       Packit  is  a  network  auditing  tool. It´s value is derived from its ability to customize, inject, monitor, and manipulate IP traffic. By
       allowing you to define (spoof) all TCP, UDP, ICMP, IP, ARP, RARP and Ethernet header options, Packit can be useful  in  testing  firewalls,
       intrusion  detection  systems,  port scanning, simulating network traffic and general TCP/IP auditing. Packit is also an excellent tool for
       learning TCP/IP.

PACKIT BASE OPTIONS
       -m mode
            Select a runtime mode. Currently supported modes
            are capture, inject and trace. The default is inject.

PACKET CAPTURE OPTIONS
       Packet capture options are as follows:

       -c count
            Specify the number of packets to capture

       -e   Display link-layer header data.

       -G   Display the timestamp in GMT rather than localtime.

       -i interface
            Listen on interface. If unspecified, packit will use the lowest
            numbered device in the 'up' state (excluding loopback).

       -n   Don't resolve host addresses to names but resolve ports numbers.
            Disables DNS lookups.

       -nn  Don't resolve ports numbers to their protocol names but resolve
            host addresses.

       -nnn Don't resolve host addresses or port numbers.

       -r file
            Read packet data from tcpdump formated binary log file. (example:
            a file created with -w)

       -s snaplen
            Read snaplen bytes of data from each packet rather than the
            default of 68.

       -v  Enables verbose packet capture.

       -w file
            Write the raw packets to file rather than displaying time to
            stderr.

       -X   Display hexadecimal & ascii dump of each packet up to snap
            length bytes.

       expression
            selects which packets should be displayed. If no expression is
            given, all packets are displayed. See the tcpdump(1) man page for
            more detailed information.

PACKET INJECTION / TRACE
       Packet injection is used to define and inject IP based network traffic onto your network.  You have the ability to define  essentially  any
       ARP,  IP, TCP, UDP, ICMP and Ethernet header value. This can be valuable in a number of ways, including testing firewalls, intrusion detec‐
       tion systems, simulating traffic flow and general TCP/IP auditing.

CHOOSE YOUR PROTOCOL
       -t protocol
            Specify the type of packet to inject. Supported values are: ARP,
            RARP, TCP, UDP and ICMP.  This option defaults to TCP in inject
            mode and to ICMP in trace mode.

PACKET INJECTION / TRACE GENERAL
       This section documents the operational command-line options.

       -c count
            The value of count is the total number of packets we would like
            to inject (a count value of 0 means forver).

       -b burst rate
            Specifies the number of packets to inject every interval (defined
            by -w). (A burst rate of 0 will send packets as quickly as
            possible)

       -h
            Host response mode. Enabling this option will print any packet
            you inject and then wait (see -H for timeout) to see if the remote
            host responds.

       -H timeout
            Specify the timeout value (in seconds) to use with '-h'.
            This value defaults to '1' second.

       -i interface
            Specify the interface to transmit from, if the machine has
            multiple interfaces.

       -v
            Verbose injection mode. Displays each packet you inject. It
            also has the same effect as in capture mode while used with
            the '-h' option.

       -p payload
            This option defines the payload portion of the header.
            Hex payload should be prefixed with '0x' with each value
            separated by a whitespace.
            ASCII Example: -p 'hello, this is my packet'
            Hex Example: -p '0x 70 61 63 6B 69 74'

       -w interval
            Specify the number of seconds to wait between packet bursts.
            This value defaults to '1' second.

       -Z length
            Specify the size of the packet(s) to inject. (Max: 65535)

IP HEADER OPTIONS
       This section documents the IP header command-line options.

       -s src address
            The IP address the packet will appear to come from. If
            unspecified, packit will default to the IP address of the
            lowest numbered device in the 'up' state (excluding loopback).

       -sR  Use a random source IP address.

       -d dst address
            The IP address of the machine you would like to contact.

       -dR  Use a random destination IP address.

       -o type of service
            TOS values are typically in hexidecimal format, however, packit
            only accepts TOS values as integers.

            Below are the 4 valid TOS bit values:

            - Minimize delay: 16 (0x10)
            - Maximize throughput: 8 (0x08)
            - Maximize reliability: 4 (0x04)
            - Minimize monetary cost: 2 (0x02)

       -n ID number
            The ID number is used to identify each datagram sent by a host.
            It generally increments by one with each datagram sent. This
            value is random by default.

       -T TTL
            The TTL value defines the upper limit on the number of devices
            through which the datagram may pass to reach it's destination.
            The default value is 128.

       -V IP protocol number
            Specify the IP protocol assocated with this packet (RAWIP only).
            The default value is 255.

TCP HEADER OPTIONS
       This section documents the TCP header command-line options.

       -S src port
            The port from which our source address is communicating from. This
            value is random by default.

       -D dst port
            The port on the destination we would like to communicate on. In
            inject mode this value is 0 by default while in trace mode this
            value is random by default. You may also specify a range of
            addresses in the format: -D 1:1024.

       -f  Do not fragment this packet.

       -F tcp flags
            There are 6 TCP header flag bits. They can be used in combination
            with one another and are specified using the following
            identifiers:

            - S : SYN (Synchronization sequence number)
            - F : FIN (Sender is finished)
            - A : ACK (Acknowledgement number is valid)
            - P : PSH (Receiver should push this data to the remote host)
            - U : URG (The urgent pointer is valid)
            - R : RST (Reset this connection)

            As an example, to set the SYN and FIN bits use the
            following: -F SF

       -q sequence number
            The sequence number is a 32-bit unsigned (positive) number used
            to identify the byte in a stream of data from the sending TCP
            to the receiving TCP that the first byte of data represents.

       -a ack number
            The acknowledgement (ack) number defines the next sequence
            number that the sender of the ack expects to see. It is
            typically the sequence number + 1 during valid TCP
            communication. It is a 32-bit unsigned (positive) number.

       -W window size
            The window size provides flow control. It is a 16-bit
            number that defines how many bytes the receiver is willing
            to accept. The default value is 1500.

       -u urgent pointer
            In valid TCP communication, the urgent pointer is
            only useful if the URG flag is set. Used with the
            sequence number, it points to the last byte of urgent
            data.

UDP HEADER OPTIONS
       This section documents the UDP header command-line options. UDP is the default IP protocol for TRACE mode.

       -S src port
            The port from which our source address is communicating from. This
            value is random by default.

       -D dst port
            The port on the destination we would like to communicate on. In
            inject mode this value is 0 by default while in trace mode this
            value is random by default. You may also specify a range of
            addresses in the format: -D 1:1024.

ICMP HEADER OPTIONS
       This section documents the ICMP header command-line options.

       -K type
            Specify the ICMP type. See /usr/share/docs/packit/ICMP.txt for details on types.

       -C code
            Specify the ICMP code. See /usr/share/docs/packit/ICMP.txt for details on codes.

       ECHO REQUEST / ECHO REPLY OPTIONS

       -N id number
            Define the 16-bit ICMP identification number. This value is
            random by default.

       -Q sequence number
            Define the 16-bit ICMP sequence number. This value is random
            by default.

       UNREACHABLE / REDIRECT / TIME EXCEEDED OPTIONS

       -g gateway
            Define the gateway in which to redirect traffic to. This option
            is only used for ICMP redirects (type 5).

       -j address
            Define the source address of the original packet.

       -J src port
            Define the source port of the original packet.

       -l address
            Define the destination address of the original packet.

       -L dst port
            Define the destination port of the original packet.

       -m time to live
            Define the Time To Live of the original packet. This option
            defaults to 128.

       -M id
            Define the IP ID of the original packet. This option defaults
            to random.

       -O type of service
            Define the Type of Service of the original packet. See the
            -o option for the possible values.

       -P protocol
            Define the protocol of the original packet. This option
            defaults to UDP.

       MASK REQUEST / MASK REPLY OPTIONS

       -N id number
            Define the 16-bit ICMP identification number. This value is
            random by default.

       -Q sequence number
            Define the 16-bit ICMP sequence number. This value is random
            by default.

       -G address mask
            Define the address network mask. The default value for this
            option is:255.255.255.0.

       TIMESTAMP REQUEST / TIMESTAMP REPLY OPTIONS

       -N id number
            Define the 16-bit ICMP identification number. This value is
            random by default.

       -Q sequence number
            Define the 16-bit ICMP sequence number. This value is random
            by default.

       -U original timestamp
            Define the 32-bit original timestamp. This value is 0
            by default.

       -k received timestamp
            Define the 32-bit received timestamp. This value is 0
            by default.

       -z transmit timestamp
            Define the 32-bit transmit timestamp. This value is 0
            by default.

ARP AND RARP HEADER OPTIONS
       This section documents the ARP/RARP header command-line options. In my opinion, these options have the ability to do the most  damage  with
       the least effort, especially on large cable and DSL networks. Use with caution.

       Packit only supports ARP/RARP protocol addresses in IPv4 format

       -A operation type
            Define the ARP / RARP / IRARP operation type. The valid options
            are as follows:

            - 1 : ARP Request (Default for ARP packages.)
            - 2 : ARP Reply
            - 3 : Reverse ARP Request (Default for RARP packages.)
            - 4 : Reverse ARP Reply
            - 5 : Inverse ARP Request
            - 6 : Inverse ARP Reply

       -y target IP address
            The IP address of the target host.

       -yR  Use a random target host IP address.

       -Y target ethernet address
            The ethernet (hardware) address of the target host.

       -YR  Usage a random target host ethernet address.

       -x sender IP address
            The IP address of the sender host.

       -xR  Use a random sender host IP address.

       -X sender ethernet address
            The ethernet (hardware) address of the sender host.

       -XR  Usage a random sender host ethernet address.

ETHERNET HEADER OPTIONS
       This section documents the Ethernet header command-line options.

       -e src ethernet address
            The ethernet (hardware) address the packet will appear to come
            from.

       -eR  Use a random source ethernet address.

            If you define this, you will most likely need to define the
            destination ethernet header value as well. When using either -e or
            -E, you enable link level packet injection and enable link level
            packet injection and the destination cannot be auto-defined while
            injecting in this manner.

       -E dst ethernet address
            The ethernet (hardware) of the next routable interface the packet
            will cross while making it's way to the destination.

       -ER  Use a random destination ethernet address.

       The following two rules should be followed if you actually want the destination to receive to receive the packets you're sending:

       1)   If the destination exists beyond your default route (gateway),
            the destination ethernet address should be set to the default
            routes address should be set to the default routes ethernet
            address. This can typically be found by using the arp(8) command.

       2)   If the destination exists on your subnet, the destination
            ethernet address should be set to its ethernet address. This
            can typically be found by using the arp command.

PACKET CAPTURE EXAMPLES
       To print all TCP communications that doesn't revolve around SSH (port 22).
            packit -m cap 'tcp and not port 22'

       To  print  the start and end packets (the SYN and FIN  pack- ets)  of  each  TCP conversation that involves a non-local host, don't resolve
       addresses and display hex/ascii dump of the packet.

            packit -m cap -nX 'tcp[tcpflags] & (tcp-syn|tcp-fin) != 0
                   and not src and dst net localnet'

       To write the first 10 ICMP packets captured to a file.

            packit -m cap -c 10 -w /tmp/mylog 'icmp'

PACKET INJECTION EXAMPLES
       IMPORTANT: The ethernet address 'f:00:d:f:00:d' in these examples is a mock representation of the ethernet address of my default route.  In
       order for these examples to work properly, you would need to change it to your correct default route ethernet address.

       Inject 10 ICMP type 8 (echo request) packets from host '3.1.33.7' to host '192.168.0.1' and watch for a response.

            packit -t icmp -s 3.1.33.7 -d 192.168.0.1 -c 10 -h

       Inject an ICMP type 18 (mask reply) packet with an ICMP id of 211 and an address mask of 255.255.255.0.

            packit -t icmp -K 18 -d 127.0.0.1 -N 211 -G 255.255.255.0

       Inject  5  TCP  packets  from  random  hosts  to  'www.microsoft.com' with the SYN flag set, a window size of 666, a random source ethernet
       address, a destination ethernet address of f:00:d:f:00:d, with a payload of "HI BILL", displaying each packet injected.

            packit -sR -d www.microsoft.com -F S -c 5 -W 666
                   -eR -E f:00:d:f:00:d -p 'HI BILL' -v

       Inject a total of 1000 TCP packets in 20 packet per second bursts from 192.168.0.1 on port 403 to 192.168.0.20 on port 80 with the SYN  and
       RST flags set, a sequence number of 12345678910 and a source ethernet address of 0:0:0:0:0:0.

            packit -s 192.168.0.1 -d 192.168.0.20 -S 403 -D 80
                   -F SR -q 12345678910 -c 1000 -b 20 -e 0:0:0:0:0:0

       Inject a TCP packets from 10.22.41.6 to 172.16.1.3 on ports ranging from 1-1024 with the SYN flag set and display each packet we send.

            packit -s 10.22.41.6 -d 172.16.1.3 -D 1-1024 -F S -v

       Inject  a broadcast ARP reply stating that 4.3.2.1 is at 5:4:3:2:1:0. Also, spoof the source ethernet adddress for a little more authentic‐
       ity and supply the payload in hex.

            packit -t arp -A 2 -x 4.3.2.1 -X 5:4:3:2:1:0 -e 5:4:3:2:1:0
                   -p '0x 70 61 63 6B 69 74'

TRACE ROUTE EXAMPLES
       Appear as a DNS response by using a UDP source port of 53 (DNS)

            packit -m trace -t UDP -d 192.168.2.35 -S 53

       Appear as HTTP traffic by using TCP port 80

            packit -m trace -t TCP -d www.google.com -S 80 -FS

SEE ALSO
       pcap(3), bpf(4), libnet(3), tcpdump(1)

BUGS
       Due to limitations in some versions of *BSD, specifying arbitrary ethernet and/or ARP header data may not be supported.

       ARP capture data is incomplete.

       Like  this  man  page,  packit  is  still  very  much  a  work  in  progress.   Please  send  bug  reports,  questions   or   requests   to
       dbounds@intrusense.com.

AUTHOR
       Darren Bounds <dbounds@intrusense.com>

       The latest version can be found at:
              http://packetfactory.openwall.net/projects/packit

Packit 1.0                                                          10 20 2002                                                           PACKIT(8)
