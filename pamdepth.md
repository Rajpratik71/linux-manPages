Pamdepth User Manual(0)                                                                                                                                                               Pamdepth User Manual(0)



NAME
       pamdepth - change the depth (color resolution) in a Netpbm image


SYNOPSIS
       pamdepth newmaxval [netpbmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       pamdepth reads a Netpbm image as input, changes its depth (color resolution), and writes out the resulting Netpbm image.  I.e. the output has a different maxval from the input, but all the same col-
       ors (apart from rounding error).

       Reducing the depth results in some loss of information.

       Here is an example of the effect at the image format level: Assume you start with an image with maxval 100 and sample values of 50 and 100.  You tell pamdepth to change it to depth 150.  The  output
       has maxval 200 and sample values 75 and 150.

       This program works on multi-image streams.

       Be careful of off-by-one errors when choosing the new maxval.  For instance, if you want the color values to be five bits wide, use a maxval of 31, not 32.

       One  important  use  of  pamdepth is to convert a new format 2-byte-per-sample PNM file to the older 1-byte-per-sample format.  Before April 2000, essentially all raw (binary) format PNM files had a
       maxval less than 256 and one byte per sample, and many programs may rely on that.  If you specify a newmaxval less than 256, the resulting file should be readable by any program that worked with PNM
       files before April 2000.


SEE ALSO
       pnm(5) , pam(5) , pnmquant(1) , ppmdither(1)

       ppmbrighten(1)

       pamfunc(1)



HISTORY
       pamdepth was new in Netpbm 10.32 (February 2006).  It replaced pnmdepth, by Jef Poskanzer.  pamdepth is backward compatible with pnmdepth and adds the ability to process arbitrary PAM images and the
       ability to process multi-image input streams.  pnmdepth handled only PNM images and ignored all but the first in any stream.



netpbm documentation                                                                           19 December 2013                                                                       Pamdepth User Manual(0)
