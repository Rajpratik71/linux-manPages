Ppmmix User Manual(0)                                                                                                                                                                   Ppmmix User Manual(0)



NAME
       ppmmix - blend together two PPM images


SYNOPSIS
       ppmmix fadefactor ppmfile1 ppmfile2


DESCRIPTION
       This program is part of Netpbm(1)

       ppmmix reads two PPM images as input and mixes them together using the specified fade factor.  The fade factor may be in the range from 0.0 (only ppmfile1's image data) to 1.0 (only ppmfile2's image
       data).  Anything in between specifies a smooth blend between the two images.

       The two images must have the same dimensions and the same maxval.  Before Netpbm 10.54 (March 2011), they must also have the same type (PBM/PGM/PPM).

       The fade factor is applied to brightness, not light intensity.  That means for example that if you have a series of images you generated using ppmmix of a black and a white  image  with  a  linearly
       increasing fade factor, you will see an image getting linearly brighter, but the light intensity will increase faster at the end.  That is because it requires more intensity change at the bright end
       of the scale than at the dark end for the human eye to perceive the same brightness change.  This also means that if the original images aren't all one color, the mixed image is distorted, since the
       intensity relationship between pixels is different from the original image.

       pamcomp  is a more general alternative.  It allows you to mix images of different size and to have the fade factor vary throughout the image (through the use of an alpha mask).  It does not have the
       same-maxval and same-type restrictions.  It mixes light intensity, not brightness.


SEE ALSO
       pamcomp(1) , ppm(5)



AUTHOR
       Copyright (C) 1993 by Frank Neumann



netpbm documentation                                                                            23 March 2010                                                                           Ppmmix User Manual(0)
