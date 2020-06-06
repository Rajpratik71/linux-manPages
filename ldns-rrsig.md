ldns-rrsig(1)                                                                              General Commands Manual                                                                              ldns-rrsig(1)



NAME
       ldns-rrsig - print out the inception and expiration dates in human readable form

SYNOPSIS
       ldns-rrsig domain [ type ]


DESCRIPTION
       ldns-rrsig  is  used  to  print  the  expiration  and inception date of a RRSIG. The first argument is a domain name. ldns-rrsig will query the authoritative servers for that domain to get a list of
       RRSIGs.  It will then print out the inception and experiration dates for the RRSIG covering the SOA record.

       If the second argument type is given the RRSIG covering that type will be shown.


AUTHOR
       Written by the ldns team as an example for ldns usage.


REPORTING BUGS
       Report bugs to <ldns-team@nlnetlabs.nl>.


COPYRIGHT
       Copyright (C) 2005 NLnet Labs. This is free software. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.



                                                                                                 27 Apr 2005                                                                                    ldns-rrsig(1)
