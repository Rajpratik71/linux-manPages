Pbmclean User Manual(0)                                                                                                                                                               Pbmclean User Manual(0)



NAME
       pbmclean - despeckle a PBM image


SYNOPSIS
       pbmclean [-minneighbors=N] [-black|-white] [-extended] [pbmfile]


OPTION USAGE
       You can use the minimum unique abbreviation of the options.  You can use two hyphens instead of one.  You can separate an option name from its value with white space instead of an equals sign.


DESCRIPTION
       This program is part of Netpbm(1)

       pbmclean cleans up a PBM image of random specks.  It reads a PBM image as input and outputs a PBM that is the same as the input except with isolated pixels inverted.

       You can use pbmclean  to clean up 'snow' on bitmap images.

       There are two ways pbmclean can define 'isolated' pixels: simple and extended.  When you specify -extended, pbmclean uses extended; otherwise it uses basic.



       In basic mode, pbmclean looks at each pixel individually, and any
       pixel that doesn't have at least a minimum number of pixels of the same color touching it is considered isolated and pbmclean erases it.

       The -minneighbors option specifies the minimum number of neighboring pixels of the same color for a pixel not to be considered isolated.

       For example, if -minneighbors is two and there are two contiguous black pixels in an otherwise white field, each of those pixels is isolated, so pbmclean erases them - turns both white.

       The default minimum 1 pixel &mdash; pbmclean flips only completely isolated pixels.

       (A -minneighbors value greater than 8 generates a completely inverted image (but use pnminvert to do that) -- or a completely white or completely black image with the -black or -white option).

       pbmclean considers the area beyond the edges of the image to be white.  (This matters when you consider pixels right on the edge of the image).

       pbmclean does not distinguish between foreground and background; by default, it flips isolated pixels of either color.  But you can specify -black or -white to have it flip only pixels of one color.



       In extended mode, pbmclean erases all blobs which don't have the
       specified  minimum  number  of  pixels.   A blob is a set of contiguous pixels of the foreground color.  The minimum number of pixels is one plus the -minneighbors value.  You specify the foreground
       color with -black and -white (default is black).

       For example, if -minneighbors is 2 and the foreground color is black, and the image contains a straight line 4 pixels long, pbmclean erases that -- turns all four pixels white.  pbmclean also erases
       4 pixels in a square or L-shape.

       The default -minneighbors is 4, so a blob must have at least 5 pixels to escape pbmclean's purge.

       Extended mode was new in Netpbm 10.56 (September 2011).



OPTIONS
       -black


       -white Flip pixels of the specified color.  By default, if you specify neither -black nor -white, pbmclean flips both black and white pixels which do not have sufficient identical neighbors.  If you
              specify -black, pbmclean leaves the white pixels alone and just erases isolated black pixels.  Vice versa for -white.  You may specify both -black and -white to get the same  as  the  default
              behavior.


       -minneighbors=N
              This determines how many pixels must be in a cluster in order for pbmclean to consider them legitimate and not clean them out of the image.  See Description ⟨#description⟩ .

              Before December 2001, pbmclean accepted -N instead of -minneighbors.  Before Netpbm 10.27 (March 2005), -minneighbors was -minneighbor.


       -extended
              pbmclean uses extended, as opposed to basic, isolated pixel detection.

              This option was new in Netpbm 10.56 (September 2011).




SEE ALSO
       pbm(5)



AUTHOR
       Copyright (C) 1990 by Angus Duggan Copyright (C) 1989 by Jef Poskanzer.  Copyright (C) 2001 by Michael Sternberg.

       Permission  to  use, copy, modify, and distribute this software and its documentation for any purpose and without fee is hereby granted, provided that the above copyright notice appear in all copies
       and that both that copyright notice and this permission notice appear in supporting documentation.  This software is provided 'as is' without express or implied warranty.



netpbm documentation                                                                           19 November 2011                                                                       Pbmclean User Manual(0)
