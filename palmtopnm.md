Palmtopnm User Manual(0)                                                                                                                                                             Palmtopnm User Manual(0)



NAME
       palmtopnm - convert a Palm Bitmap to a PNM image


SYNOPSIS
       palmtopnm

       [-verbose]

       [-rendition N]

       [-showhist] [palmfile] palmtopnm

       -transparent

       [-verbose]

       [palmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       palmtopnm reads a Palm Bitmap as input, from Standard Input or palmfile and produces a PPM image as output.

       Alternatively (when you specify -transparent), palmtopnm writes the value of the transparent color in the Palm Bitmap to Standard Output.

       Palmtopnm can convert Palm Bitmaps with the following features.  This does not mean that it doesn't handle other features.  These are just the ones we found worth mentioning.


       ·      Version 0

       ·      Version 1

       ·      Version 2

       ·      Version 3 (new in Netpbm 10.27 (March 2005))

       ·      Scanline compression

       ·      RLE compression

       ·      Packbits compression (new in Netpbm 10.27 (March 2005))



OPTIONS
       -verbose
              Display various interesting information about the input file and process.


       -transparent
              If  the Palm Bitmap has a transparent color set, palmtopnm writes the value for that color to Standard Output in the form #RRGGBB, where RR, GG, and BB are two-digit hexadecimal numbers indi-
              cating a value in the range 0 through 255.  If no transparent color is set in the Bitmap, palmtopnm writes nothing.  palmtopnm does not generate any output image when you  specify  -transpar-
              ent.


       -rendition N
              Palm  Bitmaps  may  contain  several  different renditions of the same image, with different depths.  By default, palmtopnm  operates on the first rendition (rendition number 1) in the image.
              This switch allows you to operate on a different rendition.  The value must be between 1 and the number of renditions in the image, inclusive.


       -showhist
              This option causes palmtopnm to write a histogram of colors in the input file to Standard Error.




SEE ALSO
       pnmtopalm(1) , pamtopdbimg(1) , pnm(5) ,


LIMITATIONS
       You cannot generate an alpha mask if the Palm Bitmap has a transparent color.  However, you can still do this with ppmcolormask with a Netpbm pipe similar to:

       palmtopnm bitmap.palm | ppmcolormask `palmtopnm -transparent bitmap.palm`


HISTORY
       Before Netpbm 10.23 (July 2004), there was a -forceplain option.  But that had been redundant for a long time, since the Netpbm common option -plain does the same thing.


AUTHORS
       This program was originally written as Tbmptopnm.c, by Ian Goldberg.  It was heavily modified by Bill Janssen to add color, compression, and transparency function.

       Copyright 1995-2001 by Ian Goldberg and Bill Janssen.



netpbm documentation                                                                           26 January 2005                                                                       Palmtopnm User Manual(0)
