Ppmtoapplevol User Manual(0)                                                                                                                                                     Ppmtoapplevol User Manual(0)



NAME
       ppmtoapplevol - convert a PPM into an Apple volume label image


SYNOPSIS
       ppmtoapplevol

       [ppmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       ppmtoapplevol reads a PPM image as input and produces an Apple volume label image as output.

       EFI-based Apple systems use a simple image format to provide textual labels for devices.  This program generates that format.

       The input image must be exactly 12 rows tall.  Use pamfile to see how tall your image is and pamscale or pamcut to make it 12 rows if it isn't.

       Netpbm does not have a converter for the other direction.


SEE ALSO
       pamfile(1)

       pamcut(1)

       ppm(5)



HISTORY
       ppmtoapplevol was new in Netpbm 10.54 (March 2011).



netpbm documentation                                                                           08 January 2010                                                                   Ppmtoapplevol User Manual(0)
