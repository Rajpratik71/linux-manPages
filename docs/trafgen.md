TRAFGEN(8)                                                      netsniff-ng toolkit                                                     TRAFGEN(8)

NAME
       trafgen - a fast, multithreaded network packet generator

SYNOPSIS
       trafgen [options] [packet]

DESCRIPTION
       trafgen  is  a  fast,  zero-copy  network  traffic  generator for debugging, performance evaluation, and fuzz-testing. trafgen utilizes the
       packet(7) socket interface of Linux which postpones complete control over packet data and packet headers into the user space. It has a pow‐
       erful packet configuration language, which is rather low-level and not limited to particular protocols.  Thus, trafgen can be used for many
       purposes. Its only limitation is that it cannot mimic full streams resp. sessions. However, it is very useful for  various  kinds  of  load
       testing in order to analyze and subsequently improve systems behaviour under DoS attack scenarios, for instance.

       trafgen is Linux specific, meaning there is no support for other operating systems, same as netsniff-ng(8), thus we can keep the code foot‐
       print quite minimal and to the point. trafgen makes use of packet(7) socket's TX_RING interface of the Linux kernel, which is a  mmap(2)'ed
       ring buffer shared between user and kernel space.

       By  default, trafgen starts as many processes as available CPUs, pins each of them to their respective CPU and sets up the ring buffer each
       in their own process space after having compiled a list of packets to transmit. Thus, this is likely the fastest one can get out of the box
       in  terms  of  transmission  performance from user space, without having to load unsupported or non-mainline third-party kernel modules. On
       Gigabit Ethernet, trafgen has a comparable performance to pktgen, the built-in Linux kernel traffic generator, except that trafgen is  more
       flexible  in terms of packet configuration possibilities. On 10-Gigabit-per-second Ethernet, trafgen might be slower than pktgen due to the
       user/kernel space overhead but still has a fairly high performance for out of the box kernels.

       trafgen has the potential to do fuzz testing, meaning a packet configuration can be built with random numbers on all or certain packet off‐
       sets  that  are  freshly generated each time a packet is sent out. With a built-in IPv4 ping, trafgen can send out an ICMP probe after each
       packet injection to the remote host in order to test if it is still responsive/alive. Assuming there is no  answer  from  the  remote  host
       after  a certain threshold of probes, the machine is considered dead and the last sent packet is printed together with the random seed that
       was used by trafgen. You might not really get lucky fuzz-testing the Linux kernel, but presumably there are  buggy  closed-source  embedded
       systems or network driver's firmware files that are prone to bugs, where trafgen could help in finding them.

       trafgen's  configuration  language  is  quite  powerful,  also due to the fact, that it supports C preprocessor macros. A stddef.h is being
       shipped with trafgen for this purpose, so that well known defines from Linux kernel or network programming can be reused. After a  configu‐
       ration  file  has passed the C preprocessor stage, it is processed by the trafgen packet compiler. The language itself supports a couple of
       features that are useful when assembling packets, such as built-in runtime checksum support for IP, UDP and TCP. Also it has an  expression
       evaluator  where arithmetic (basic operations, bit operations, bit shifting, ...) on constant expressions is being reduced to a single con‐
       stant on compile time. Other features are ''fill'' macros, where a packet can be filled with n bytes by a constant, a  compile-time  random
       number  or run-time random number (as mentioned with fuzz testing). Also, netsniff-ng(8) is able to convert a pcap file into a trafgen con‐
       figuration file, thus such a configuration can then be further tweaked for a given scenario.

