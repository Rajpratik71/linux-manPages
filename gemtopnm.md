Gemtopnm User Manual(0)                                                                                                                                                               Gemtopnm User Manual(0)



NAME
       gemtopnm - convert a GEM .img file into a PNM image


SYNOPSIS
       gemtopnm [-d] [gemfile]


DESCRIPTION
       This program is part of Netpbm(1)

       gemtopnm reads a GEM .img file, either the one plane (black/white) or four plane (16 color) varieety, as input and produces a PBM or PPM file as output, depending on whether the input is one or four
       plane.

       The input file is gemfile if you specify that argument, or Standard Input otherwise.  Output is to Standard Output.


OPTIONS
       -d     Produce output describing the contents of the .img file.




SEE ALSO
       pbmtogem(1) , pnm(5)



AUTHOR
       Copyright (C) 1988 Diomidis D. Spinellis (dds@cc.ic.ac.uk).



netpbm documentation                                                                            30 April 2000                                                                         Gemtopnm User Manual(0)
