ldns-keyfetcher(1)                                                                         General Commands Manual                                                                         ldns-keyfetcher(1)



NAME
       ldns-keyfetcher - retrieve the DNSSEC DNSKEYs for a zone

SYNOPSIS
       ldns-keyfetcher [ OPTIONS ] DOMAIN


DESCRIPTION
       ldns-keyfetcher is used to retrieve the DNSKEYs of a zone.

       First  it  finds  all authoritative nameservers of the zone by tracing it from the root down. All authoritative nameservers are then queried (using TCP) for the DNSKEY RRset of the zone apex. If the
       results are all the same, the key resource record set is printed.



OPTIONS
       -4 Only use IPv4

       -6 Only use IPv6

       -h Show a help text and exit

       -i Insecurer mode; there will only be one query for the DNSKEYS. There will not be crosschecking of all authoritative nameservers.

       -v verbosity

       Set the verbosity level. The following levels are available:

        0: default, only print the DNSKEY RRset found, or an error on failure.
        1: Show the nameservers that are queried
        2: Show more info on what is checked
        3: Show the intermediate results (authority and dnskey rrsets)
        4: Print the answer packets that are returned

       -r file

       Use file as the root hints file, should contain A records in presentation format. The default is /etc/named.root. You can get this file from http://www.internic.net/zones/named.root.

       -s Don't print the keys to stdout, but store them in files.

       The filenames will be of the format K<file>.+<alg>.+<keytag>.key


AUTHOR
       Written by Jelte Jansen for NLnet Labs.


REPORTING BUGS
       Report bugs to <ldns-team@nlnetlabs.nl>.


COPYRIGHT
       Copyright (C) 2006 NLnet Labs. This is free software. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.



                                                                                                  4 Apr 2006                                                                               ldns-keyfetcher(1)
