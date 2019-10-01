ldns-revoke(1)                                                                             General Commands Manual                                                                             ldns-revoke(1)



NAME
       ldns-revoke - sets the revoke bit of a DNSKEY

SYNOPSIS
       ldns-revoke file


DESCRIPTION
       ldns-revoke is used to revoke a public DNSKEY RR.  When run it will read file with a DNSKEY RR in it, sets the revoke bit and write back the output to file .


OPTIONS
       -n     Write the result to stdout instead of a file


AUTHOR
       Written by the ldns team as an example for ldns usage.


REPORTING BUGS
       Report bugs to <ldns-team@nlnetlabs.nl>.


COPYRIGHT
       Copyright (C) 2008 NLnet Labs. This is free software. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.



                                                                                                 23 Jul 2008                                                                                   ldns-revoke(1)
