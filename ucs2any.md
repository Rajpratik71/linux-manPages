ucs2any(1)                                                                               General Commands Manual                                                                               ucs2any(1)

NAME
       ucs2any - generate BDF fonts containing subsets of ISO 10646-1 codepoints

SYNOPSIS
       ucs2any [ +d | -d ] source-name { mapping-file registry-encoding } ...

DESCRIPTION
       ucs2any allows one to generate from an ISO 10646-1 encoded BDF font other BDF fonts in any possible encoding.  This way, one can derive from a single ISO 10646-1 master font a whole set of 8-bit
       fonts in all ISO 8859 and various other encodings.

OPTIONS
       +d     puts DEC VT100 graphics characters in the C0 range (default for upright, character-cell fonts).

       -d     omits DEC VT100 graphics characters from the C0 range (default for all font types except upright, character-cell fonts).

OPERANDS
       source-name
              is the name of an ISO 10646-1 encoded BDF file.

       mapping-file
              is the name of a character set table like those at <ftp://ftp.unicode.org/Public/MAPPINGS/>.  These files can also typically be found installed in the /usr/share/fonts/X11/util directory.

       registry-encoding
              are the CHARSET_REGISTRY and CHARSET_ENCODING field values for the font name (XLFD) of the target font, separated by a hyphen.

       Any number of mapping-file and registry-encoding operand pairs may be specified.

EXAMPLE
       The command
              ucs2any 6x13.bdf 8859-1.TXT iso8859-1 8859-2.TXT iso8859-2
       will generate the files 6x13-iso8859-1.bdf and 6x13-iso8859-2.bdf.

FUTURE DIRECTIONS
       Hopefully a future release will have a facility similar to ucs2any built into the server, and reencode ISO 10646-1 on the fly, because storing the same  fonts  in  many  different  encodings  is
       clearly a waste of storage capacity.

SEE ALSO
       bdftruncate(1)

AUTHOR
       ucs2any was written by Markus Kuhn.

       Branden Robinson wrote this manual page, originally for the Debian Project.

X Version 11                                                                                 font-util 1.3.1                                                                                   ucs2any(1)
