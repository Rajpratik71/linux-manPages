CVTENC(1)                                                      GNUstep System Manual                                                     CVTENC(1)

NAME
       cvtenc - file encoding converter

SYNOPSIS
       cvtenc [-Encoding encoding] [-EscapeIn yes|NO] [-EscapeOut yes|NO]
        filename

DESCRIPTION
       Converts  a file encoded in a specified or default non-unicode encoding to unicode (UTF16), or, if the file is already in unicode, converts
       it to a specified or default non-unicode encoding.  The converted text is printed to standard out.  If the filename is a hyphen  then  this
       tool reads from standard input.

OPTIONS
       -Encoding  encoding
           Specify  non-unicode encoding to be used.  The direction of conversion depends on whether the file given as input is recognized as uni‐
           code (from the higher order bytes).  To get a list of available encodings, enter "list" for the encoding.  If this  is  not  specified,
           the default encoding for the current locale is used.

       -EscapeIn YES|NO
           Specify '-EscapeIn YES' (the default is 'NO') to parse the input for \u escape sequences (as in property lists).

       -EscapeOut YES|NO
           Specify  '-EscapeOut YES' (the default is 'NO') to generate \u escape sequences (as in property lists) in the output.  Note, this might
           produce unexpected results for some encodings.

       -Unicode IN|OUT
           Specify '-Unicode IN' (or '-Unicode OUT') to control the direction of conversion rather than having the tool guess it on the  basis  of
           the  content  it  reads.  Using '-Unicode IN' means that the tool reads UTF16 data and writes C-String data, while using '-Unicode OUT'
           merans that the tool reads C-String data and writes UTF16 data.

HISTORY
       Written in 2002.  Minr update in 2010.

       This manual page first appeared in gnustep-base 1.9.2 (March 2004).

AUTHORS
       cvtenc was written by Richard Frith-Macdonald <rfm@gnu.org>

GNUstep                                                            February 2004                                                         CVTENC(1)
