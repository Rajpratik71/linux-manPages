FILESNARF(8)                                                  System Manager's Manual                                                 FILESNARF(8)

NAME
       filesnarf - sniff files from NFS traffic

SYNOPSIS
       filesnarf [-i interface | -p pcapfile] [[-v] pattern [expression]]

DESCRIPTION
       filesnarf saves files sniffed from NFS traffic in the current working directory.

OPTIONS
       -i interface
              Specify the interface to listen on.

       -p pcapfile
              Process packets from the specified PCAP capture file instead of the network.

       -v     "Versus" mode. Invert the sense of matching, to select non-matching files.

       pattern
              Specify regular expression for filename matching.

       expression
              Specify a tcpdump(8) filter expression to select traffic to sniff.

SEE ALSO
       dsniff(8), nfsd(8)

AUTHOR
       Dug Song <dugsong@monkey.org>

                                                                                                                                      FILESNARF(8)
