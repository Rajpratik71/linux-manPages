Pammosaicknit User Manual(0)                                                                                                                                                     Pammosaicknit User Manual(0)



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">




       Table Of Contents ⟨#contents⟩


NAME
       pammosaicknit - validate a mosaic knitting pattern



SYNOPSIS
       pammosaicknit [in_netpbmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       pammosaicknit  helps the user create mosaic knitting patterns ⟨http://en.wikipedia.org/wiki/Slip-stitch_knitting#Mosaic_knitting⟩ . The program inputs a black-and-white Netpbm image that describes a
       mosaic knitting pattern and outputs a color Netpbm image of the same pattern but with invalid runs shown in red.

       A valid knitting pattern starts with a <q>black</q> row on the bottom and alternates <q>white</q> and <q>black</q> rows. A <q>black</q> row can contain any arrangement of black pixels  but  no  more
       than  three consecutive white pixels. A <q>white</q> row can contain any arrangement of white pixels but no more than three consecutive black pixels. Columns wrap horizontally, so a <q>white</q> row
       that both begins and ends with two black pixels is deemed to contain four consecutive black pixels. Because this is an invalid number for a <q>white</q> row, those four pixels will be recolored  red
       in the output image.

       For  clarity,  there  are two shades of red in the output image.  Dark red pixels indicate pixels that were black in the input image but which must contain one or more white pixels. Light red pixels
       indicate pixels that were white in the input image but which must contain one or more black pixels.

       If the output image contains no red pixels, then the input image represents a valid mosaic knitting pattern.



ARGUMENTS
       pammosaicknit's only argument, in_netpbmfile, is the name of an image file that represents a mosaic knitting pattern. If you don't specify in_netpbmfile, the program reads the  image  from  Standard
       Input.



NOTES
       If  the input image is not a black-and-white image, pammosaicknit converts it internally to black and white by thresholding each pixel's luminosity. The output image is always a color image contain-
       ing at most four colors (black, white, dark red, light red).



SEE ALSO
       ·

              pam(5)




HISTORY
       pammosaicknit was new in Netpbm 10.53 (December 2010).



AUTHOR
       Copyright (C) 2010 Scott Pakin, scott+pbm@pakin.org.



Table Of Contents
       ·

              SYNOPSIS ⟨#synopsis⟩

       ·

              DESCRIPTION ⟨#description⟩

       ·

              ARGUMENTS ⟨#arguments⟩

       ·

              NOTES ⟨#notes⟩

       ·

              SEE ALSO ⟨#see_also⟩

       ·

              HISTORY ⟨#history⟩

       ·

              AUTHOR ⟨#author⟩



netpbm documentation                                                                           12 December 2010                                                                  Pammosaicknit User Manual(0)
