CAPTYPE(1)                          The Wireshark Network Analyzer                          CAPTYPE(1)

NAME
       captype - Prints the types of capture files

SYNOPSIS
       capinfos <infile> ...

DESCRIPTION
       Captypes is a program that opens one or more capture files and prints the capture file type of
       each <infile>.

       Capinfos is able to detect and read the same capture files that are supported by Wireshark.
       The input files don't need a specific filename extension; the file format and an optional gzip
       compression will be automatically detected.  Near the beginning of the DESCRIPTION section of
       wireshark(1) or <https://www.wireshark.org/docs/man-pages/wireshark.html> is a detailed
       description of the way Wireshark handles this, which is the same way Capinfos handles this.

SEE ALSO
       pcap(3), wireshark(1), mergecap(1), editcap(1), tshark(1), dumpcap(1), capinfos(1),
       pcap-filter(7) or tcpdump(8)

NOTES
       Captype is part of the Wireshark distribution.  The latest version of Wireshark can be found at
       <https://www.wireshark.org>.

       HTML versions of the Wireshark project man pages are available at:
       <https://www.wireshark.org/docs/man-pages>.

AUTHORS
         Original Author
         -------- ------
         Ian Schorr           <ian[AT]ianschorr.com>

         Contributors
         ------------
         Gerald Combs         <gerald[AT]wireshark.org>
         Jim Young            <jyoung[AT]gsu.edu>

3.3.0                                         2020-02-07                                    CAPTYPE(1)
