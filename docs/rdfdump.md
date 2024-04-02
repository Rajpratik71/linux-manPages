RDFDUMP(1)                                                         Debian Manual                                                        RDFDUMP(1)

NAME
       rdfdump - dumps an RDOFF object in human-readable form

SYNOPSIS
       rdfdump [-v] <filename>

DESCRIPTION
       rdfdump  prints a list of the header records in an RDOFF object in human-readable form, and optionally prints a hex dump of the contents of
       the segments.

       rdfdump supports both version 1 and 2 of RDOFF.  It will give warnings if the RDOFF2 format is violated (it looks for incorrect lengths for
       header records, and checks the overall length count at the start of the file).

OPTIONS
       -v     Print a hex dump of the contents of the segments.

AUTHORS
       Julian Hall <jules@earthcorp.com>.

       This manual page was written by Matej Vela <vela@debian.org>.

Debian Project                                                   September 6, 1999                                                      RDFDUMP(1)
