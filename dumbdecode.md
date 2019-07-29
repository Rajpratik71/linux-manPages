DUMBDECODE(1)                                               BSD General Commands Manual                                              DUMBDECODE(1)

NAME
     dumbdecode — dump packets in a text-based format

SYNOPSIS
     dumbdecode {-h | -v}
     dumbdecode [-w WIDTH] [FILE ...]

DESCRIPTION
     dumbdecode is a dumb emulation of the Python Network Archæology Toolkit's text-based packet dumper (netarch(3)).

     This script combines several of the NetRE Toolkit utilities in order to produce a text-based, packet display from one or more PCAP files.

     1.   pmerge(1) is used to merge PCAP files, while keeping the packets in order.

     2.   puniq(1) is used to drop any duplicate packets.

     3.   pcat(1) is used to produce a line-based, parsable output from the merged packet captures.

     4.   Finally, along with several bash built-ins and GNU/Linux utilities, unhex(1) produces binary from the hexadecimal payload, and hdng(1)
          produces a variable-width hex dump for each packet's payload.

     The available options are as follows:

     -h      usage information
     -v      the program's version
     -w WIDTH
             data width of the payload hexdump (multiples of 8 work best) [default: the widest multiple of 8 for the current terminal width]
     FILE ...
             the packet capture(s) to display. If FILE is not in libpcap 2.4 format, an attempt is made to convert them to that format, if
             editcap(1) from the Wireshark package is present.  - may be used to read from stdin.

EXAMPLES
           $ dumbdecode one.pcap two.pcap

     Packet UDP4
         192.168.0.142:47529 -> 192.168.0.1:53 (2011-11-29T06:57:37.698367Z)
                    parts: (25!) +25 bytes
     00000000  9a e5 01 00 00 01 00 00  00 00 00 00 01 65 02 63  ┆Üσ☺··☺······☺e☻c┆
     00000010  30 02 63 78 00 00 01 00  01                       ┆0☻cx··☺·☺✘✘✘✘✘✘✘┆
     00000019 bytes

     Packet ICMP4
         192.168.177.160 -> 10.64.11.49 (2012-05-02T11:31:57.529201Z)
                    parts: (56!) +56 bytes
                type/code: 8/0
                   quench: 43ca 0000
     00000000  4f a1 1b 2d 00 08 12 91  08 09 0a 0b 0c 0d 0e 0f  ┆Oí←-·◘↕æ◘○◙♂♀♪♫☼┆
     00000010  10 11 12 13 14 15 16 17  18 19 1a 1b 1c 1d 1e 1f  ┆►◄↕‼¶§▬↨↑↓→←∟↔▲▼┆
     00000020  20 21 22 23 24 25 26 27  28 29 2a 2b 2c 2d 2e 2f  ┆ !"#$%&'()*+,-./┆
     00000030  30 31 32 33 34 35 36 37                           ┆01234567✘✘✘✘✘✘✘✘┆
     00000038 bytes

     Packet TCP4
         192.168.1.15:54567 -> 93.94.83.51:19800 (2013-02-05T18:32:17.101575Z)
                    parts: (0!) +0 bytes
                  seq/ack: 24b4190f/88cf561c
                    flags: ....a...
                     opts: -
     00000000 bytes

SEE ALSO
     pcat(1), pmerge(1), puniq(1), unhex(1), hdng(1)

AUTHORS
     Zephyr ⟨zephyr@dirtbags.net⟩,
     pi-rho ⟨pi-rho@tyr.cx⟩

BUGS
     Bugs may be submitted at ⟨https://bugs.launchpad.net/netre-tools⟩

Network RE Toolkit 1.1337                                        February 1, 2013                                        Network RE Toolkit 1.1337
