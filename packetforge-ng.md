PACKETFORGE-NG(1)                                             General Commands Manual                                            PACKETFORGE-NG(1)

NAME
       packetforge-ng - forge packets: ARP, UDP, ICMP or custom packets.

SYNOPSIS
       packetforge-ng <mode> <options>

DESCRIPTION
       packetforge-ng  is  a tool to create encrypted packets that can subsequently be used for injection. You may create various types of packets
       such as arp requests, UDP, ICMP and custom packets. The most common use is to create ARP requests for subsequent injection.

       To create an encrypted packet, you must have a PRGA (pseudo random genration algorithm) file. This is used to encrypt the packet  you  cre‐
       ate. This is typically obtained from aireplay-ng chopchop or fragmentation attacks.

OPTIONS
       -H, --help
              Shows the help screen.

       -p <fctrl>
              Set frame control word (hex)

       -a <bssid>
              Set Access Point MAC address

       -c <dmac>
              Set Destination MAC address

       -h <smac>
              Set Source MAC address

       -j     set FromDS bit

       -o     clear ToDS bit

       -e     disable WEP encryption

       -k <ip:[port]>
              Set destination IP (and port)

       -l <ip:[port]>
              Set source IP (and port)

       -w <file>
              Write packet to this pcap file

       -r <file>
              Read packet from this pcap file

       -y <file>
              Read PRGA from this file

       -t <ttl>
              Set Time To Live in IP-Header

       -s <size>
              Set size of the generated null packet.

       -0, --arp
              Forge an ARP packet

       -1, --udp
              Forge an UDP packet

       -2, --icmp
              Forge an ICMP packet

       -3, --null
              Forge a llc null packet

       -9, --custom
              Build a custom packet, requires -r to read an unencrypted frame out of a pcap file.

EXAMPLE
       packetforge-ng -y test.xor -a 00:09:5b:12:40:cc -h 00:10:2a:cb:30:14 -k 192.168.1.100 -l 192.168.1.1 -w arp-request.cap

AUTHOR
       This manual page was written by Thomas d'Otreppe.  Permission is granted to copy, distribute and/or modify this document under the terms of
       the GNU General Public License, Version 2 or any later version published by the Free Software Foundation On Debian  systems,  the  complete
       text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

SEE ALSO
       airbase-ng(8)
       aireplay-ng(8)
       airmon-ng(8)
       airodump-ng(8)
       airodump-ng-oui-update(8)
       airserv-ng(8)
       airtun-ng(8)
       besside-ng(8)
       easside-ng(8)
       tkiptun-ng(8)
       wesside-ng(8)
       aircrack-ng(1)
       airdecap-ng(1)
       airdecloak-ng(1)
       airolib-ng(1)
       besside-ng-crawler(1)
       buddy-ng(1)
       ivstools(1)
       kstats(1)
       makeivs-ng(1)
       wpaclean(1)
       airventriloquist(8)

Version 1.5.2                                                      December 2018                                                 PACKETFORGE-NG(1)
