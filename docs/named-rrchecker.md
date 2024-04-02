NAMED-RRCHECKER(1)                                                                                  BIND9                                                                                  NAMED-RRCHECKER(1)



NAME
       named-rrchecker - syntax checker for individual DNS resource records

SYNOPSIS
       named-rrchecker [-h] [-o origin] [-p] [-u] [-C] [-T] [-P]

DESCRIPTION
       named-rrchecker read a individual DNS resource record from standard input and checks if it is syntactically correct.

       The -h prints out the help menu.

       The -o origin option specifies a origin to be used when interpreting the record.

       The -p prints out the resulting record in canonical form. If there is no canonical form defined then the record will be printed in unknown record format.

       The -u prints out the resulting record in unknown record form.

       The -C, -T and -P print out the known class, standard type and private type mnemonics respectively.

SEE ALSO
       RFC 1034, RFC 1035, named(8)

AUTHOR
       Internet Systems Consortium, Inc.

COPYRIGHT
       Copyright © 2013-2016, 2018 Internet Systems Consortium, Inc. ("ISC")



ISC                                                                                               2013-11-12                                                                               NAMED-RRCHECKER(1)
