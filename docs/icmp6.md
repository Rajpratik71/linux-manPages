ICMP6(1)                                                      General Commands Manual                                                     ICMP6(1)

NAME
       icmp6 - A security assessment tool for attack vectors based on ICMPv6 packets

SYNOPSIS
       icmp6  [-i  INTERFACE]  [-s  SRC_ADDR[/LEN]]  [-d  DST_ADDR]  [-S  LINK_SRC_ADDR]  [-D  LINK-DST-ADDR]  [-c  HOP_LIMIT]  [-y FRAG_SIZE] [-u
       DST_OPT_HDR_SIZE] [-U DST_OPT_U_HDR_SIZE] [-H HBH_OPT_HDR_SIZE] [-t TYPE[:CODE] | -e CODE | -A CODE -V CODE -R CODE] [-r  TARGET_ADDR]  [-x
       PEER_ADDR]   [-c   HOP_LIMIT]   [-m   MTU]   [-O   POINTER]  [-p  PAYLOAD_TYPE]  [-P  PAYLOAD_SIZE]  [-n]  [-a  SRC_PORTL[:SRC_PORTH]]  [-o
       DST_PORTL[:DST_PORTH]] [-X TCP_FLAGS] [-q TCP_SEQ] [-Q TCP_ACK] [-V TCP_URP] [-w TCP_WIN] [-M]  [-j  PREFIX[/LEN]]  [-k  PREFIX[/LEN]]  [-J
       LINK_ADDR] [-K LINK_ADDR] [-b PREFIX[/LEN]] [-g PREFIX[/LEN]] [-B LINK_ADDR] [-G LINK_ADDR] [-f] [-L | -l] [-z] [-v] [-h]

DESCRIPTION
       icmp6  allows the assessment of IPv6 implementations with respect to a variety of attack vectors based on ICMPv6 error messages. It is part
       of the SI6 Networks' IPv6 Toolkit: a security assessment suite for the IPv6 Protocols.

       This tool has two modes of operation: "active" and "listening". In active mode, the tool attacks a specific target without listening to any
       incoming  traffic,  while  in "listening" mode the tool listens to traffic on the local network, and launches an attack in response to such
       traffic. Active mode is employed if an IPv6 Destination Address is specified. "Listening" mode is employed if the "-L" option (or its  long
       counterpart  "--listen")  is  set. If both an attack target and the "-L" option are specified, the attack is launched against the specified
       target, and then the tool enters "listening" mode to respond incoming packets with ICMPv6 error messages.

       The tool supports filtering of incoming packets based on the Ethernet Source Address, the Ethernet Destination  Address,  the  IPv6  Source
       Address,  and the IPv6 Destination Address.  There are two types of filters: "block filters" and "accept filters". If any "block filter" is
       specified, and the incoming packet matches any of those filters, the message is discarded (and thus no ICMPv6 error messages  are  sent  in
       response).  If  any  "accept  filter" is specified, incoming packets must match the specified filters in order for the tool to respond with
       ICMPv6 error messages.

