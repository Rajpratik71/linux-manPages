Yuvtoppm User Manual(0)                                                                                                                                                               Yuvtoppm User Manual(0)



NAME
       yuvtoppm - convert Abekas YUV bytes to PPM


SYNOPSIS
       yuvtoppm

       width height [imagedata]


DESCRIPTION
       This program is part of Netpbm(1)

       yuvtoppm  reads  raw Abekas YUV bytes as input and produces a PPM image as output.  The input file is just YUV bytes.  You have to specify the width and height on the command line, since the program
       obviously can't get them from the file.  yuvotppm assumes the maxval of the input is 255.

       The ppmtoyuvmanual(1)
        tells a little about the Abekas YUV format.



SEE ALSO
       ppmtoyuv(1) , ppm(5)



AUTHOR
       Marc Boucher <marc@PostImage.COM>, based on Example Conversion Program, A60/A64 Digital Video Interface Manual, page 69.

       Copyright (C) 1991 by DHD PostImage Inc.

       Copyright (C) 1987 by Abekas Video Systems Inc.



netpbm documentation                                                                             25 March 91                                                                          Yuvtoppm User Manual(0)
