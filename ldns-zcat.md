ldns-zcat(1)                                                                               General Commands Manual                                                                               ldns-zcat(1)



NAME
       ldns-zcat - reunite (z)split up a zone files

SYNOPSIS
       ldns-zcat zonefiles


DESCRIPTION
       ldns-zcat will read in a bunch of (z)split up zonefiles and creates a new larger zone file. The SOA record in the first part is used as the SOA record in the generated zone.

       The resulted zone file is printed to standard output.


OPTIONS
       -o ORIGIN
              use ORIGIN when reading in the zone


       -v     show the version number and exit


AUTHOR
       Written by the ldns team as an example for ldns usage.


REPORTING BUGS
       Report bugs to <ldns-team@nlnetlabs.nl>.


COPYRIGHT
       Copyright (C) 2005, 2006 NLnet Labs. This is free software. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.



                                                                                                 15 Dec 2005                                                                                     ldns-zcat(1)