OPTIONS
   -i <cfg|pcap|->, -c <cfg|->, --in <cfg|pcap|->, --conf <cfg|->
       Defines the input configuration file that can either be passed as a normal plain text file or via stdin (''-''). Note that currently, if  a
       configuration  is passed through stdin, only 1 CPU will be used.  It is also possible to specify PCAP file with .pcap extension via -i,--in
       option, by default packets will be sent at rate considering timestamp from PCAP file which might be reset via -b/-t options.

   -o <dev|.pcap|.cfg>, -d <dev|.pcap|.cfg>, --out <dev|.pcap|.cfg>, --dev <dev|.pcap|.cfg>
       Defines the outgoing networking device such as eth0, wlan0 and others or a *.pcap or *.cfg file. Pcap and configuration files  are  identi‐
       fied by extension.

   -p, --cpp
       Pass  the  packet  configuration to the C preprocessor before reading it into trafgen. This allows #define and #include directives (e.g. to
       include definitions from system headers) to be used in the trafgen configuration file.

   -D <name>=<definition>, --define <name>=<definition>
       Add macro definition for the C preprocessor to use it within trafgen file. This option is used in combination with the -p,--cpp option.

   -J, --jumbo-support
       By default trafgen's ring buffer frames are of a fixed size of 2048 bytes.  This means that if you're expecting jumbo frames or even  super
       jumbo frames to pass your line, then you will need to enable support for that with the help of this option. However, this has the disadvan‐
       tage of a performance regression and a bigger memory footprint for the ring buffer.

   -R, --rfraw
       In case the output networking device is a wireless device, it is possible with trafgen to turn this into monitor mode and create  a  mon<X>
       device  that trafgen will be transmitting on instead of wlan<X>, for instance. This enables trafgen to inject raw 802.11 frames. In case if
       the output is a pcap file the link type is set to 127 (ieee80211 radio tap).

   -s <ipv4>, --smoke-test <ipv4>
       In case this option is enabled, trafgen will perform a smoke test. In other words, it will probe the remote end,  specified  by  an  <ipv4>
       address,  that  is being ''attacked'' with trafgen network traffic, if it is still alive and responsive. That means, after each transmitted
       packet that has been configured, trafgen sends out ICMP echo requests and waits for an answer before it continues.  In case the remote  end
       stays unresponsive, trafgen assumes that the machine has crashed and will print out the content of the last packet as a trafgen packet con‐
       figuration and the random seed that has been used in order to reproduce a possible bug. This  might  be  useful  when  testing  proprietary
       embedded devices. It is recommended to have a direct link between the host running trafgen and the host being attacked by trafgen.

   -n <0|uint>, --num <0|uint>
       Process  a  number  of  packets  and then exit. If the number of packets is 0, then this is equivalent to infinite packets resp. processing
       until interrupted.  Otherwise, a number given as an unsigned integer will limit processing.

   -r, --rand
       Randomize the packet selection of the configuration file. By default, if more than one packet is defined in a packet configuration, packets
       are scheduled for transmission in a round robin fashion. With this option, they are selected randomly instread.

   -P <uint>, --cpus <uint>
       Specify  the number of processes trafgen shall fork(2) off. By default trafgen will start as many processes as CPUs that are online and pin
       them to each, respectively. Allowed value must be within interval [1,CPUs].

   -t <time>, --gap <time>
       Specify a static inter-packet timegap in seconds, milliseconds, microseconds, or nanoseconds: ''<num>s/ms/us/ns''. If no postfix  is  given
       default to microseconds. If this option is given, then instead of packet(7)'s TX_RING interface, trafgen will use sendto(2) I/O for network
       packets, even if the <time> argument is 0. This option is useful for a couple of reasons: i) comparison between sendto(2) and TX_RING  per‐
       formance,  ii)  low-traffic  packet probing for a given interval, iii) ping-like debugging with specific payload patterns. Furthermore, the
       TX_RING interface does not cope with interpacket gaps.

   -b <rate>, --rate <rate>
       Specify the packet send rate <num>pps/B/kB/MB/GB/kbit/Mbit/Gbit/KiB/MiB/GiB units.  Like with the -t,--gap option, the packets are sent  in
       slow mode.

   -S <size>, --ring-size <size>
       Manually  define  the TX_RING resp. TX_RING size in ''<num>KiB/MiB/GiB''. On default the size is being determined based on the network con‐
       nectivity rate.

   -E <uint>, --seed <uint>
       Manually set the seed for pseudo random number generator (PRNG) in trafgen. By default, a random seed from /dev/urandom  is  used  to  feed
       glibc's  PRNG.  If that fails, it falls back to the unix timestamp. It can be useful to set the seed manually in order to be able to repro‐
       duce a trafgen session, e.g. after fuzz testing.

   -u <uid>, --user <uid> resp. -g <gid>, --group <gid>
       After ring setup, drop privileges to a non-root user/group combination.

   -H, --prio-high
       Set this process as a high priority process in order to achieve a higher scheduling rate resp. CPU time. This is however  not  the  default
       setting, since it could lead to starvation of other processes, for example low priority kernel threads.

   -A, --no-sock-mem
       Do not change systems default socket memory setting during testrun.  Default is to boost socket buffer memory during the test to:

          /proc/sys/net/core/rmem_default:4194304
          /proc/sys/net/core/wmem_default:4194304
          /proc/sys/net/core/rmem_max:104857600
          /proc/sys/net/core/wmem_max:104857600

   -Q, --notouch-irq
       Do not reassign the NIC's IRQ CPU affinity settings.

   -q, --qdisc-path
       Since  Linux  3.14,  the  kernel supports a socket option PACKET_QDISC_BYPASS, which trafgen enables by default.  This options disables the
       qdisc bypass, and uses the normal send path through the kernel's qdisc (traffic control) layer, which can be usefully for testing the qdisc
       path.

   -V, --verbose
       Let trafgen be more talkative and let it print the parsed configuration and some ring buffer statistics.

   -e, --example
       Show a built-in packet configuration example. This might be a good starting point for an initial packet configuration scenario.

   -C, --no-cpu-stats
       Do not print CPU time statistics on exit.

   -v, --version
       Show version information and exit.

   -h, --help
       Show user help and exit.

