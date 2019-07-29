Pnmgamma User Manual(0)                                                                                                                                                               Pnmgamma User Manual(0)



NAME
       pnmgamma - perform gamma adjustment on a PNM image


SYNOPSIS
       pnmgamma {
        -bt709tolinear |
        -lineartobt709 |
        -bt709tosrgb |
        -srgbtobt709 } [-gamma=float] [-rgamma=float] [-ggamma=float] [-bgamma=float]

       [pnmfile]

       pnmgamma [
        -bt709ramp |
        -srgbramp ] [-ungamma] [{gamma | redgamma greengamma bluegamma} [pnmfile]]



DESCRIPTION
       This program is part of Netpbm(1)

       Pnmgamma performs gamma adjustment on pseudo-PNM images.

       The  PPM format specification specifies that certain sample values in a file represent certain light intensities in an image.  In particular, they specify that the sample values are directly propor-
       tional to luminance as defined by ITU-R Recommendation BT.709.  BT.709 luminance as a function of radiance is a power function modified with a linear ramp near black.

       However, people sometimes work with approximations of PPM and PGM where the sample values represent intensity in different ways:

       In one common variation, the sample value is directly proportional to radiance (often called 'linear intensity').

       Another popular variation is to make the samples proportional to luminance as defined by the International Electrotechnical Commission (IEC) SRGB standard.  The SRGB gamma transfer function is  like
       the BT.709 one except with different constants in it.

       Note that SRGB is often spelled 'sRGB'.  In this document, we use standard English typography, though, which doesn't allow for that kind of capitalization.

       pnmgamma allows you to manipulate the gamma transfer function, thus working with and/or creating pseudo-PPM files that are useful for various things.

       For  example,  if  you  feed  a  true PPM to pnmgamma -bt709tolinear , you get as output a file which is PPM in every respect except that the sample values are radiances.  If you feed such a file to
       pnmgamma -linearto709, you get back a true PPM.

       The situation for PGM images is analogous.  And pnmgamma treats PBM images as PGM images.

       When you feed a radiance-proportional pseudo-PPM image to a display program that expects a true PPM, the display appears darker than it should, so pnmgamma has the effect of  lightening  the  image.
       When  you feed a true PPM to a display program that expects radiance-proportional sample values, and therefore does a gamma adjustment of its own on them, the display appears lighter than it should,
       so pnmgamma with a gamma value less than one (the multiplicative inverse of whatever gamma value the display program uses) has the effect of darkening the image.


PARAMETERS
       The form of the parameters depends on whether you're using the old syntax or the new syntax.  With the old syntax, the parameters are a mixture of gamma values and the input file name.  With the new
       syntax, the only parameter is the input file name and you specify gamma values with option.

       You  use  the  old syntax if you specify -bt709ramp (or its synonym -cieramp) or -srgramp or if you don't specify any transfer function at all (and thus default to a simple exponential).  Otherwise,
       you use the new syntax.

       With the old syntax, you may specify a single gamma value or 3 separate gamma values (red, green, and blue) or no gamma values.  In any case, the meanings of those parameters is the same as the more
       modern -gamma, -rgamma, -ggamma, and -bgamma options described below.



