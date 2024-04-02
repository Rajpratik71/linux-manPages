Pamtilt User Manual(0)                                                                                                                                                                 Pamtilt User Manual(0)



NAME
       pamtilt - print the tilt angle of a PGM file


SYNOPSIS
       pamtilt [-angle=maxangle] [-fast] [-quality=q] [-hstep=n] [-vstep=n] [-dstep=n] [-astep=n] [-verbose] [pgmfile]


EXAMPLES
           scanimage --mode Gray --resolution 300 >crooked.pgm
           pnmrotate -b white `pamtilt crooked.pgm` crooked.pgm >straight.pgm
           (then crop, threshold, etc.)


DESCRIPTION
       This program is part of Netpbm(1)

       pamtilt tries to find the correct angle for untilting (de-skewing) a scanned text document.  The output is a single floating-point number (the angle in degrees) for use as the argument to pnmrotate.

       'Document skew' is the name given to what happens when you feed a page into an image scanner at an angle: the resulting image is tilted.  pamtilt aims to help correct that.

       pamtilt  makes  three iterations at successively finer increments, testing prospective rotation angles to find the best one.  pamtilt works best for straightening images with strong horizontal lines
       and does poorly with arbitrary photos.  If pamtilt has no confidence in its results, it prints the special value 00.00; you can check for this or just pass it as a legal argument to pnmrotate.

       pamtilt operates on the first plane of the input image, which is either PNM or PAM, and ignores any other planes.  Ordinarily, the input is PGM or GRAYSCALE PAM, so there is only one plane.

       pamtilt works on bilevel (PBM, BLACKANDWHITE PAM) images as well as grayscale, but you will minimize artifacts if you scan and rotate in grayscale before you apply a  threshold  to  make  a  bilevel
       image.


OPTIONS
       A few options have general utility:




       -angle=maxangle
              Assume a maximum tilt angle of maxangle (measured in degrees).  The default value is sufficient for most images, even those scanned somewhat carelessly.

              The default is 10.0.


       -fast  Skip the third iteration for speed at the expense of accuracy.


       -verbose
              Show on Standard Error the measurements computed at each tested angle.



       Here are some other options you can use to tune the operation of pamtilt but they're seldom needed.  The default values accommodate a wide variety of input documents.




       -quality=q
              Require  a signal-to-noise ratio of a least q on the first iteration to report a valid result.  Larger values reduce the chances of obtaining a bogus result at the risk of obtaining no result
              at all.

              The default is 1.0.


       -hstep=n
              Set the horizontal increment to check every nth column.  This value affects both run time and memory requirements.

              The default is 11.


       -vstep=n
              Set the vertical increment to check every nth row.  Larger values usually work, reducing run time, but they increase the risk of incorrect results.

              The default is 5.


       -dstep=n
              Set the vertical distance used when checking pixels in a column.  The default is intended to minimize the effect of noise along a horizontal boundary.

              The default is 2.


       -astep=n
              Set the angle increment of the first iteration, in degrees.

              The default is 1.0.





REFERENCES
       pamtilt implements a somewhat simplified algorithm inspired by: "Measuring Document Image Skew and Orientation", by Bloomberg, Kopec, and Dasari.  In SPIE Volume 2422, Document Recognition II, pages
       302-316, February 1995.


SEE ALSO
       ·

              pnmrotate(1)


       ·

              pgm(5)




HISTORY
       pamtilt was new in Netpbm 10.30 (October 2005).

       Gregg Townsend wrote it and sent it to Bryan Henderson in August 2005.  Bryan recoded it to fit Netpbm conventions.



netpbm documentation                                                                            28 August 2005                                                                         Pamtilt User Manual(0)
