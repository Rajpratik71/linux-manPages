Pbmtolj User Manual(0)                                                                                                                                                                 Pbmtolj User Manual(0)



NAME
       pbmtolj - convert a PBM image to HP LaserJet format


SYNOPSIS
       pbmtolj [-resolution N] [-float] [-noreset] [-packbits] [-delta] [-compress] [pbmfile] [-copies N]

       You can abbreviate any option to its shortest unique prefix.



DESCRIPTION
       This program is part of Netpbm(1)

       pbmtolj reads a PBM image as input and produces HP LaserJet data as output.  You can send this data to a LaserJet or DeskJet printer (at least some of them).

       Each  pixel in the input PBM image becomes one dot in the printed output.  Therefore, you must make sure the width and height of the input are appropriate for the print resolution you choose and the
       print area you want.  E.g. if you print at 300 dpi and want the image to print as 8 inches by 10, you must supply a PBM that is 2400 pixels wide by 3000 pixels high.  You can adjust the size of  the
       input with pamscale, pamstretch, pbmreduce, or pamenlarge.

       The input may be a multi-image PBM stream.  Each input image becomes a page of output.  But before Netpbm 10.28 (June 2005), images after the first one are ignored.

       Note that there is no ljtopbm tool.


OPTIONS
       -resolution
              Specifies the resolution of the output device, in dpi.  Another way to look at this is as a declaration of the resolution of the input image (PBM images don't have inherent resolution).  Typ-
              ical values are 75, 100, 150, 300, and 600.  The default is 75.


       -float Suppresses positioning commands.  By default, pbmtolj places the sequence ESC & l 0 E in the output, which means to force the top margin to zero.  With -float, pbmtolj omits that command.


       -noreset
              Prevents pbmtolj from writing the reset sequences to the beginning and end of the output file.


       -packbits
              Enables use of TIFF packbits compression.


       -delta Enables use of delta-between-rows compression.


       -compress
              Enables use of both TIFF packbits, and delta-between-rows compression.


       -copies
              Specifies the number of copies. The default is 1.  This option controls the 'number of copies' printer control; pbmtolj generates only one copy of the image.




SEE ALSO
       pnmtopclxl(1) , ppmtolj(1) , pjtoppm(1) , ppmtopj(1) , thinkjettopbm(1) , pbm(5)



AUTHOR
       Copyright (C) 1988 by Jef Poskanzer and Michael Haberler.  -float and -noreset options added by Wim Lewis.  -delta, -packbits, and -compress options added by Dave Platt.



netpbm documentation                                                                            23 April 2005                                                                          Pbmtolj User Manual(0)
