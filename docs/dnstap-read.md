DNSTAP-READ(1)                                                                            BIND9                                                                            DNSTAP-READ(1)

NAME
       dnstap-read - print dnstap data in human-readable form

SYNOPSIS
       dnstap-read [-m] [-p] [-y] {file}

DESCRIPTION
       dnstap-read reads dnstap data from a specified file and prints it in a human-readable format. By default, dnstap data is printed in a short summary format, but if the -y option
       is specified, then a longer and more detailed YAML format is used instead.

OPTIONS
       -m
           Trace memory allocations; used for debugging memory leaks.

       -p
           After printing the dnstap data, print the text form of the DNS message that was encapsulated in the dnstap frame.

       -y
           Print dnstap data in a detailed YAML format.

SEE ALSO
       named(8), rndc(8), BIND 9 Administrator Reference Manual.

AUTHOR
       Internet Systems Consortium, Inc.

COPYRIGHT
       Copyright © 2015, 2016, 2018 Internet Systems Consortium, Inc. ("ISC")

ISC                                                                                     2015-09-13                                                                         DNSTAP-READ(1)
