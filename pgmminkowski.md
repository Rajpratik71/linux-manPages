Pgmminkowski User Manual(0)                                                                                                                                                       Pgmminkowski User Manual(0)



NAME
       pgmminkowski - compute Minkowski integral


SYNOPSIS
       pgmminkowski pgmfile


DESCRIPTION
       This program is part of Netpbm(1)

       pgmminkowski computes the 3 Minkowski integrals of a PGM image.

       The Minkowski integrals mathematically characterize the shapes in the image and hence are the basis of "morphological image analysis."

       Hadwiger's  theorem  has  it that these integrals are the only motion-invariant, additive and conditionally continuous functions of a two-dimensional image, which means that they are preserved under
       certain kinds of deformations of the image.  On top of that, they are very easy and quickly calculated.  This makes them of interest for certain kinds of pattern recognition.

       Basically, the Minkowski integrals are the area, total perimeter length, and the Euler characteristic of the image, where these metrics apply to the foreground image, not the rectangular  PGM  image
       itself.   The foreground image consists of all the pixels in the image that are white.  For a grayscale image, there is some threshold of intensity applied to categorize pixels into black and white,
       and the Minkowski integrals are calculated as a function of this threshold value. The total surface area refers to the number of white pixels in the PGM and the perimeter is the sum of perimeters of
       each closed white region in the PGM.

       For  a  grayscale  image,  these  numbers are a function of the threshold of what you want to call black or white.  pgmminkowski reports these numbers as a function of the threshold for all possible
       threshold values.  Since the total surface area can increase only as a function of the threshold, it is a reparameterization of the threshold.  It turns out that if you consider the other two  func-
       tions,  the  boundary  length and the Euler characteristic, as a function of the first one, the surface, you get two functions that are a fingerprint of the picture.  This fingerprint is e.g. suffi-
       cient to recognize the difference between pictures of different crystal lattices under a scanning tunnelling electron microscope.

       For more information about Minkowski integrals, see e.g.


       ·

               K. Michielsen and H. De Raedt, "Integral-Geometry Morphological Image Analysis",  Phys. Rep. 347, 461-538 (2001).  ⟨http://rugth30.phys.rug.nl/compphys0/2001.htm⟩


       ·

               J.S.  Kole,  K.  Michielsen,  and  H.   De   Raedt,   "Morphological   Image   Analysis   of   Quantum   Motion   in   Billiards",   Phys.   Rev.   E   63,   016201-1   -   016201-7   (2001)
              ⟨http://rugth30.phys.rug.nl/pdf/prechaos.pdf⟩


       The output is suitable for direct use as a datafile in gnuplot.

       In addition to the three Minkowski integrals, pgmminkowski also lists the horizontal and vertical edge counts.




SEE ALSO
       pgmmorphconv(1)

       pbmminkowski(1)

       pgm(5)



AUTHORS
       Luuk van Dijk, 2001.

       Based on work which is Copyright (C) 1989, 1991 by Jef Poskanzer.



netpbm documentation                                                                           29 October 2002                                                                    Pgmminkowski User Manual(0)
