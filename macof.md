MACOF(8)                                                      System Manager's Manual                                                     MACOF(8)

NAME
       macof - flood a switched LAN with random MAC addresses

SYNOPSIS
       macof [-i interface] [-s src] [-d dst] [-e tha] [-x sport] [-y dport] [-n times]

DESCRIPTION
       macof  floods  the local network with random MAC addresses (causing some switches to fail open in repeating mode, facilitating sniffing). A
       straight C port of the original Perl Net::RawIP macof program by Ian Vitek <ian.vitek@infosec.se>.

OPTIONS
       -i interface
              Specify the interface to send on.

       -s src Specify source IP address.

       -d dst Specify destination IP address.

       -e tha Specify target hardware address.

       -x sport
              Specify TCP source port.

       -y dport
              Specify TCP destination port.

       -n times
              Specify the number of packets to send.

       Values for any options left unspecified will be generated randomly.

SEE ALSO
       dsniff(8)

AUTHOR
       Dug Song <dugsong@monkey.org>

                                                                                                                                          MACOF(8)
