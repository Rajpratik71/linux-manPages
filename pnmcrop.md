Pnmcrop User Manual(0)                                                                                                                                                                 Pnmcrop User Manual(0)



NAME
       pnmcrop - crop a PNM image


SYNOPSIS
       pnmcrop

       [-white|-black|-sides]

       [-left]

       [-right]

       [-top]

       [-bottom]

       [-margin=pixels]

       [-borderfile=filename]

       [pnmfile]

       Minimum  unique  abbreviation  of  option  is  acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.


DESCRIPTION
       This program is part of Netpbm(1)

       pnmcrop reads a PBM, PGM, or PPM image as input, removes borders that are the background color, and produces the same type of image as output.

       If you don't specify otherwise, pnmcrop assumes the background color is whatever color the top left and right corners of the image are and if they are  different  colors,  something  midway  between
       them.  You can specify that the background is white or black with the -white and -black options or make pnmcrop base its guess on all four corners instead of just two with -sides.

       By default, pnmcrop chops off any stripe of background color it finds, on all four sides.  You can tell pnmcrop to remove only specific borders with the -left, -right, -top, and -bottom options.

       If  you  want to leave some border, use the -margin option.  It will not only spare some of the border from cropping, but will fill in (with what pnmcrop considers the background color) if necessary
       to get up to that size.

       If the input is a multi-image stream, pnmcrop processes each one independently and produces a multi-image stream as output.  It chooses where to crop independently for each image.  So if  you  start
       with a stream of images of the same dimensions, you may end up with images of differing dimensions.  Before Netpbm 10.37 (December 2006), pnmcrop ignored all input images but the first.

       If you want to chop a specific amount off the side of an image, use pamcut.

       If you want to add different borders after removing the existing ones, use pnmcat or pamcomp.


OPTIONS
       -white Take white to be the background color.  pnmcrop removes borders which are white.


       -black Take black to be the background color.  pnmcrop  removes borders which are black.


       -sides Determine the background color from the colors of the four corners of the input image.  pnmcrop removes borders which are of the background color.

              If  at least three of the four corners are the same color, pnmcrop  takes that as the background color.  If not, pnmcrop looks for two corners of the same color in the following order, taking
              the first found as the background color: top, left, right, bottom.  If all four corners are different colors, pnmcrop assumes an average of the four colors as the background color.

              The -sides option slows pnmcrop down, as it reads the entire image to determine the background color in addition to the up to three times that it would read it without -sides.


       -left  Remove any left border.


       -right Remove any right border.


       -top   Remove any top border.


       -bottom
              Remove any bottom border.


       -margin=pixels
              Leave pixels pixels of border.  Expand the border to this size if necessary.

              This option was new in Netpbm 10.29 (August 2005).


       -borderfile=filename
              Use the image in the file named filename instead of the input image to determine where the borders of the input image are and the background color.

              Without this option, pnmcrop examines the input image and figures out what part of the image is border and what part is foreground (not border), as well as the background  color.   With  this
              option,  pnmcrop  finds  the borders in one image, then uses the those four border sizes (left, right, top, bottom) in cropping a different image.  Furthermore, if you use -margin to add bor-
              ders, the color of those borders is the background color pnmcrop detects in the border file.

              The point of this is that you may want to help pnmcrop to come to a different conclusion as to where the borders are and what the background color is by preprocessing the  input  image.   For
              example,  consider an image that has speckles of noise in its borders.  pnmcrop isn't smart enough to recognize these as noise; it sees them as foreground image.  So pnmcrop considers most of
              your borders to be foreground and does not crop them off as you want.  To fix this, run the image through a despeckler such as pbmclean and tell pnmcrop to use the despeckled version  of  the
              image as the -borderfile image, but the original speckled version as the input image.  That way, you crop the borders, but retain the true foreground image, speckles and all.

              This option was new in Netpbm 10.29 (August 2005).

              Before  Netpbm  10.46  (March  2009), the original image and not the border file determines the background color.  pnmcrop fails if there is no apparent background color in the original image
              (i.e. the corners of the image don't have a common color).


       -verbose
              Print on Standard Error information about the processing, including exactly how much is being cropped off of which sides.




SEE ALSO
       pamcut(1) , pamfile(1) , pnm(5)



AUTHOR
       Copyright (C) 1989 by Jef Poskanzer.



netpbm documentation                                                                            11 March 2009                                                                          Pnmcrop User Manual(0)
