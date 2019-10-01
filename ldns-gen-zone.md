ldns-gen-zone(1)                                                                           General Commands Manual                                                                           ldns-gen-zone(1)



NAME
       ldns-gen-zone - read a zonefile and print it while adding DS records and extra RR's

SYNOPSIS
       ldns-gen-zone ZONEFILE


DESCRIPTION
       ldns-gen-zone reads a DNS zone file and prints it.

       It is build for speed, not for a nice formatting. The output has one resource record per line and no pretty-printing makeup.

       DNSSEC data (NSEC, NSEC3, RRSIG or DNSKEY) is not stripped. You may want to use ldns-read-zone for that. Existing DS records are also not stripped.

       The idea is to use this tool for quickly generating a representative artificial zonefile from a real zonefile, to use it for testing purposes.


OPTIONS
       -a NUM Adds  NUM  extra  artificial NS RRSets to the output.  The RRSets owner names start with 'xn--' in an attempt to ensure uniqueness (nl.-zone does not support IDN's - and this tool was written
              with that knowledge in mind).

              An artificial NS RRSet has two NS records; ns1.example.com and ns2.example.com.


       -p NUM Add NUM% of DS RRSets to the NS RRSets (anywhere between 1-4 DS records per RRSet).


       -o ORIGIN
              Sets an $ORIGIN, which can be handy if the one in the zonefile is set to '@' for example. If there is an $ORIGIN in the zonefile, this option will silently be ignored.


       -s     This is the recommended way of processing large zones that are already sorted and canonicalized (ie lowercase). It skips the sorting and canonicalization step that is  required  for  properly
              grouping RRSets together (before adding any DS records to them. Skipping this step will speed things up.

              It is not recommended to use this option if you want to add DS records to unsorted, non-canonicalized zones.


       -h     Show usage and exit.


       -v     Show version and exit.


EXAMPLES
       ldns-gen-zone -a 100000 -p 10 -s ./zonefile.txt
              Read  a  zonefile,  add 100.000 artificial NS RRSets and 10% of DS records, print it to standard output. Don't sort (will only work well if the input zonefile is already sorted and canonical‐
              ized).


       ldns-gen-zone -p 10 -s -o nl zonefile.txt | named-compilezone -s relative -i none -o zonefile_10.txt nl /dev/stdin
              This creates a nicely formatted zone file with the help of named-compilezone.  It adds 10% DS records to the .nl zone, reformats it and saves it as zonefile_10.txt.


AUTHOR
       Initially written by Marco Davids, several modifications added by Miek Gieben, both from SIDN.


REPORTING BUGS
       Report bugs to <ldns-team@nlnetlabs.nl>.


BUGS
       Only undiscovered ones.


CAVEATS
       May require a machine with a considerable amount of memory for large zone files.

       Fake DS records hashes are generated as digest type SHA-256 (RFC4509). Be aware not to change the DIGESTTYPE #define in the source code in anything else but 2 if you want to keep things realistic.

       Despite a number of efforts, this program is still not the fastest in the world.


COPYRIGHT
       Copyright (C) 2010 SIDN. This is free software. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.



                                                                                                 10 June 2010                                                                                ldns-gen-zone(1)
