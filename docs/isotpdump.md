ISOTPDUMP(1)                                                       User Commands                                                      ISOTPDUMP(1)

NAME
       isotpdump - manual page for isotpdump 2018.02.0-1~ubuntu16.04.1~ppa1

SYNOPSIS
       isotpdump [options] <CAN interface>

DESCRIPTION
       isotpdump - dump and explain ISO15765-2 protocol CAN frames.

OPTIONS
       -s <can_id>
              (source can_id. Use 8 digits for extended IDs)

       -d <can_id>
              (destination can_id. Use 8 digits for extended IDs)

       -x <addr>
              (extended addressing mode. Use 'any' for all addresses)

       -X <addr>
              (extended addressing mode (rx addr). Use 'any' for all)

       -c     (color mode)

       -a     (print data also in ASCII-chars)

       -t <type>
              (timestamp: (a)bsolute/(d)elta/(z)ero/(A)bsolute w date)

       CAN IDs and addresses are given and expected in hexadecimal values.

isotpdump 2018.02.0-1~ubuntu16.04.1~ppa1                           October 2018                                                       ISOTPDUMP(1)
