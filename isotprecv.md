ISOTPRECV(1)                                                       User Commands                                                      ISOTPRECV(1)

NAME
       isotprecv - manual page for isotprecv 2018.02.0-1~ubuntu16.04.1~ppa1

SYNOPSIS
       isotprecv [options] <CAN interface>

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

       -b <bs>
              (blocksize. 0 = off)

       -m <val>
              (STmin in ms/ns. See spec.)

       -f <time ns>
              (force rx stmin value in nanosecs)

       -w <num>
              (max. wait frame transmissions.)

       -l     (loop: do not exit after pdu receiption.)

       -L <mtu>:<tx_dl>:<tx_flags>
              (link layer options for CAN FD)

       CAN IDs and addresses are given and expected in hexadecimal values.  The pdu data is written on STDOUT in space separated ASCII hex values.

isotprecv 2018.02.0-1~ubuntu16.04.1~ppa1                           October 2018                                                       ISOTPRECV(1)
