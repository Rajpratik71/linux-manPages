Pgmmorphconv User Manual(0)                                                                                                                                                       Pgmmorphconv User Manual(0)



NAME
       pgmmorphconv - perform morphological convolutions: dilation, erosion


SYNOPSIS
       pgmmorphconv [ -erode | -dilate | -open | -close ] templatefile [pgmfile]

       Minimum  unique  abbreviation  of  option  is  acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.


DESCRIPTION
       This program is part of Netpbm(1)

       pgmmorphconv performs morphological convolutions on a PGM image: dilation and erosion.

       pgmmorphconv performs a "topological" convolution.  For each pixel of the input, pgmmorphconv generates an output pixel in the same position.  To determine the intensity of the output pixel, pgmmor-
       phconv  lays  the  template  image  over the input image such that the middle pixel of the template is over the input pixel in question.  pgmmorphconv looks at the input pixels underneath each white
       pixel in the template.  For a dilation, the maximum intensity of all those pixels is the intensity of the output pixel.  For an erosion, it is the minimum.

       Thus, the dilation effect is that bright areas of the input get bigger and dark areas smaller.  The erosion effect is the opposite.  The simplest template image would be one with a  white  pixel  in
       the  middle and the rest black.  This would produce an output image identical to the input.  Another simple template image is a fully white square.  This causes bright or dark areas to expand in all
       directions.  A template image that is white on the left side and black on the right would smear the image to the right.

       The template file named by templatefile contains the template image as a PBM image.  It must have an odd number of rows and an odd number of columns, so there is a definite middle  pixel.   It  must
       contain at least one white pixel.

       This is similar to the continuous convolution done by pnmconvol, except that with pnmconvol the output intensity is a weighted average of nearby input pixels instead of a minimum or maximum.

       This convolution changes the three Minkowski integrals in a predefined way, and can be used to filter an image to enhance certain features, to ease their automatic recognition.

       The options -erode and -dilate obviously produce an erosion or dilation, respectively.

       The  -open  option causes pgmmorphconv to perform first an erode and then a dilate operation.  The -close option causes a dilate first and then an erode.  If you specify none of these options, it is
       the same as -dilate.


SEE ALSO
       ·

              pgmminkowski(1)


       ·

              pnmconvol(1)


       ·

              pgm(5)



       For more information about morphological convolutions, see e.g.


       ·

               K. Michielsen and H. De Raedt, "Integral-Geometry Morphological Image Analysis",  Phys. Rep. 347, 461-538 (2001).  ⟨http://rugth30.phys.rug.nl/compphys0/2001.htm⟩


       ·

               J.S.  Kole,  K.  Michielsen,  and  H.   De   Raedt,   "Morphological   Image   Analysis   of   Quantum   Motion   in   Billiards",   Phys.   Rev.   E   63,   016201-1   -   016201-7   (2001)
              ⟨http://rugth30.phys.rug.nl/pdf/prechaos.pdf⟩




AUTHORS
       Luuk van Dijk, 2001.

       Based on work which is Copyright (C) 1989, 1991 by Jef Poskanzer.



netpbm documentation                                                                           29 October 2002                                                                    Pgmmorphconv User Manual(0)
