Ppm3d User Manual(0)                                                                                                                                                                     Ppm3d User Manual(0)



NAME
       ppm3d - convert two PPM images into an anaglyph (red/blue 3d glasses) PPM


SYNOPSIS
       ppm3d [-color] [-offset=horizontal_offset] leftppmfile rightppmfile

       Deprecated optional 3rd argument: horizontal_offset


DESCRIPTION
       This program is part of Netpbm(1)

       ppm3d  reads  two PPM images as input and produces a PPM as output, with the images overlapping by the specified number of pixels in blue-green/red format.  The idea is that if you look at the image
       with 3-D glasses (glasses that admit only red through one eye and only green or blue through the other), you see an image with depth.  This is called an anaglyph stereogram.

       ppm3d can produce either of two kinds of anaglyph stereogram: monochrome or color.  Use the -color option to choose.

       In the monochrome version, ppm3d ignores any color (actually, chrominance) in the input images and produces a result which is monochrome.  Viewed through red-green glasses it is yellow, but  without
       any other color in the field, your brain tends to see it as grayscale.

       In  the color version, ppm3d generates a result which is close to the color of the original.  It's not great, though, because each eye necessarily cannot see the entire spectrum.  Red and cyan don't
       work well, but most other colors -- especially when heavily saturated -- come out quite well.

       To view a color anaglyph stereogram, you need glasses with a left lens that admits only red light and a right lens that admits only blue and green light.  (The right lens may be called a  cyan  lens
       because that is its pigment in white light; don't be misled into thinking that cyan is the only color that gets through it).  Your brain is wired so that even though the components of light are com-
       ing in through different eyes, they mix in your brain to form the same sensation as if you were looking at the combined light with both eyes.

       The input PPMs must be the same dimensions.

       To make a different kind of stereogram, use pamstereogram.  That makes a stereogram that you view without special glasses, just by letting your eyes unfocus so that each eye sees different parts  of
       the image.


ARGUMENTS
       The mandatory arguments are file names of the left and right input images.

       An  optional  third argument specifies the same thing as the value of the -offset argument, but is deprecated because -offset is easier to use and read.  Before Netpbm 10.38 (March 2007), this third
       argument is the only way to specify the offset.


OPTIONS
       -offset=horizontal_offset
              This option indicates the amount, in pixels, by which the left and image is offset to the right of the right image in the output.

              The effect of this option is to move the entire image forward (positive numbers) or backward (negative numbers).  With a zero offset, the main subject of the picture appears in the  plane  of
              the  picture  (i.e.  if the image is projected on a screen, the location of the screen).  The main subject is the subject at the location where the line of sight of the left camera intersects
              the line of sight of the right camera -- the main subject appears at the same location in both the left and right images.

              Default is zero.

              This option was new in Netpbm 10.38 (March 2007).  Before that, use the third argument instead.  Also, before Netpbm 10.38 the default is +30 pixels.


       -color This option causes ppm3d to generate a color anaglyph stereogram.  By default, it generates monochrome.

              This option was new in Netpbm 10.38 (March 2007).




SEE ALSO
       pamstereogram(1)

       ppm(5)



AUTHOR
       Copyright (C) 1993 by David K. Drum.



netpbm documentation                                                                           20 February 2007                                                                          Ppm3d User Manual(0)
