Ppmchange User Manual(0)                                                                                                                                                             Ppmchange User Manual(0)



NAME
       ppmchange - change all pixels of one color to another in a PPM image


SYNOPSIS
       ppmchange

       [-closeness=closeness_percent] [-remainder=remainder_color] [-closeok] [oldcolor newcolor] ...  [ppmfile]


EXAMPLES
       ppmchange red blue redimage.ppm >blueimage.ppm

       ppmchange red red -remainder=black myimage.ppm >redblack.ppm

       ppmchange -closeness=90 white white black black



DESCRIPTION
       This program is part of Netpbm(1)

       ppmchange reads a PPM image as input and changes all pixels of color oldcolor to color newcolor.

       You  may  specify  up  to  256 oldcolor/newcolor pairs on the command line.  ppmchange leaves all colors not mentioned unchanged, unless you specify the -remainder option, in which case they are all
       changed to the single specified color.

       You can specify that colors similar, but not identical, to the ones you specify get replaced by specifying a 'closeness' factor.

       Specify the colors as described for the argument of the ppm_parsecolor() library routine ⟨libppm.html#colorname⟩ .

       If a pixel matches two different oldcolors, ppmchange replaces it with the newcolor of the leftmost specified one.

       The maxval of the output image is the same as that of the input image.  If a newcolor you specify cannot be exactly represented in that maxval, ppmchange assumes a color that is as close as possible
       to what you specified but can be represented with your maxval.  Unless you specify the -closeok option, ppmchange issues a warning that it is using an approximation.

       A  common  way that you can have this maxval problem, where the color you specify cannot be represented with your maxval, is that your input is a PBM (black and white) image that you are colorizing.
       The maxval in this case is 1, which severely limits the colors to which you can change.  To avoid this problem, use pamdepth to make the maxval of your input something consistent with  your  colors.
       255 is usually a good choice.

       Before Netpbm 10.22 (April 2004), ppmchange always behaved as if the user specified -closeok and there was no -closeok option.



OPTIONS
       -closeness closeness_percent
              closeness  is  an  integer  percentage indicating how close to the color you specified a pixel must be to get replaced.  By default, it is 0, which means the pixel must be the exact color you
              specified.

              A pixel gets replaced if the distance in color between it and the color you specified is less than or equal to closeness per cent of the maxval.

              The 'distance' in color is defined as the Cartesian sum of the individual differences in red, green, and blue intensities between the two pixels, normalized so  that  the  difference  between
              black and white is 100%.

              This  is  probably  simpler than what you want most the time.  You probably would like to change colors that have similar chrominance, regardless of their intensity.  So if there's a red barn
              that is variously shadowed, you want the entire barn changed.  But because the shadowing significantly changes the color according to ppmchange's distance formula, parts of the barn are prob-
              ably about as distant in color from other parts of the barn as they are from green grass next to the barn.

              Maybe ppmchange will be enhanced some day to do chrominance analysis.

              This option was new in Netpbm 9.8 (September 2000).


       -closeok
              This  option  affects  how  ppmchange interprets a color you specify in the arguments.  When you specify this option, ppmchange may use a color close to, but not the same as what you specify.
              See the description section ⟨#description⟩  for details.

              This option was new in Netpbm 10.22 (April 2004).  Before that, ppmchange always behaved as if you specified this option.


       -remainder color
              ppmchange changes all pixels which are not of a color for which you specify an explicit replacement color on the command line to color color.

              An example application of this is

              ppmchange -remainder=black red red

              to lift only the red portions from an image, or
              ppmchange -remainder=black red white | ppmtopgm

              to create a mask file for the red portions of the image.




SEE ALSO
       pgmtoppm(1) , ppmcolormask(1) , ppm(5)



AUTHOR
       Wilson H. Bent. Jr. (whb@usc.edu) with modifications by Alberto Accomazzi (alberto@cfa.harvard.edu)



netpbm documentation                                                                            September 2005                                                                       Ppmchange User Manual(0)
