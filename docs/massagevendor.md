MASSAGEVENDOR(8)                                              System Manager's Manual                                             MASSAGEVENDOR(8)

NAME
       massagevendor - convert the ethernet vendor codes master list to arpwatch format

SYNOPSIS
       massagevendor vendorfile

DESCRIPTION
       massagevendor is a program that converts a text file containing ethernet vendor codes into a format suitable for use by arpwatch(8) and
       arpsnmp(8).  The input vendorfile is a master text file containing vendor codes. The output is sent to stdout.  Each line of the vendorfile
       is expected to have a six digit hexadecimal vendor code followed by spaces followed by the name of the manufacturer.

       All ethernet devices have a unique identifier which includes a vendor code specifying the manufacturer of the device. In normal operation
       arpwatch(8) and arpsnmp(8) use the file ethercodes.dat to report this vendor code.  massagevendor is used to generate the ethercodes.dat
       file from text files containing these vendor codes.

       Locations where an ethernet vendor codes master text file can be obtained are given below.

FILES
       /usr/share/arpwatch - default location of the ethernet vendor list
       ethercodes.dat - file containing the list of ethernet vendor codes

SEE ALSO
       arpwatch(8), arpsnmp(8)

NOTES
       Sources for ethernet vendor codes seen in the wild are

              http://map-ne.com/Ethernet/vendor.html
              ftp://ftp.cavebear.com/pub/Ethernet.txt
              http://www.cavebear.com/CaveBear/Ethernet/vendor.html

       Useful for comparison or completeness are the
       ethernet vendor codes as assigned
       by the IEEE which can be found at

              http://standards.ieee.org/regauth/oui/oui.txt

BUGS
       Please send bug reports to arpwatch@ee.lbl.gov.

AUTHORS
       Craig Leres of the Lawrence Berkeley National Laboratory Network Research Group, University of California, Berkeley, CA.

       The current version is available via anonymous ftp:

              ftp://ftp.ee.lbl.gov/arpwatch.tar.gz

       This manual page was contributed by Hugo Graumann.

                                                                                                                                  MASSAGEVENDOR(8)
