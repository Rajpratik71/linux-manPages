Rasttopnm User Manual(0)                                                                                                                                                             Rasttopnm User Manual(0)



NAME
       rasttopnm - convert a Sun rasterfile to a PNM image


SYNOPSIS
       rasttopnm

       [-index]

       [rastfile]


DESCRIPTION
       This program is part of Netpbm(1)

       rasttopnm reads a Sun rasterfile as input and produces a PNM image as output.  The type of the output file depends on the input file - if it's black and white, rasttopnm writes a PBM image.  If it's
       grayscale, rasttopnm writes a PGM.  If it's color, rasttopnm writes a PPM.  The program tells you which type it is generating.


OPTIONS
       -index This odd option tells rasttopnm to use the color map indices in the raster as if they are the color values.

              In a colormapped Sun rasterfile, the header of the file contains a color map, associating each unique color that occurs in the file with an index number.  The raster portion of the file  then
              represents the color of a pixel with one of those colormap indices.

              This  option  has  found  use  as follows: take a regular grayscale Sun rasterfile in which all the grayscale value are represented, so the colormap indices are identical to the color values.
              Modify its color map so as to alter the colors in the image, in particular to equalize the colors.  With that modified rasterfile as input, rasttopnm  without  -index  produces  the  modified
              image.  But with -index, it produces the original unmodified image.

              This option was new in Netpbm 10.56 (September 2011).




SEE ALSO
       pnmtorast(1) , pnm(5)



AUTHOR
       Copyright (C) 1989, 1991 by Jef Poskanzer.



netpbm documentation                                                                            16 August 2011                                                                       Rasttopnm User Manual(0)
