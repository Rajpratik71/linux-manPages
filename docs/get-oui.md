GET-OUI(1)                                                    General Commands Manual                                                   GET-OUI(1)

NAME
       get-oui - Fetch the arp-scan OUI file from the IEEE website (on Debian and Debian based systems, data is fetched from ieee-data package)

SYNOPSIS
       get-oui [options]

DESCRIPTION
       get-oui fetches the Ethernet OUI file from the IEEE website, and saves it in the format used by arp-scan.

       The  OUI  file  contains  all of the OUIs (Organizationally Unique Identifiers) that have been registered with IEEE.  Each OUI entry in the
       file specifies the first 24-bits of the 48-bit Ethernet hardware address, leaving the remaining 24-bits for use by the registering  organi‐
       sation.   For  example  the  OUI  entry  "080020",  registered  to  Sun  Microsystems,  applies  to  any  Ethernet  hardware  address  from
       08:00:20:00:00:00 to 08:00:20:ff:ff:ff inclusive.  Each OUI assignment represents a total of 2^24 (16,777,216) Ethernet addresses.

       Every major Ethernet hardware vendor registers an OUI for their equipment, and larger vendors will need to register  more  than  one.   For
       example,  3Com have a total of 37 OUI entries.  Organisations that only produce a small number of Ethernet devices will often obtain an IAB
       registration instead.  See get-iab(1) for details.

       This script can be used to update the arp-scan OUI file from the latest data on the IEEE website.  Most of the Ethernet  addresses  in  use
       belong  to  an  OUI registration, so this is the most important of the files that arp-scan uses to decode Ethernet hardware addresses.  You
       should therefore run get-oui occasionally to keep the arp-scan OUI file up to date.

       The OUI data is fetched from the URL http://standards.ieee.org/regauth/oui/oui.txt (on Debian and Debian based  systems,  data  is  fetched
       from  ieee-data package) and the output file is saved to the file ieee-oui.txt in the current directory. The URL to fetch the data from can
       be changed with the -u option, and the output file name can be changed with the -f option.

       The ieee-oui.txt file that is produced by this script is used by arp-scan to determine the Ethernet card vendor from its hardware address.

       The directory that arp-scan will look for the ieee-oui.txt file depends on the options used when it was built.  If it was built  using  the
       default options, then it will look in /usr/local/share/arp-scan.

OPTIONS
       -h     Display a brief usage message and exit.

       -f <fn>
              Write the output to the specified file instead of the default ieee-oui.txt.

       -u <URL>
              Use  the  specified  URL  to  fetch the raw OUI data from instead of the default http://standards.ieee.org/regauth/oui/oui.txt.  (on
              Debian and Debian based systems, data is fetched from ieee-data package by default)

       -v     Display verbose progress messages.

FILES
       ieee-oui.txt
              The default output file.

EXAMPLES
       $ get-oui -v
       Renaming ieee-oui.txt to ieee-oui.txt.bak
       Fetching OUI data from http://standards.ieee.org/regauth/oui/oui.txt
       Fetched 1467278 bytes
       Opening output file ieee-oui.txt
       9274 OUI entries written to file ieee-oui.txt

NOTES
       get-oui is implemented in Perl, so you need to have the Perl interpreter installed on your system to use it.

       get-oui uses the LWP::Simple Perl module to fetch the data from the IEEE website. You must have this module installed on your system for it
       to work. This module is available on most distributions, often called libwww-perl.  It is also available in source form from CPAN.

       You can use a proxy server by defining the http_proxy environment variable.

AUTHOR
       Roy Hills <Roy.Hills@nta-monitor.com>

SEE ALSO
       arp-scan(1)

       get-iab(1)

       arp-fingerprint(1)

       http://www.nta-monitor.com/wiki/ The arp-scan wiki page.

                                                                  March 30, 2007                                                        GET-OUI(1)
