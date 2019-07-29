Pamenlarge User Manual(0)                                                                                                                                                           Pamenlarge User Manual(0)



NAME
       pamenlarge - Enlarge a Netpbm image N times


SYNOPSIS
       pamenlarge N [pnmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       pamenlarge reads a Netpbm image as input, replicates its pixels N times, and produces a Netpbm image as output.  The output is the same type of image as the input.

       If you enlarge by a factor of 3 or more, you should probably add a pnmsmooth step; otherwise, you can see the original pixels in the resulting image.

       For  PBM  images, pamenlarge uses special fast algorithms for scale factors up to 10.  For larger factors, it uses a simple but slow algorithm.  As a result, you can often get a significantly faster
       scale by running pamenlarge multiple times.  For example, enlarging by 3 and then by 5 is faster than enlarging once by 15.  And because the algorithms are different for the different scale factors,
       some  faster  than  others, the order matters too.  For example, the following examples all produce the same output -- an image 15 times bigger on edge than the input -- but with at different spees,
       each being faster than the one before.

            $ pamenlarge 15 test.pbm
            $ pamenlarge 5 test.pbm | pamenlarge 3
            $ pamenlarge 3 test.pbm | pamenlarge 5

       The special fast cases for factors up to 10 have existed since Release 10.50 (March 2010).  The special cases for 1, 2, 3, and 5 go back to Release 10.41 (December 2007).  Before 10.41, there are no
       special scale factors and PBM enlargement is significantly slower than today for all scale factors.

       pamenlarge  can  enlarge  only  by  integer  factors.  The slower but more general pamscale can enlarge or reduce by arbitrary factors.  pamscale allows you to enlarge by resampling, which gives you
       smoother enlargements.  But it is much slower.

       pamstretch is another enlarging program that enlarges by integer factors.  It does a simple kind of resampling that gives you a smoothed enlargement with less computational cost.

       pbmreduce can reduce by integer factors, but only for PBM images.


HISTORY
       pamenlarge was new in Netpbm 10.25 (October 2004).  It is designed as a replacement for pnmenlarge by Jef Poskanzer, which was in Pbmplus as far back as 1989.  The major difference  is  that  pamen-
       large can enlarge PAM format images in addition to PNM.



SEE ALSO
       pbmreduce(1) , pamscale(1) , pamstretch(1) , pbmpscale(1) , pnmsmooth(1) , pnm(5)



AUTHOR
       Copyright (C) 1989 by Jef Poskanzer.



netpbm documentation                                                                            17 March 2010                                                                       Pamenlarge User Manual(0)
