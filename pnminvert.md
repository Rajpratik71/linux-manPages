Pnminvert User Manual(0)                                                                                                                                                             Pnminvert User Manual(0)



NAME
       pnminvert - invert a PNM image


SYNOPSIS
       pnminvert

       [pnmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       pnminvert reads a PNM image as input, inverts it black for white, and produces a PNM image as output.

       If the image is grayscale, pnminvert replaces a pixel with one of complementary brightness, i.e. if the original pixel has gamma-adjusted gray value G, the output pixel has gray value maxval - G.

       If the image is color, pnminvert inverts each individual RGB component the same as for a grayscale image.


SEE ALSO
       pnm(5)



AUTHOR
       Copyright (C) 1989 by Jef Poskanzer.



netpbm documentation                                                                            08 August 1989                                                                       Pnminvert User Manual(0)
