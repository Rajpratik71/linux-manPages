GET-IAB(1)                                                    General Commands Manual                                                   GET-IAB(1)

NAME
       get-iab - Fetch the arp-scan IAB file from the IEEE website

SYNOPSIS
       get-iab [options]

DESCRIPTION
       get-iab fetches the Ethernet IAB file from the IEEE website, and saves it in the format used by arp-scan.

       The  IAB  file contains all of the IABs (Individual Address Blocks) that have been registered with IEEE.  Each IAB entry in the file speci‐
       fies the first 36-bits of the 48-bit Ethernet hardware address, leaving the remaining 12-bits for use by the registering organisation.  For
       example  the  IAB  entry  "0050C2003",  registered  to  Microsoft,  applies  to  any  Ethernet  hardware  address from 00:50:c2:00:30:00 to
       00:50:c2:00:3f:ff inclusive.  Each IAB assignment represents a total of 2^12 (4,096) Ethernet addresses.

       Major Ethernet hardware vendors typically use an OUI registration rather than an IAB registration.  See get-oui(1) for details.

       This script can be used to update the arp-scan IAB file from the latest data on the IEEE website.  It is relatively rare  to  see  Ethernet
       addresses from IAB registrations, so the IAB file is not as important as the OUI file.

       The IAB data is fetched from the URL http://standards.ieee.org/regauth/oui/iab.txt and the output file is saved to the file ieee-iab.txt in
       the current directory. The URL to fetch the data from can be changed with the -u option, and the output file name can be changed  with  the
       -f option.

       The ieee-iab.txt file that is produced by this script is used by arp-scan to determine the Ethernet card vendor from its hardware address.

       The  directory  that arp-scan will look for the ieee-iab.txt file depends on the options used when it was built.  If it was built using the
       default options, then it will look in /usr/local/share/arp-scan.

OPTIONS
       -h     Display a brief usage message and exit.

       -f <fn>
              Write the output to the specified file instead of the default ieee-iab.txt.

       -u <URL>
              Use the specified URL to fetch the raw IAB data from instead of the default http://standards.ieee.org/regauth/oui/iab.txt

       -v     Display verbose progress messages.

FILES
       ieee-iab.txt
              The default output file.

EXAMPLES
       $ get-iab -v
       Renaming ieee-iab.txt to ieee-iab.txt.bak
       Fetching IAB data from http://standards.ieee.org/regauth/oui/iab.txt
       Fetched 230786 bytes
       Opening output file ieee-iab.txt
       1535 IAB entries written to file ieee-iab.txt

NOTES
       get-iab is implemented in Perl, so you need to have the Perl interpreter installed on your system to use it.

       get-iab uses the LWP::Simple Perl module to fetch the data from the IEEE website. You must have this module installed on your system for it
       to work. This module is available on most distributions, often called libwww-perl.  It is also available in source form from CPAN.

       You can use a proxy server by defining the http_proxy environment variable.

AUTHOR
       Roy Hills <Roy.Hills@nta-monitor.com>

SEE ALSO
       arp-scan(1)

       get-oui(1)

       arp-fingerprint(1)

       http://www.nta-monitor.com/wiki/ The arp-scan wiki page.

                                                                  March 30, 2007                                                        GET-IAB(1)
