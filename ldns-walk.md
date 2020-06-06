ldns-walk(1)                                                                               General Commands Manual                                                                               ldns-walk(1)



NAME
       ldns-walk - Retrieve the contents of a DNSSEC signed zone

SYNOPSIS
       ldns-walk [ OPTION ] ZONE


DESCRIPTION
       ldns-walk  is used to retrieve the contents of a DNSSEC signed zone.  It does this through NSEC-walking (following the chain of NSEC records) and 'guessing' the next non-existent owner name for each
       NSEC.

       Note that it might get stuck on some wildcard records when used through a caching forwarder. This problem can be circumvented by querying the authoritative nameserver directly (with the @ argument).

       Of course the nameserver that is used must be DNSSEC-aware.


OPTIONS
       -4     Use only IPv4.


       -6     Use only IPv6.


       -f     Do a 'full' zone walk; by default, ldns-walk will only show the names, and types present at those names. If this option is given, all resource records will be printed.


       -s name
              Start the walk with this owner name. Useful when continuing the walk for a large zone.


       -v verbosity
              Verbosity level [1-5].


       @ nameserver
              Send the queries to this nameserver.


BUGS
       The full zone walk function is not complete yet, it does not correctly print delegation records


AUTHOR
       Written by Jelte Jansen as an example for ldns usage.


REPORTING BUGS
       Report bugs to <ldns-team@nlnetlabs.nl>.


COPYRIGHT
       Copyright (C) 2005 NLnet Labs. This is free software. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.



                                                                                                 21 Nov 2005                                                                                     ldns-walk(1)
