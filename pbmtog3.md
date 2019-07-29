Pbmtog3 User Manual(0)                                                                                                                                                                 Pbmtog3 User Manual(0)



NAME
       pbmtog3 - convert a PBM image into a Group 3 MH fax file


SYNOPSIS
       pbmtog3 [-reversebits] [-nofixedwidth] [pbmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       pbmtog3 reads a PBM image as input and produces a Group 3 MH fax file as output.

       You can also generate a TIFF file that uses the same encoding inside, with pamtotiff.

       There is no program in Netpbm that generates other fax formats, such as MR and MMR, but pamtotiff can generate TIFF files that use those encodings.


OPTIONS
       -reversebits
              This  option causes the output to have the bits in every byte reversed so the least significant bit becomes the most significant bit.  Apparently, there is some ambiguity in transmission pro-
              tocols so that the bits get reversed on transmission, and this compensates for that.  If you get a whole bunch of "bad code word" messages when  you  try  to  read  the  G3  file  (e.g.  with
              g3topbm), try using this option.  Note that the output is not G3 when you use this option.


       -nofixedwidth
              Most fax machines expect the image to be 1728 columns wide, so pbmtog3 cuts the output to this width by default.  If you want to keep the width of the original image, use this option.

              This option was new in Netpbm 10.6 (July 2002).  Before that, pbmtog3 always kept the width of the original image.




SEE ALSO
       g3topbm(1) , pamtotiff(1) , pbm(5)

       faxformats(1)




AUTHOR
       Copyright (C) 1989 by Paul Haeberli <paul@manray.sgi.com>.



netpbm documentation                                                                           03 December 2008                                                                        Pbmtog3 User Manual(0)
