Pampaintspill User Manual(0)                                                                                                                                                     Pampaintspill User Manual(0)



       pampaintspill - smoothly spill colors into the background


SYNOPSIS
       pampaintspill [--bgcolor=color] [--wrap] [--all] [--downsample=number] [--power=number] [filename]

       Minimum  unique  abbreviations  of  option are acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.


DESCRIPTION
       This program is part of Netpbm(1)

       pampaintspill produces a smooth color gradient from all of the non-background-colored pixels in an input image, effectively <q>spilling paint</q> onto the background.  pampaintspill  is  similar  to
       pamgradient but differs in the following characteristics:



       ·      pampaintspill accepts any number of paint
                    sources (non-background-colored pixels), which can lie anywhere
                    on the canvas.  pamgradient accepts exactly
                    four paint sources, one in each corner of the image.


       ·      pampaintspill requires an input image while
                    pamgradient generates a new image from
                    scratch.


       ·      pampaintspill can produce tileable output and
                    can control how tightly the gradient colors bind to their source
                    pixels.


       Results  are  generally best when the input image contains just a few, crisp spots of color. Use your drawing program's pencil tool &mdash; as opposed to a paintbrush or airbrush tool &mdash; with a
       small nib.


OPTIONS
       --bgcolor=color

              Explicitly specify the background color. color can be
                    specified using any of the formats accepted by the ppm_parsecolor() library       routine ⟨libppm.html#colorname⟩  such as red or #ff0000.  If
                    --bgcolor is not specified, pampaintspill makes an
                    educated guess about the background color based on the colors in the
                    image's corners.


       --wrap

              Allow gradients to wrap around image borders. That is, colors
                    that spill off the right side of the image reappear on the left side of
                    the image and likewise for left/right, top/bottom, and
                    bottom/top. --wrap makes images tileable, which is nice for
                    producing desktop backgrounds.


       --all

              Recolor all pixels, not just background pixels. Normally,
                    non-background-colored pixels in the input image appear unmodified in
                    the output image. With --all, all pixels are colored
                    based on their distance from all of the (other) non-background-colored
                    pixels.


       --downsample=number

              Ignore all but number non-background-colored pixels.
                    When a large number of pixels in the input image differ in color from
                    the background, pampaintspill runs very slowly. The
                    --downsample option randomly selects a given number of colored
                    pixels to use as paint sources for the gradients and ignores the rest,
                    thereby trading off image quality for speed of execution.


       --power=number

              Control how color intensity changes as a function of the
                    distance from a paint source. The default value for number is
                    -2.0, which means that intensity drops (because of the minus sign) with
                    the square (because of the 2.0) of the distance from each paint
                    source. -2.0 generally works well in practice, but other values can be
                    specified for various special effects. With very small numbers of paint
                    sources, -1.0 may produce subtler gradients, but these get muddier as
                    the number of paint sources increases. Positive numbers (e.g., 1.0 and
                    2.0) make the paint sources stand out in the output image by pushing the
                    gradients away from them.




SEE ALSO
       ·

              pamgradient(1)


       ·

              ppmmake(1) ,

       ·

              ppmrainbow(1) ,

       ·

              pgmramp(1) ,

       ·

              ppmpat(1) ,

       ·

              pam(5)




HISTORY
       pampaintspill was new in Netpbm 10.50 (March 2010).



COPYRIGHT
       Copyright © 2010 Scott Pakin, <a href= "mailto:scott+pbm@pakin.org">scott+pbm@pakin.org</a>.



netpbm documentation                                                                                                                                                             Pampaintspill User Manual(0)
