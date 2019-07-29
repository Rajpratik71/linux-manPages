Ppmtorgb3 User Manual(0)                                                                                                                                                             Ppmtorgb3 User Manual(0)



NAME
       ppmtorgb3 - separate a PPM image into three PGMs


SYNOPSIS
       ppmtorgb3

       [ppmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       ppmtorgb3 reads a PPM image as input and writes three PGM images as output, one each for red, green, and blue.

       ppmtorgb3  constructs  the  output  filenames by taking the input filename, stripping off any extension, and appending .red, .grn, .blu.  For example, separating lenna.ppm would result in lenna.red,
       lenna.grn, and lenna.blu.  If the input comes from stdin, the names are noname.red, noname.grn, and noname.blu.


SEE ALSO
       rgb3toppm(1) , pamchannel(1) , ppmtopgm(1) , pgmtoppm(1) , ppm(5) , pgm(5)




AUTHOR
       Copyright (C) 1991 by Jef Poskanzer.



netpbm documentation                                                                           10 January 1991                                                                       Ppmtorgb3 User Manual(0)
