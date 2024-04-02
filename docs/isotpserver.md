ISOTPSERVER(1)                                                     User Commands                                                    ISOTPSERVER(1)

NAME
       isotpserver - manual page for isotpserver 2018.02.0-1~ubuntu16.04.1~ppa1

SYNOPSIS
       isotpserver -l <port> -s <can_id> -d <can_id> [options] <CAN interface>

OPTIONS
   ip adressing:
       -l <port>
              * (local port for the server)

   isotp adressing:
       -s <can_id>
              * (source can_id. Use 8 digits for extended IDs)

       -d <can_id>
              * (destination can_id. Use 8 digits for extended IDs)

       -x <addr>[:<rxaddr>]
              (extended addressing / opt. separate rxaddr)

       -L <mtu>:<tx_dl>:<tx_flags>
              (link layer options for CAN FD)

   padding:
       -p [tx]:[rx]
              (set and enable tx/rx padding bytes)

       -P <mode>
              (check rx padding for (l)ength (c)ontent (a)ll)

   rx path:
              (config, which is sent to the sender / data source)

       -b <bs>
              (blocksize. 0 = off)

       -m <val>
              (STmin in ms/ns. See spec.)

       -w <num>
              (max. wait frame transmissions)

   tx path:
              (config, which changes local tx settings)

       -t <time ns> (transmit time in nanosecs)

       (* = mandatory option)

       All values except for '-l' and '-t' are expected in hexadecimal values.

isotpserver 2018.02.0-1~ubuntu16.04.1~ppa1                         October 2018                                                     ISOTPSERVER(1)
