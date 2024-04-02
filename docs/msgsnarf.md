MSGSNARF(8)                                                   System Manager's Manual                                                  MSGSNARF(8)

NAME
       msgsnarf - sniff chat messages

SYNOPSIS
       msgsnarf [-i interface | -p pcapfile] [[-v] pattern [expression]]

DESCRIPTION
       msgsnarf records selected messages from AOL Instant Messenger, ICQ 2000, IRC, MSN Messenger, or Yahoo Messenger chat sessions.

OPTIONS
       -i interface
              Specify the interface to listen on.

       -p pcapfile
              Process packets from the specified PCAP capture file instead of the network.

       -v     "Versus" mode. Invert the sense of matching, to select non-matching messages.

       pattern
              Specify regular expression for message matching.

       expression
              Specify a tcpdump(8) filter expression to select traffic to sniff.

SEE ALSO
       dsniff(8)

AUTHOR
       Dug Song <dugsong@monkey.org>

                                                                                                                                       MSGSNARF(8)
