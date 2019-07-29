Pnmnorm User Manual(0)                                                                                                                                                                 Pnmnorm User Manual(0)



NAME
       pnmnorm - normalize the contrast in a Netbpm image


SYNOPSIS
       pnmnorm

       [-bpercent=N | -bvalue=N]

       [-wpercent=N | -wvalue=N]

       [-midvalue=N]

       [-middle=N]

       [-maxexpand]

       [-keephues]

       [-luminosity | -colorvalue | -saturation]

       [ppmfile]

       All  options  can  be abbreviated to their shortest unique prefix.  You may use two hyphens instead of one to designate an option.  You may use either white space or an equals sign between an option
       name and its value.


DESCRIPTION
       This program is part of Netpbm(1)

       pnmnorm reads a PNM image (PBM, PGM, or PPM).  It normalizes the contrast by forcing the brightest pixels to white, the darkest pixels to black, and spreading out the ones in between.   It  produces
       the same kind of file as output.  This is pretty useless for a PBM image.

       The  program  offers  two ways of spreading out the pixels in between the darkest and brightest: linear and quadratic.  In the quadratic case, you specify some in between brightness and specify what
       brightness that should become in the output.  With those three constraints: the brightness that becomes black, the brightness that becomes white, and the brightness that becomes that  middle  value,
       pnmnorm computes a quadratic equation that maps all the other brightnesses from input values to output values.

       The program first determines a mapping of old brightness to new brightness.  For each possible brightness of a pixel, the program determines a corresponding brightness for the output image.

       Then  for  each pixel in the image, the program computes a color which has the desired output brightness and puts that in the output.  With a color image, it is not always possible to compute such a
       color and retain any semblance of the original hue, so the brightest and dimmest pixels may only approximate the desired brightness.

       For a PPM image, you have a choice of three ways to define brightness:


       ·      luminosity

       ·      color value

       ·      saturation


              In the case of saturation, 'brightness' is pretty much a misnomer, but you can use the brightness analogy to see what it does.  In the analogy, bright means saturated and dark  means  unsatu-
              rated.

       Note that all of these are different from separately normalizing the individual color components.

       An alternative way to spread out the brightnesses in an image is pnmhisteq.  pnmhisteq stretches the brightest pixels to white and the darkest pixels to black, but rather than linearly adjusting the
       ones in between, it adjusts them so that there are an equal number of pixels of each brightness throughout the range.  This gives you more contrast than pnmnorm does, but can considerably change the
       picture in exchange.



