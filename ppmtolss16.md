PPMTOLSS16(1)                           General Commands Manual                          PPMTOLSS16(1)

NAME
       ppmtolss16 — Convert a PPM to an LSS16 image

SYNOPSIS
       ppmtolss16 [               #rrggbb=i            ...]  [< input.ppm]  [> output.rle]

DESCRIPTION
       This manual page documents briefly the ppmtolss16 command.

       The  ppmtolss16 program converts a "raw" PPM file with max 16 colors to a simple RLE-based for‐
       mat:

       simple RLE-based format

       unint32 0x1413f3d   magic (littleendian)
       unint16 xsize       littleendian
       unint15 ysize       littleendian
       16 x unint8 r,g,b   color map

       Color map is in 6-bit format (each byte is 0..63)

       Then, a sequence of nybbles:

       N   ... if N is != previous pixel, one pixel of color N, otherwise run sequence follows ...

       M   ... if M > 0 then run length is M+1, otherwise run sequence is encoded in two nybbles, lit‐
       tleendian, +17

       The  nybble  sequences  are  on a per-row basis, runs may not extend across rows and odd-nybble
       rows are zero-padded.

       At the start of a row, the "previous pixel" is assumed to be zero.

OPTIONS
       A summary of options is included below.

       #rrggbb=i Specify that the color #rrggbb (hex) should be assigned index i (decimal).

BUG
       This program cannot handle comments in the header, nor "plain" ppm format.

SEE ALSO
       ppmtolss16(1)

AUTHOR
       This manual page was compiled by dann frazier <dannf@debian.org> for the Debian GNU/Linux  sys‐
       tem (but may be used by others).  Most of the content was written by H. Peter Anvin.

                                                                                         PPMTOLSS16(1)
