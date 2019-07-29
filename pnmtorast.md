Pnmtorast User Manual(0)                                                                                                                                                             Pnmtorast User Manual(0)



NAME
       pnmtorast - convert a PPM into a Sun rasterfile


SYNOPSIS
       pnmtorast [-standard|-rle] [pnmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       pnmtorastreads a PPM image as input and produces a Sun rasterfile as output.

       Color values in Sun rasterfiles are eight bits wide, so pnmtorast will automatically scale colors to have a maxval of 255.  An extra pamdepth step is not necessary.


OPTIONS
       The -standard option forces the result to be in RT_STANDARD form; the -rle option, RT_BYTE_ENCODED, which is smaller but, well, less standard.  The default is -rle.

       All options can be abbreviated to their shortest unique prefix.


SEE ALSO
       rasttopnm(1) , pnm(5)


AUTHOR
       Copyright (C) 1989, 1991 by Jef Poskanzer.



netpbm documentation                                                                           12 January 1991                                                                       Pnmtorast User Manual(0)
