BLACKHOLE6(1)                                                 General Commands Manual                                                BLACKHOLE6(1)

NAME
       blackhole6 - A tool to find IPv6 blackholes

SYNOPSIS
       blackhole6 DESTINATION [PARAMETERS]

DESCRIPTION
       blackhole6 is a tool to isolate IPv6 blackholes.

       SCRIPTS

       get-mx

       This script takes no further arguments, and operates as follows:

           + The tool reads domain names from standard-input (oner per line),
             and obtains the MX for the corresponding domain.

           + Lines where the first non-blank character is the numeral sign (#)
             are consdered to contain comments, and hence are ignored.

           + The format of the resulting output is:

             # DOMAIN_NAME (CANONIC_NAME)
             MX_RECORD_1
             MX_RECORD_2

       get-ns

       This script takes no further arguments, and operates as follows:

           + The tool reads domain names from standard-input (oner per line),
             and obtains the NS records for the corresponding domain.

           + Lines where the first non-blank character is the numeral sign (#)
             are consdered to contain comments, and hence are ignored.

           + The format of the resulting output is:

             # DOMAIN_NAME (CANONIC_NAME)
             MX_RECORD_1
             MX_RECORD_2

       trace-do8-tcp trace-do8-icmp trace-do256-tcp trace-do256-icmp

       These  scripts  are meant to obtain information about where in the network packets employing IPv6 Extension Headers are being dropped. They
       test the path with IPv6 packets containing TCP or ICMPv6 payloads and a Destination Options Header of 8 or 256 bytes. Based on the obtained
       results, the tool can infer what is the system causing the packet drops.

       trace-hbh8-tcp trace-hbh8-icmp trace-hbh256-tcp trace-hbh256-icmp

       These  scripts  are meant to obtain information about where in the network packets employing IPv6 Extension Headers are being dropped. They
       test the path with IPv6 packets containing TCP or ICMPv6 payloads and a Hop-by-Hop Options Header of 8 or 256 bytes. Based on the  obtained
       results, the tool can infer what is the system causing the packet drops.

       trace-fh256-tcp trace-fh256-icmp

       These  scripts  are meant to obtain information about where in the network packets employing IPv6 Extension Headers are being dropped. They
       test the path with IPv6 packets containing TCP or ICMPv6 payloads resulting in IPv6 fragments of around 256 bytes. Based  on  the  obtained
       results, the tool can infer what is the system causing the packet drops.

       trace-do8-tcp-stdin trace-do8-icmp-stdin trace-do256-tcp-stdin trace-do256-icmp-stdin

       These  scripts  are meant to obtain information about where in the network packets employing IPv6 Extension Headers are being dropped. They
       test the path with IPv6 packets containing TCP or ICMPv6 payloads and a Destination Options Header of 8 or 256 bytes. Based on the obtained
       results,  the  tool  can  infer what is the system causing the packet drops. These tools read one IPv6 address per line form standard input
       and, for each of those addresses, information is printed with the following syntax:

       trace-hbh8-tcp-stdin trace-hbh8-icmp-stdin trace-hbh256-tcp-stdin trace-hbh256-icmp-stdin

       These scripts are meant to obtain information about where in the network packets employing IPv6 Extension Headers are being  dropped.  They
       test  the path with IPv6 packets containing TCP or ICMPv6 payloads and a Hop-by-Hop Options Header of 8 or 256 bytes. Based on the obtained
       results, the tool can infer what is the system causing the packet drops. These tools read one IPv6 address per  line  form  standard  input
       and, for each of those addresses, information is printed with the following syntax:

       trace-fh256-tcp-stdin trace-fh256-icmp-stdin

       These  scripts  are meant to obtain information about where in the network packets employing IPv6 Extension Headers are being dropped. They
       test the path with IPv6 packets containing TCP or ICMPv6 payloads resulting in IPv6 fragments of around 256 bytes. Based  on  the  obtained
       results,  the  tool  can  infer what is the system causing the packet drops. These tools read one IPv6 address per line form standard input
       and, for each of those addresses, information is printed with the following syntax:

       -h, --help

              Print help information for the scan6 tool.

EXAMPLES
       The following sections illustrate typical use cases of the script6 tool.

       Example #1

       # scan6 -i eth0 -L -e -v

       Perform host scanning on the local network ("-L" option) using interface "eth0" ("-i" option). Use both ICMPv6 echo requests  and  unrecog‐
       nized  IPv6  options  of type 10xxxxxx (default). Print link-link layer addresses along with IPv6 addresses ("-e" option). Be verbose ("-v"
       option).

       Example #2

       # scan6 -d 2001:db8::/64 --tgt-virtual-machines all --ipv4-host 10.10.10.0/24

       Scan for virtual machines (both VirtualBox and vmware) in the prefix 2001:db8::/64.  The  additional  information  about  the  IPv4  prefix
       employed by the host system is leveraged to reduce the search space.

       Example #3

       # scan6 -d 2001:db8::/64 --tgt-ipv4-embedded ipv4-32 --ipv4-host 10.10.10.0/24

       Scan for IPv6 addresses of the network 2001:db8::/64 that embed the IPv4 prefix 10.10.10.0/24 (with the 32-bit encoding).

       Example #4

       # scan6 -d 2001:db8:0-500:0-1000

       Scan  for  IPv6  addresses  of the network 2001:db8::/64, varying the two lowest order 16-bit words of the addresses in the range 0-500 and
       0-1000, respectively.

       Example #5

       # scan6 -d fc00::/64 --tgt-vendor 'Dell Inc' -p tcp

       Scan for network devices manufactured by 'Dell Inc' in the target prefix fc00::/64. The tool will employ TCP segments as the probe  packets
       (rather than the default ICMPv6 echo requests).

       Example #6

       # scan6 -i eth0 -L -S 66:55:44:33:22:11 -p unrec -P global -v

       Use  the  "eth0" interface ("-i" option) to perform host-scanning on the local network ("-L" option). The Ethernet Source Address is set to
       "66:55:44:33:22:11" ("-S" option). The probe packets will be IPv6 packets with unrecognized options of type  10xxxxxx  ("-p"  option).  The
       tool will only print IPv6 global addresses ("-P" option). The tool will be verbose.

       Example #7

       # scan6 -d 2001:db8::/64 -w KNOWN_IIDS

       Perform  an  address  scan of a set of known hosts listed in the file KNOWN_IIDS, at remote network 2001:db8::/64. The target addresses are
       obtaining by concatenating the network prefix 2001:db8::/64 with the interface IDs of each of the addresses fund in the file KNOWN_IIDS.

       Example #8

       # scan6 -i eth0 -L -P global --print-unique -e

       Use the "eth0" interface ("-i" option) to perform host-scanning on the local network ("-L" option). Print  only  global  unicast  addresses
       ("-P"  option),  and at most one IPv6 address per Ethernet address ("--print-unique" option). Ethernet addresses will be printed along with
       the corresponiding IPv6 address ("-e" option).

       Example #9

       # scan6 -m knownprefixes.txt -w knowniids.txt -l -z 60 -t -v

       Build the list of targets from the IPv6 prefixes contained in the file 'knownprefixes.txt' and the Interface IDs (IIDs)  contained  in  the
       file  'knowniids.txt'.  Poll the targets periodically ("-l" option), and sleep 60 seconds after each iteration ("-z" option). Print a time‐
       stamp along the IPv6 address of each alive node ("-t" option). Be verbose ("-v" option).

AUTHOR
       The  script6  tool  and  the  corresponding  manual  pages  were  produced  by  Fernando  Gont  <fgont@si6networks.com>  for  SI6  Networks
       <http://www.si6networks.com>.

COPYRIGHT
       Copyright (c) 2014 Fernando Gont.

       Permission is granted to copy, distribute and/or modify this document under the terms of the GNU Free Documentation License, Version 1.3 or
       any later version published by the Free Software Foundation; with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.   A
       copy of the license is available at <http://www.gnu.org/licenses/fdl.html>.

                                                                                                                                     BLACKHOLE6(1)
