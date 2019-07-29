L2TEST(1)                                                     General Commands Manual                                                    L2TEST(1)

NAME
       l2test - L2CAP testing

SYNOPSIS
       l2test

DESCRIPTION
       l2test is L2CAP testing program.

USAGE
       l2test <mode> [options] [bdaddr]

       Modes:
         -r listen and receive
         -w listen and send
         -d listen and dump incoming data
         -x listen, then send, then dump incoming data
         -s connect and send
         -u connect and receive
         -n connect and be silent
         -y connect, then send, then dump incoming data
         -c connect, disconnect, connect, ...
         -m multiple connects
         -p trigger dedicated bonding
         -z information request

       Options:
         [-b bytes] [-i device] [-P psm] [-J cid]
         [-I imtu] [-O omtu]
         [-L seconds] enable SO_LINGER
         [-W seconds] enable deferred setup
         [-B filename] use data packets from file
         [-N num] send num frames (default = infinite)
         [-C num] send num frames before delay (default = 1)
         [-D milliseconds] delay after sending num frames (default = 0)
         [-X mode] select retransmission/flow-control mode
         [-Q num] Max Transmit value (default = 3)
         [-Z size] Transmission Window size (default = 63)
         [-F fcs] use CRC16 check (default = 1)
         [-R] reliable mode
         [-G] use connectionless channel (datagram)
         [-U] use sock stream
         [-A] request authentication
         [-E] request encryption
         [-S] secure connection
         [-M] become master
         [-T] enable timestamps

AUTHOR
       This manual page was written by Nobuhiro Iwamatsu <iwamatsu@debian.org>, for the Debian GNU/Linux system (but may be used by others).

                                                                   January 2012                                                          L2TEST(1)
