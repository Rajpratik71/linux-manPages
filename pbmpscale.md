Pbmpscale User Manual(0)                                                                                                                                                             Pbmpscale User Manual(0)



NAME
       pbmpscale - enlarge a PBM image with edge smoothing


SYNOPSIS
       pbmpscale N [pbmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       pbmpscale reads a PBM image as input, and outputs a PBM image enlarged N times.  pbmpscale does this enlargement by pixel replication, with some additional smoothing of corners and edges.



SEE ALSO
       pamenlarge(1) , pamscale(1) , pamstretch(1) , pbm(5)




AUTHOR
       Copyright (C) 1990 by Angus Duggan Copyright (C) 1989 by Jef Poskanzer.

       Permission  to  use, copy, modify, and distribute this software and its documentation for any purpose and without fee is hereby granted, provided that the above copyright notice appear in all copies
       and that both that copyright notice and this permission notice appear in supporting documentation.  This software is provided 'as is' without express or implied warranty.


NOTES
       pbmpscale works best for enlargements of 2. To do enlargements greater than 2, you should do as many enlargements of 2 as possible, then enlarge by the remaining factor.



netpbm documentation                                                                           03 October 2003                                                                       Pbmpscale User Manual(0)
