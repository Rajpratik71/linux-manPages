ldns-test-edns(1)                                                                          General Commands Manual                                                                          ldns-test-edns(1)



NAME
       ldns-test-edns - test if dns cache supports EDNS and DNSSEC.

SYNOPSIS
       ldns-test-edns [ -i ] { ip }

DESCRIPTION
       ldns-test-edns  tests  a DNS cache and checks if it supports EDNS0 and DNSSEC types so that it can be used as a dnssec-enabled DNS cache.  It sends two queries to the cache, one for the root key and
       one for a DS record.  These must succeed, the answer must have EDNS, that type and signatures.

       If the IP address is good for DNSSEC, it is printed with 'OK'.  Otherwise short description is given of the failure.  If OK is given, the cache should be good to use as a cache for a  local  config‐
       ured DNSSEC validator.

       The tool assumes the root is signed and Sweden is signed.  Also, the queries are sent with the CD flag, the tool does not check that the results are validated, but that they can be validated.

OPTIONS
       -i option enables a mode where the working IP addresses are printed after another, with no other explanations, and if none work or no IP addresses are on the input, 'off' is printed.

       ldns-test-edns  takes  one  or  more IP addresses, it checks them in turn.  IPv4 and IPv6 addresses can be given.  The exit value is for the last checked IP address: 0 is OK, 1 is failure, 2 is some
       sort of network failure.

AUTHOR
       Written by the ldns team as an example for ldns usage.

REPORTING BUGS
       Report bugs to <ldns-team@nlnetlabs.nl>.

COPYRIGHT
       Copyright (C) 2010 NLnet Labs. This is free software. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.



                                                                                                 14 Dec 2010                                                                                ldns-test-edns(1)