SYNTAX
       trafgen's  packet  configuration  syntax is fairly simple. The very basic things one needs to know is that a configuration file is a simple
       plain text file where packets are defined. It can contain one or more packets. Packets are enclosed by opening '{' and closing '}'  braces,
       for example:

          { /* packet 1 content goes here ... */ }
          { /* packet 2 content goes here ... */ }

       Alternatively, packets can also be specified directly on the command line, using the same syntax as used in the configuration files.

       When  trafgen  is  started  using  multiple  CPUs  (default),  then each of those packets will be scheduled for transmission on all CPUs by
       default. However, it is possible to tell trafgen to schedule a packet only on a particular CPU:

          cpu(1): { /* packet 1 content goes here ... */ }
          cpu(2-3): { /* packet 2 content goes here ... */ }

       Thus, in case we have a 4 core machine with CPU0-CPU3, packet 1 will be scheduled only on CPU1, packet 2 on CPU2 and CPU3. When using traf‐
       gen with --num option, then these constraints will still be valid and the packet is fairly distributed among those CPUs.

       Packet content is delimited either by a comma or whitespace, or both:

          { 0xca, 0xfe, 0xba 0xbe }

       Packet content can be of the following:

          hex bytes:   0xca, xff
          decimal:     42
          binary:      0b11110000, b11110000
          octal:       011
          character:   'a'
          string:      "hello world"
          shellcode:   "\x31\xdb\x8d\x43\x17\x99\xcd\x80\x31\xc9"

       Thus,  a  quite  useless  packet configuration might look like this (one can verify this when running this with trafgen in combination with
       -V):

          { 0xca, 42, 0b11110000, 011, 'a', "hello world",
            "\x31\xdb\x8d\x43\x17\x99\xcd\x80\x31\xc9" }

       There are a couple of helper functions in trafgen's language to make life easier to write configurations:

       i) Fill with garbage functions:

          byte fill function:      fill(<content>, <times>): fill(0xca, 128)
          compile-time random:     rnd(<times>): rnd(128), rnd()
          runtime random numbers:  drnd(<times>): drnd(128), drnd()
          compile-time counter:    seqinc(<start-val>, <increment>, <times>)
                                   seqdec(<start-val>, <decrement>, <times>)
          runtime counter (1byte): dinc(<min-val>, <max-val>, <increment>)
                                   ddec(<min-val>, <max-val>, <decrement>)

       ii) Checksum helper functions (packet offsets start with 0):

          IP/ICMP checksum:        csumip/csumicmp(<off-from>, <off-to>)
          UDP checksum:            csumudp(<off-iphdr>, <off-udpdr>)
          TCP checksum:            csumtcp(<off-iphdr>, <off-tcphdr>)
          UDP checksum (IPv6):     csumudp6(<off-ip6hdr>, <off-udpdr>)
          TCP checksum (IPv6):     csumtcp6(<off-ip6hdr>, <off-tcphdr>)

       iii) Multibyte functions, compile-time expression evaluation:

          const8(<content>), c8(<content>), const16(<content>), c16(<content>),
          const32(<content>), c32(<content>), const64(<content>), c64(<content>)

          These functions write their result in network byte order into the packet configuration, e.g. const16(0xaa) will  result  in  ''00  aa''.
       Within c*() functions, it is possible to do some arithmetics: -,+,*,/,%,&,|,<<,>>,^ E.g. const16((((1<<8)+0x32)|0b110)*2) will be evaluated
       to ''02 6c''.

       iv) Protocol header functions:
           The protocol header functions allow to fill protocol header fields by using following generic syntax:

               <proto>(<field>=<value>,<field2>=<value2>,...,<field3>,...)

           If a field is not specified, then a default value will be used (usually 0).  Protocol fields might be set in any  order.  However,  the
           offset of the fields in the resulting packet is according to the respective protocol.

           Each  field  might  be set with a function which generates field value at runtime by increment or randomize it. For L3/L4 protocols the
           checksum is calculated automatically if the field was changed dynamically by specified function.  The  following  field  functions  are
           supported:

               dinc - increment field value at runtime. By default increment step is '1'.  min and max parameters are used to increment field only
               in the specified range, by default original field value is used. If the field length is greater than 4 then last 4 bytes are incre‐
               mented only (useful for MAC and IPv6 addresses):

                   <field> = dinc() | dinc(min, max) | dinc(min, max, step)

               drnd - randomize field value at runtime.  min and max parameters are used to randomize field only in the specified range:

                   <field> = drnd() | drnd(min, max)

               Example of using dynamic functions:

               {
                     eth(saddr=aa:bb:cc:dd:ee:ff, saddr=dinc()),
                     ipv4(saddr=dinc()),
                     udp(sport=dinc(1, 13, 2), dport=drnd(80, 100))
               }

           Fields might be further manipulated with a function at a specific offset:

               <field>[<index>] | <field>[<index>:<length>]

                   <index> - relative field offset with range 0..<field.len> - 1

                   <length> - length/size of the value which will be set; either 1, 2 or 4 bytes (default: 1)

               The <index> starts from the field's first byte in network order.

               The syntax is similar to the one used in pcap filters (man pcap-filter) for matching header field at a specified offset.

               Examples of using field offset (showing the effect in a shortenet output from netsniff-ng):

                   1) trafgen -o lo --cpus 1 -n 3 '{ eth(da=11:22:33:44:55:66, da[0]=dinc()), tcp() }'

                       [ Eth MAC (00:00:00:00:00:00 => 11:22:33:44:55:66)

                       [ Eth MAC (00:00:00:00:00:00 => 12:22:33:44:55:66)

                       [ Eth MAC (00:00:00:00:00:00 => 13:22:33:44:55:66)

                   2) trafgen -o lo --cpus 1 -n 3 '{ ipv4(da=1.2.3.4, da[0]=dinc()), tcp() }'

                       [ IPv4 Addr (127.0.0.1 => 1.2.3.4)

                       [ IPv4 Addr (127.0.0.1 => 2.2.3.4)

                       [ IPv4 Addr (127.0.0.1 => 3.2.3.4)

           All required lower layer headers will be filled automatically if they were not specified by the user. The headers will be filled in the
           order they were specified. Each header will be filled with some mimimum required set of fields.

           Supported protocol headers:

           Ethernet : eth(da=<mac>, sa=<mac>, type=<number>)

               da|daddr - Destination MAC address (default: 00:00:00:00:00:00)

               sa|saddr - Source MAC address (default: device MAC address)

               etype|type|prot|proto - Ethernet type (default: 0)

           PAUSE (IEEE 802.3X) : pause(code=<number>, time=<number>)

               code - MAC Control opcode (default: 0x0001)

               time - Pause time (default: 0)

               By default Ethernet header is added with a fields:

                   Ethernet type - 0x8808

                   Destination MAC address - 01:80:C2:00:00:01

           PFC : pfc(pri|prio(<number>)=<number>, time(<number>)=<number>)

               code - MAC Control opcode (default: 0x0101)

               pri|prio - Priority enable vector (default: 0)

               pri|prio(<number>) - Enable/disable (0 - disable, 1 - enable) pause for priority <number> (default: 0)

               time(<number>) - Set pause time for priority <number> (default: 0)

               By default Ethernet header is added with a fields:

                   Ethernet type - 0x8808

                   Destination MAC address - 01:80:C2:00:00:01

           VLAN : vlan(tpid=<number>, id=<number>, dei=<number>, tci=<number>, pcp=<number>, 1q, 1ad)

               tpid|prot|proto - Tag Protocol Identifier (TPID) (default: 0x8100)

               tci - Tag Control Information (TCI) field (VLAN Id + PCP + DEI) (default: 0)

               dei|cfi - Drop Eligible Indicator (DEI), formerly Canonical Format Indicator (CFI) (default: 0)

               pcp - Priority code point (PCP) (default: 0)

               id - VLAN Identifier (default: 0)

               1q - Set 802.1q header (TPID: 0x8100)

               1ad - Set 802.1ad header (TPID: 0x88a8)

           By default, if the lower level header is Ethernet, its EtherType is set to 0x8100 (802.1q).

           MPLS : mpls(label=<number>, tc|exp=<number>, last=<number>, ttl=<number>)

               label|lbl - MPLS label value (default: 0)

               tclass|tc|exp - Traffic Class for QoS field (default: 0)

               last - Bottom of stack S-flag (default: 1 for most last label)

               ttl - Time To Live (TTL) (default: 0)

           By default, if the lower level header is Ethernet, its EtherType is set to 0x8847 (MPLS Unicast). S-flag is set automatically to 1  for
           the last label and resets to 0 if the lower MPLS label was added after.

           ARP   :   arp(htype=<number>,  ptype=<number>,  op=<request|reply|number>,  request,  reply,  smac=<mac>,  sip=<ip4_addr>,  tmac=<mac>,
           tip=<ip4_addr>)

               htype - ARP hardware type (default: 1 [Ethernet])

               ptype - ARP protocol type (default: 0x0800 [IPv4])

               op - ARP operation type (request/reply) (default: request)

               req|request - ARP Request operation type

               reply - ARP Reply operation type

               smac|sha - Sender hardware (MAC) address (default: device MAC address)

               sip|spa - Sender protocol (IPv4) address (default: device IPv4 address)

               tmac|tha - Target hardware (MAC) address (default: 00:00:00:00:00:00)

               tip|tpa - Target protocol (IPv4) address (default: device IPv4 address)

           By default, the ARP operation field is set to request and the Ethernet  destination  MAC  address  is  set  to  the  broadcast  address
           (ff:ff:ff:ff:ff:ff).

           IPv4 : ip4|ipv4(ihl=<number>, ver=<number>, len=<number>, csum=<number>, ttl=<number>, tos=<number>, dscp=<number>, ecn=<number>,
                           id=<number>, flags=<number>, frag=<number>, df, mf, da=<ip4_addr>, sa=<ip4_addr>, prot[o]=<number>)

               ver|version - Version field (default: 4)

               ihl - Header length in number of 32-bit words (default: 5)

               tos - Type of Service (ToS) field (default: 0)

               dscp - Differentiated Services Code Point (DSCP, DiffServ) field (default: 0)

               ecn - Explicit Congestion Notification (ECN) field (default: 0)

               len|length - Total length of header and payload (calculated by default)

               id - IPv4 datagram identification (default: 0)

               flags - IPv4 flags value (DF, MF) (default: 0)

               df - Don't fragment (DF) flag (default: 0)

               mf - More fragments (MF) flag (default: 0)

               frag - Fragment offset field in number of 8 byte blocks (default: 0)

               ttl - Time to live (TTL) field (default: 0)

               csum - Header checksum (calculated by default)

               sa|saddr - Source IPv4 address (default: device IPv4 address)

               da|daddr - Destination IPv4 address (default: 0.0.0.0)

               prot|proto - IPv4 protocol number (default: 0)

           By  default, if the lower level header is Ethernet, its EtherType field is set to 0x0800 (IPv4). If the lower level header is IPv4, its
           protocol field is set to 0x4 (IP-in-IP).

           IPv6 : ip6|ipv6(ver=<number>, class=<number>, flow=<number> len=<number>, nexthdr=<number>, hoplimit=<number>,
                           da=<ip6_addr>, sa=<ip6_addr>)

               ver|version - Version field (default: 6)

               tc|tclass - Traffic class (default: 0)

               fl|flow - Flow label (default: 0)

               len|length - Payload length (calculated by default)

               nh|nexthdr - Type of next header, i.e. transport layer protocol number (default: 0)

               hl|hoplimit|ttl - Hop limit, i.e. time to live (default: 0)

               sa|saddr - Source IPv6 address (default: device IPv6 address)

               da|daddr - Destination IPv6 address (default: 0:0:0:0:0:0:0:0)

           By default, if the lower level header is Ethernet, its EtherType field is set to 0x86DD (IPv6).

           ICMPv4 : icmp4|icmpv4(type=<number>, code=<number>, echorequest, echoreply,  csum=<number>,  mtu=<number>,  seq=<number>,  id=<number>,
           addr=<ip4_addr>)

               type - Message type (default: 0 - Echo reply)

               code - Message code (default: 0)

               echorequest - ICMPv4 echo (ping) request (type: 8, code: 0)

               echoreply - ICMPv4 echo (ping) reply (type: 0, code: 0)

               csum - Checksum of ICMPv4 header and payload (calculated by default)

               mtu - Next-hop MTU field used in 'Datagram is too big' message type (default; 0)

               seq - Sequence number used in Echo/Timestamp/Address mask messages (default: 0)

               id - Identifier used in Echo/Timestamp/Address mask messages (default: 0)

               addr - IPv4 address used in Redirect messages (default: 0.0.0.0)

           Example ICMP echo request (ping):

               { icmpv4(echorequest, seq=1, id=1326) }

           ICMPv6 : icmp6|icmpv6(type=<number>, echorequest, echoreply, code=<number>, csum=<number>)

               type - Message type (default: 0)

               code - Code (default: 0)

               echorequest - ICMPv6 echo (ping) request

               echoreply - ICMPv6 echo (ping) reply

               csum - Message checksum (calculated by default)

           By default, if the lower level header is IPv6, its Next Header field is set to 58 (ICMPv6).

           UDP : udp(sp=<number>, dp=<number>, len=<number>, csum=<number>)

               sp|sport - Source port (default: 0)

               dp|dport - Destination port (default: 0)

               len|length - Length of UDP header and data (calculated by default)

               csum - Checksum field over IPv4 pseudo header (calculated by default)

           By default, if the lower level header is IPv4, its protocol field is set to 0x11 (UDP).

           TCP : tcp(sp=<number>, dp=<number>, seq=<number>, aseq|ackseq=<number>, doff|hlen=<number>, cwr, ece|ecn, urg, ack, psh, rst, syn, fin,
           win|window=<number>, csum=<number>, urgptr=<number>)

               sp|sport - Source port (default: 0)

               dp|dport - Destination port (default: 0)

               seq - Sequence number (default: 0)

               aseq|ackseq - Acknowledgement number (default: 0)

               doff|hlen - Header size (data offset) in number of 32-bit words (default: 5)

               cwr - Congestion Window Reduced (CWR) flag (default: 0)

               ece|ecn - ECN-Echo (ECE) flag (default: 0)

               urg - Urgent flag (default: 0)

               ack - Acknowledgement flag (default: 0)

               psh - Push flag (default: 0)

               rst - Reset flag (default: 0)

               syn - Synchronize flag (default: 0)

               fin - Finish flag (default: 0)

               win|window - Receive window size (default: 0)

               csum - Checksum field over IPv4 pseudo header (calculated by default)

               urgptr - Urgent pointer (default: 0)

           By default, if the lower level header is IPv4, its protocol field is set to 0x6 (TCP).

           Simple example of a UDP Echo packet:

               {
                 eth(da=11:22:33:44:55:66),
                 ipv4(daddr=1.2.3.4)
                 udp(dp=7),
                 "Hello world"
               }

       Furthermore, there are two types of comments in trafgen configuration files:

         1. Multi-line C-style comments:        /* put comment here */
         2. Single-line Shell-style comments:   #  put comment here

       Next to all of this, a configuration can be passed through the C preprocessor before the trafgen compiler gets to see it with option --cpp.
       To give you a taste of a more advanced example, run ''trafgen -e'', fields are commented:

          /* Note: dynamic elements make trafgen slower! */
          #include <stddef.h>

          {
            /* MAC Destination */
            fill(0xff, ETH_ALEN),
            /* MAC Source */
            0x00, 0x02, 0xb3, drnd(3),
            /* IPv4 Protocol */
            c16(ETH_P_IP),
            /* IPv4 Version, IHL, TOS */
            0b01000101, 0,
            /* IPv4 Total Len */
            c16(59),
            /* IPv4 Ident */
            drnd(2),
            /* IPv4 Flags, Frag Off */
            0b01000000, 0,
            /* IPv4 TTL */
            64,
            /* Proto TCP */
            0x06,
            /* IPv4 Checksum (IP header from, to) */
            csumip(14, 33),
            /* Source IP */
            drnd(4),
            /* Dest IP */
            drnd(4),
            /* TCP Source Port */
            drnd(2),
            /* TCP Dest Port */
            c16(80),
            /* TCP Sequence Number */
            drnd(4),
            /* TCP Ackn. Number */
            c32(0),
            /* TCP Header length + TCP SYN/ECN Flag */
            c16((8 << 12) | TCP_FLAG_SYN | TCP_FLAG_ECE)
            /* Window Size */
            c16(16),
            /* TCP Checksum (offset IP, offset TCP) */
            csumtcp(14, 34),
            /* TCP Options */
            0x00, 0x00, 0x01, 0x01, 0x08, 0x0a, 0x06,
            0x91, 0x68, 0x7d, 0x06, 0x91, 0x68, 0x6f,
            /* Data blob */
            "gotcha!",
          }

       Another real-world example by Jesper Dangaard Brouer [1]:

          {
            # --- ethernet header ---
            0x00, 0x1b, 0x21, 0x3c, 0x9d, 0xf8,  # mac destination
            0x90, 0xe2, 0xba, 0x0a, 0x56, 0xb4,  # mac source
            const16(0x0800), # protocol
            # --- ip header ---
            # ipv4 version (4-bit) + ihl (4-bit), tos
            0b01000101, 0,
            # ipv4 total len
            const16(40),
            # id (note: runtime dynamic random)
            drnd(2),
            # ipv4 3-bit flags + 13-bit fragment offset
            # 001 = more fragments
            0b00100000, 0,
            64, # ttl
            17, # proto udp
            # dynamic ip checksum (note: offsets are zero indexed)
            csumip(14, 33),
            192, 168, 51, 1, # source ip
            192, 168, 51, 2, # dest ip
            # --- udp header ---
            # as this is a fragment the below stuff does not matter too much
            const16(48054), # src port
            const16(43514), # dst port
            const16(20),    # udp length
            # udp checksum can be dyn calc via csumudp(offset ip, offset tcp)
            # which is csumudp(14, 34), but for udp its allowed to be zero
            const16(0),
            # payload
            'A',  fill(0x41, 11),
          }

          [1] https://marc.info/?l=linux-netdev&m=135903630614184

       The above example rewritten using the header generation functions:

          {
            # --- ethernet header ---
            eth(da=00:1b:21:3c:9d:f8, da=90:e2:ba:0a:56:b4)
            # --- ip header ---
            ipv4(id=drnd(), mf, ttl=64, sa=192.168.51.1, da=192.168.51.2)
            # --- udp header ---
            udp(sport=48054, dport=43514, csum=0)
            # payload
            'A',  fill(0x41, 11),
          }

USAGE EXAMPLE
   trafgen --dev eth0 --conf trafgen.cfg
       This  is  the most simple and, probably, the most common use of trafgen. It will generate traffic defined in the configuration file ''traf‐
       gen.cfg'' and transmit this via the ''eth0'' networking device. All online CPUs are used.

   trafgen -e | trafgen -i - -o lo --cpp -n 1
       This is an example where we send one packet of the built-in example through the loopback device. The example configuration  is  passed  via
       stdin and also through the C preprocessor before trafgen's packet compiler will see it.

   trafgen --dev eth0 --conf fuzzing.cfg --smoke-test 10.0.0.1
       Read the ''fuzzing.cfg'' packet configuration file (which contains drnd() calls) and send out the generated packets to the ''eth0'' device.
       After each sent packet, ping probe the attacked host with address 10.0.0.1 to check if it's still alive. This also means, that we utilize 1
       CPU only, and do not use the TX_RING, but sendto(2) packet I/O due to ''slow mode''.

   trafgen --dev wlan0 --rfraw --conf beacon-test.txf -V --cpus 2
       As  an  output  device ''wlan0'' is used and put into monitoring mode, thus we are going to transmit raw 802.11 frames through the air. Use
       the
        ''beacon-test.txf'' configuration file, set trafgen into verbose mode and use only 2 CPUs.

   trafgen --dev em1 --conf frag_dos.cfg --rand --gap 1000us
       Use trafgen in sendto(2) mode instead of TX_RING mode and sleep after each sent packet a static timegap for 1000us. Generate  packets  from
       ''frag_dos.cfg'' and select next packets to send randomly instead of a round-robin fashion.  The output device for packets is ''em1''.

   trafgen --dev eth0 --conf icmp.cfg --rand --num 1400000 -k1000
       Send  only  1400000  packets  using  the  ''icmp.cfg'' configuration file and then exit trafgen. Select packets randomly from that file for
       transmission and send them out via ''eth0''. Also, trigger the kernel every 1000us for batching the ring frames from user space (default is
       10us).

   trafgen --dev eth0 --conf tcp_syn.cfg -u `id -u bob` -g `id -g bob`
       Send  out  packets  generated from the configuration file ''tcp_syn.cfg'' via the ''eth0'' networking device. After setting up the ring for
       transmission, drop credentials to the non-root user/group bob/bob.

   trafgen --dev eth0 '{ fill(0xff, 6), 0x00, 0x02, 0xb3, rnd(3), c16(0x0800), fill(0xca, 64) }' -n 1
       Send out 1 invaid IPv4 packet built from command line to all hosts.

NOTE
       trafgen can saturate a Gigabit Ethernet link without problems. As always, of course, this depends on your hardware as well. Not  everywhere
       where it says Gigabit Ethernet on the box, will you reach almost physical line rate!  Please also read the netsniff-ng(8) man page, section
       NOTE for further details about tuning your system e.g. with tuned(8).

       If you intend to use trafgen on a 10-Gbit/s Ethernet NIC, make sure you are using a multiqueue tc(8) discipline, and  make  sure  that  the
       packets you generate with trafgen will have a good distribution among tx_hashes so that you'll actually make use of multiqueues.

       For  introducing bit errors, delays with random variation and more, there is no built-in option in trafgen. Rather, one should reuse exist‐
       ing methods for that which integrate nicely with trafgen, such as tc(8) with its different disciplines, i.e. netem.

       For more complex packet configurations, it is recommended to use high-level scripting for generating trafgen  packet  configurations  in  a
       more automated way, i.e. also to create different traffic distributions that are common for industrial benchmarking:

           Traffic model              Distribution

           IMIX                       64:7,  570:4,  1518:1
           Tolly                      64:55,  78:5,   576:17, 1518:23
           Cisco                      64:7,  594:4,  1518:1
           RPR Trimodal               64:60, 512:20, 1518:20
           RPR Quadrimodal            64:50, 512:15, 1518:15, 9218:20

       The  low-level  nature  of  trafgen makes trafgen rather protocol independent and therefore useful in many scenarios when stress testing is
       needed, for instance. However, if a traffic generator with higher level packet descriptions is desired, netsniff-ng's mausezahn(8)  can  be
       of good use as well.

       For  smoke/fuzz testing with trafgen, it is recommended to have a direct link between the host you want to analyze (''victim'' machine) and
       the host you run trafgen on (''attacker'' machine). If the ICMP reply from the victim fails, we assume that probably  its  kernel  crashed,
       thus  we print the last sent packet together with the seed and quit probing. It might be very unlikely to find such a ping-of-death on mod‐
       ern Linux systems. However, there might be a good chance to find it on some proprietary (e.g. embedded) systems or buggy  driver  firmwares
       that are in the wild. Also, fuzz testing can be done on raw 802.11 frames, of course. In case you find a ping-of-death, please mention that
       you were using trafgen in your commit message of the fix!

BUGS
       For old trafgen versions only, there could occur kernel crashes: we have fixed this bug in the mainline and  stable  kernels  under  commit
       7f5c3e3a8 (''af_packet: remove BUG statement in tpacket_destruct_skb'') and also in trafgen.

       Probably the best is if you upgrade trafgen to the latest version.

LEGAL
       trafgen is licensed under the GNU GPL version 2.0.

HISTORY
       trafgen  was originally written for the netsniff-ng toolkit by Daniel Borkmann. It is currently maintained by Tobias Klauser <tklauser@dis‐
       tanz.ch> and Daniel Borkmann <dborkma@tik.ee.ethz.ch>.

SEE ALSO
       netsniff-ng(8), mausezahn(8), ifpps(8), bpfc(8), flowtop(8), astraceroute(8), curvetun(8)

AUTHOR
       Manpage was written by Daniel Borkmann.

COLOPHON
       This page is part of the Linux netsniff-ng toolkit project. A description of the project, and information  about  reporting  bugs,  can  be
       found at http://netsniff-ng.org/.

Linux                                                              03 March 2013                                                        TRAFGEN(8)
