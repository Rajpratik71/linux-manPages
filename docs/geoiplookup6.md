GEOIPLOOKUP6(1)                                                                            General Commands Manual                                                                            GEOIPLOOKUP6(1)



NAME
       geouplookup6 - look up country using IP Address or hostname

SYNOPSIS
       geouplookup6 [-d directory] [-f filename] [-v] <ipaddress|hostname>

DESCRIPTION
       geouplookup6 uses the GeoIP library and database to find the Country that an IP address or hostname originates from. You must install a database suitable for geoiplookup6. IE: GeoIPv6.dat

       For example:

       geouplookup6 2001:4860:0:1001::68

       geoiplookup6 ipv6.google.com

       will find the Country that 2001:4860:0:1001::68 originates from, in the following format:

       US, United States

OPTIONS
       -f     Specify a custom path to a single GeoIP datafile.

       -d     Specify a custom directory containing GeoIP datafile(s).  By default geouplookup6 looks in /usr/share/GeoIP

       -v     Lists the date and build number for the GeoIP datafile(s).

AUTHOR
       Written by T.J. Mather

REPORTING BUGS
       Report bugs to <support@maxmind.com>

COPYRIGHT
       Copyright © 2008 MaxMind, Inc.

       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       geoipupdate(1), nslookup(1).



4th Berkeley Distribution                                                                        28 Oct 2008                                                                                  GEOIPLOOKUP6(1)
