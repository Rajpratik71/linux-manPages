Escp2topbm User Manual(0)                                                                                                                                                           Escp2topbm User Manual(0)



Created: 1 August 2003 escp2topbm - convert an ESC/P2 printer file to a PBM image


SYNOPSIS
       escp2topbm [printfile]


DESCRIPTION
       This program is part of Netpbm(1)

       escp2topbm reads an ESC/P2 printer control stream as input.  It produces a PBM image as output.

       escp2topbm filters the raster graphic content from an Epson ESC/P2 printer control stream and writes the image it would print as a standard (raw) PBM image.

       The input is from the file named by the printfile argument, or from Standard Input if you don't specify printfile.  The output is to Standard Output.

       escp2topbm understands compression modes 0 (uncompressed) and 1 (RLE compressed) in the Epson input stream.


OPTIONS
       none


HINTS
       As escp2topbm is a simple program, created mainly to test pbmtoescp2, there are some restrictions:



       ·      escp2topbm looks only at "ESC." sequences and ignores all data outside these Escape sequences.


       ·      escp2topbm assumes that only one raster graphic is in the printer stream.  If this isn't true, the result is garbage.


       ·      escp2topbm assumes that all "ESC."  sequences use the same width value.  If this isn't true, the result is garbage.



SEE ALSO
       pbmtoescp2(1) , pbm(5)



AUTHOR
       Copyright (C) 2003 by Ulrich Walcher (u.walcher@gmx.de).


HISTORY
       escp2topbm was added to Netpbm in Release 10.18 (August 2003); it was created around the same time.



netpbm documentation                                                                                                                                                                Escp2topbm User Manual(0)
