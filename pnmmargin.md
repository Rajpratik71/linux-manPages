Pnmmargin User Manual(0)                                                                                                                                                             Pnmmargin User Manual(0)



NAME
       pnmmargin - add borders to a PNM image


SYNOPSIS
       pnmmargin [-white|-black|-color colorspec] size [pnmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       pnmmargin adds a border around a PNM image.


OPTIONS
       You can specify the border color with the -white, -black, and -color options.  If no color is specified, the program makes a guess.

       To remove a border of a specified size from an image, use pamcut.  pnmcrop also removes borders, but determines by itself what is border and what is subject.

       For lower level control, including to add different size borders to different sides of the image, look at pnmcat.

       If all you're trying to do is get the image up to a certain required size, pamcut may be what you want.

       pnmpad does essentially the same thing, but gives you more control over the individual margins and does only black and white margins.


SEE ALSO
       pamcut(1)

       pnmcrop(1)

       pnmcat(1)

       pnmpad(1)

       pnm(5)



AUTHOR
       Copyright (C) 1991 by Jef Poskanzer.



netpbm documentation                                                                            20 March 2009                                                                        Pnmmargin User Manual(0)
