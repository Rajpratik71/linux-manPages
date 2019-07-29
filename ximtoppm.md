Ximtoppm User Manual(0)                                                                                                                                                               Ximtoppm User Manual(0)



NAME
       ximtoppm - convert an Xim file to a PPM image


SYNOPSIS
       ximtoppm

       [--alphaout={alpha-filename,-}] [ximfile]


DESCRIPTION
       This program is part of Netpbm(1)

       ximptoppm reads an Xim file as input and produces a PPM image as output.  The Xim toolkit is included in the contrib tree of the X.V11R4 release.


OPTIONS
       You can abbreviate any option to its shortest unique prefix.



       --alphaout=alpha-filename
              ximtoppm  creates a PGM file containing the alpha channel values in the input image.  If the input image doesn't contain an alpha channel, the alpha-filename file contains all zero (transpar-
              ent) alpha values.  If you don't specify --alphaout, ximtoppm does not generate an alpha file, and if the input image has an alpha channel, ximtoppm simply discards it.

              If you specify - as the filename, ximtoppm writes the alpha output to Standard Output and discards the image.

              Actually, an Xim image can contain an arbitrary fourth channel -- it need not be an Alpha channel.  ximtoppm extracts any fourth channel it finds as described above; it doesn't matter  if  it
              is an alpha channel or not.

              See pamcomp(1)
               for one way to use the alpha output file.




SEE ALSO
       pamcomp(1) , ppm(5)



AUTHOR
       Copyright (C) 1991 by Jef Poskanzer.



netpbm documentation                                                                            April 2, 2000                                                                         Ximtoppm User Manual(0)
