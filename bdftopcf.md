BDFTOPCF(1)                                                   General Commands Manual                                                  BDFTOPCF(1)

NAME
       bdftopcf - convert X font from Bitmap Distribution Format to Portable Compiled Format

SYNOPSIS
       bdftopcf [ -pn ] [ -un ] [ -m ] [ -l ] [ -M ] [ -L ] [ -t ] [ -i ] [ -o outputfile ] fontfile.bdf

DESCRIPTION
       Bdftopcf  is a font compiler for the X server and font server.  Fonts in Portable Compiled Format can be read by any architecture, although
       the file is structured to allow one particular architecture to read them directly without reformatting.  This allows fast  reading  on  the
       appropriate machine, but the files are still portable (but read more slowly) on other machines.

OPTIONS
       -pn     Sets the font glyph padding.  Each glyph in the font will have each scanline padded in to a multiple of n bytes, where n is 1, 2, 4
               or 8.

       -un     Sets the font scanline unit.  When the font bit order is different from the font byte order, the scanline  unit  n  describes  what
               unit of data (in bytes) are to be swapped; the unit i can be 1, 2 or 4 bytes.

       -m      Sets the font bit order to MSB (most significant bit) first.  Bits for each glyph will be placed in this order; i.e., the left most
               bit on the screen will be in the highest valued bit in each unit.

       -l      Sets the font bit order to LSB (least significant bit) first.  The left most bit on the screen will be in the lowest valued bit  in
               each unit.

       -M      Sets the font byte order to MSB first.  All multi-byte data in the file (metrics, bitmaps and everything else) will be written most
               significant byte first.

       -L      Sets the font byte order to LSB first.  All multi-byte data in the file (metrics, bitmaps and  everything  else)  will  be  written
               least significant byte first.

       -t      When  this  option  is  specified, bdftopcf will convert fonts into "terminal" fonts when possible.  A terminal font has each glyph
               image padded to the same size; the X server can usually render these types of fonts more quickly.

       -i      This option inhibits the normal computation of ink metrics.  When a font has glyph images which do not fill the bitmap image (i.e.,
               the  "on"  pixels  don't  extend  to the edges of the metrics) bdftopcf computes the actual ink metrics and places them in the .pcf
               file; the -t option inhibits this behaviour.

       -o output-file-name
               By default bdftopcf writes the pcf file to standard output; this option gives the name of a file to be used instead.

       -v      Print version information and exit.

SEE ALSO
       X(7)

AUTHOR
       Keith Packard, MIT X Consortium

X Version 11                                                      bdftopcf 1.0.5                                                       BDFTOPCF(1)
