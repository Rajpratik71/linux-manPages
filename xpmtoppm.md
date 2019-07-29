Xpmtoppm User Manual(0)                                                                                                                                                               Xpmtoppm User Manual(0)



NAME
       xpmtoppm - convert an X11 pixmap to a PPM image


SYNOPSIS
       xpmtoppm

       [--alphaout={alpha-filename,-}] [-verbose]

       [xpmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       xpbtoppm reads an X11 pixmap (XPM version 1 or 3) as input and produces a PPM image as output.


OPTIONS
       --alphaout=alpha-filename
              xpmtoppm  creates  a PBM file containing the transparency mask for the image.  If the input image doesn't contain transparency information, the alpha-filename file contains all white (opaque)
              alpha values.  If you don't specify --alphaout, xpmtoppm does not generate an alpha file, and if the input image has transparency information, xpmtoppm simply discards it.

              If you specify - as the filename, xpmtoppm writes the alpha output to Standard Output and discards the image.

              See pamcomp(1)
               for one way to use the alpha output file.

              xpmtoppm can't handle a line longer than 8K characters in the XPM input.  If an input line exceeds this limit, xpmtoppm quits with an error message to that effect.  Before Netpbm 10.30 (Octo-
              ber 2005), the limit was 2K.


       --verbose
              xpmtoppm prints information about its processing on Standard Error.




LIMITATIONS
       xpmtoppm recognizes only a limited set of the features of XPM Version 3; i.e. it rejects as invalid many valid XPM images.

       The only place a comment block is valid is starting in Column 1 of the line immediately after 'static char ...'.

       In addition, ppmtoxpm properly recognizes any single-line comment that begins in Column 1 in the color table part of the file.

       There must be for every pixel a default colorname for a color type visual.

       Before Netpbm 10.58 (March 2012), zero bytes per pixel causes the program to fail with a message about premature EOF on input.


SEE ALSO
       ppmtoxpm(1) , pamcomp(1) , ppm(5)



AUTHOR
       Copyright (C) 1991 by Jef Poskanzer.

       Upgraded to work with XPM version 3 by Arnaud Le Hors<lehors@mirsa.inria.fr>, Tue Apr 9 1991.



netpbm documentation                                                                           31 December 2011                                                                       Xpmtoppm User Manual(0)
