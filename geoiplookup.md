GEOIPLOOKUP(1)                                                                             General Commands Manual                                                                             GEOIPLOOKUP(1)



NAME
       geoiplookup - look up country using IP Address or hostname

SYNOPSIS
       geoiplookup [-d directory] [-f filename] [-v] <ipaddress|hostname>

DESCRIPTION
       geoiplookup uses the GeoIP library and database to find the Country that an IP address or hostname originates from.

       For example

       geoiplookup 80.60.233.195

       will find the Country that 80.60.233.195 originates from, in the following format:

       NL, Netherlands

OPTIONS
       -f     Specify a custom path to a single GeoIP datafile.

       -d     Specify a custom directory containing GeoIP datafile(s).  By default geoiplookup looks in /usr/share/GeoIP

       -v     Lists the date and build number for the GeoIP datafile(s).

AUTHOR
       Written by T.J. Mather

REPORTING BUGS
       Report bugs to <support@maxmind.com>

COPYRIGHT
       Copyright © 2006 MaxMind, Inc.

       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       geoipupdate(1), nslookup(1).



4th Berkeley Distribution                                                                         2 Jan 2007                                                                                   GEOIPLOOKUP(1)
