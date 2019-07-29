Pgmhist User Manual(0)                                                                                                                                                                 Pgmhist User Manual(0)



NAME
       pgmhist - print a histogram of the values in a PGM image


SYNOPSIS
       pgmhist

       [-median, -quartile, -decile]

       [-forensic]

       [-machine]

       [pgmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       pgmhist reads a PGM image as input and prints a histogram of the gray values or other gray value distribution metrics.

       If  you  specify  none  of -median, -quartile, or -decile, pgmhist prints a complete histogram showing how many pixels of each possible gray value exist in the image.  Along with each gray value, it
       tells you how many pixels are more black and more white that it.

       -median, -quartile, and -decile options cause pgmhist instead to print the indicated quantiles.  Each quantile is a gray value that actually appears in the image (as  opposed  to  fractional  values
       that  are  sometimes  used for quantiles).  The 3rd quartile is the least gray value for which at least 75% of the pixels are as dark or darker than it.  The 4th quartile is the brightest gray value
       that appears in the image.



OPTIONS
       You must specify exactly one of the ramp type options.


       -median

              This option causes pgmhist to print the median gray value.

              You may specify at most one of -median, -quartile, and -decile.

              This option was new in Netpbm 10.61 (December 2012).


       -quartile

              This option causes pgmhist to print the four quartile gray values.

              You may specify at most one of -median, -quartile, and -decile.

              This option was new in Netpbm 10.61 (December 2012).


       -decile

              This option causes pgmhist to print the ten decile gray values.

              You may specify at most one of -median, -quartile, and -decile.

              This option was new in Netpbm 10.61 (December 2012).


       -forensic

              With this option, pgmhist works on images that contain invalid gray values.  Normally, like most Netpbm programs, pgmhist fails if it encounters a gray value greater than the maxval that  the
              image  declares.   The  presence of such a value means the image is invalid, so the pixels have no meaning.  But with -forensic, pgmhist produces a histogram of the actual gray values without
              regard to maxval.  It issues messages summarizing the invalid pixels if there are any.

              One use for this is to diagnose the problem that caused the invalid Netpbm image to exist.

              There is a small exception to the ability of pgmhist to process invalid pixels even with -forensic: it can never process a gray value greater than 65535.  Note that in the rarely  used  Plain
              PGM format, it is possible for a number greater than that to appear where a gray value belongs.

              This option was new in Netpbm 10.66 (March 2014).  But Netpbm older than 10.66 does not properly reject invalid sample values, so the effect is very similar to -forensic.


       -machine

              This option causes pgmhist to print the information in a way easily digestible by a machine as opposed to a human.

              For the quantiles, there is one line per quantile, in quantile order, and it consists of the gray value of the quantile in decimal with no leading zeroes.

              For  the full histogram output, it consists of one line per possible gray value (whether that value appears in the image or not), in order of the gray values.  The line consists of two tokens
              separated by a space.  The first is the gray value; the second is the number of pixels in the image that have that gray value.  Both are decimal numbers without leading zeroes.

              This option was new in Netpbm 10.61 (December 2012).





SEE ALSO
       pnmnorm(1) , ppmhist(1)

       pgm(5) ,


AUTHOR
       Copyright (C) 1989 by Jef Poskanzer.



netpbm documentation                                                                             2 March 2014                                                                          Pgmhist User Manual(0)
