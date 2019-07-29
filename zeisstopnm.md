Zeisstopnm User Manual(0)                                                                                                                                                           Zeisstopnm User Manual(0)



NAME
       zeisstopnm - convert a Zeiss confocal file to PNM


SYNOPSIS
       zeisstopnm

       [-pgm | -ppm]

       [zeissfile]


DESCRIPTION
       This program is part of Netpbm(1)

       zeisstopnm reads a Zeiss confocal file as input and produces a PNM image as output.

       By  default,  the  exact  type of the output depends on the input file: If it's grayscale a PGM image; otherwise a PPM.  The program tells you which type it is writing.  You can override the default
       with the -pgm and -ppm options.



OPTIONS
       -pgm   Force the output to be in PGM format.


       -ppm   Force the output to be in PPM format.




SEE ALSO
       pnm(5)



AUTHOR
       Copyright (C) 1993 by Oliver Trepte



netpbm documentation                                                                             15 June 1993                                                                       Zeisstopnm User Manual(0)
