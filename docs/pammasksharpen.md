Pammasksharpen User Manual(0)                                                                                                                                                   Pammasksharpen User Manual(0)



NAME
       pammasksharpen - Sharpen an image via an unsharp mask


SYNOPSIS
       pammasksharpen [-sharpness=realnum] [-threshold=realnum] maskfile [inputfile]

       All options can be abbreviated to their shortest unique prefix.  You may use two hyphens instead of one.  You may separate an option name and its value with white space instead of an equals sign.


EXAMPLES
          pamgauss 5 5 -sigma=.7 -tupletype=GRAYSCALE | pamtopnm >gauss.pgm
          pnmconvol -nooffset gauss.pgm myimage.ppm >blurred.ppm
          pammasksharpen blurred.ppm myimage.ppm >sharpened.ppm



DESCRIPTION
       This program is part of Netpbm(1)

       pammasksharpen reads a Netpbm image as input and produces a sharpened version of it, in the same format, as output.  It does this via an unsharp mask, which you supply as another Netpbm image.

       An  unsharp  mask  is generally a blurred version of the original image.  The sharpening computation is this: Calculate the 'edgeness' of a sample in the input image as the signed difference between
       the sample value and the corresponding sample in the unsharp mask.  This tells how different the pixel is from its neighbors.  Add a multiple of the edgeness to the original sample to get the corre-
       sponding  output sample.  Clip as necessary.  This causes pixels that are brighter than their neighbors to get even brighter, while pixels that are dimmer than their neighbors get even dimmer.  This
       makes edges -- places where pixel values change quickly in space -- stand out more.

       The unsharp mask must be the same dimensions and have the same maxval as the input image.


   The Unsharp Mask
       You usually create the unsharp mask as a Gaussian blur of the original image, which you can do using pamgauss and pnmconvol as in the example above.  The convolution kernel you use with pnmconvol is
       normally a square with side length an odd number of pixels.

       When  you  create  an  unsharp  mask  like  this, you will have to choose the side length of the convolution kernel.  That length implements the parameter of unsharp mask sharpening usually known as
       'radius.'  In particular, a radius of R pixels corresponds to a convolution kernel 2R+1 pixels on a side.

       Radius is a very important parameter; you can ruin an image with a radius too large.  You can safely use the highest radius with an inanimate object, while a human face  demands  the  least.   Land-
       scapes  fall in between.  But it really depends on the size of the details.  Fine detail needs a smaller radius, or else you may obliterate tiny detail of the same size as the Radius width.  A large
       image often has larger detail (more pixels involved), so can use a larger radius.  Radius and sharpness (see -sharpness option) interact: reducing one allows you to increase the other.


OPTIONS
       -sharpness=realnum
              This specifies the magnitude of the sharpening.  It is the multiple of edgeness that gets added to each sample as described above.

              realnum is a nonnegative real decimal number.  Zero means no sharpening at all.

              This parameter is known as 'amount' in ImageMagick.

              The default is 1.0.

              This option was new in Netpbm 10.30 (October 2005).  Before that, the sharpness was always 1.0.


       -threshold=realnum
              This minimum amount of edgeness that will be considered edgeness at all.  i.e. if the magnitude of the edgeness is less than this, pammasksharpen will treat the edgeness as zero.

              A nonzero value may be necessary here to avoid speckling in smooth areas.

              This is a fraction of the maxval (so it is in the range [0, 1.0]).

              The default is 0.

              This option was new in Netpbm 10.34 (June 2006).




SEE ALSO
       pnmconvol(1) , pamedge(1) , pamsharpness(1) , pamsharpmap(1) , pamarith(1) , pnm(5) , pam(5)




HISTORY
       pammasksharpen was new in Netpbm 10.23 (July 2004).



netpbm documentation                                                                             14 June 2006                                                                   Pammasksharpen User Manual(0)
