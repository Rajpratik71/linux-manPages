GENRANDOM(8)                                                                                        BIND9                                                                                        GENRANDOM(8)



NAME
       genrandom - generate a file containing random data

SYNOPSIS
       genrandom [-n number] {size} {filename}

DESCRIPTION
       genrandom generates a file or a set of files containing a specified quantity of pseudo-random data, which can be used as a source of entropy for other commands on systems with no random device.

ARGUMENTS
       -n number
           In place of generating one file, generates number (from 2 to 9) files, appending number to the name.

       size
           The size of the file, in kilobytes, to generate.

       filename
           The file name into which random data should be written.

SEE ALSO
       rand(3), arc4random(3)

AUTHOR
       Internet Systems Consortium, Inc.

COPYRIGHT
       Copyright © 2009-2011, 2014, 2015 Internet Systems Consortium, Inc. ("ISC")



ISC                                                                                               2011-08-08                                                                                     GENRANDOM(8)
