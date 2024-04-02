ldns-read-zone(1)                                                                          General Commands Manual                                                                          ldns-read-zone(1)



NAME
       ldns-read-zone - read a zonefile and print it

SYNOPSIS
       ldns-read-zone ZONEFILE


DESCRIPTION
       ldns-read-zone reads a DNS zone file and prints it. The output has 1 resource record per line, and no pretty-printing makeup.


OPTIONS
       -c     Canonicalize all resource records in the zone before printing


       -d     Only print DNSSEC data from the zone. This option skips every record that is not of type NSEC, NSEC3, RRSIG or DNSKEY. DS records are not printed.


       -b     Include Bubble Babble encoding of DS's.


       -0     Print  a  (null) for the RRSIG inception, expiry and key data. This option can be used when comparing different signing systems that use the same DNSKEYs for signing but would have a slightly
              different timings/jitter.


       -h     Show usage and exit


       -n     Do not print the SOA record


       -p     Pad the SOA serial number with spaces so the number and the spaces together take ten characters. This is useful for in file serial number increments.


       -s     Strip DNSSEC data from the zone. This option skips every record that is of type NSEC, NSEC3, RRSIG or DNSKEY. DS records are still printed.


       -S [[+|0]number | YYYYMMDDxx | unixtime ]
              Set serial number to the given number, or when preceded by a sign, offset the exisiting number with it. When giving the literal strings YYYYMMDDxx or unixtime, the serial number is  tried  to
              be reset in datecounter or in unixtime format respectively. Though is the updated serial number is smaller than the original one, the original one is simply increased by one.

              When updating a serial number, records of type NSEC, NSEC3, RRSIG and DNSKEY will be skipped when printing the zone.



       -v     Show the version and exit


       -z     Sort the zone before printing (this implies -c)



AUTHOR
       Written by the ldns team as an example for ldns usage.


REPORTING BUGS
       Report bugs to <ldns-team@nlnetlabs.nl>.


COPYRIGHT
       Copyright (C) 2005 NLnet Labs. This is free software. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.



                                                                                                 30 May 2005                                                                                ldns-read-zone(1)
