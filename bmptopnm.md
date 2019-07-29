Bmptopnm User Manual(0)                                                                                                                                                               Bmptopnm User Manual(0)



NAME
       bmptopnm - convert a BMP file into a PBM, PGM, or PNM image


SYNOPSIS
       bmptopnm

       [-verbose]

       [bmpfile]


DESCRIPTION
       This program is part of Netpbm(1)

       bmptopnm reads a Microsoft Windows or OS/2 BMP file as input.  and produces a PBM, PGM, or PNM image as output.  If the input is colormapped and contains only black and white, the output is PBM.  If
       the input is colormapped and contains only black white and gray, the output is PGM.  Otherwise, the output is PPM.

       bmptopnm understands BMP files compressed with run length encoding (RLE4/RLE8), but not if that encoding includes a 'delta' (which is rare).  bmptopnm recognizes the delta and issues an  error  mes-
       sage.

       bmptopnm  cannot  convert  BMP files compressed with JPEG or PNG encoding.  It recognizes the compression and issues an error message.  Before Netpbm 10.32 (February 2006), bmptopnm couldn't convert
       RLE BMP files either.

       Before Netpbm 10.18 (September 2003), this program could not convert BMP images with the BI_BITFIELDS format ("compression type").  It would recognize the format and issue an error message.

       bmptopnm cannot convert OS/2 BMP files with 16 bits per pixel (only because the author did not have a complete specification for them).  It recognizes the format and issues an error message.  Before
       Netpbm 10.16 (June 2003), it also could not convert Windows BMP files with 16 bits per pixel.



SEE ALSO
       ppmtobmp(1) , ppmtowinicon(1) , ppm(5)



AUTHOR
       Copyright (C) 1992 by David W. Sanderson.



netpbm documentation                                                                          20 September 2010                                                                       Bmptopnm User Manual(0)
