NS6(1)                                                        General Commands Manual                                                       NS6(1)

NAME
       ns6 - A security assessment tool for attack vectors based on ICMPv6 Neighbor Solicitation messages

SYNOPSIS
       ns6 [-i INTERFACE] [-s SRC_ADDR[/LEN]] [-d DST_ADDR] [-y FRAG_SIZE] [-u DST_OPT_HDR_SIZE] [-U DST_OPT_U_HDR_SIZE] [-H HBH_OPT_HDR_SIZE] [-S
       LINK_SRC_ADDR] [-D LINK-DST-ADDR] [-E LINK_ADDR] [-e] [-t TARGET_ADDR[/LEN]] [-F N_SOURCES] [-T N_TARGETS] [-z SECONDS] [-l] [-v] [-h]

DESCRIPTION
       ns6 allows the assessment of IPv6 implementations with respect to a variety of attacks based on ICMPv6 Neighbor Solicitation messages. This
       tool is part of the SI6 Networks' IPv6 Toolkit: a security assessment suite for the IPv6 protocols.

OPTIONS
       ns6 The ns6 tool takes its parameters by means of command-line options. Each of the options can be specified with a short name (one charac‐
       ter preceded with the hyphen character, as e.g. "-i") or with a long name (a string preceded with two hyphen characters, as e.g.  "--inter‐
       face").

       Depending on the amount of information (i.e., options) to be conveyed into the Neighbor Solicitations, it may be necessary for the ns6 tool
       to split that information into more than one Neighbor Solicitation message. Also, when the ns6 tool is instructed to flood the victim  with
       Neighbor  Solicitations from different sources ("--flood-sources" option), multiple packets may need to be sent. ns6 supports IPv6 fragmen‐
       tation, which may be of use if a large amount of information needs to be conveyed within a single Neighbor Solicitation message. IPv6 frag‐
       mentation is not enabled by default, and must be explicitly enabled with the "-y" option.

       -i INTERFACE, --interface INTERFACE
              This  option  specifies  the  network  interface  that  the  tool will use. If the destination address ("-d" option) is a link-local
              address, the interface must be explicitly specified. The interface may also be specified along with a destination address, with  the
              "-d" option.

       -s SRC_ADDR, --src-address SRC_ADDR

              This  option  is  meant to specify the IPv6 Source Address to be used for the Neighbor Solicitation messages. If left unspecified, a
              randomized link-local (fe80::/64) address is selected.

       -d DST_ADDR, --dst-address DST_ADDR

              This option specifies the IPv6 Destination Address of the Neighbor Solicitation messages. If this option is  left  unspecified,  but
              the Ethernet Destination Address is specified, the "all-nodes link-local multicast" address (ff02::1) is selected as the IPv6 Desti‐
              nation Address.

       --hop-limit, -A

              This option specifies the IPv6 Hop Limit to be used for the Neighbor Solicitation messages. It defaults to 255. Note that IPv6 nodes
              are required to check that the Hop Limit of incoming Neighbor Solicitation messages is 255. Therefore, this option is only useful to
              assess whether an IPv6 implementation fails to enforce the aforementioned check.

       -y SIZE, --frag-hdr SIZE

              This option specifies that the resulting packet must be fragmented. The fragment size must be  specified  as  an  argument  to  this
              option.

       -u HDR_SIZE, --dst-opt-hdr HDR_SIZE

              This option specifies that a Destination Options header is to be included in the resulting packet. The extension header size must be
              specified as an argument to this option (the header is filled with padding options). Multiple Destination  Options  headers  may  be
              specified by means of multiple "-u" options.

       -U HDR_SIZE, --dst-opt-u-hdr HDR_SIZE

              This  option  specifies a Destination Options header to be included in the "unfragmentable part" of the resulting packet. The header
              size must be specified as an argument to this option (the header is filled with padding options). Multiple Destination Options head‐
              ers may be specified by means of multiple "-U" options. This option is only valid if the "-y" option is specified (as the concept of
              "unfragmentable part" only makes sense when fragmentation is employed).

       -H HDR_SIZE, --hbh-opt-hdr HDR_SIZE

              This option specifies that a Hop-by-Hop Options header is to be included in the resulting packet. The header size must be  specified
              as  an  argument to this option (the header is filled with padding options). Multiple Hop-by-Hop Options headers may be specified by
              means of multiple "-H" options.

       -S SRC_LINK_ADDR, --src-link-address SRC_LINK_ADDR

              This option specifies the link-layer Source Address of the Neighbor Solicitation messages (currently, only Ethernet  is  supported).
              If left unspecified, the link-layer Source Address is randomized.

       -D DST_LINK_ADDR, --dst-link-address DST_LINK_ADDR

              This  option  specifies  the  link-layer Destination Address of the Neighbor Solicitation messages (currently, only Ethernet is sup‐
              ported). If left unspecified, it is set to the address "33:33:00:00:00:01" (the Ethernet address  corresponding  to  the  "all-nodes
              link-local multicast" IPv6 address (ff02::1).

       --target, -t

              This option specifies the IPv6 Target Address of the Neighbor Solicitation messages.

              If the "-T" ("--flood-targets") option is specified, this option specifies an IPv6 prefix in the form "-t prefix/prefixlen". See the
              description of the "-T" option for further information on how the "-t" option is processed in that specific case.

       --source-lla-opt, -E

              This option specifies the contents of a source link-layer address option to be included in the Neighbor  Solicitation  messages.  If
              more  than  one  source link-layer address is specified (by means of multiple "-E" options), and all the resulting options cannot be
              conveyed into a single Neighbor Solicitation, multiple Neighbor Solicitations will be sent as needed.

       --add-slla-opt, -e

              This option instructs the ns6 tool to include a source link-layer address option in  the  Neighbor  Solicitation  messages  that  it
              sends.  The  link-layer  address  included  in  the option is the same as the Ethernet Source Address used for the outgoing Neighbor
              Solicitation messages.

       --flood-sources, -F

              This option instructs the ns6 tool to send Neighbor Solicitations from multiple (and random) IPv6 Source Addresses.  The  number  of
              different  sources  is specified as "-F number". The IPv6 Source Address of the packets are randomly selected from the prefix speci‐
              fied by the "-s" option (which defaults to fe80::/64).

       --flood-targets, -T

              This option instructs the ns6 tool to send Neighbor Solicitation messages for multiple Target Addresses.  The  number  of  different
              Target Addresses is specified as "-T number". The Target Address of each packet is randomly selected from the prefix ::/64, unless a
              different prefix has been specified by means of the "-t" option.

       --loop, -l

              This option instructs the ns6 tool to send periodic Neighbor Solicitations to the victim. The amount of time to pause between  send‐
              ing Neighbor Solicitations can be specified by means of the "-z" option, and defaults to 1 second.

       --sleep, -z

              This  option  instructs  the ns6 tool to the amount of time to pause between sending Neighbor Solicitations. If left unspecified, it
              defaults to 1 second.

       --verbose, -v

              This option instructs the ns6 tool to be verbose.

       --help, -h

              Print help information for the ns6 tool.

EXAMPLES
       The following sections illustrate typical use cases of the ns6 tool.

       Example #1

       # ns6 -i eth0 -d fe80::01 -t 2001:db8::1 -e

       Use the network interface "eth0" to send a Neighbor Solicitation message using a random link-local unicast IPv6 Source Address and a random
       Ethernet  Source  Address,  to  the  IPv6  Destination  address fe80::1 and the Ethernet Destination Address 33:33:00:00:00:01 (selected by
       default). The target of the Neighbor Advertisement is 2001:db8::1. The Neighbor Solicitation also  includes  a  source  link-layer  address
       option, that contains the same Ethernet address as that used for the Ethernet Source Address of the packet.

       Example #2

       # ns6 -i eth0 -s 2001:db8::/32 -t 2001:db8::1 -F 10 -l -z 10 -e -v

       Send  10  Neighbor  Solicitation  messages  using  random  Ethernet  Source  Addresses  and  random  IPv6  Source Addresses from the prefix
       2001:db8::/32, to the Ethernet Destination Address 33:33:00:00:00:01 (default) and the IPv6 Destination Address ff02::1 (default). The IPv6
       Target  Address of the Neighbor Solicitation is 2001:db8::1, and each message includes a source link-layer address option that contains the
       same address as that used for the Ethernet Source Address of the packet. Repeat this operation every ten seconds. Be verbose.

       Example #3

       # ns6 -i eth0 -s 2001:db8::/32 -t 2001:db8::1 -F 10 -l -z 10 -E ff:ff:ff:ff:ff:ff -v

       Send 10 Neighbor Solicitation messages using random Ethernet Source Addresses and random IPv6 Source Addresses from  the  prefix  fe80::/64
       (default,  link-local  unicast),  to  the  Ethernet Destination Address 33:33:00:00:00:01 (default) and the IPv6 Destination Address ff02:1
       (default). The IPv6 Target Address of the Neighbor Solicitation is 2001:db8::1, and each  message  includes  a  source  link-layer  address
       option that contains the Ethernet address ff:ff:ff:ff:ff:ff. Repeat this operation every ten seconds. Be verbose.

SEE ALSO
       "Security/Robustness  Assessment  of  IPv6  Neighbor  Discovery Implementations" (available at: <http://www.si6networks.com/tools/ipv6tool‐
       kit/si6networks-ipv6-nd-assessment.pdf>) for a discussion of Neighbor Discovery vulnerabilities, and additional examples of how to use  the
       na6 tool to exploit them.

AUTHOR
       The ns6 tool and the corresponding manual pages were produced by Fernando Gont <fgont@si6networks.com> for SI6 Networks <http://www.si6net‐
       works.com>.

COPYRIGHT
       Copyright (c) 2011-2013 Fernando Gont.

       Permission is granted to copy, distribute and/or modify this document under the terms of the GNU Free Documentation License, Version 1.3 or
       any  later version published by the Free Software Foundation; with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.  A
       copy of the license is available at <http://www.gnu.org/licenses/fdl.html>.

                                                                                                                                            NS6(1)
