Ppmtoterm User Manual(0)                                                                                                                                                             Ppmtoterm User Manual(0)



NAME
       ppmtoterm - convert a PPM image to a ANSI ISO 6429 ascii image


SYNOPSIS
       ppmtoterm

       [ppmfile]

       All options can be abbreviated to their shortest unique prefix.  You may use two hyphens instead of one.  You may separate an option name and its value with white space instead of an equals sign.


DESCRIPTION
       This program is part of Netpbm(1)

       This  program  tries  to  produce an accurate representation of a PPM image on an terminal that implements the ANSI ISO 6429 standard.  It approximates colors, finding the minimum Cartesian distance
       between the input RGB vectors and the ones in the generated palette.  As the available color palette is somewhat restricted, you get the best results when the colors in the original  image  are  few
       and the RGB intensities are close to zero, half of maximum, and maximum.

       You can usually get good results with cartoons or images with plain colors (no gradients).  With photos, results can vary, but are usually not very accurate.

       The output image has one line for each row and one character for each column of the input image.  E.g. an 80 pixel by 25 pixel PPM image would fill up an 80x25 terminal screen.  Use pamscale or pam-
       cut to make your image fit properly on your screen.

       Furthermore, use pamscale to recover the proper aspect ratio, because a character on a terminal screen is rarely square.  Typically, a character is twice has high as it is wide, so in  order  for  a
       20x20 image to appear square on your terminal, as it should, you'll want to squash it vertically or stretch it horizontally by a factor of two (resulting int 10x20 characters are 20x40 characters).

       The  image  starts at the current cursor position on the terminal screen.  Each successive row starts at Column 0 on the screen.  If you want to shift the image up or down, for example to center it,
       use pnmpad on the input.

       This program was born with the objective of displaying nice color images on the Linux console, e.g. a proper logo at Linux boot.

       pbmto4425 does a similar thing for black and white images, using line drawing characters, on some terminals.


OPTIONS
       None.



SEE ALSO
       pamscale(1) , pamcut(1) , pbmtoascii(1) , pbmto4425(1) , ppm(5)




AUTHOR
       Copyright (C) 2002 by Ero Carrera.



HISTORY
       This program was new in Netpbm 10.9 (August 2002).



netpbm documentation                                                                            07 April 2010                                                                        Ppmtoterm User Manual(0)
