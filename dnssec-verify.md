DNSSEC-VERIFY(8)                                                                                    BIND9                                                                                    DNSSEC-VERIFY(8)



NAME
       dnssec-verify - DNSSEC zone verification tool

SYNOPSIS
       dnssec-verify [-c class] [-E engine] [-I input-format] [-o origin] [-v level] [-V] [-x] [-z] {zonefile}

DESCRIPTION
       dnssec-verify verifies that a zone is fully signed for each algorithm found in the DNSKEY RRset for the zone, and that the NSEC / NSEC3 chains are complete.

OPTIONS
       -c class
           Specifies the DNS class of the zone.

       -I input-format
           The format of the input zone file. Possible formats are "text" (default) and "raw". This option is primarily intended to be used for dynamic signed zones so that the dumped zone file in a
           non-text format containing updates can be verified independently. The use of this option does not make much sense for non-dynamic zones.

       -o origin
           The zone origin. If not specified, the name of the zone file is assumed to be the origin.

       -v level
           Sets the debugging level.

       -V
           Prints version information.

       -x
           Only verify that the DNSKEY RRset is signed with key-signing keys. Without this flag, it is assumed that the DNSKEY RRset will be signed by all active keys. When this flag is set, it will not be
           an error if the DNSKEY RRset is not signed by zone-signing keys. This corresponds to the -x option in dnssec-signzone.

       -z
           Ignore the KSK flag on the keys when determining whether the zone if correctly signed. Without this flag it is assumed that there will be a non-revoked, self-signed DNSKEY with the KSK flag set
           for each algorithm and that RRsets other than DNSKEY RRset will be signed with a different DNSKEY without the KSK flag set.

           With this flag set, we only require that for each algorithm, there will be at least one non-revoked, self-signed DNSKEY, regardless of the KSK flag state, and that other RRsets will be signed by
           a non-revoked key for the same algorithm that includes the self-signed key; the same key may be used for both purposes. This corresponds to the -z option in dnssec-signzone.

       zonefile
           The file containing the zone to be signed.

SEE ALSO
       dnssec-signzone(8), BIND 9 Administrator Reference Manual, RFC 4033.

AUTHOR
       Internet Systems Consortium, Inc.

COPYRIGHT
       Copyright © 2012, 2014, 2015 Internet Systems Consortium, Inc. ("ISC")



ISC                                                                                               2012-06-26                                                                                 DNSSEC-VERIFY(8)
