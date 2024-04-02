Pamtohdiff User Manual(0)                                                                                                                                                           Pamtohdiff User Manual(0)



NAME
       pamtohdiff - convert PAM image to horizontal difference image


SYNOPSIS
       pamtohdiff [pamfile] [-verbose]

       Minimum  unique  abbreviation  of  option  is acceptable.  You may use double hyphens instead of single hyphens to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.


DESCRIPTION
       This program is part of Netpbm(1)

       pamtohdiff takes a PAM (or PNM) image as input and produced a horizontal difference image version of it as output.  A horizontal difference image is one where the samples in each  row  indicate  the
       difference between the sample value in the corresponding sample of the input image and the sample directly above it (in the previous row) in the input image.  The horizontal difference image has the
       property that if a row of the original image is identical to the row above it over a long extent, the corresponding row in the horizontal difference image will contain all  zeroes.   That  makes  it
       compress better than the original image.

       Because the horizontal difference samples can be positive or negative, but PAM samples are unsigned integers, the samples in the horizontal difference image PAM are defined to be the difference mod-
       ulus the range of the input (maxval + 1).  This doesn't lose any information, as it might seem, because: of the two differences that could result in the same pamtohdiff output value (e.g. if  maxval
       is  99,  +20  and  -80 would both result in "20" in the output), only one is possible in context and the other would result, when reconstructing the original image, in a value less than 0 or greater
       than maxval.

       Before the modulus operation, the values pamtohdiff computes are also biased by half the maxval.  This is to make the results easier to inspect visually.  Because of the bias, you  can  display  the
       pamtohdiff  output  as  if it were a PNM image.  As long as none of your differences are more than half the maxval, large negative differences show up as dark spots, smaller negative differences are
       lighter, zero differences are medium intensity, and positive differences are light.  If you want this to work even for images that have differences that exceed half the maxval, just use ppmdim 50 on
       the original image.  To avoid losing information, though, do a pamdepth to double the maxval first.

       Note that because of the transfer function just described, a difference of zero, which is most common, is represented by a PAM sample value in the output of one half the maxval.

       The output PAM has a tuple type of "hdiff".

       You can use hdifftopam to recover the original image from a horizontal difference image PAM.



SEE ALSO
       hdifftopam(1) , pamdepth(1) ,


AUTHOR
       Bryan Henderson



netpbm documentation                                                                            15 April 2002                                                                       Pamtohdiff User Manual(0)
