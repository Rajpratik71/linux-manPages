DNSSEC-CHECKDS(8)                                                                                   BIND9                                                                                   DNSSEC-CHECKDS(8)



NAME
       dnssec-checkds - DNSSEC delegation consistency checking tool

SYNOPSIS
       dnssec-checkds [-l domain] [-f file] [-d dig path] [-D dsfromkey path] {zone}

       dnssec-dsfromkey [-l domain] [-f file] [-d dig path] [-D dsfromkey path] {zone}

DESCRIPTION
       dnssec-checkds verifies the correctness of Delegation Signer (DS) or DNSSEC Lookaside Validation (DLV) resource records for keys in a specified zone.

OPTIONS
       -f file
           If a file is specified, then the zone is read from that file to find the DNSKEY records. If not, then the DNSKEY records for the zone are looked up in the DNS.

       -l domain
           Check for a DLV record in the specified lookaside domain, instead of checking for a DS record in the zone's parent.

       -d dig path
           Specifies a path to a dig binary. Used for testing.

       -D dsfromkey path
           Specifies a path to a dnssec-dsfromkey binary. Used for testing.

SEE ALSO
       dnssec-dsfromkey(8), dnssec-keygen(8), dnssec-signzone(8),

AUTHOR
       Internet Systems Consortium, Inc.

COPYRIGHT
       Copyright © 2012-2018 Internet Systems Consortium, Inc. ("ISC")



ISC                                                                                               2013-01-01                                                                                DNSSEC-CHECKDS(8)
