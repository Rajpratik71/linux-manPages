ISOTPTUN(1)                                                        User Commands                                                       ISOTPTUN(1)

NAME
       isotptun - manual page for isotptun 2018.02.0-1~ubuntu16.04.1~ppa1

SYNOPSIS
       isotptun [options] <CAN interface>

DESCRIPTION
       isotptun - IP over CAN ISO-TP (ISO15765-2) tunnel / proof-of-concept.

       This program creates a Linux tunnel netdevice 'ctunX' and transfers the ethernet frames inside ISO15765-2 (unreliable) datagrams on CAN.

OPTIONS
       -s <can_id>
              (source can_id. Use 8 digits for extended IDs)

       -d <can_id>
              (destination can_id. Use 8 digits for extended IDs)

       -n <name>
              (name of created IP netdevice. Default: 'ctun%d')

       -x <addr>[:<rxaddr>]
              (extended addressing / opt. separate rxaddr)

       -L <mtu>:<tx_dl>:<tx_flags>
              (link layer options for CAN FD)

       -p [tx]:[rx]
              (set and enable tx/rx padding bytes)

       -P <mode>
              (check rx padding for (l)ength (c)ontent (a)ll)

       -t <time ns>
              (transmit time in nanosecs)

       -b <bs>
              (blocksize. 0 = off)

       -m <val>
              (STmin in ms/ns. See spec.)

       -w <num>
              (max. wait frame transmissions.)

       -D     (daemonize to background when tun device created)

       -h     (half duplex mode.)

       -v     (verbose mode. Print symbols for tunneled msgs.)

       CAN  IDs  and addresses are given and expected in hexadecimal values.  Use e.g. 'ifconfig ctun0 123.123.123.1 pointopoint 123.123.123.2 up'
       to create a point-to-point IP connection on CAN.

isotptun 2018.02.0-1~ubuntu16.04.1~ppa1                            October 2018                                                        ISOTPTUN(1)
