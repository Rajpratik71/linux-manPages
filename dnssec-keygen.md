DNSSEC-KEYGEN(8)                                                                                    BIND9                                                                                    DNSSEC-KEYGEN(8)



NAME
       dnssec-keygen - DNSSEC key generation tool

SYNOPSIS
       dnssec-keygen [-a algorithm] [-b keysize] [-n nametype] [-3] [-A date/offset] [-C] [-c class] [-D date/offset] [-D sync date/offset] [-E engine] [-f flag] [-G] [-g generator] [-h] [-I date/offset]
                     [-i interval] [-K directory] [-k] [-L ttl] [-P date/offset] [-P sync date/offset] [-p protocol] [-q] [-R date/offset] [-r randomdev] [-S key] [-s strength] [-t type] [-V] [-v level]
                     [-z] {name}

DESCRIPTION
       dnssec-keygen generates keys for DNSSEC (Secure DNS), as defined in RFC 2535 and RFC 4034. It can also generate keys for use with TSIG (Transaction Signatures) as defined in RFC 2845, or TKEY
       (Transaction Key) as defined in RFC 2930.

       The name of the key is specified on the command line. For DNSSEC keys, this must match the name of the zone for which the key is being generated.

OPTIONS
       -a algorithm
           Selects the cryptographic algorithm. For DNSSEC keys, the value of algorithm must be one of RSAMD5, RSASHA1, DSA, NSEC3RSASHA1, NSEC3DSA, RSASHA256, RSASHA512, ECCGOST, ECDSAP256SHA256,
           ECDSAP384SHA384, ED25519 or ED448. For TSIG/TKEY, the value must be DH (Diffie Hellman), HMAC-MD5, HMAC-SHA1, HMAC-SHA224, HMAC-SHA256, HMAC-SHA384, or HMAC-SHA512. These values are case
           insensitive.

           If no algorithm is specified, then RSASHA1 will be used by default, unless the -3 option is specified, in which case NSEC3RSASHA1 will be used instead. (If -3 is used and an algorithm is
           specified, that algorithm will be checked for compatibility with NSEC3.)

           Note 1: that for DNSSEC, RSASHA1 is a mandatory to implement algorithm, and DSA is recommended. For TSIG, HMAC-MD5 is mandatory.

           Note 2: DH, HMAC-MD5, and HMAC-SHA1 through HMAC-SHA512 automatically set the -T KEY option.

       -b keysize
           Specifies the number of bits in the key. The choice of key size depends on the algorithm used. RSA keys must be between 512 and 2048 bits. Diffie Hellman keys must be between 128 and 4096 bits.
           DSA keys must be between 512 and 1024 bits and an exact multiple of 64. HMAC keys must be between 1 and 512 bits. Elliptic curve algorithms don't need this parameter.

           The key size does not need to be specified if using a default algorithm. The default key size is 1024 bits for zone signing keys (ZSKs) and 2048 bits for key signing keys (KSKs, generated with
           -f KSK). However, if an algorithm is explicitly specified with the -a, then there is no default key size, and the -b must be used.

       -n nametype
           Specifies the owner type of the key. The value of nametype must either be ZONE (for a DNSSEC zone key (KEY/DNSKEY)), HOST or ENTITY (for a key associated with a host (KEY)), USER (for a key
           associated with a user(KEY)) or OTHER (DNSKEY). These values are case insensitive. Defaults to ZONE for DNSKEY generation.

       -3
           Use an NSEC3-capable algorithm to generate a DNSSEC key. If this option is used and no algorithm is explicitly set on the command line, NSEC3RSASHA1 will be used by default. Note that RSASHA256,
           RSASHA512, ECCGOST, ECDSAP256SHA256, ECDSAP384SHA384, ED25519 and ED448 algorithms are NSEC3-capable.

       -C
           Compatibility mode: generates an old-style key, without any metadata. By default, dnssec-keygen will include the key's creation date in the metadata stored with the private key, and other dates
           may be set there as well (publication date, activation date, etc). Keys that include this data may be incompatible with older versions of BIND; the -C option suppresses them.

       -c class
           Indicates that the DNS record containing the key should have the specified class. If not specified, class IN is used.

       -E engine
           Specifies the cryptographic hardware to use, when applicable.

           When BIND is built with OpenSSL PKCS#11 support, this defaults to the string "pkcs11", which identifies an OpenSSL engine that can drive a cryptographic accelerator or hardware service module.
           When BIND is built with native PKCS#11 cryptography (--enable-native-pkcs11), it defaults to the path of the PKCS#11 provider library specified via "--with-pkcs11".

       -f flag
           Set the specified flag in the flag field of the KEY/DNSKEY record. The only recognized flags are KSK (Key Signing Key) and REVOKE.

       -G
           Generate a key, but do not publish it or sign with it. This option is incompatible with -P and -A.

       -g generator
           If generating a Diffie Hellman key, use this generator. Allowed values are 2 and 5. If no generator is specified, a known prime from RFC 2539 will be used if possible; otherwise the default is
           2.

       -h
           Prints a short summary of the options and arguments to dnssec-keygen.

       -K directory
           Sets the directory in which the key files are to be written.

       -k
           Deprecated in favor of -T KEY.

       -L ttl
           Sets the default TTL to use for this key when it is converted into a DNSKEY RR. If the key is imported into a zone, this is the TTL that will be used for it, unless there was already a DNSKEY
           RRset in place, in which case the existing TTL would take precedence. If this value is not set and there is no existing DNSKEY RRset, the TTL will default to the SOA TTL. Setting the default TTL
           to 0 or none is the same as leaving it unset.

       -p protocol
           Sets the protocol value for the generated key. The protocol is a number between 0 and 255. The default is 3 (DNSSEC). Other possible values for this argument are listed in RFC 2535 and its
           successors.

       -q
           Quiet mode: Suppresses unnecessary output, including progress indication. Without this option, when dnssec-keygen is run interactively to generate an RSA or DSA key pair, it will print a string
           of symbols to stderr indicating the progress of the key generation. A '.' indicates that a random number has been found which passed an initial sieve test; '+' means a number has passed a single
           round of the Miller-Rabin primality test; a space means that the number has passed all the tests and is a satisfactory key.

       -r randomdev
           Specifies the source of randomness. If the operating system does not provide a /dev/random or equivalent device, the default source of randomness is keyboard input.  randomdev specifies the name
           of a character device or file containing random data to be used instead of the default. The special value keyboard indicates that keyboard input should be used.

       -S key
           Create a new key which is an explicit successor to an existing key. The name, algorithm, size, and type of the key will be set to match the existing key. The activation date of the new key will
           be set to the inactivation date of the existing one. The publication date will be set to the activation date minus the prepublication interval, which defaults to 30 days.

       -s strength
           Specifies the strength value of the key. The strength is a number between 0 and 15, and currently has no defined purpose in DNSSEC.

       -T rrtype
           Specifies the resource record type to use for the key.  rrtype must be either DNSKEY or KEY. The default is DNSKEY when using a DNSSEC algorithm, but it can be overridden to KEY for use with
           SIG(0).  Using any TSIG algorithm (HMAC-* or DH) forces this option to KEY.

       -t type
           Indicates the use of the key.  type must be one of AUTHCONF, NOAUTHCONF, NOAUTH, or NOCONF. The default is AUTHCONF. AUTH refers to the ability to authenticate data, and CONF the ability to
           encrypt data.

       -v level
           Sets the debugging level.

       -V
           Prints version information.

