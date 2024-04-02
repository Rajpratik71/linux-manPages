NSEC3HASH(8)                                                                                        BIND9                                                                                        NSEC3HASH(8)



NAME
       nsec3hash - generate NSEC3 hash

SYNOPSIS
       nsec3hash {salt} {algorithm} {iterations} {domain}

DESCRIPTION
       nsec3hash generates an NSEC3 hash based on a set of NSEC3 parameters. This can be used to check the validity of NSEC3 records in a signed zone.

ARGUMENTS
       salt
           The salt provided to the hash algorithm.

       algorithm
           A number indicating the hash algorithm. Currently the only supported hash algorithm for NSEC3 is SHA-1, which is indicated by the number 1; consequently "1" is the only useful value for this
           argument.

       iterations
           The number of additional times the hash should be performed.

       domain
           The domain name to be hashed.

SEE ALSO
       BIND 9 Administrator Reference Manual, RFC 5155.

AUTHOR
       Internet Systems Consortium, Inc.

COPYRIGHT
       Copyright © 2009, 2014, 2015 Internet Systems Consortium, Inc. ("ISC")



ISC                                                                                               2009-03-02                                                                                     NSEC3HASH(8)
