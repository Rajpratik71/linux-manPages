Pamditherbw User Manual(0)                                                                                                                                                         Pamditherbw User Manual(0)



NAME
       pamditherbw - dither grayscale image to black and white


SYNOPSIS
       pamditherbw

       [-floyd | -fs | -atkinson | -threshold | -hilbert | -dither8 | -d8 | -cluster3 | -c3 | -cluster4 | -c4 | -cluster8 | -c8]

       [-value val]

       [-clump size]

       [-randomseed=integer]

       [pamfile]

       All options can be abbreviated to their shortest unique prefix.


DESCRIPTION
       This program is part of Netpbm(1)

       pamditherbw dithers a grayscale image.  Dithering means turning each shade of gray into a pattern of black and white pixels that, from a distance, look the same as the gray.

       The  input should be a PGM image or a PAM image of tuple type GRAYSCALE.  However, pamditherbw doesn't check, so if you feed it e.g. a PPM image, it will produce arbitrary results (actually, it just
       takes the first channel of whatever you give it and treats it as if it represented gray levels).

       The output is a PAM with tuple type BLACKANDWHITE.  You can turn this into a PBM (if you need to use it with an older program doesn't understand PAM) with pamtopnm.

       To do the opposite of dithering, you can usually just scale the image down and then back up again with pamscale, possibly smoothing or blurring the result with pnmsmooth or pnmconvol.   Or  use  the
       special case program pbmtopgm.

       To dither a color image (to reduce the number of pixel colors), use ppmdither.

       Another  way  to  convert  a  grayscale  image to a black and white image is thresholding.  Thresholding is simply replacing each grayscale pixel with a black or white pixel depending on whether its
       brightness is above or below a threshold.  That threshold might vary.  Simple thresholding is a degenerate case of dithering, so pamditherbw does very simple thresholding with its -threshold option.
       But pamthreshold does more sophisticated thresholding.

       If all you want is to change a PGM image with maxval 1 to a PBM image, pamtopnm will do that.



OPTIONS
       The default quantization method is boustrophedonic Floyd-Steinberg error diffusion (-floyd or -fs).

       Also available are simple thresholding (-threshold); Bayer's ordered dither (-dither8) with a 16x16 matrix;
        Atkinson ⟨http://www.tinrocket.com/projects/programming/graphics/00158/⟩ ; and three different sizes of 45-degree clustered-dot dither (-cluster3, -cluster4, -cluster8).

       A space filling curve halftoning method using the Hilbert curve is also available (-hilbert).

       Floyd-Steinberg  or  Atkinson will almost always give the best looking results; however, looking good is not always what you want.  For instance, you can use thresholding in a pipeline with the pnm-
       convol, for tasks such as edge and peak detection.  And clustered-dot dithering gives a newspaper-ish look, a useful special effect.

       Floyd-Steinberg is by far the more traditional, but
        some claim ⟨http://www.tinrocket.com/projects/programming/graphics/00158/⟩  Atkinson works better.

       The Hilbert curve method is useful for processing images before display on devices that do not render individual pixels distinctly (like laser printers).   This  dithering  method  can  give  better
       results  than  the dithering usually done by the laser printers themselves.  The -clump option alters the number of pixels in a clump.  Typically a PGM image will have to be scaled to fit on a laser
       printer page (2400 x 3000 pixels for an A4 300 dpi page), and then dithered to a PBM image before being converted to a postscript file.  A printing pipeline might look something like:

           pamscale -xysize 2400 3000 image.pgm | pamditherbw -hilbert |  \
             pamtopnm | pnmtops -scale 0.25 > image.ps




       -value This option alters the thresholding value for Floyd-Steinberg, Atkinson, and simple thresholding.  It should be a real number between 0 and 1.  Above 0.5 means darker images; below 0.5  means
              lighter.


       -clump This  option alters the number of pixels in a clump.  This is usually an integer between 2 and 100 (default 5).  Smaller clump sizes smear the image less and are less grainy, but seem to lose
              some grey scale linearity.


       -randomseed=integer
              This is the seed for the random number generator that generates the pixels.

              Use this to ensure you get the same image on separate invocations.

              By default, pgmnoise uses a seed derived from the time of day and process ID, which gives you fairly uncorrelated results in multiple invocations.

              This option was new in Netpbm 10.45 (December 2008).





REFERENCES
       The only reference you need for this stuff is 'Digital Halftoning' by Robert Ulichney, MIT Press, ISBN 0-262-21009-6.

       The Hilbert curve space filling method is taken from 'Digital Halftoning with Space Filling Curves' by Luiz Velho, Computer Graphics Volume 25, Number 4, proceedings of SIGRAPH '91,  page  81.  ISBN
       0-89791-436-8


SEE ALSO
       pamtopnm(1) , pgmtopgm(1) , pbmtopgm(1) , pamthreshold(1) , pbmreduce(1) , pnmconvol(1) , pamscale(1) , pam(5) , pnm(5) ,


HISTORY
       pamditherbw  was  new in Netpbm 10.23 (July 2004), but is essentially the same program as pgmtopbm that has existed practically since the beginning.  pamditherbw differs from its predecessor in that
       it properly adds brightnesses (using gamma transformations; pgmtopbm just adds them linearly) and that it accepts PAM input in addition to PGM and PBM and produces PAM output.

       pamditherbw obsoletes pgmtopbm.

       -atkinson was new in Netpbm 10.38 (March 2007).


AUTHOR
       Copyright (C) 1989 by Jef Poskanzer.



netpbm documentation                                                                             10 May 2010                                                                       Pamditherbw User Manual(0)
