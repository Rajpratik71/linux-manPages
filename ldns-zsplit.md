ldns-zsplit(1)                                                                             General Commands Manual                                                                             ldns-zsplit(1)



NAME
       ldns-zsplit - split up a zone file

SYNOPSIS
       ldns-zsplit [ OPTIONS ] zonefile


DESCRIPTION
OPTIONS
       -n NUMBER
              Split after NUMBER RRs, ldns-zsplit will not split in the middle of an RRs.

       Each part is saved with a numerical suffix, starting with .000. The largest suffix is thus .999.


       -o ORIGIN
              use ORIGIN as origin when reading the zonefile.


       -z     Sort the zone before splitting.


       -v     Show version number and exit.


AUTHOR
       Written by the ldns team as an example for ldns usage.


REPORTING BUGS
       Report bugs to <ldns-team@nlnetlabs.nl>.


COPYRIGHT
       Copyright (C) 2005, 2006 NLnet Labs. This is free software. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.



                                                                                                 15 Dec 2005                                                                                   ldns-zsplit(1)