OPTIONS
       icmp6 takes its parameters as command-line options. Each of the options can be specified with a short name (one character preceded with the
       hyphen character, as e.g. "-i") or with a long name (a string preceded with two hyphen characters, as e.g. "--interface").

       The  icmp6  tool supports IPv6 fragmentation, which might be of use to circumvent layer-2 filtering and/or Network Intrusion Detection Sys‐
       tems (NIDS). However, IPv6 fragmentation is not enabled by default, and must be explicitly enabled with the "-y" option.

       -i INTERFACE, --interface INTERFACE
              This option specifies the network interface that the tool will use. If  the  destination  address  ("-d"  option)  is  a  link-local
              address, or the "listening" ("-L") mode is selected, the interface must be explicitly specified. The interface may also be specified
              along with a destination address, with the "-d" option.

       -s SRC_ADDR, --src-address SRC_ADDR

              This option specifies the IPv6 source address (or IPv6 prefix) to be used for the Source Address of the attack packets. If a  prefix
              is  specified, the Source Address is randomly selected from that prefix. If this option is left unspecified, the IPv6 Source Address
              of the attack packets is randomly selected from the prefix ::/0.

       -d DST_ADDR, --dst-address DST_ADDR

              This option specifies the IPv6 Destination Address of the victim. It can be left unspecified only if the  "-L"  option  is  selected
              (that is, if the tool is to operate in "listening" mode).

              When  operating  in "listening" mode ("-L" option), the IPv6 Destination Address is selected according to the IPv6 Source Address of
              the incoming packet.

       -S SRC_LINK_ADDR, --src-link-address SRC_LINK_ADDR

              This option specifies the link-layer Source Address of the attack packets. If left unspecified, the  link-layer  Source  Address  is
              randomized.

       -D DST_LINK_ADDR, --dst-link-address DST_LINK_ADDR

              This  option specifies the link-layer Destination Address of the attack packets. If left unspecified, it is set to that of the local
              router (for non-local destinations) or to that corresponding to the destination host (for local hosts).

              When operating in "listening" mode, the link-layer Destination Address is set to the  link-layer  Source  Address  of  the  incoming
              packet.

       -c HOP_LIMIT, --hop-limit HOP_LIMIT

              This  option specifies the Hop Limit to be used for the Redirect messages. If this option is left unspecified, the Hop Limit is ran‐
              domized to a value between 64 and 243.

       -y SIZE, --frag-hdr SIZE

              This option specifies that the ICMPv6 error messages must be fragmented. The fragment size must be specified as an argument to  this
              option.

       -u HDR_SIZE, --dst-opt-hdr HDR_SIZE

              This  option specifies that a Destination Options header is to be included in the outgoing packet(s). The extension header size must
              be specified as an argument to this option (the header is filled with padding options). Multiple Destination Options headers may  be
              specified by means of multiple "-u" options.

       -U HDR_SIZE, --dst-opt-u-hdr HDR_SIZE

              This option specifies a Destination Options header to be included in the "unfragmentable part" of the outgoing packet(s). The header
              size must be specified as an argument to this option (the header is filled with padding options). Multiple Destination Options head‐
              ers may be specified by means of multiple "-U" options.

       -H HDR_SIZE, --hbh-opt-hdr HDR_SIZE

              This  option  specifies that a Hop-by-Hop Options header is to be included in the outgoing packet(s). The header size must be speci‐
              fied as an argument to this option (the header is filled with padding options). Multiple Hop-by-Hop Options headers may be specified
              by means of multiple "-H" options.

       -t TYPE, --icmp6 TYPE

              This option specifies the Type and Code of the ICMPv6 error message in the form "--icmp6 TYPE:CODE". If left unspecified, the ICMPv6
              error message defaults to "Parameter Problem, Erroneous header field encountered" (Type 4, Code 0).

              Note: Other options (such as "--icmp6-unreachable") provide an alternative for setting the ICMPv6 Type and Code.

       -e, --icmp6-dest-unreach

              This option sets the ICMPv6 Type to "1" (Destination Unreachable), and allows the user to specify  the  ICMPv6  Code,  in  the  form
              "--icmp6-dest-unreach CODE".

              Note: this option is an alternative to the "-t" option for setting the ICMPv6 Type and Code.

       -E, --icmp6-packet-too-big

              This option sets the ICMPv6 Type to "1", and the ICMPv6 Code to "0" (Packet Too Big).

              Note: this option is an alternative to the "-t" option for setting the ICMPv6 Type and Code.

       -A, --icmp6-time-exceeded

              This  option sets the ICMPv6 Type to "3" (Time Exceeded), and allows the user to specify the ICMPv6 Code, in the form "--icmp6-time-
              exceeded CODE".

              Note: this option is an alternative to the "-t" option for setting the ICMPv6 Type and Code.

       -R, --icmp6-param-problem

              This option sets the ICMPv6 Type to "4" (Parameter Problem),  and  allows  the  user  to  specify  the  ICMPv6  Code,  in  the  form
              "--icmp6-param-problem CODE".

              Note: this option is an alternative to the "-t" option for setting the ICMPv6 Type and Code.

       -m MTU, --mtu MTU

              This specifies the value of the "MTU" field of ICMPv6 Packet Too Big error messages.

       -O POINTER, --pointer POINTER

              This option specifies the value of the "Pointer" field of ICMPv6 Parameter Problem error messages.

       -p TYPE, --payload-type TYPE

              This  option  specifies  the  payload  type to be included in the ICMPv6 Payload. Currently supported payloads are "TCP", "UDP", and
              "ICMP6". The payload-type defaults to "TCP".

              When the tool operates in "Listening" mode, this option specifies the type of packets the tool will listen to. In listening mode, an
              additional type can be specified: "IP6"; this will cause the tool to listen to all IPv6 traffic.

       -P SIZE, --payload-size SIZE

              Size  of the payload to be included in the ICMPv6 Payload (with the payload type being specified by the "-p" option). By default, as
              many bytes as possible are included, without exceeding the minimum IPv6 MTU (1280 bytes).

       -n, --no-payload

              This option specifies that no payload should be included within the ICMPv6 error message.

       -C HOP_LIMIT, --ipv6-hlim HOP_LIMIT

              This option specifies the Hop Limit of the IPv6 packet included in the payload of the ICMPv6 error message. If this option  is  left
              unspecified, the Hop Limit is randomized to a value between 64 and  243.

       -r ADDRESS, --target-addr ADDRESS

              This option specifies the Source Address of the IPv6 packet that is embedded in the ICMPv6 error message. If left unspecified, it is
              set to the same address as the IPv6 Destination Address of the outer packet.

              When operating in "Listening mode", the tool automatically embeds a piece of the received packet (unless otherwise specified by  the
              "-n" option), and hence the IPv6 Source Address of the embedded IPv6 packet is set accordingly.

       -x ADDRESS, --peer-addr ADDRESS

              This  option specifies the Destination Address of the IPv6 packet that is embedded in the ICMPv6 error message. If left unspecified,
              it is set to a random value.

              When operating in "Listening mode", the tool automatically embeds a piece of the received packet (unless otherwise specified by  the
              "-n" option), and hence the IPv6 Destination Address of the embedded IPv6 packet is set accordingly.

              Note:  since  the  victim  host is expected to check that the ICMPv6 error message corresponds to an ongoing communication instance,
              when operating in "active mode", this option should be set to a value that corresponds to an ongoing communication instance.

       -o PORT, --target-port PORT

              This option specifies the Source Port of the TCP or UDP packet contained in the ICMPv6 Payload. If a port range is specified in  the
              form "-o LOWPORT:HIGHPORT" the tool will send one ICMPv6 error message for each port in that range.

              Note: This option is meaningful only if "TCP" or "UDP" have been specified (with the "-p" option).

       -a PORT, --peer-port PORT

              This option specifies the Destination Port of the TCP or UDP packet contained in the ICMPv6 Payload. If a port range is specified in
              the form "-o LOWPORT:HIGHPORT" the tool will send one ICMPv6 error message for each port in that range.

              Note: This option is meaningful only if "TCP" or "UDP" have been specified (with the "-p" option).

       -X TCP_FLAGS, --tcp-flags TCP_FLAGS

              This option specifies the flags of the TCP header contained in the ICMPv6 Payload. The flags are specified as "F" (FIN), "S"  (SYN),
              "R" (RST), "P" (PSH), "A" (ACK), "U" (URG), "X" (no flags). If left unspecified, only the "ACK" bit is set.

              Note: This option is meaningful only if "TCP" has been specified (with the "-p" option).

       -q SEQ_NUMBER, --tcp-seq SEQ_NUMBER

              This  option specifies the Sequence Number of the TCP header contained in the ICMPv6 Payload. If left unspecified, the Sequence Num‐
              ber is randomized.

              Note: This option is meaningful only if "TCP" has been specified (with the "-p" option).

       -Q ACK_NUMBER, --tcp-ack ACK_NUMBER

              This option specifies the Acknowledgment Number of the TCP header contained  in  the  ICMPv6   Payload.  If  left  unspecified,  the
              Acknowledgment Number is randomized.

              Note: This option is meaningful only if "TCP" has been specified (with the "-p" option).

       -V URG_POINTER, --tcp-urg URG_POINTER

              This  option specifies the Urgent Pointer of the TCP header contained in the ICMPv6 Payload. If left unspecified, the Urgent Pointer
              is set to 0.

              Note: This option is meaningful only if "TCP" has been specified (with the "-p" option).

       -w TCP_WIN, --tcp-win TCP_WIN

              This option specifies the Window of the TCP header contained in the ICMPv6 Payload. If left unspecified, the Window is randomized.

              Note: This option is meaningful only if "TCP" has been specified (with the "-p" option).

       -j SRC_ADDR, --block-src SRC_ADDR

              This option sets a block filter for the incoming packets, based on their IPv6 Source Address. It allows the specification of an IPv6
              prefix  in  the  form "-j prefix/prefixlen". If the prefix length is not specified, a prefix length of "/128" is selected (i.e., the
              option assumes that a single IPv6 address, rather than an IPv6 prefix, has been specified).

       -k DST_ADDR, --block-dst DST_ADDR

              This option sets a block filter for the incoming Neighbor Solicitation messages, based on their IPv6 Destination Address. It  allows
              the  specification  of  an  IPv6 prefix in the form "-k prefix/prefixlen". If the prefix length is not specified, a prefix length of
              "/128" is selected (i.e., the option assumes that a single IPv6 address, rather than an IPv6 prefix, has been specified).

       -J SRC_ADDR, --block-link-src SRC_ADDR

              This option sets a block filter for the incoming packets, based on their link-layer Source Address. The option must be followed by a
              link-layer address (currently, only Ethernet is supported).

       -K DST_ADDR, --block-link-dst DST_ADDR

              This option sets a block filter for the incoming packets, based on their link-layer Destination Address. The option must be followed
              by a link-layer address (currently, only Ethernet is supported).

       -b SRC_ADDR, --accept-src SRC_ADDR

              This option sets an accept filter for the incoming packets, based on their IPv6 Source Address. It allows the  specification  of  an
              IPv6  prefix  in the form "-b prefix/prefixlen". If the prefix length is not specified, a prefix length of "/128" is selected (i.e.,
              the option assumes that a single IPv6 address, rather than an IPv6 prefix, has been specified).

       -g DST_ADDR, --accept-dst DST_ADDR

              This option sets a accept filter for the incoming packets, based on their IPv6 Destination Address. It allows the  specification  of
              an  IPv6  prefix  in  the  form  "-g prefix/prefixlen". If the prefix length is not specified, a prefix length of "/128" is selected
              (i.e., the option assumes that a single IPv6 address, rather than an IPv6 prefix, has been specified).

       -B SRC_ADDR, --accept-link-src SRC_ADDR

              This option sets an accept filter for the incoming Neighbor Solicitation messages, based on their  link-layer  Source  Address.  The
              option must be followed by a link-layer address (currently, only Ethernet is supported).

       -G DST_ADDR, --accept-link-dst DST_ADDR

              This  option  sets an accept filter for the incoming packets, based on their link-layer Destination Address. The option must be fol‐
              lowed by a link-layer address (currently, only Ethernet is supported).

       -f, --sanity-filters

              This option automatically adds a "block filter" for the IPv6 Source Address of the packets.

              Note: This option may be desirable when the tool operates in "Listening mode" and is instructed to listen to "ICMP6" or "IP6"  pack‐
              ets (thus possibly avoiding packet loops).

       -l, --loop

              This  option instructs the icmp6 tool to send periodic ICMPv6 error messages to the victim node. The amount of time to pause between
              sending ICMPv6 error messages can be specified by means of the "-z" option, and defaults to 1 second. Note that this  option  cannot
              be set in conjunction with the "-L" ("--listen") option.

       -z, --sleep

              This  option  specifies the amount of time to pause between sending ICMPv6 error messages (when the "--loop" option is set). If left
              unspecified, it defaults to 1 second.

       -L, --listen

              This instructs the icmp6 tool to operate in "Listening" mode (possibly after attacking a given node). Note that this  option  cannot
              be used in conjunction with the "-l" ("--loop") option.

       -v, --verbose

              This  option  instructs  the  icmp6 tool to be verbose.  When the option is set twice, the tool is "very verbose", and the tool also
              informs which packets have been accepted or discarded as a result of applying the specified filters.

       -h, --help

              Print help information for the icmp6 tool.

