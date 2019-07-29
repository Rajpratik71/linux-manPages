Ppmdither User Manual(0)                                                                                                                                                             Ppmdither User Manual(0)



NAME
       ppmdither - ordered dither for color images


SYNOPSIS
       ppmdither

       [-dim=power]

       [-red=n]

       [-green=n]

       [-blue=n]

       [netpbmfile]

       All  options  can  be abbreviated to their shortest unique prefix.  You may use two hyphens instead of one to designate an option.  You may use either white space or an equals sign between an option
       name and its value.



DESCRIPTION
       This program is part of Netpbm(1)

       ppmdither reads a Netpbm image as input, and applies dithering to it to reduce the number of colors used down to the specified number of shades for each primary.  It produces a PPM image as output.

       The default number of shades is 5 red, 9 green, and 5 blue, for a total of 225 colors.  To convert the image to a binary rgb format  suitable  for  primitive  color  printers,  use  -red=2  -green=2
       -blue=2.

       You can do another kind of dither -- Floyd-Steinberg -- with pnmquant or pnmremap.


OPTIONS
       -dim power
               The size of the dithering matrix.  The dithering matrix is a square whose dimension is a power of 2.  power is that power of 2.  The default is 4, for a 16 by 16 matrix.


       -red=n The number of red shades to be used, including black; minimum of 2.

              Default is 5.


       -green n
              The number of green shades to be used, including black; minimum of 2.

              Default is 9.


       -blue n
              The number of blue shades to be used, including black; minimum of 2.

              Default is 5.



SEE ALSO
       pamditherbw(1) , pamdepth(1) , pnmquant(1) , pnmremap(1) , ppm(5)



AUTHOR
       Copyright (C) 1991 by Christos Zoulas.



netpbm documentation                                                                           16 December 2009                                                                      Ppmdither User Manual(0)
