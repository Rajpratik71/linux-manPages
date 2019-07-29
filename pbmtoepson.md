Pbmtoepson User Manual(0)                                                                                                                                                           Pbmtoepson User Manual(0)



NAME
       pbmtoepson - convert a PBM image into Epson printer graphics


SYNOPSIS
       pbmtoepson

       [-dpi=n] [-protocol={escp9|escp}] [-adjacent] [-nonadjacent]

       [pbmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       pbmtoepson reads a PBM image as input and produces a stream of Epson printer graphics as output.

       The input is from the file identified by the pbmfile argument or, if you don't specify pbmfile, from Standard Input.  Output is to Standard Output.

       The output is for traditional (ca 1991) Epson 9-wire dot matrix (sometimes called ESC/P 9-wire) printers or newer ESC/P printers.  For a more modern Epson ESC/P2 type printer, try pbmtoescp2.

       Before Netpbm 10.23 (July 2004), pbmtoepson could not produce ESC/P streams -- only ESC/P 9-wire.

       The Epson printer protocols are described in Epson's protocol specification.

       Note that there is no epsontopbm tool - this transformation is one way.


OPTIONS
       -protocol={escp9|escp}
              This determines which Epson printer protocol the output uses.  escp9 is the older ESC/P 9-pin protocol.  escp is the newer ESC/P protocol.  For the even newer ESC/P2 protocol, you have to use
              pbmtoescp2 instead.

              This option was new in Netpbm 10.23 (July 2004).



       -dpi=n This specifies the horizontal print density in dots per inch.  The protocol allows only certain values: 60, 72, 80, 90, 120, 144, and 240.  Actually, the ESC/P protocol allows a  few  others,
              but pbmtoepson doesn't know how to generate the command streams that use them.

              If you don't specify this, pbmtoepson chooses a horizontal print density for you consistent with your other options.

              This option was new in Netpbm 10.23 (July 2004).


       -adjacent

       -nonadjacent
              These options determine whether the output uses 'adjacent dot printing' or not, whatever that is.

              If you don't specify this, pbmtoepson selects adjacent dot printing unless that is incompatible with your other options.

              This option was new in Netpbm 10.23 (July 2004).





SEE ALSO
       pbmtoescp2(1) , pbm(5) ,


AUTHOR
       Copyright (C) 1991 by John Tiller (tiller@galois.msfc.nasa.gov) and Jef Poskanzer.



netpbm documentation                                                                            8 August 2003                                                                       Pbmtoepson User Manual(0)
