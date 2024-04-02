WEBSPY(8)                                                     System Manager's Manual                                                    WEBSPY(8)

NAME
       webspy - display sniffed URLs in Netscape in real-time

SYNOPSIS
       webspy [-i interface | -p pcapfile] host

DESCRIPTION
       webspy sends URLs sniffed from a client to your local Netscape browser for display, updated in real-time (as the target surfs, your browser
       surfs along with them, automagically). Netscape must be running on your local X display ahead of time.

OPTIONS
       -i interface
              Specify the interface to listen on.

       -p pcapfile
              Process packets from the specified PCAP capture file instead of the network.

       host   Specify the web client to spy on.

SEE ALSO
       dsniff(8)

AUTHOR
       Dug Song <dugsong@monkey.org>

                                                                                                                                         WEBSPY(8)
