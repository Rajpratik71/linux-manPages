Pnmpaste User Manual(0)                                                                                                                                                               Pnmpaste User Manual(0)



NAME
       pnmpaste - paste a rectangle into a PNM image


SYNOPSIS
       pnmpaste

       [-replace|-or|-and|-xor]

       frompnmfile x y [intopnmfile]

       You can abbreviate all options to their shortest unique prefix.


DESCRIPTION
       This program is part of Netpbm(1)

       pnmpaste  reads two PNM images as input and inserts the first image (the "pasted image") into the second (the "base image") at the specified location, and produces a PNM image the same size and type
       as the base image as output.  If you don't specify the second file, pnmpaste reads the base image from Standard Input.

       x and y specify the location in the base image at which to put the top left corner of the pasted image, x giving the horizontal position and x giving the  vertical  position.   A  nonnegative  value
       indicates the number of pixels right of the right edge or below the top edge of the base image, while a negative value indicates the number of pixels right of the right edge or below the bottom edge
       (so x = -5 means 5 pixels left of the right edge).

       If any part of the pasted image does not fit within the base image, pnmpaste fails.

       This tool is most useful in combination with pamcut.  For instance, if you want to edit a small segment of a large image, and your image editor cannot edit the large image, you can cut out the  seg-
       ment you are interested in, edit it, and then paste it back in.

       Another useful companion tool is pbmmask.

       pamcomp is a more general tool, except that it lacks the 'or,' 'and,' and 'xor' functions.  pamcomp allows you to specify an alpha mask in order to have only part of the inserted image get inserted.
       So the inserted pixels need not be a rectangle.  You can also have the inserted image be translucent, so the resulting image is a mixture of the inserted image and the base image.


OPTIONS
       The option specifies the operation to use when doing the paste.  The default is -replace, which means to do the obvious paste: replace pixels of the 'into' image with those of the 'from' image.

       -and, -or, and -xor are allowed only if both input images are PBM images.  They say to combine the 'from' and 'into' images by performing boolean operations:  Each pixel of the output image  is  the
       result of the boolean operation on the corresponding pixels of the two input image, where white is TRUE and black is FALSE.

       Note  that  this is different from what you would get by doing a bit arithmetic on the bits in the PBM images, because in PBM, white is represented by a 0 bit, and 0 in bit arithmetic corresponds to
       FALSE in boolean arithmetic.


SEE ALSO
       pamcomp(1) , pamcut(1) , pnminvert(1) , pnmarith(1) , pbmmask(1) , pnm(5)



AUTHOR
       Copyright (C) 1989, 1991 by Jef Poskanzer.



netpbm documentation                                                                           21 February 1991                                                                       Pnmpaste User Manual(0)
