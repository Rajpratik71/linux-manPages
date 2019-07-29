Pamwipeout User Manual(0)                                                                                                                                                           Pamwipeout User Manual(0)



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">




NAME
       pamwipeout - replace detail with smooth gradient from one edge to the other


SYNOPSIS
       pamwipeout {-lr | -tb} [filename]

       Minimum unique abbreviation of options is acceptable.  You may use double hyphens instead of single hyphen to denote options.


DESCRIPTION
       This program is part of Netpbm(1)

       The  pamwipeout  utility takes a Netpbm image as input and the uses two opposite edges of the image to wipe out anything in between.  You can use it in combination with pamcut and pnmpaste / pamcomp
       to remove unwanted parts of a larger image.  The program replaces the pixels in between the two edges with a gradient from one edge to the other.

       In top-bottom mode, the program reads the whole image into memory before it can start processing.  In left-right it will read the image a row at the time, process that row and write it to the output
       file.  Therefore, in case of very large images, it may be better to use instead of "pamwipeout -tb" a pipe of "pamflip -cw | pamwipeout -lr | pamflip -ccw".

       In his blog at

       www.i-am.ws  ⟨http://www.i-am.ws/entry/pnmblend_disappearing_act⟩  ,  the author wrote about a predecessor of "pamwipeout" at the time named "pnmblend". It shows a good example of what can be accom-
       plished with this utility.


PARAMETERS
       Filename is the name of the input file. If you don't specify this, pamwipeout reads the image from Standard Input.


OPTIONS
       <dl compact="compact">

       -tb | -lr

              This option chooses between a vertical and a horizontal gradient.  You must specify one of these, but not both.




SEE ALSO
       pam(1)
        and pamflip(1) , pamcut(1) , pamcomp(1) , pnmpaste(1)


HISTORY
       pamwipeout was new in Netpbm 10.54 (March 2011).


AUTHORS
       Willem van Schaik wrote this program in January 2011 and contributed it to Netpbm.



netpbm documentation                                                                          February 26, 2011                                                                     Pamwipeout User Manual(0)
