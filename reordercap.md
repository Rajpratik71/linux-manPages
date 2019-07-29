REORDERCAP(1)                                             The Wireshark Network Analyzer                                             REORDERCAP(1)

NAME
       reordercap - Reorder input file by timestamp into output file

SYNOPSIS
       reordercap [ -n ] [ -v ] <infile> <outfile>

DESCRIPTION
       Reordercap is a program that reads an input capture file and rewrites the frames to an output capture file, but with the frames sorted by
       increasing timestamp.

       This functionality may be useful when capture files have been created by combining frames from more than one well-synchronised source, but
       the frames have not been combined in strict time order.

       Reordercap writes the output capture file in the same format as the input capture file.

       Reordercap is able to detect, read and write the same capture files that are supported by Wireshark.  The input file doesn't need a
       specific filename extension; the file format and an optional gzip compression will be detected automatically.  Near the beginning of the
       DESCRIPTION section of wireshark(1) or <https://www.wireshark.org/docs/man-pages/wireshark.html> is a detailed description of the way
       Wireshark handles this, which is the same way reordercap handles this.

OPTIONS
       -n  When the -n option is used, reordercap will not write out the output file if it finds that the input file is already in order.

       -v  Print the version and exit.

SEE ALSO
       pcap(3), wireshark(1), tshark(1), dumpcap(1), editcap(1), mergecap(1), text2pcap(1), pcap-filter(7) or tcpdump(8)

NOTES
       Reordercap is part of the Wireshark distribution.  The latest version of Wireshark can be found at <https://www.wireshark.org>.

       It may make sense to move this functionality into editcap, or perhaps mergecap, in which case reordercap could be retired.

       HTML versions of the Wireshark project man pages are available at: <https://www.wireshark.org/docs/man-pages>.

AUTHORS
         Original Author
         -------- ------
         Martin Mathieson             <martin.r.mathieson[AT]googlemail.com>

2.2.2                                                               2016-08-09                                                       REORDERCAP(1)
