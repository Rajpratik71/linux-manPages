Pamaddnoise User Manual(0)                                                                                                                                                         Pamaddnoise User Manual(0)



NAME
       pamaddnoise - add noise to a Netpbm image



SYNOPSIS
       pamaddnoise

       [-type noise_type]

       [-seed int] pamaddnoise -type gaussian

       [-sigma1 value]

       [-sigma2 value] [-seed int]

       [netpbmfile] pamaddnoise -type  multiplicative_gaussian

       [-mgsigma value] [-seed int]

       [netpbmfile] pamaddnoise -type impulse

       [-tolerance ratio]

       [-seed int] [netpbmfile] pamaddnoise -type  laplacian

       [-lsigma value]

       [-seed int] [netpbmfile] pamaddnoise -type  poisson

       [-lambda value]

       [-seed int] [netpbmfile]



DESCRIPTION
       This program is part of Netpbm(1)

       pamaddnoise adds the specified noise type to a Netpbm image.  pamaddnoise treats a PPM image as 3 independent planes, not as a plane of colors in a color space.



OPTIONS
       -lambda value
              Used for poisson noise only.  The default value is 0.05.


       -lsigma value
              Used for laplacian noise only.  The default value is 10.0.


       -mgsigma value
              Used for multiplicative gaussian noise only.  The default value is 0.5.


       -seed int
              Used for all noise types.  Set the initial random number generator seed value.


       -sigma1 value
              Used for gaussian noise only.  The default value is 4.0.


       -sigma2 value
              Used for gaussian noise only.  The default value is 20.0.


       -tolerance ratio
              Used for impulse noise only.  The default value is 0.10.  This means that 5% of all pixel values will be set to 0 and 5% will be set to the maxval


       -type noise_type
              Select  type of noise by name.  The following noise types are available: gaussian, multiplicative_gaussian, impulse, laplacian, poisson.  Only enough letters to be unique are required for the
              noise type option.  The default noise type is gaussian.



       ·      gaussian

       ·      multiplicative_gaussian

       ·      impulse

       ·      laplacian

       ·      poisson





REFERENCES
       ·      'Adaptive Image Restoration in Signal-Dependent Noise' by R. Kasturi Institute for Electronic Science, Texas Tech University, 1982


       ·      'Digital Image Processing Algorithms' by Ioannis Pitas, Prentice Hall, 1993 ISBN 0-13-145814-0





SEE ALSO
       pgmnoise(1) , pgmmedian(1) , pnm(5) , pam(5) ,


HISTORY
       pamaddnoise was added to Netpbm in Version 10.29 (August 2005).  It had been distributed by Mike Burns via his own web site before that (and continued to be so).

       Burns' version, and the one in Netpbm 10.29, was called pnmaddnoise and worked only on PNM images.  In Netpbm 10.30, it was converted to handle PAM images and renamed to pamaddnoise.



AUTHOR
       Copyright (C) 1995 by Mike Burns <burns@cac.psu.edu>



netpbm documentation                                                                           14 November 1995                                                                    Pamaddnoise User Manual(0)
