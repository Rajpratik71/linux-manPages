Ppmspread User Manual(0)                                                                                                                                                             Ppmspread User Manual(0)



NAME
       ppmspread - displace a PPM image's pixels by a random amount


SYNOPSIS
       ppmspread amount [ppmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       ppmspread reads a PPM image as input and moves every pixel around a random bit relative to its original position. amount determines by how many pixels a pixel is to be moved around at most.

       Pictures processed with this filter will seem to be somewhat dissolved or unfocussed (although they appear more coarse than images processed by something like pnmconvol).

       The randomness in the image is limited before Netpbm 10.37 (December 2006) -- if you run the program twice in the same second, you may get identical output.



SEE ALSO
       ppm(5) , pnmconvol(1)



AUTHOR
       Copyright (C) 1993 by Frank Neumann



netpbm documentation                                                                           20 November 2008                                                                      Ppmspread User Manual(0)
