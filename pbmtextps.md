Pbmtextps User Manual(0)                                                                                                                                                             Pbmtextps User Manual(0)



NAME
       pbmtextps - render text into a PBM image using a postscript interpreter


SYNOPSIS
       pbmtextps [-font fontname] [-fontsize fontsize] [-resolution resolution] [-stroke strokesize] text


DESCRIPTION
       This program is part of Netpbm(1)

       pbmtextps takes a single line of text from the command line and renders it into a PBM image.  The image is of a single line of text; newline characters in the input have no effect.

       The  image  is cropped at the top and the right.  It is not cropped at the left or bottom so that the text begins at the same position relative to the origin.  You can use pnmcrop to crop it all the
       way.

       See pbmtext for a more sophisticated generator of text, but using less common font formats.  pbmtext can generate multiple lines of text.

       The -plain common option ⟨index.html#commonoptions⟩  has no effect before Netpbm 10.42 (March 2008).  The output is always raw PBM.


OPTIONS
       -font  By default, pbmtextps uses TimesRoman.

              You can specify the font to use with the -font option.  This is the name of any valid postscript font which is installed on your system.


       -fontsize
              Size of font in points.  See the -resolution option for information on how to interpret this size.

              Default is 24 points.


       -resolution
              Resolution in dots per inch of distance measurements pertaining to generation of the image.  PBM images don't have any inherent resolution, so a distance such as "1 inch"  doesn't  mean  any-
              thing unless you separately specify what resolution you're talking about.  That's what this option does.

              In particular, the meaning of the font size is determined by this resolution.  If the font size is 24 points and the resolution is 150 dpi, then the font size is 50 pixels.

              Default is 150 dpi.


       -stroke
              Width of line to use for stroke font.  There is no default stroke width because the characters are solid by default.



USAGE
       You can generate antialiased text by using a larger resolution than the default and scaling the image down using pamscale.

       See the manual for the similar pbmtext for more advice on usage.


HISTORY
       pbmtextps was added to Netpbm in Release 10.0 (June 2002).



SEE ALSO
       pbmtext(1) , pamcut(1) , pnmcrop(1) , pamcomp(1) , ppmchange(1) , pnmrotate(1) , pamscale(1) , ppmlabel(1) , pbm(5)



AUTHOR
       Copyright (C) 2002 by James McCann



netpbm documentation                                                                           09 December 2007                                                                      Pbmtextps User Manual(0)
