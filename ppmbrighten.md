Ppmbrighten User Manual(0)                                                                                                                                                         Ppmbrighten User Manual(0)



NAME
       ppmbrighten - change a PPM image's Saturation and Value


SYNOPSIS
       ppmbrighten [-normalize] [-saturation [+|-saturation_percent]] [-value [+|-value_percent]] ppmfile

       Minimum  unique  abbreviation  of  option  is  acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.


DESCRIPTION
       This program is part of Netpbm(1)

       ppmbrighten increases or decreases the Saturation and Value (from the HSV color space) of each pixel of a PPM image.  You specify the per centage change for each of those parameters.

       You can also remap the colors of the pixels so their Values cover the full range of possible Values.

       Hue-Saturation-Value, or HSV, is one way to represent a color, like the more well-known RGB.  Hue, Saturation, and Value are numbers in the range from 0 to 1.  We always capitalize them in this doc-
       ument when we mean the number from the HSV color space, especially since "value" as a conventional English word has a much more abstract meaning.

       Value is a measure of how bright the color is, relative to some specified maximum (the PPM format is also defined in terms of a specified maximum brightness -- For the purposes of this program, they
       are the same).  In particular, it is the brightness of the brightest primary color component of the color divided by the maximum brightness possible for a component.  Zero Value means black.   White
       has full Value.

       Hue is an indication of the secondary color with the same brightness that most closely approximates the color.  A secondary color is made of a combination of at most two of the primary colors.

       Saturation is a measure of how close the color is to the color indicated by the Hue and Value.  A lower number means more light of the third primary color must be added to get the exact color.  Full
       Saturation means the color is a secondary color.  Zero Saturation means the color is gray (or black or white).  Decreasing the saturation of a color tends to make it washed out.

       If it is impossible to increase the Value of a pixel by the amount you specify (e.g. the Value is .5 and you specify +200%), ppmbrighten increases it to full Value instead.

       If it is impossible to increase the Saturation of a pixel by the amount you specify (e.g. it is already half saturated and you specify +200%), ppmbrighten increases it to full Saturation instead.

       For a simpler kind of brightening, you can use pamfunc -multiplier simply to increase the brightness of each pixel by a specified per centage,  clipping  each  RGB  component  where  the  calculated
       brightness  would  exceed  full  brightness.  Thus, the brightest colors in the image would change chromaticity in addition to not getting the specified brightness boost.  For decreasing brightness,
       pamfunc should do the same thing as ppmbrighten.

       ppmflash does another kind of brightening.  It changes the color of each pixel to bring it a specified per centage closer to white.  This increases the value and saturation.


EXAMPLES
       To double the Value of each pixel:
       ppmbrighten -v 100

       To double the Saturation and halve the Value of each pixel:
       ppmbrighten -s 100 -v -50


OPTIONS
       -value value_percent
              This option specifies the amount, as a per centage, by which you want to change the Value of each pixel.  It may be negative.


       -saturation value_percent
              This option specifies the amount, as a per centage, by which you want to change the Saturation of each pixel.  It may be negative.



       -normalize
              This option causes ppmbrighten to linearly remap the Values of the pixels to cover the range 0 to 1.  The option name is wrong -- this operation is not normalization (it was  named  in  error
              and the name has been kept for backward compatibility).

              ppmbrighten applies the brightening that you specify with the -value option after the remapping.

              Before Netpbm 10.14 (March 2003), your input must be from a seekable file (not a pipe) to use -normalize.  If it isn't, the program fails with a bogus error message.




SEE ALSO
       pnmnorm(1) , ppmdim(1) , pamfunc(1) , ppmflash(1) , pamdepth(1) , pnmgamma(1) , ppmhist(1) , ppm(5)



AUTHOR
       Copyright (C) 1990 by Brian Moffet.  Copyright (C) 1989 by Jef Poskanzer.

       Permission  to  use, copy, modify, and distribute this software and its documentation for any purpose and without fee is hereby granted, provided that the above copyright notice appear in all copies
       and that both that copyright notice and this permission notice appear in supporting documentation.  This software is provided 'as is' without express or implied warranty.



netpbm documentation                                                                           26 October 2012                                                                     Ppmbrighten User Manual(0)
