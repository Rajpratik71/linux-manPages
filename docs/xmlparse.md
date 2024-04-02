XMLPARSE(1)                                                    GNUstep System Manual                                                   XMLPARSE(1)

NAME
       xmlparse - error-check and validate XML documents

SYNOPSIS
       xmlparse
        filename

DESCRIPTION
       Parses  the given file, validating it against its DTD if found.  Prints messages about any errors, otherwise returns silently.  (Value 0 is
       always returned in any case.)  The parse of the file is discarded.

HISTORY
       Written in 2003.

       This manual page first appeared in gnustep-base 1.9.2 (March 2004).

AUTHORS
       xmlparse was written by Richard Frith-Macdonald <rfm@gnu.org>

GNUstep                                                            February 2004                                                       XMLPARSE(1)
