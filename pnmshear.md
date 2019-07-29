Pnmshear User Manual(0)                                                                                                                                                               Pnmshear User Manual(0)



NAME
       pnmshear - shear a PNM image by a specified angle


SYNOPSIS
       pnmshear

       [-noantialias] [-background=color] angle [pnmfile]

       All options can be abbreviated to their shortest unique prefix.  You may use two hyphens instead of one to designate an option.  You may use either white space or equals signs between an option name
       and its value.


DESCRIPTION
       This program is part of Netpbm(1)

       pnmshear reads a PNM image as input and shears it by the specified angle and produce a PNM image as output.  If the input file is in color, the output will be too, otherwise it  will  be  grayscale.
       The angle is in degrees (floating point), and measures this:

           +-------+  +-------+
           |       |  |\       \
           |  OLD  |  | \  NEW  \
           |       |  |an\       \
           +-------+  |gle+-------+

       If the angle is negative, it shears the other way:
           +-------+  |-an+-------+
           |       |  |gl/       /
           |  OLD  |  |e/  NEW  /
           |       |  |/       /
           +-------+  +-------+

       The angle should not get too close to 90 or -90, or the resulting image will be unreasonably wide.

       pnmshear  does  the  shearing by looping over the source pixels and distributing fractions to each of the destination pixels.  This has an 'anti-aliasing' effect - it avoids jagged edges and similar
       artifacts.  However, it also means that the original colors in the image are modified and there are typically more of them than you started with.  If you need to keep precisely the same set of  col-
       ors, see the -noantialias option.  If the expanded palette is a problem, you can run the result through pnmquant.


OPTIONS
       -background=color
              This determines the color of the background on which the sheared image sits.

              Specify the color (color) as described for the argument of the ppm_parsecolor() library routine ⟨libppm.html#colorname⟩ .

              By  default, if you don't specify this option, pnmshear selects what appears to it to be the background color of the original image.  It determines this color rather simplistically, by taking
              an average of the colors of the two top corners of the image.

              This option was new in Netpbm 10.37 (December 2006).  Before that, pnmshear always behaved as is the default now.


       -noantialias
              This option forces pnmshear to simply move pixels around instead of synthesizing output pixels from multiple input pixels.  The latter could cause the output to contain colors that are not in
              the  input, which may not be desirable.  It also probably makes the output contain a large number of colors.  If you need a small number of colors, but it doesn't matter if they are the exact
              ones from the input, consider using pnmquant on the output instead of using -noantialias.

              Note that to ensure the output does not contain colors that are not in the input, you also must consider the background color.  See the -background option.




SEE ALSO
       pnmrotate(1) , pamflip(1) , pnmquant(1) , pnm(5)




AUTHOR
       Copyright (C) 1989, 1991 by Jef Poskanzer.



netpbm documentation                                                                           27 November 2006                                                                       Pnmshear User Manual(0)
