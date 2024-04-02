ldns-nsec3-hash.c(1)                                                                       General Commands Manual                                                                       ldns-nsec3-hash.c(1)



NAME
       ldns-nsec3-hash - print out the NSEC3 hash for a domain name

SYNOPSIS
       ldns-nsec3-hash <domain_name>


DESCRIPTION
       ldns-nsec3-hash is used to print out the NSEC3 hash for the given domain name.


OPTIONS
       -a number
              Use the given algorithm number for the hash calculation. Defaults to 1 (SHA-1).


       -s salt
              Use the given salt for the hash calculation. Salt value should be in hexadecimal format.


       -t count
              Use count iterations for the hash calculation.



AUTHOR
       Written by the ldns team as an example for ldns usage.


REPORTING BUGS
       Report bugs to <ldns-team@nlnetlabs.nl>.


COPYRIGHT
       Copyright (C) 2008 NLnet Labs. This is free software. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.



                                                                                                 10 Dec 2008                                                                             ldns-nsec3-hash.c(1)
