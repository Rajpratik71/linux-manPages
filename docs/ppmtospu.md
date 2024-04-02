Ppmtospu User Manual(0)                                                                                                                                                               Ppmtospu User Manual(0)



NAME
       ppmtospu - convert a PPM image to an Atari Spectrum 512 image


SYNOPSIS
       ppmtospu

       [-d0|-d2|-d4] [ppmfile]

       All options can be abbreviated to their shortest unique prefix.  You may use two hyphens instead of one.  You may separate an option name and its value with white space instead of an equals sign.


DESCRIPTION
       This program is part of Netpbm(1)

       This program converts from the PPM format to the uncompressed Spectrum 512 image format used on Atari ST computers.

       Input comes from the file you name with the ppmfile argument, or Standard Input by default.  Output goes to Standard Output.

       The input must be 320 pixels wide by 200 pixels high.  If you have an image of a different size, you can use pamcut or pamscale to force it to these dimensions.



OPTIONS
       -d0    The program does no dithering.


       -d2    The program uses a 2x2 ordered dither.

              This is the default.


       -d4    The program uses a 4x4 ordered dither.





SEE ALSO
       sputoppm(1) , sputoppm(1) , pamscale(1) , pamcut(1) , ppm(5)




AUTHOR
       Copyright (C) 1990 by Steve Belczyk



HISTORY
       This program was new in Netpbm 10.58 (March 2012).

       But  it  was  written  in  1990.  Steve Belczyk posted it along with sputoppm, spctoppm, pi1toppm, and pi1toppm - all programs for dealing with Atari image formats - to comp.sources.misc on July 15,
       1990.  For reasons that have been lost to history, all of these entered the Netpbm (then Pbmplus) distribution except ppmtospu.

       Georges Kesseler wondered In March 2012 why there was no counterpart to sputoppm in Netpbm and searched the web, finding only one reference to ppmtopsu: the 1990 comp.sources.misc posting, including
       the source code.  He emailed the Netpbm maintainer suggesting it be added.

       Bryan Henderson found the source code to be extremely primitive, not even using common library code.  So Bryan completely recoded it, but retained nearly all of the original logic.



netpbm documentation                                                                            08 March 2012                                                                         Ppmtospu User Manual(0)
