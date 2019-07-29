Ppmquant User Manual(0)                                                                                                                                                               Ppmquant User Manual(0)



NAME
       ppmquant - quantize the colors in a PPM image down to a specified number


SYNOPSIS
       ppmquant [-floyd|-fs] ncolors [ppmfile] ppmquant [-floyd|-fs] [-nofloyd|-nofs] -mapfile mapfile [ppmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       ppmquant  is  obsolete.   All  it does now is invoke pnmquant or pnmremap.  You should use one of those programs in any new program, or if you are modifying an old program, and your program does not
       have to work with a version of Netpbm before 9.21 (January 2001).  ppmquant exists only for name compatibility.

       pnmquant is fully backward compatible with ppmquant without the -mapfile option; pnmremap is fully backward compatible with ppmquant with the -mapfile option.

       All options can be abbreviated to their shortest unique prefix.  You may use two hyphens instead of one to designate an option.  You may use either white space or equals signs between an option name
       and its value.

       Except with differences suggested by the syntax synopsis above, ppmquant's function is the same as pnmquant and pnmremap.

       Before  Netpbm  10.19  (November  2003),  ppmquant  was a completely separate program from pnmquant, and was a bona fide PPM program.  That means if you gave it a PGM or PBM image as input, it would
       process it as if it were PPM and generate a PPM output.  Now, since it is really a PNM program, it processes PBM and PGM inputs as what they are and produces the same kind of output.

       Note: The reason ppmquant was changed in Netpbm 10.19 is that for some time before that, ppmquant had a serious bug that would have been difficult to fix -- it chose the wrong color set.   Maintain-
       ing two versions of the same code did not make sense.


SEE ALSO
       pnmquant(1) , pnmremap(1) , pnmcolormap(1) , pamseq(1) , ppm(5)



AUTHOR
       Copyright (C) 1989, 1991 by Jef Poskanzer.



netpbm documentation                                                                           22 October 2003                                                                        Ppmquant User Manual(0)
