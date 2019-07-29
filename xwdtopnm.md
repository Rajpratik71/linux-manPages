Xwdtopnm User Manual(0)                                                                                                                                                               Xwdtopnm User Manual(0)



NAME
       xwdtopnm - convert an X11 or X10 window dump file to a PNM image


SYNOPSIS
       xwdtopnm [-verbose] [-headerdump] [xwdfile]


DESCRIPTION
       This program is part of Netpbm(1)

       xwdtopnm  reads  an X11 or X10 window dump file as input and produces a PNM image as output.  The type of the output image depends on the input file - if it's black and white, the output is PBM.  If
       it's grayscale, the output is PGM.  Otherwise, it's PPM.  The program tells you which type it is writing.

       Using this program, you can convert anything you can display on an X workstation's screen into a PNM image.  Just display whatever you're interested in, run the xwd program to capture  the  contents
       of the window, run it through xwdtopnm, and then use pamcut to select the part you want.

       Note  that  a pseudocolor XWD image (typically what you get when you make a dump of a pseudocolor X window) has maxval 65535, which means the PNM file that xwdtopnm generates has maxval 65535.  Many
       older image processing programs (that aren't part of the Netpbm package and don't use the Netpbm programming library) don't know how to handle a PNM image with maxval greater than 255 (because there
       are two bytes instead of one for each sample in the image).  So you may want to run the output of xwdtopnm through pamdepth before feeding it to one of these old programs.

       xwdtopnm  can't  convert every kind of XWD image (which essentially means it can't convert an XWD created from every kind of X display configuration).  In particular, it cannot convert one with more
       than 24 bits per pixel.



OPTIONS
       -verbose
              This option causes xwdtopnm to display handy information about the input image and the conversion process


       -headerdump
              This option causes xwdtopnm to display the contents of the X11 header.  It has no effect when the input is X10.  This option was new in Netpbm 10.26 (December 2004).




NOTES
   Two Byte Samples
       xwdtopnm sometimes produces output with a maxval greater than 255, which means the maximum value of a sample (one intensity value, e.g. the red component of a pixel) is greater than 255  and  there-
       fore  each  sample takes 2 bytes to represent.  This can be a problem because some programs expect those bytes in a different order from what the Netpbm format specs say, which is what xwdtopnm pro-
       duces, which means they will see totally different colors that they should.   xv is one such program.

       If this is a problem (e.g. you want to look at the output of xwdtopnm with xv), there are two ways to fix it:



       ·      Pass the output through pamendian to produce the format the program expects.

       ·      Pass the output through pamdepth to reduce the maxval below 256 so there is only one byte per sample.


       Often, there is no good reason to have a maxval greater than 255.  It happens because in XWD, byte not PNM, each color component of a pixel can have different resolution, for example 5 bits for blue
       (maxval  31),  5  bits  for red (maxval 31), and 6 bits for green (maxval 63), for a total of 16 bits per pixel.  In order to reproduce the colors as closely as possible, xwdtopnm has to use a large
       maxval.  In this example, it would use 31 * 63 = 1953, and use 48 bits per pixel.

       Because this is a common and frustrating problem when using xwdtopnm, the program issues a warning whenever it generates output with two byte samples.  You can quiet this  warning  with  the  -quiet
       common option ⟨index.html#commonoptions⟩ .  The warning was new in Netpbm 10.46 (March 2009).



SEE ALSO
       pnmtoxwd(1) , pamendian(1) , pamdepth(1) , pnm(5) , xwd man page


AUTHOR
       Copyright (C) 1989, 1991 by Jef Poskanzer.



netpbm documentation                                                                            8 January 2010                                                                        Xwdtopnm User Manual(0)