EXAMPLES
       The following sections illustrate typical use cases of the icmp6 tool.

       Example #1

       # icmp6 -i eth0 -L -p TCP -v

       The tool employs the network interface "eth0", and operates in "Listening" mode ("-L" option). Each ICMPv6 error message will  contain  the
       ICMPv6  Payload  as  many  bytes from the captured packet without exceeding the minimum IPv6 MTU (1280 bytes). The tool will print detailed
       information about the attack ("-v" option).

       Example #2

       # icmp6 --icmp6-packet-too-big -p ICMP6 -d 2001:db8:10::1 --peer-addr 2001:db8:11::2 -m 1240 -v

       The tool will send an ICMPv6 Packet Too Big error message that advertises an MTU of 1240 bytes. The ICMPv6 error message will  be  sent  to
       the  address  "  "2001:db8:10::1".  The  ICMPv6  error  message  will  embed  an ICMPv6 Echo Request message with the Source Address set to
       "2001:db8:10::1" (i.e., Destination Address of the error message), and the  Destination  Address  set  to  "2001:db8:11::2)  ("--peer-addr"
       option).  The  value  of  the "Identifier" and "Sequence Number" fields of the embedded ICMPv6 Echo Request message will be randomized. The
       tool will provide detailed information about the attack ("-v" option).

SEE ALSO
       RFC 5927 (available at <http://www.rfc-editor.org/rfc/rfc5927.txt>) and "Security Assessment of the Transmission  Control  Protocol  (TCP)"
       (available  at  <http://www.si6networks.com/publications/tn-03-09-security-assessment-TCP.pdf>)  for a discussion of ICMPv6 attacks against
       TCP.

AUTHOR
       The icmp6 tool and the corresponding manual pages were produced by Fernando Gont <fgont@si6networks.com> for SI6 Networks.

COPYRIGHT
       Copyright (c) 2011-2013 Fernando Gont.

       Permission is granted to copy, distribute and/or modify this document under the terms of the GNU Free Documentation License, Version 1.3 or
       any  later version published by the Free Software Foundation; with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.  A
       copy of the license is available at <http://www.gnu.org/licenses/fdl.html>.

                                                                                                                                          ICMP6(1)
