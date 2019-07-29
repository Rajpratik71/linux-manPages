FLOW6(1)                                                      General Commands Manual                                                     FLOW6(1)

NAME
       flow6 - A security assessment tool for the IPv6 Flow Label field

SYNOPSIS
       flow6 [-i INTERFACE] -d DST_ADDR [-S LINK_SRC_ADDR] [-D LINK_DST_ADDR] [-s SRC_ADDR[/LEN]] [-A HOP_LIMIT] [-P PROTOCOL] [-p PORT] [-W] [-v]
       [-h]

DESCRIPTION
       flow6 performs a security assessment of the Flow Label generation policy of a target node. It is part of the SI6 Networks' IPv6 Toolkit:  a
       security assessment suite for the IPv6 protocols.

       flow6 sends a number of probe packets to the target node, and samples the Flow Label values of the corresponding response packets. Based on
       the sampled values, it tries to infer the Flow Label generation policy of the target.

       The tool will first send a number of probe packets from single IPv6 address, such that the per-destination policy is determined.  The  tool
       will then send probe packets from random IPv6 addresses (from the same prefix as the first probes) such that the "global" Flow Label gener‐
       ation policy can be determined.

       The tool computes the expected value and the standard deviation of the difference between consecutive-sampled Flow Label values  (Labeln  -
       Labeln-1) with the intent of inferring the Flow Label generation algorithm of the target node.

       If the standard deviation of [Labeln - Labeln-1] is 0, the Flow Label is assumed to be set to a constant value, and the corresponding value
       is informed to the user. For small values of the standard deviation, the Flow Label is assumed to be  a  monotonically-increasing  function
       with  increments  of  the  "expected  value", and such "expected value" together with the standard deviation, are informed to the user. For
       large values of the standard deviation, the Flow Label is assumed to be randomized, and the  expected  value  and  standard  deviation  are
       informed to the user, as indicators of the "quality" of the Flow Label generation algorithm.

OPTIONS
       flow6  takes it parameters as command-line options. Each of the options can be specified with a short name (one character preceded with the
       hyphen character, as e.g. "-i") or with a long name (a string preceded with two hyphen characters, as e.g. "--interface").

       -i INTERFACE, --interface INTERFACE
              This option specifies the network interface that the tool will use. If  the  destination  address  ("-d"  option)  is  a  link-local
              address,  the  interface must be explicitly specified. The interface may also be specified alon with a destination address, with the
              "-d" option.

       -s SRC_ADDR, --src-address SRC_ADDR

              This option specifies the IPv6 source address (or IPv6 prefix) to be used for the Source Address of the probe packets.  If  an  IPv6
              prefix is specified, the IPv6 Source Address of the ICMPv6 packets will be randomized from that prefix.

       -d DST_ADDR, --dst-address DST_ADDR

              This option specifies the IPv6 Destination Address of the target node. This option cannot be left unspecified.

       -A HOP_LIMIT, --hop-limit HOP_LIMIT

              This option specifies the Hop Limit to be used for the IPv6 packets. By default, the Hop Limit is randomized.

       -S SRC_LINK_ADDR, --src-link-address SRC_LINK_ADDR

              This  option  specifies the link-layer Source Address of the probe packets (currently, only Ethernet is supported). If left unspeci‐
              fied, the link-layer Source Address of the packets is set to the real link-layer address of the network interface.

       -D DST_LINK_ADDR, --dst-link-address DST_LINK_ADDR

              This option specifies the link-layer Destination Address of the probe packets (currently, only Ethernet is supported).  By  default,
              the link-layer Destination Address is automatically set to the link-layer address of the destination host (for on-link destinations)
              or to the link-layer address of the first-hop router.

       -P PROTOCOL, --protocol PROTOCOL

              This option specifies the protocol type of the probe packets. Currently, both "UDP" and "TCP" are supported. If this option is  left
              unspecified, the protocol type defaults to "TCP".

       -p PORT, --dst-port PORT

              This option specifies the Destination Port of the probe packets. If left unspecified, the Destination Port defaults to "80" when the
              IPv6 payload is TCP, and to 53 if the IPv6 payload is UDP.

              Note: Since it is vital for the tool to receive response packets to be able to infer the Flow Label algorithm  of  the  target,  the
              protocol type and Destination Port should be carefully selected (i.e., the corresponding protocol and Destination Port should not be
              filter, and the target should respond to packets sent to that protocol/port).

       -W, --flow-label-policy
              This option instructs the tool to determine the Flow Label generation policy. As of this version of the tool, this  option  must  be
              specified.

       -v, --verbose

              This  option  instructs the flow6 tool to be verbose.  If this option is set twice, the tool is "very verbose", and outputs the sam‐
              pled Flow Label values (in addition to other information).

       -h, --help

              Print help information for the flow6 tool.

EXAMPLES
       The following sections illustrate typical use cases of the flow6 tool.

       Example #1

       # flow6 -i eth0 --flow-label-policy -d fe80::1 -v

       Assess the Flow Label generation policy of the host "fe80::1", using the network interface "eth0". Probe packets are TCP segments  directed
       to  port 80 (default). Be verbose. In this example, since the IPv6 destination address is a link-local address, the network interface ccard
       must be explicitly specified.

       Example #2

       # flow6 -d 2001:db8::1 --flow-label-policy -P TCP -p 22 -vv

       Assess the Flow Label generation policy of the host "2001:db8::1". Probe packets are TCP segments directed to  port  22.  Be  very  verbose
       (i.e., list the sampled Flow Label values).

AUTHOR
       The   flow6   tool  and  the  corresponding  manual  pages  were  produced  by  Fernando  Gont  <fgont@si6networks.com>  for  SI6  Networks
       <http://www.si6networks.com>.

COPYRIGHT
       Copyright (c) 2011-2013 Fernando Gont.

       Permission is granted to copy, distribute and/or modify this document under the terms of the GNU Free Documentation License, Version 1.3 or
       any  later version published by the Free Software Foundation; with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.  A
       copy of the license is available at <http://www.gnu.org/licenses/fdl.html>.

                                                                                                                                          FLOW6(1)
