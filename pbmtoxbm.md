Pbmtoxbm User Manual(0)                                                                                                                                                               Pbmtoxbm User Manual(0)



NAME
       pbmtoxbm - convert a PBM image to an X11 bitmap


SYNOPSIS
       pbmtoxbm

       [{-x10|-x11}]

       [pbmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       pbmtoxbm reads a PBM image as input and produces an X10 or X11 bitmap as output.



OPTIONS
       -x10   This option causes pbmtoxbm to generate the X10 version of XBM.

              You may not specify this with -x11.

              This option was new with Netpbm 10.37 (December 2006).  Before that, use pbmtox10bm instead.


       -x11   This option causes pbmtoxbm to generate the X11 version of XBM.

              You may not specify this with -x10.

              The X11 version is the default, so this option has no effect.

              This option was new with Netpbm 10.37 (December 2006).




SEE ALSO
       pbmtox10bm(1) , xbmtopbm(1) , pbm(5)



AUTHOR
       Copyright (C) 1988 by Jef Poskanzer.



netpbm documentation                                                                           25 October 2006                                                                        Pbmtoxbm User Manual(0)
