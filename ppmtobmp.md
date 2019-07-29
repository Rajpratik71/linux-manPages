Ppmtobmp User Manual(0)                                                                                                                                                               Ppmtobmp User Manual(0)



NAME
       ppmtobmp - convert a PPM image into a BMP file


SYNOPSIS
       ppmtobmp

       [-windows]

       [-os2]

       [-bpp=bits_per_pixel]

       [-mapfile=filename]

       [ppmfile]

       Minimum  unique  abbreviation  of  option  is  acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.



DESCRIPTION
       This program is part of Netpbm(1)

       ppmtobmp reads a PPM image as input and produces a Microsoft Windows or OS/2 BMP file as output.


OPTIONS
       -windows
              Tells the program to produce a Microsoft Windows BMP file.  (This is the default.)


       -os2   Tells the program to produce an OS/2 BMP file.  (Before August 2000, this was the default).


       -bpp   This tells how many bits per pixel you want the BMP file to contain.  Only 1, 4, 8, and 24 are possible.  By default, ppmtobmp chooses the smallest number with which it can represent all  the
              colors  in  the input image.  If you specify a number too small to represent all the colors in the input image, ppmtobmp tells you and terminates.  You can use pnmquant or ppmdither to reduce
              the number of colors in the image.


       -mapfile=filename
              This identifies a file to use as the BMP palette (aka 'colormap').  In one BMP subformat, the BMP stream contains a palette of up to 256 colors, and represents the  image  raster  as  indices
              into  that  palette.   Normally,  ppmtobmp  takes care of computing a suitable palette, but if you are going to dissect the BMP output in some way, you may want certain values for the palette
              indices.  E.g. you might want red to be 13, where ppmtobmp would (arbitrarily) choose 39.  In that case, you can construct the palette yourself and use this option to  tell  ppmtobmp  to  use
              your palette.

              This  option does not control what colors are in the output.  The colors in the output are exactly those in the input, and the palette you supply must contain at least all the colors that are
              in the input.  You can use pnmremap to adjust your input image so that it contains only colors from your palette.

              The palette file is a Netpbm format file with one pixel per palette entry.  Each pixel must have a distinct color (no repeats).  The order of the BMP palette ppmtobmp generates is  the  order
              of the pixels in the palette file, going from top to bottom, left to right.

              A BMP palette may have at most 256 colors, so the palette file must have at most 256 pixels.

              You may find pnmcolormap useful in generating the palette file.  pamseq too.

              This option was new in Netpbm 10.45 (December 2008).





NOTES
       To  get  a  faithful reproduction of the input image, the maxval of the input image must be 255.  If it is something else, the colors in the BMP file may be slightly different from the colors in the
       input.

       Windows icons are not BMP files.  Use ppmtowinicon to create those.


SEE ALSO
       bmptoppm(1) , ppmtowinicon(1) , pnmquant(1) , ppmdither(1) , pnmremap(1) , ppm(5)



AUTHOR
       Copyright (C) 1992 by David W. Sanderson.



netpbm documentation                                                                           29 October 2008                                                                        Ppmtobmp User Manual(0)
