bdftruncate(1)                          General Commands Manual                         bdftruncate(1)

NAME
       bdftruncate - generate truncated BDF font from ISO 10646-1-encoded BDF font

SYNOPSIS
       bdftruncate threshold < source.bdf > destination.bdf

DESCRIPTION
       bdftruncate  allows  one  to  generate from an ISO10646-1 encoded BDF font other ISO10646-1 BDF
       fonts in which all characters above a threshold code value are stored unencoded.  This is often
       desirable because the Xlib API and X11 protocol data structures used for representing font met‐
       ric information are extremely inefficient when handling sparsely populated fonts.

EXAMPLE
       The command
              bdftruncate 0x3200 < 6x13.bdf > 6x13t.bdf
       will generate the file 6x13t.bdf in which all glyphs with codes >= 0x3200 will only  be  stored
       unencoded (i.e., they are encoded at codepoint -1).

SEE ALSO
       ucs2any(1)

AUTHOR
       bdftruncate was written by Markus Kuhn.

       Branden Robinson wrote this manual page, originally for the Debian Project.

X Version 11                                font-util 1.3.1                             bdftruncate(1)
