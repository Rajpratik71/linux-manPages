TESTJ1939(1)                                                       User Commands                                                      TESTJ1939(1)

NAME
       testj1939 - manual page for testj1939 2018.02.0-1~ubuntu16.04.1~ppa1

SYNOPSIS
       testj1939 FROM TO

DESCRIPTION
       testj1939: demonstrate j1939 use

       FROM / TO
              - or [IFACE][:[SA][,[PGN][,NAME]]]

OPTIONS
       -v     Print relevant API calls

       -s[=LEN]
              Initial send of LEN bytes dummy data

       -r     Receive (and print) data

       -e     Echo incoming packets back This atually receives packets

       -c     Issue connect()

       -p=PRIO
              Set priority to PRIO

       -n     Emit 64bit NAMEs in output

       -w[TIME]
              Return after TIME (default 1) seconds

EXAMPLES
       testj1939 can1 20

testj1939 2018.02.0-1~ubuntu16.04.1~ppa1                           October 2018                                                       TESTJ1939(1)