TIMING OPTIONS
       Dates can be expressed in the format YYYYMMDD or YYYYMMDDHHMMSS. If the argument begins with a '+' or '-', it is interpreted as an offset from the present time. For convenience, if such an offset is
       followed by one of the suffixes 'y', 'mo', 'w', 'd', 'h', or 'mi', then the offset is computed in years (defined as 365 24-hour days, ignoring leap years), months (defined as 30 24-hour days),
       weeks, days, hours, or minutes, respectively. Without a suffix, the offset is computed in seconds. To explicitly prevent a date from being set, use 'none' or 'never'.

       -P date/offset
           Sets the date on which a key is to be published to the zone. After that date, the key will be included in the zone but will not be used to sign it. If not set, and if the -G option has not been
           used, the default is "now".

       -P sync date/offset
           Sets the date on which CDS and CDNSKEY records that match this key are to be published to the zone.

       -A date/offset
           Sets the date on which the key is to be activated. After that date, the key will be included in the zone and used to sign it. If not set, and if the -G option has not been used, the default is
           "now". If set, if and -P is not set, then the publication date will be set to the activation date minus the prepublication interval.

       -R date/offset
           Sets the date on which the key is to be revoked. After that date, the key will be flagged as revoked. It will be included in the zone and will be used to sign it.

       -I date/offset
           Sets the date on which the key is to be retired. After that date, the key will still be included in the zone, but it will not be used to sign it.

       -D date/offset
           Sets the date on which the key is to be deleted. After that date, the key will no longer be included in the zone. (It may remain in the key repository, however.)

       -D sync date/offset
           Sets the date on which the CDS and CDNSKEY records that match this key are to be deleted.

       -i interval
           Sets the prepublication interval for a key. If set, then the publication and activation dates must be separated by at least this much time. If the activation date is specified but the
           publication date isn't, then the publication date will default to this much time before the activation date; conversely, if the publication date is specified but activation date isn't, then
           activation will be set to this much time after publication.

           If the key is being created as an explicit successor to another key, then the default prepublication interval is 30 days; otherwise it is zero.

           As with date offsets, if the argument is followed by one of the suffixes 'y', 'mo', 'w', 'd', 'h', or 'mi', then the interval is measured in years, months, weeks, days, hours, or minutes,
           respectively. Without a suffix, the interval is measured in seconds.

GENERATED KEYS
       When dnssec-keygen completes successfully, it prints a string of the form Knnnn.+aaa+iiiii to the standard output. This is an identification string for the key it has generated.

       ·   nnnn is the key name.

       ·   aaa is the numeric representation of the algorithm.

       ·   iiiii is the key identifier (or footprint).

       dnssec-keygen creates two files, with names based on the printed string.  Knnnn.+aaa+iiiii.key contains the public key, and Knnnn.+aaa+iiiii.private contains the private key.

       The .key file contains a DNS KEY record that can be inserted into a zone file (directly or with a $INCLUDE statement).

       The .private file contains algorithm-specific fields. For obvious security reasons, this file does not have general read permission.

       Both .key and .private files are generated for symmetric cryptography algorithms such as HMAC-MD5, even though the public and private key are equivalent.

EXAMPLE
       To generate a 768-bit DSA key for the domain example.com, the following command would be issued:

       dnssec-keygen -a DSA -b 768 -n ZONE example.com

       The command would print a string of the form:

       Kexample.com.+003+26160

       In this example, dnssec-keygen creates the files Kexample.com.+003+26160.key and Kexample.com.+003+26160.private.

SEE ALSO
       dnssec-signzone(8), BIND 9 Administrator Reference Manual, RFC 2539, RFC 2845, RFC 4034.

AUTHOR
       Internet Systems Consortium, Inc.

COPYRIGHT
       Copyright © 2000-2005, 2007-2012, 2014-2018 Internet Systems Consortium, Inc. ("ISC")



ISC                                                                                            August 21, 2015                                                                               DNSSEC-KEYGEN(8)
