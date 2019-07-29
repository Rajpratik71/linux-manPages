JSR(1)                                                             User Commands                                                            JSR(1)

NAME
       jsr - manual page for jsr 2018.02.0-1~ubuntu16.04.1~ppa1

SYNOPSIS
       jsr [OPTION...] SOURCE [DEST]

DESCRIPTION
       jsr: An SAE J1939 send/recv utility

OPTIONS
       -v, --verbose
              Increase verbosity

       -p, --priority=VAL
              J1939 priority (0..7, default 6)

       -S, --serialize
              Strictly serialize outgoing packets

       -s, --size
              Packet size, default autodetected

       SOURCE [IFACE:][NAME|SA][,PGN]

       DEST   [NAME|SA]

jsr 2018.02.0-1~ubuntu16.04.1~ppa1                                 October 2018                                                             JSR(1)
