Pgmramp User Manual(0)                                                                                                                                                                 Pgmramp User Manual(0)



NAME
       pgmramp - generate a grayscale ramp


SYNOPSIS
       pgmramp {-lr|-tb|-rectangle|-ellipse|-diagonal} [-maxval=maxval] width height

       All  options  can  be abbreviated to their shortest unique prefix.  You may use two hyphens instead of one to designate an option.  You may use either white space or an equals sign between an option
       name and its value.


DESCRIPTION
       This program is part of Netpbm(1)

       Generates a graymap of the specified size containing a black-to-white ramp.  These ramps are useful for multiplying with other images, using pamarith.

       The ramp is linear in brightness, not intensity.  I.e. the gamma-corrected sample values in the PGM rise linearly with distance from the corner of the image.  If you want a ramp that  is  linear  in
       light intensity, use pnmgamma with pgmramp.

       Options let you choose the shape of the ramp (left to right, inside out, etc.).  You can use pamflip to get more shapes.  For example, the -lr option gives you a left to right ramp and

           $ pgmramp -lr 100 100 | pamflip -lr

       gives you a right to left ramp.

       To generate a simple ramp of all the values from 0 to maxval, and not necessarily a graphic image, use pamseq(1)

       ppmrainbow does something similar to what pgmramp does, but for color.  The image fades between two colors of your choice.



OPTIONS
       You must specify exactly one of the ramp type options.


       -lr    A left to right ramp.  Black on the left; white on the right.


       -tb    A top to bottom ramp.  Black on top; white on the bottom.


       -rectangle
              An outside-in rectangular ramp.  It is black around the edges and white in the center.


       -ellipse
              An outside-in elliptical ramp.  It is black around the edge and white in the center.


       -diagonal
              A ramp from top left corner diagonally down to bottom right.  Black at the top left; white at the bottom right.

              This option was new in Netpbm 10.66 (March 2014).


       -maxval=maxval
                   The maxval for the generated image.  Default is 255.

                   This option was new in Netpbm 10.1 (June 2002).  Before that, the maxval
                   is always 255.





SEE ALSO
       pamflip(1) , pamarith(1) , pnmgamma(1) , pamseq(1) , ppmrainbow(1) , pamgradient(1) , pgm(5)




AUTHOR
       Copyright (C) 1989 by Jef Poskanzer.



netpbm documentation                                                                           15 February 2014                                                                        Pgmramp User Manual(0)
