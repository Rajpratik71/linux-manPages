ISOTPSNIFFER(1)                                                    User Commands                                                   ISOTPSNIFFER(1)

NAME
       isotpsniffer - manual page for isotpsniffer 2018.02.0-1~ubuntu16.04.1~ppa1

SYNOPSIS
       isotpsniffer [options] <CAN interface>

DESCRIPTION
       isotpsniffer - dump ISO15765-2 datagrams using PF_CAN isotp protocol.

OPTIONS
       -s <can_id>
              (source can_id. Use 8 digits for extended IDs)

       -d <can_id>
              (destination can_id. Use 8 digits for extended IDs)

       -x <addr>
              (extended addressing mode)

       -X <addr>
              (extended addressing mode - rx addr)

       -c     (color mode)

       -t <type>
              (timestamp: (a)bsolute/(d)elta/(z)ero/(A)bsolute w date)

       -f <format>
              (1 = HEX, 2 = ASCII, 3 = HEX & ASCII - default: 3)

       -h <len>
              (head: print only first <len> bytes)

       CAN IDs and addresses are given and expected in hexadecimal values.

isotpsniffer 2018.02.0-1~ubuntu16.04.1~ppa1                        October 2018                                                    ISOTPSNIFFER(1)
