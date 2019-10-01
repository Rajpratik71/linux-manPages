ldns-key2ds(1)                                                                             General Commands Manual                                                                             ldns-key2ds(1)



NAME
       ldns-key2ds - transform a DNSKEY RR to a DS RR

SYNOPSIS
       ldns-key2ds file


DESCRIPTION
       ldns-key2ds is used to transform a public DNSKEY RR to a DS RR.  When run it will read file with a DNSKEY RR in it and it will create a .ds file with the DS RR in it.

       It prints out the basename for this file (K<name>+<alg>+<id>).

       By default it takes a pick of algorithm similar to the key algorithm, SHA1 for RSASHA1, and so on.


OPTIONS
       -f     Ignore SEP flag (i.e. make DS records for any key)


       -n     Write the result DS Resource Record to stdout instead of a file


       -1     Use SHA1 as the hash function.


       -2     Use SHA256 as the hash function



AUTHOR
       Written by the ldns team as an example for ldns usage.


REPORTING BUGS
       Report bugs to <ldns-team@nlnetlabs.nl>.


COPYRIGHT
       Copyright (C) 2005 NLnet Labs. This is free software. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.



                                                                                                 30 May 2005                                                                                   ldns-key2ds(1)
