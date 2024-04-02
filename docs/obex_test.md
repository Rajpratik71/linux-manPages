OBEX_TEST(1)                                                       User commands                                                      OBEX_TEST(1)

NAME
       obex_test - interactive test application for the openobex library

SYNOPSIS
       obex_test [[-s port] | [-r port] | [-i] | [-b [address] [channel]] | [-u interface]]

DESCRIPTION
       obex_test is a test application for the openobex library. It uses an interactive mode but the access method is selcted with command line
       arguments.

       This program is designed to be an example application for the openobex library.

OPTIONS
       -s
           This is the default. It selects cable obex. The port argument is optional (default: /dev/ttyS0)

       -r
           Select cable obex for the Ericsson R320 mobile phone. The port argument is optional (default: /dev/ttyS0)

       -i
           Select obex over IrDA.

       -b
           Select obex over bluetooth. Both, address and channel are actually optional. Default channel is 4, default address is ANY.

       -u
           Select usb obex (CDC). If the interface argument is omitted, a list of available interface is written to stdout.

INTERACTIVE MODE: COMMANDS
       c
           connect to the remote side (client mode)

       d
           disconnect from the remote side

       g
           issue a GET request

       p
           issue a PUT request

       q
           quit the program

       s
           go into server mode

       t
           change the path on the remote side

       x
           issue a PUSH request

AUTHOR
       Hendrik Sattler <post@hendrik-sattler.de>
           initial version of manpage

openobex 1.7.1                                                      05/24/2016                                                        OBEX_TEST(1)
