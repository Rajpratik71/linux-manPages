Ppmtoascii User Manual(0)                                                                                                                                                           Ppmtoascii User Manual(0)



NAME
       ppmtoascii - convert a PPM image to ASCII graphics with ANSI terminal color


SYNOPSIS
       ppmtoascii

       [-1x2|-2x4]

       [ppmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       ppmtoascii reads a PPM image as input and produces a somewhat crude ASCII graphic image as output, with ANSI terminal control characters so it has crude color when sent to a color text terminal.

       There is no converter for the other direction.

       ppmtoterm  does a similar thing, but displays each character of the image as a single pixel (using the same dense character for every pixel), whereas ppmtoascii combines 2 or 8 pixels into one char-
       acter, where the character roughly represents those particular pixels.

       Note that ANSI provides for only eight colors (including black and white).

       Note that an ANSI terminal can't display a single character in multiple colors, so where a character represents 8 pixels of differing colors, the color of the character is one that is the average of
       the colors of those pixels.

       pbmtoascii does the same thing for PBM images, with no terminal control characters (because none are needed for a strictly black and white image).



OPTIONS
       The  -1x2 and -2x4 options give you two alternate ways for the pixels to get mapped to characters.  With 1x2, the default, each character represents a group of 1 pixel across by 2 pixels down.  With
       -2x4, each character represents 2 pixels across by 4 pixels down.


SEE ALSO
       pbmtoascii(1)

       ppmtoterm(1)

       ppm(5)




HISTORY
       ppmtoascii was new in Netpbm 10.51 (June 2010).  Frank Ch. Eigler derived it from pbmtoascii.



AUTHOR
       Copyright (C) 2010 by Frank Ch. Eigler.



netpbm documentation                                                                            09 April 2010                                                                       Ppmtoascii User Manual(0)
