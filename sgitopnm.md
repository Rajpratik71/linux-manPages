Sgitopnm User Manual(0)                                                                                                                                                               Sgitopnm User Manual(0)



NAME
       sgitopnm - convert a SGI image file to PNM


SYNOPSIS
       sgitopnm

       [-verbose]

       [-channel c]

       [SgiFileName]



DESCRIPTION
       This program is part of Netpbm(1)

       sgitopnm reads an SGI image file as input and produces a PGM image for a 2-dimensional (1- or 2-channel) input file, and a PPM image for a 3-dimensional (3 or more channels) input file.

       Alternatively, the program produces a PGM image of any one of the channels in the input file.

       Before Netpbm 10.67 (June 2014), sgitopnm does not work on 2-channel SGI images.  It fails if you try.

       If you don't specify the SgiFileName argument, input is from Standard Input.

       Before Netpbm 10.67 (June 2014), sgitopnm requires its input to be a seekable file, so for example you can't feed it from a pipe.



OPTIONS
       -verbose
              Give some information about the SGI image file.


       -channel n
              Extract channel n of the image as a PGM image.

              Without this option, sgitopnm extracts the first 3 channels as a PPM image or, if the input has 1 or 2 channels, extracts the first channel as a PGM image.

              A  2-channel  image  is  grayscale  plus  alpha  (transparency),  so  you  can  get  the  transparency information with -channel=2.  You could then combine them into a PAM image of tuple type
              GRAYSCALE_ALPHA with pamstack.




REFERENCES
       The SGI image format specification version 1.0 is at ftp://ftp.sgi.com/graphics/grafica/sgiimage.html .

       There is an example SGI file at https://github.com/ZaaLabs/ZaaIL-TestImages/tree/master/SGI .



SEE ALSO
       pnm(5) , pam(5) , pnmtosgi(1) , pamstack(1)




AUTHOR
       Copyright (C) 1994 by Ingo Wilken ( Ingo.Wilken@informatik.uni-oldenburg.de)



netpbm documentation                                                                            25 April 2014                                                                         Sgitopnm User Manual(0)
