DNSSEC-REVOKE(8)                                                                                    BIND9                                                                                    DNSSEC-REVOKE(8)



NAME
       dnssec-revoke - set the REVOKED bit on a DNSSEC key

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
           Specifies the cryptographic hardware to use, when applicable.

           When BIND is built with OpenSSL PKCS#11 support, this defaults to the string "pkcs11", which identifies an OpenSSL engine that can drive a cryptographic accelerator or hardware service module.
           When BIND is built with native PKCS#11 cryptography (--enable-native-pkcs11), it defaults to the path of the PKCS#11 provider library specified via "--with-pkcs11".

       -f
           Force overwrite: Causes dnssec-revoke to write the new key pair even if a file already exists matching the algorithm and key ID of the revoked key.

       -R
           Print the key tag of the key with the REVOKE bit set but do not revoke the key.

SEE ALSO
       dnssec-keygen(8), BIND 9 Administrator Reference Manual, RFC 5011.

AUTHOR
       Internet Systems Consortium, Inc.

COPYRIGHT
       Copyright © 2009, 2011, 2014-2016, 2018 Internet Systems Consortium, Inc. ("ISC")



ISC                                                                                               2014-01-15                                                                                 DNSSEC-REVOKE(8)
