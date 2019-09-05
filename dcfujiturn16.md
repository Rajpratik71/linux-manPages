dcfujiturn(1)                                                 General Commands Manual                                                dcfujiturn(1)

NAME
       dcfujiturn/dcfujiturn16 - Alternative rotation for dcraw processed images

SYNOPSIS
       dcraw -c -j dscf0000.raf | dcfujiturn > dscf0000.ppm
       dcraw -c -j -4 dscf0000.raf | dcfujiturn16 > dscf0000.ppm

DESCRIPTION
       UNIX filter to correct the 45-degree rotation in images from Fuji digital cameras.
       Some  Fuji  digital  cameras  have  a unique CCD sensor placed at a 45 degree angle.  The raw output for this sensor is rotated relative to
       other camera brands.  dcfujiturn and dcfujiturn16 provide an alternative to the automatic rotation present in dcraw producing a larger res‐
       olution image.

       dcfujiturn16 works on 16 bit linear ppm data if you are using dcraw -4 to generate your output

SEE ALSO
       dcraw(1), dcfuji_green(1)

AUTHOR
       Written by Steve King for debian.

                                                                   Jun 27, 2006                                                      dcfujiturn(1)