OPTIONS
       By  default,  the  darkest  2  percent  of  all  pixels are mapped to black, and the brightest 1 percent are mapped to white.  You can override these percentages by using the -bpercent and -wpercent
       options, or you can specify the exact pixel values to be mapped by using the -bvalue and -wvalue options.  You can get appropriate numbers for the options from ppmhist.  If you just want to  enhance
       the  contrast,  then choose values at elbows in the histogram; e.g. if value 29 represents 3% of the image but value 30 represents 20%, choose 30 for bvalue.  If you want to brighten the image, then
       set bvalue to 0 and just fiddle with wvalue; similarly, to darken the image, set wvalue to maxval and play with bvalue.

       If you specify both -bvalue and -bpercent, pnmnorm uses the one that produces the least change.  The same goes for -wvalue and -wpercent.  (In Netpbm 10.26 (January 2005), the -bvalue/-wvalue  takes
       precedence, and before that, it's a syntax error to specify both).

       If you want to maximize the change instead of minimizing it, just cascade two runs of pnmnorm, specifying values for the first and percentages for the second.

       -bpercent and -wpercent values are floating point decimal.  Zero is valid and is the same as -bvalue=0 or -wvalue=maxval, respectively.

       Because  there  are whole numbers of pixels at each brightness, pnmnorm obviously can't guarantee the exact percentage, so it arranges that at least the percentage of pixels you specify get remapped
       as promised.

       It is possible for your -bpercent or -wpercent to overlap your -wvalue or -bvalue, respectively.  For example, you say -bpercent=20 and -wvalue=100 for an image in which only 10 percent of the  pix-
       els are darker than 100.  In that case, pnmnorm adjusts the percentile value as required.  In the example, it uses 99 as the black value (like -bvalue=99).

       It  is also possible for your -bpercent and -wpercent options to select the same brightness value for the stretch-to-white and stretch-to-black value because of the fact that pnmnorm can't subdivide
       a histogram cell.  E.g. if an image is all brightness 100, then no matter what -bpercent and -wpercent values you choose, it's the same as saying -bvalue=100  -wvalue=100.   In  that  case,  pnmnorm
       changes one of the values by 1 to make it legal.  In the example, pnmnorm would either make the black value 99 or the white value 101.

       Before Netpbm 10.43 (June 2008), pnmnorm fails if the -wpercent and/or -bpercent values specify an overlap.

       The  stretch  points  are  further constrained by the -maxexpand option.  Sometimes, too much contrast is a bad thing.  If your intensities are all concentrated in the middle, -bpercent=2 and -wper-
       cent=1 might mean that an intensity of 60 gets stretched up to 100 and intensity of 20 gets stretched down to zero, for a range expansion of 150% (from a range of 40 to a range of 100).   That  much
       stretching means two adjacent pixels that used to differ in intensity by 4 units now differ by 10, and that might be unsightly.

       So  that  you can put a limit on the amount of expansion without having to examine the image first, there is the -maxexpand option.  It specifies the maximum expansion you will tolerate, as an addi-
       tional percentage.  In the example above, you could say -maxexpand=50 to say you want the range to expand by at most 50%, regardless of your other options.  pnmnorm figures  out  what  intensity  to
       stretch  to  full  intensity  and  what intensity to stretch to zero intensity as described above, and then raises the former and lowers the latter as needed to limit the expansion to the amount you
       specified.

       When pnmnorm limits the expansion because of -maxexpand, it tells you about it with a message like this:
           limiting expansion of 150% to 50%

       In any case, pnmnorm tells you exactly what expansion it's doing, like this:

           remapping 25..75 to 0..100

       Before Netpbm 10.26 (December 2004), it was not valid to specify both -bvalue and -bpercent or -wvalue and -wpercent.

       -maxexpand was new in Netpbm 10.32 (February 2006).

       The -keephues option says to keep each pixel the same hue as it is in the input; just adjust its brightness.  You normally want this; the only reason it is not the default behavior is backward  com-
       patibility with a design mistake.

       By  default, pnmnorm normalizes contrast in each component independently (except that the meaning of the -wpercent and -bpercent options are based on the overall brightnesses of the colors, not each
       component taken separately).  So if you have a color which is intensely red but dimly green, pnmnorm would make the red more intense and the green less intense, so you end up with  a  different  hue
       than you started with.

       When  you specify -midvalue=N, pnmnorm uses a quadratic function to map old brightnesses to new ones, making sure that an old brightness of N becomes 50% bright in the output.  You can override that
       50% default with -middle.  The value of -middle is a floating point number in the range 0 through 1 with 0 being full darkness and 1 full brightness.  If  your  -midvalue  and  -middle  indicate  an
       ambiguous or impossible quadratic function (e.g. -midvalue is the same as -bvalue, so an infinite number of quadratic functions fit), pnmnorm just ignores your -midvalue and maps linearly.

       -midvalue and -middle were new in Netpbm 10.57 (December 2011).

       If you specify -keephues, pnmnorm would likely leave this pixel alone, since its overall brightness is medium.

       -keephues  can cause clipping, because a certain color may be below a target intensity while one of its components is saturated.  Where that's the case, pnmnorm uses the maximum representable inten-
       sity for the saturated component and the pixel ends up with less overall intensity, and a different hue, than it is supposed to have.

       This option is meaningless on grayscale images.

       When you don't specify -keephues, the -luminosity, -colorvalue, and -saturation options affect the transfer function (which is the same for all three RGB components), but  are  meaningless  when  it
       comes to applying the transfer function (since it is applied to each individual RGB component).

       Before Netpbm 9.25 (March 2002), there was no -keephues option.

       -luminosity, -colorvalue, and -saturation determine what property of the pixels pnmnorm normalizes.  I.e., what kind of brightness.  You cannot specify more than one of these.

       The  -luminosity  option  says  to  use the luminosity (i.e. the 'Y' in the YUV or YCbCr color space) as the pixel's brightness.  The luminosity is a measure of how bright a human eye would find the
       color, taking into account the fact that the human eye is more sensitive to some RGB components than others.

       This option is default.

       This option is meaningless on grayscale images.

       Before Netpbm 10.28 (August 2005), there was no -luminosity option, but its meaning was still the default.

       Before Netpbm 10.28 (August 2005), there was no -colorvalue option.

       The -colorvalue option says to use the color value (i.e. the 'V' in the HSV color space) as the pixel's brightness.  The color value is the gamma-adjusted intensity of the most  intense  RGB  compo-
       nent.

       This option is meaningless on grayscale images.

       Before Netpbm 10.28 (August 2005), there was no -colorvalue option.

       The  -saturation option says to use the saturation (i.e. the 'S' in the HSV color space) as the pixel's brightness.  The saturation is the ratio of the intensity of the most intense RGB component to
       the difference between the intensities of the most and least intense RGB component (all intensities gamma-adjusted).

       In this case, 'brightness' is more of a metaphor than anything.  'bright' means saturated and 'dark' means unsaturated.

       This option is meaningless on grayscale images.

       Before Netpbm 10.28 (August 2005), there was no -colorvalue option.




SEE ALSO
       pnmhisteq(1) , ppmhist(1) , pgmhist(1) , pnmgamma(1) , ppmbrighten(1) , ppmdim(1) , pnm(5)



netpbm documentation                                                                            6 January 2006                                                                         Pnmnorm User Manual(0)
