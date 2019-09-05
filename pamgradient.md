Pamgradient User Manual(0)                                                                                                                                                         Pamgradient User Manual(0)



NAME
       pamgradient - create a four-corner gradient PAM image


SYNOPSIS
       pamgradient [-maxval=maxval] color-tl color-tr color-bl color-br width height

       Minimum  unique  abbreviation  of  option  is  acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.



DESCRIPTION
       This program is part of Netpbm(1)

       pamgradient creates an image of the specified dimensions width by height which contains a smooth, two-dimensional gradient between the specified colors of the four corners (from top left  to  bottom
       right).

       Specify the colors as described for the argument of the ppm_parsecolor() library routine ⟨libppm.html#colorname⟩ .

       If all four colors are gray values, pamgradient creates a grayscale image (PAM tuple type GRAYSCALE).  Otherwise, it creates a color image (PAM tuple type RGB).


OPTIONS
       -maxval=maxval


              maxval of the generated image.  (See PAM(5)
               and PNM(5)
               specifications).



SEE ALSO
       pamgradient(1) , ppmmake(1) , ppmrainbow(1) , pgmramp(1) , ppmpat(1) , pam(5) , pnm(5)



NOTE
       Only  the  top  left  corner  of the generated image has exactly the specified color.  The color of the top right corner is a bit shifted to the left, the bottom left corner a bit up, and the bottom
       right corner left and up. This ensures nice transitions when combining adjacent (very narrow) gradients, and doesn't play a role when the gradient butts against a solid surface.

       This effect is created by the integer arithmetic used for the interpolation of the color values, and since it doesn't make a difference for all practical purposes I might as well sell it as  a  fea-
       ture.


HISTORY
       pamgradient was new in Netpbm 10.31 (December 2005).


AUTHOR
       pamgradient was written by Daniel Haude in October 2005.



netpbm documentation                                                                           21 October 2005                                                                     Pamgradient User Manual(0)
