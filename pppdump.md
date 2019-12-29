PPPDUMP(8)                              System Manager's Manual                             PPPDUMP(8)

NAME
       pppdump - convert PPP record file to readable format

SYNOPSIS
       pppdump [ -h | -p [ -d ]] [ -r ] [ -m mru ] [ file ...  ]

DESCRIPTION
       The  pppdump  utility  converts the files written using the record option of pppd into a human-
       readable format.  If one or more filenames are specified, pppdump will read each in turn;  oth‐
       erwise it will read its standard input.  In each case the result is written to standard output.

       The options are as follows:

       -h     Prints  the  bytes  sent and received in hexadecimal.  If neither this option nor the -p
              option is specified, the bytes are printed as the characters themselves, with non-print‐
              ing and non-ASCII characters printed as escape sequences.

       -p     Collects the bytes sent and received into PPP packets, interpreting the async HDLC fram‐
              ing and escape characters and checking the FCS (frame check sequence)  of  each  packet.
              The  packets  are  printed as hex values and as characters (non-printable characters are
              printed as `.').

       -d     With the -p option, this option causes pppdump to decompress  packets  which  have  been
              compressed with the BSD-Compress or Deflate methods.

       -r     Reverses  the  direction  indicators, so that `sent' is printed for bytes or packets re‐
              ceived, and `rcvd' is printed for bytes or packets sent.

       -m mru Use mru as the MRU (maximum receive unit) for both directions of the link when  checking
              for over-length PPP packets (with the -p option).

SEE ALSO
       pppd(8)

                                             1 April 1999                                   PPPDUMP(8)