OPTIONS
       -bt709tolinear
              Convert the image from BT.709 luminance to radiance.  I.e. convert from true PPM or PGM to a radiance-linear variation that can be used with certain tools that need it.

              This option was new in Netpbm 10.32 (February 2006).


       -lineartobt709
              Convert the image from radiance to BT.709 luminance.  I.e. convert to true PPM or PGM from a radiance-linear variation.

              You get true BT.709 (ergo true PPM or PGM) only if you use the default gamma value (i.e. don't specify -gamma, etc.).

              This option was new in Netpbm 10.32 (February 2006).


       -bt709tosrgb
              Convert the image from BT.709 luminance to SRGB luminance.  I.e. convert from true PPM or PGM to an SRGB-based variation that is required by certain tools and display devices.

              You get true SRGB only if you use the default gamma value (i.e. don't specify -gamma, etc.).

              This option was new in Netpbm 10.32 (February 2006).


       -srgbtobt709
              Convert the image from SRGB luminance to BT.709 luminance.  I.e. convert to true PPM or PGM from an SRGB-based variation.

              This option was new in Netpbm 10.32 (February 2006).


       -bt709ramp
              Same as -lineartobt709, but using the old syntax.

              This option was renamed in Netpbm 10.32 (February 2006).  Before that, its name is -cieramp.


       -cieramp
              This is an obsolete synonym for -bt709ramp.

              The name of this option comes from a former belief that this was a standard of CIE (International Commission On Illumination), but it now (August 2005) looks like it never was.


       -srgbramp
              Convert the image from radiance to SRGB luminance.  Note that it is true SRGB only if you use the default gamma value (i.e. don't specify any gamma parameters).

              This is an old syntax option.  There is no equivalent in the new syntax because it really shouldn't be a function of pnmgamma at all.  It exists solely for backward compatibility.  The reason
              it shouldn't exist is that the way to do this conversion consistent with the Netpbm philosophy is do a -lineartobt709 followed by a -bt709tosrgb.  It's exactly analogous to the way  you  have
              to  convert  from PNG to TIFF by doing a pngtopam followed by a pnmtotiff.  The -srgbramp option actually dates to before there was a standard definition of what the sample values of a Netpbm
              image measure, and pnmgamma considered radiance-linear to be the proper intermediate format.


       -ungamma
              Apply the inverse of the specified transfer function (i.e. go from gamma-adjusted luminance to radiance).

              This is valid only with -bt709ramp (aka -cieramp), -srgbramp, and the default exponential transfer function.


       -gamma=float
              This specifies the gamma value to use in the transfer function.  All of the transfer functions involve an exponent, and the gamma value is that exponent.

              The standards specify a particular gamma value.  If you use anything else, you are varying from the standard.

              The default is the standard value.  For the simple exponential transfer function (which is not a standard), the default is 2.2.

              In the -bt709tosrgb and -srgbtobt709 conversions there are two exponents.  -gamma affects the 'to' function; the 'from' function always uses the standard gamma value.

              If you specify one of the component-specific options (-rgamma, etc.), that overrides the -gamma value.

              With the -bt709ramp (aka -cieramp), -srgbramp, or the default exponential transfer function, you can't actually use this option, but you specify the same thing with parameters.  ⟨#parameters⟩


              This option was new in Netpbm 10.32 (February 2006).


       -rgamma=float

       -ggamma=float

       -bgamma=float
              These options are just like -gamma, except they specify the value for a particular one of the color components.

              If you don't specify this option for a particular color component, the default is the -gamma value (or -gamma's default if you didn't specify that either).

              With the -bt709ramp (aka -cieramp), -srgbramp, or the default exponential transfer function, you can't actually use this option, but you specify the same thing with parameters.  ⟨#parameters⟩


              This option was new in Netpbm 10.32 (February 2006).


       -maxval=maxval
              This is the maxval of the output image.  By default, the maxval of the output is the same as that of the input.

              Because the transformation is not linear, you need a greater maxval in the output in order not to lose any information from the input.  For example, if you convert to  radiance-linear  sample
              values  with  -ungamma  -bt709ramp and default gamma value, and your maxval is 255 on both input and output, 3 different input sample values all generate output sample value 254.  In order to
              have a different output sample value for each input sample value, you would need an output maxval at least 3 times the input maxval.

              This option was new in Netpbm 10.32 (February 2006).  Before that, you can achieve the same result by increasing the maxval of the input or decreasing the maxval of the output using pamdepth.




WHAT IS GAMMA?
       A good explanation of gamma is in Charles Poynton's Gamma FAQ at  http://www.poynton.com/GammaFAQ.html (1)
        and Color FAQ at  http://www.poynton.com/ColorFAQ.html (1)

       In brief: The simplest way to code an image is by using sample values that are directly proportional to the radiance of the color components.  Radiance is a  physical  quantification  based  on  the
       amount  of  power in the light; it is easily measurable in a laboratory, but does not take into account what the light looks like to a person.  It wastes the sample space because the human eye can't
       discern differences between low-radiance colors as well as it can between high-radiance colors.  So instead, we pass the radiance values through a transfer function that makes it so that changing  a
       sample value by 1 causes the same level of perceived color change anywhere in the sample range.  We store those resulting values in the image file.  That transfer function is called the gamma trans-
       fer function and the transformation is called gamma adjusting.

       The gamma-adjusted value, proportional to subjective brightness, are known as the luminance of the pixel.

       There is no precise objective way to measure luminance, since it's psychological.  Also, perception of brightness varies according to a variety of factors, including  the  surrounding  in  which  an
       image is viewed.  Therefore, there is not just one gamma transfer function.

       Virtually all image formats, either specified or de facto, use gamma-adjusted values for their sample values.

       What's really nice about gamma is that by coincidence, the inverse function that you have to do to convert the gamma-adjusted values back to radiance is done automatically by CRTs.  You just apply a
       voltage to the CRT's electron gun that is proportional to the gamma-adjusted sample value, and the radiance of the light that comes out of the screen is close to the radiance value  you  had  before
       you applied the gamma transfer function!

       And  when  you consider that computer video devices usually want you to store in video memory a value proportional to the signal voltage you want to go to the monitor, which the monitor turns into a
       proportional drive voltage on the electron gun, it is really convenient to work with gamma-adjusted sample values.


SEE ALSO
       pnm(5)



AUTHOR
       Copyright (C) 1991 by Bill Davidson and Jef Poskanzer.



netpbm documentation                                                                             30 June 2007                                                                         Pnmgamma User Manual(0)
