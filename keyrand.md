KEYRAND(1)                                                                                  Cryptography Utilities                                                                                 KEYRAND(1)



NAME
       keyrand - utility for collecting random data

SYNOPSIS
       keyrand {bits} {outfile}

DESCRIPTION
       keyrand is a tool which collects a given number of random bits from the kernel random number generator, presenting a text-based user interface showing progress.

       The random data is read from /dev/random and appended to the output file outfile, which must already exist.

EXAMPLES
       The following example will collect 1024 bits of random data and append them to the file data:

           # keyrand 1024 data



FILES
       /dev/random

SEE ALSO
       genkey(1)



crypto-utils 2.4.1                                                                               9 June 2014                                                                                       KEYRAND(1)
