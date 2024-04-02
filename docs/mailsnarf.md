MAILSNARF(8)                                                  System Manager's Manual                                                 MAILSNARF(8)

NAME
       mailsnarf - sniff mail messages in Berkeley mbox format

SYNOPSIS
       mailsnarf [-i interface | -p pcapfile] [[-v] pattern [expression]]

DESCRIPTION
       mailsnarf  outputs  e-mail  messages  sniffed  from  SMTP  and POP traffic in Berkeley mbox format, suitable for offline browsing with your
       favorite mail reader (mail(1), pine(1), etc.).

OPTIONS
       -i interface
              Specify the interface to listen on.

       -p pcapfile
              Process packets from the specified PCAP capture file instead of the network.

       -v     "Versus" mode. Invert the sense of matching, to select non-matching messages.

       pattern
              Specify regular expression for message header/body matching.

       expression
              Specify a tcpdump(8) filter expression to select traffic to sniff.

SEE ALSO
       dsniff(8), mail(1), pine(1)

AUTHOR
       Dug Song <dugsong@monkey.org>

                                                                                                                                      MAILSNARF(8)
