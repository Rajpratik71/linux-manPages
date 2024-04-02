Pgmdeshadow User Manual(0)                                                                                                                                                         Pgmdeshadow User Manual(0)



NAME
       pgmdeshadow - Deshadow a PGM image


SYNOPSIS
       pgmdeshadow

       [pnmfile]



DESCRIPTION
       This program is part of Netpbm(1)

       pgmdeshadow  removes gray shadows from an image.  This is useful for an image containing text, such as a scanned book pages, where a shadow typically appears near the book crease or near one side of
       the image.  pgmdeshadow recognizes a gray shadow as an area of smoothly changing color, starting from the outer edges of the image.  The program uses  a  simple  image  reconstruction  algorithm  to
       determine the local shadow gray level, then divides each pixel's gray level by the local shadow gray level.

       The algorithm is the 'fast hybrid grayscale reruction' algorithm from Luc Vincent, "Morphological Grayscale Reruction in Image Analysis: Applications and Efficient Algorithms.



OPTIONS
       None.


REFERENCES
       ·      Luc Vincent, 'Morphological Grayscale Reruction in Image Analysis: Applications and Efficient Algorithms,' IEEE Transactions on Image Processing, vol. 2, no. 2, April 1993, pp. 176-201.





SEE ALSO
       ppmshadow(1) , pgm(5)



HISTORY
       pgmdeshadow was added to Netpbm in Version 10.35 (August 2006).



netpbm documentation                                                                             06 July 2006                                                                      Pgmdeshadow User Manual(0)
