Anytopnm User Manual(0)                                                                                                                                                               Anytopnm User Manual(0)



NAME
       anytopnm - convert an arbitrary type of image file to PBM, PGM, or PPM


SYNOPSIS
       anytopnm [file]


DESCRIPTION
       This program is part of Netpbm(1)

       anytopnm converts the input image, which may be in any of about 100 graphics formats, to PBM, PGM, or PPM format, depending on that nature of the input image, and outputs it to Standard Output.

       To  determine  the  format  of the input, anytopnm uses the file program (possibly assisted by the magic numbers file fragment included with Netpbm). If that fails (very few image formats have magic
       numbers), anytopnm looks at the filename extension.  If that fails, anytopnm punts.

       The type of the output file depends on the input image.

       anytopnm uses the converters for particular graphics formats that are in the Netpbm package, so it can't convert any format that you couldn't convert with some other Netpbm program.   What  anytopnm
       adds is the ability to recognize the format and choose the appropriate Netpbm program to convert it.  For example, if you invoke anytopnm on a GIF file, anytopnm will recognize that it is a GIF file
       and therefore giftopnm knows how to convert it to PNM, so anytopnm invokes giftopnm.

       anytopnm cannot recognize every possible input format, so you may still be able to convert an image with a specific Netpbm program when anytopnm fails to convert it.

       If file indicates that the input file is compressed (either via Unix compress, gzip, or bzip compression), anytopnm uncompresses it and proceeds as above with the uncompressed result.

       If file indicates that the input file is encoded by uuencode or btoa, anytopnm decodes it and proceeds as above with the decoded result.

       If file is - or not given, anytopnm takes its input from Standard Input.


SEE ALSO
       pamfile(1) , pnm(5) , file man page


AUTHOR
       Copyright (C) 1991 by Jef Poskanzer.



netpbm documentation                                                                          05 September 2006                                                                       Anytopnm User Manual(0)
