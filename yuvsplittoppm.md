Yuvsplittoppm User Manual(0)                                                                                                                                                     Yuvsplittoppm User Manual(0)



NAME
       yuvsplittoppm - convert separate Y, U, and V files into a PPM image


SYNOPSIS
       yuvsplittoppm

       basename width height [-ccir601]


DESCRIPTION
       This program is part of Netpbm(1)

       yuvsplittoppm reads three files, containing the YUV components, as input.  These files are basename.Y, basename.U, and basename.V.  Produces a PPM image on Standard Output.

       Since the YUV files are raw files, the dimensions width and height must be specified on the command line.


OPTIONS
       -ccir601
              Assumes that the YUV triplets are scaled into the smaller range of the CCIR 601 (MPEG) standard. Else, the JFIF (JPEG) standard is assumed.



SEE ALSO
       ppmtoyuvsplit(1) , yuvtoppm(1) , ppm(5)



AUTHOR
       Marcel Wijkstra <wijkstra@fwi.uva.nl>, based on ppmtoyuvsplit.



netpbm documentation                                                                             26 August 93                                                                    Yuvsplittoppm User Manual(0)
