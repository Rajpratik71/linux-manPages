Tgatoppm User Manual(0)                                                                                                                                                               Tgatoppm User Manual(0)



NAME
       tgatoppm - convert TrueVision Targa file to a PPM image


SYNOPSIS
       tgatoppm      [--alphaout={alpha-filename,-}]      [--headerdump] tga-filename


DESCRIPTION
       This program is part of Netpbm(1)

       tgatoppm reads a TrueVision Targa file as input and produces a PPM image as output.


OPTIONS
       All options can be abbreviated to their shortest unique prefix.




       --alphaout=alpha-filename
              tgatoppm   creates  a PGM image containing the alpha channel values in the input image.  If the input image doesn't contain an alpha channel, the alpha-filename file contains all zero (trans-
              parent) alpha values.  If you don't specify --alphaout, tgatoppm does not generate an alpha file, and if the input image has an alpha channel, tgatoppm simply discards it.

              If you specify - as the filename, tgatoppm writes the alpha output to Standard Output and discards the image.

              See pamcomp(1)
               for one way to use the alpha output file.


       --headerdump
              Causes tgatoppm to dump information from the TGA header to Standard Error.




SEE ALSO
       ppmtotga(1) , pamcomp(1) , ppm(5)



AUTHOR
       Partially based on tga2rast, version 1.0, by Ian J. MacPhedran.

       Copyright (C) 1989 by Jef Poskanzer.



netpbm documentation                                                                            02 April 2000                                                                         Tgatoppm User Manual(0)
