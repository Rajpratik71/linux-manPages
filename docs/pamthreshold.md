Pamthreshold User Manual(0)                                                                                                                                                       Pamthreshold User Manual(0)



NAME
       pamthreshold - threshold grayscale image to black and white


SYNOPSIS
       pamthreshold [-simple] [-local=widthxheight] [-dual=widthxheight] [-threshold=threshold] [-contrast=threshold] [inputpamfile]

       Minimum  unique  abbreviations  of options are acceptable. You may use double hyphens instead of a single hyphen to denote options. You may use white space in place of the equals sign to separate an
       option name from its value.


DESCRIPTION
       This program is part of Netpbm(1)

       pamthreshold thresholds a grayscale image. Thresholding means dividing the image into background and foreground by comparing every pixel to a thresholding value.

       The input should be a PGM image or a PAM image of tuple type GRAYSCALE or GRAYSCALE_ALPHA.  However, pamthreshold doesn't check; it just thresholds the first channel as if it were grayscale  samples
       and if there is a second channel, processes it as if it is an alpha (transparency) channel.  So if you feed it e.g. a PPM image, it will work but produce probably useless results.

       The output is a PAM with tuple type BLACKANDWHITE or BLACKANDWHITE_ALPHA, depending on whether the input has an alpha channel.  You can turn this into a PBM (if you need to use it with an older pro-
       gram that doesn't understand PAM, or you can't afford the 8X amount of space that PAM uses for the image) with pamtopnm.

       The output is to Standard Output.

       When the input has an alpha channel, pamthreshold includes an alpha channel in the output.  Since the output has maxval 1, the alpha channel can indicate only  fully  transparent  or  fully  opaque.
       pamthreshold make it fully transparent where the input is more than half transparent and fully opaque where it isn't.

       The alpha function was new in Netpbm 10.43 (June 2008).  Before that, pamthreshold ignores any alpha channel in the input.

       Another  way  to  convert  a grayscale image to black and white is to dither.  Dithering is using clustered black and white pixels such that if you step back and look at the picture, you see varying
       levels of gray.  pamditherbw does dithering.


OPTIONS
       Without any options, pamthreshold uses a method based on the iterative algorithm found in the wikipedia ⟨http://www.wikipedia.org/⟩  article
        Thresholding    (image     processing)     ⟨http://en.wikipedia.org/wiki/Thresholding_%28image_processing%29⟩          to     compute     the     thresholding     value.      (     this     version
       ⟨http://en.wikipedia.org/w/index.php?title=Thresholding_%28image_processing%29&oldid=132306976⟩    of the Wikipedia article was current at the time of this writing).  It uses this threshold to glob-
       ally threshold the image.  This should work well for most images.  The program issues a message telling you what threshold it used.  (Netpbm messages go to Standard Error, and you can turn them  off
       with the Netpbm common option -quiet).

       Options -simple, -local, and -dual select other methods.




       -simple
              This  selects simple or global thresholding, i.e. pamthreshold compares every pixel to the threshold you specify with -threshold.  Those with a brightness greater than or equal to the thresh-
              old become white; others become black.  This works well for black and white text pages scanned with a flatbed scanner and is faster than the default method  that  iteratively  determines  the
              thresholding value first.


       -local=widthxheight
              This  selects  local  adaptive  thresholding  (also known as dynamic thresholding) using the neighborhood which is the square width pixels wide and height pixels high centered on the pixel in
              question.  pamthreshold computes the threshold individually for each pixel of the image.  This can accommodate changing lighting conditions in the image.  Depending on the size of the  neigh-
              borhood this can be quite slow.


       -dual=widthxheight
              This  selects  a  dual thresholding algorithm using a global threshold for low contrast neighborhoods and local thresholding otherwise.  This can preserve larger back- respectively foreground
              areas than local adaptive thresholding.  This algorithm was proposed in the paper "An Approach To Licence Plate Recognition" by J.R. Parker and Pavol Federl.


       -threshold=threshold
              This sets the thresholding value for simple or local thresholding.  The value is a floating point number in the range [0, 1] directly proportional to the Netpbm sample values, where 0  corre-
              sponds to black and 1 to the maxval of the image.

              If you don't specify this option, pamthreshold uses a threshold of 0.5.

              Without -simple, -local, or -dual, this option is meaningless.

              The  meaning  of  the  threshold depends upon the kind of thresholding you do (as determined by other options).  Roughly, pixels at least as bright as the threshold become white in the output
              while others become black.


       -contrast=threshold
              This sets the threshold to determine if a neighborhood has low contrast or not for dual thresholding.  The value is a floating point number in the range [0, 1].

              If you don't specify this option, pamthreshold uses a contrast threshold of 0.05.  Without -dual this option is meaningless.





SEE ALSO
       pamditherbw(1) , ppmtopgm(1) , pamtopnm(1) , pam(5)



HISTORY
       pamthreshold was new in Netpbm 10.34 (June 2006).


AUTHOR
       pamthreshold is Copyright © 2006 by Erik Auerswald and released under the GPL(1)




netpbm documentation                                                                             06 June 2007                                                                     Pamthreshold User Manual(0)
