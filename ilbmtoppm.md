Ilbmtoppm User Manual(0)                                                                                                                                                             Ilbmtoppm User Manual(0)



NAME
       ilbmtoppm - convert an ILBM file into a PPM image


SYNOPSIS
       ilbmtoppm [-ignore<chunkID>] [ -isham | -isnotham | -isehb | -isnotehb | -isdeep | -isnotdeep ] [-cmaponly] [-adjustcolors] [-transparent color] [-maskfile filename [-verbose] [ILBMfile]


DESCRIPTION
       This program is part of Netpbm(1)

       ilbmtoppm reads an IFF ILBM file as input and produces a PPM image as output.  ilbmtoppm can handle the following ILBM types:



       ·      Normal ILBMs with 1-16 planes.

       ·      Amiga Extra_Halfbrite (EHB)

       ·      Amiga HAM with 3-16 planes.

       ·      24 bit.

       ·      Multiplatte (normal or HAM) pictures.

       ·      Color map (BMHD + CMAP chunk only, nPlanes = 0).

       ·      Unofficial direct color.  1-16 planes for each color component.


       ilbmtoppm  uses  these  ILBM  chunks:  BMHD, CMAP, CAMG (only HAM & EHB flags used), PCHG, BODY unofficial DCOL chunk to identify direct color ILBM.  It ignores these chunks: GRAB, DEST, SPRT, CRNG,
       CCRT, CLUT, DPPV, DRNG, EPSF.  It ignores, but displays in verbose mode, these: NAME, AUTH, (c), ANNO, DPI.  It skips chunks whose type it doesn't recognize.


OPTIONS
       -verbose
              Give some information about the ILBM file.


       -ignore chunkID
              Skip a chunk.  chunkID is the 4-letter IFF chunk identifier of the chunk to be skipped.


       -isham | -isehb
              Treat the input file as a HAM or Extra_Halfbrite picture, even if these flags are not set in the CAMG chunk (or if there is no CAMG chunk).


       -cmaponly
              With this option, ilbmtoppm generates a PPM of the ILBM's color map, not the image itself.

              ilbmtoppm does the same thing even without -cmaponly if the ILBM is a pure color map stream (it has a bitmap header with an nplanes value of zero or has no BODY chunk.



       -adjustcolors
              If all colors in the CMAP have a value of less then 16, ilbmtoppm assumes a 4-bit colormap and gives a warning.  With this option the colormap is scaled to 8 bits.




LIMITATIONS
       The multipalette PCHG BigLineChanges and Huffman decompression code is untested.


REFERENCES
       Amiga ROM Kernel Reference Manual - Devices (3rd Ed.)  Addison Wesley, ISBN 0-201-56775-X


SEE ALSO
       ppmtoilbm(1) , ppm(5)



AUTHORS
       Copyright (C) 1989 by Jef Poskanzer.

       Modified October 1993 by Ingo Wilken (Ingo.Wilken@informatik.uni-oldenburg.de)



netpbm documentation                                                                           04 October 1993                                                                       Ilbmtoppm User Manual(0)
