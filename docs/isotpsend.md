ISOTPSEND(1)                                                       User Commands                                                      ISOTPSEND(1)

NAME
       isotpsend - manual page for isotpsend 2018.02.0-1~ubuntu16.04.1~ppa1

SYNOPSIS
       isotpsend [options] <CAN interface>

OPTIONS
       -s <can_id>
              (source can_id. Use 8 digits for extended IDs)

       -d <can_id>
              (destination can_id. Use 8 digits for extended IDs)

       -x <addr>[:<rxaddr>]
              (extended addressing / opt. separate rxaddr)

       -p [tx]:[rx]
              (set and enable tx/rx padding bytes)

       -P <mode>
              (check rx padding for (l)ength (c)ontent (a)ll)

       -t <time ns>
              (frame transmit time (N_As) in nanosecs)

       -f <time ns>
              (ignore FC and force local tx stmin value in nanosecs)

       -D <len>
              (send a fixed PDU with len bytes - no STDIN data)

       -L <mtu>:<tx_dl>:<tx_flags>
              (link layer options for CAN FD)

       CAN IDs and addresses are given and expected in hexadecimal values.  The pdu data is expected on STDIN in space separated ASCII hex values.

isotpsend 2018.02.0-1~ubuntu16.04.1~ppa1                           October 2018                                                       ISOTPSEND(1)
