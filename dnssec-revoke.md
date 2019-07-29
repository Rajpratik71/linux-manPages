DNSSEC-REVOKE(8)                                                                                    BIND9                                                                                    DNSSEC-REVOKE(8)



NAME
       dnssec-revoke - Set the REVOKED bit on a DNSSEC key

SYNOPSIS
       dnssec-revoke [-hr] [-v level] [-V] [-K directory] [-E engine] [-f] [-R] {keyfile}

DESCRIPTION
       dnssec-revoke reads a DNSSEC key file, sets the REVOKED bit on the key as defined in RFC 5011, and creates a new pair of key files containing the now-revoked key.

OPTIONS
       -h
           Emit usage message and exit.

       -K directory
           Sets the directory in which the key files are to reside.

       -r
           After writing the new keyset files remove the original keyset files.

       -v level
           Sets the debugging level.

       -V
           Prints version information.

       -E engine
           Use the given OpenSSL engine. When compiled with PKCS#11 support it defaults to pkcs11; the empty name resets it to no engine.

       -f
           Force overwrite: Causes dnssec-revoke to write the new key pair even if a file already exists matching the algorithm and key ID of the revoked key.

       -R
           Print the key tag of the key with the REVOKE bit set but do not revoke the key.

SEE ALSO
       dnssec-keygen(8), BIND 9 Administrator Reference Manual, RFC 5011.

COPYRIGHT
       Copyright © 2009, 2011, 2014, 2015 Internet Systems Consortium, Inc. ("ISC")



BIND9                                                                                             2011-10-20                                                                                 DNSSEC-REVOKE(8)
