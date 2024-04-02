Pbmtocis User Manual(0)                                                                                                                                                               Pbmtocis User Manual(0)



NAME
       pbmtocis - convert a PBM image to a CompuServe RLE image


SYNOPSIS
       pbmtocis [-i] [-w] [cisfile]


DESCRIPTION
       This program is part of Netpbm(1)

       pbmtocis reads a PBM image as input and produces a CompuServe RLE image as output.


OPTIONS
       -i     Inverse: Reverse the mapping of foreground/background to black/white.


       -w     If the input image is smaller than the fixed size of the output image, pad with white pixels rather than black.




SEE ALSO
       cistopbm(1) , pbm(5) CompuServe RLE file format ⟨http://staticweb.rasip.fer.hr/research/compress/algorithms_run-length_coding.htm#examples⟩


HISTORY
       pbmtocis was new in Netpbm 10.48 (September 2009).


AUTHOR
       Copyright (C) 2009 John Elliot <jce@seasip.demon.co.uk>



netpbm documentation                                                                             05 July 2009                                                                         Pbmtocis User Manual(0)
