MMDBRESOLVE(1)                      The Wireshark Network Analyzer                      MMDBRESOLVE(1)

NAME
       mmdbresolve - Read IPv4 and IPv6 addresses and print their IP geolocation information.

SYNOPSIS
       mmdbresolve -f <dbfile> [ -f <dbfile> ] ...

DESCRIPTION
       mmdbresolve reads IPv4 and IPv6 addresses on stdin and prints their IP geolocation information
       on stdout. Each input line must contain exactly one address. Output is in INI format, with a
       section delimiter named after the query address followed by a set of "key: value" pairs. A
       comment beginning with "# End" is appended to each section.

       At startup an "[init]" section is printed that shows the status of each datbase and of
       mmdbresolve itself.

OPTIONS
       -f  Path to a MaxMind Database file. Multiple databases may be specified.

EXAMPLES
       To resolve a single address:

           echo 4.4.4.4 | mmdbresolve -f /usr/share/GeoIP/GeoLite2-City.mmdb

         Example output:
       [init]
       db.0.path: /usr/share/GeoIP/GeoLite2-City.mmdb
       db.0.status: OK
       mmdbresolve.status: true
       # End init
       [4.4.4.4]
       # GeoLite2-City
       country.iso_code: US
       country.names.en: United States
       location.latitude: 37.751000
       location.longitude: -97.822000
       # End 4.4.4.4

SEE ALSO
       wireshark(1), tshark(1)

NOTES
       mmdbresolve is part of the Wireshark distribution. The latest version of Wireshark can be found
       at <https://www.wireshark.org>.

       HTML versions of the Wireshark project man pages are available at:
       <https://www.wireshark.org/docs/man-pages>.

AUTHORS
         Original Author
         ---------------
         Gerald Combs            <gerald[AT]wireshark.org>

3.3.0                                         2019-12-19                                MMDBRESOLVE(1)
