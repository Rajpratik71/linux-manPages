Pnmscalefixed User Manual(0)                                                                                                                                                     Pnmscalefixed User Manual(0)



NAME
       pnmscalefixed - scale a PNM file quickly


DESCRIPTION
       This program is part of Netpbm(1)

       pnmscalefixed is like pamscale except that it uses fixed point arithmetic internally instead of floating point, which may make it run faster.  In turn, it is less accurate and may distort the image.
       It also lacks many of the features of pamscale.

       Use the pamscale user manual with pnmscalefixed.  This document only describes the difference.  Avoid any feature mentioned in the pamscale manual as not existing before Netpbm 9.9.

       pnmscalefixed uses fixed point 12 bit arithmetic.  By contrast, pamscale uses floating point arithmetic which on most machines is probably 24 bit precision.  This makes pnmscalefixed run faster (30%
       faster in one experiment), but the imprecision can cause distortions at the right and bottom edges.

       The  distortion takes the following form: One pixel from the edge of the input is rendered larger in the output than the scaling factor requires.  Consequently, the rest of the image is smaller than
       the scaling factor requires, because the overall dimensions of the image are always as requested.  This distortion will usually be very hard to see.

       pnmscalefixed with the -verbose option tells you how much distortion there is.

       The amount of distortion depends on the size of the input image and how close the scaling factor is to an integral 1/4096th.

       If the scaling factor is an exact multiple of 1/4096, there is no distortion.  So, for example doubling or halving an image causes no distortion.  But reducing it or enlarging it by  a  third  would
       cause  some  distortion.   To  consider an extreme case, scaling a 100,000 row image down to 50,022 rows would create an output image with all of the input squeezed into the top 50,000 rows, and the
       last row of the input copied into the bottom 22 rows of output.

       pnmscalefixed could probably be modified to use 16 bit or better arithmetic without losing anything.  The modification would consist of a single constant in the source code.  Until there is a demon-
       strated need for that, though, the Netpbm maintainer wants to keep the safety cushion afforded by the original 12 bit precision.

       pnmscalefixed does not have pamscale's -nomix option.



netpbm documentation                                                                           18 November 2000                                                                  Pnmscalefixed User Manual(0)
