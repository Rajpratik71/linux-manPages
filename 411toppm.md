411toppm User Manual(0)                                                                                                                                                               411toppm User Manual(0)



NAME
       411toppm - convert Sony Mavica .411 image to PPM

SYNOPSIS
       411toppm [-width width] [-height height] [411file]


DESCRIPTION
       This program is part of Netpbm(1)

        411toppm reads a .411 file, such as from a Sony Mavic camera, and converts it to a PPM image as output.

       Output is to Standard Output.

       The  originator of this program and decipherer of the .411 format, Steve Allen <sla@alumni.caltech.edu>, has this to say about the utility of this program: 'There's so little image in a 64x48 thumb-
       nail (especially when you have the full size JPG file) that the only point in doing this was to answer the implicit challenge posed by the manual stating that only the camera can use these files.'


OPTIONS
       All options may be abbreviated to the shortest unique prefix.



       -width The width (number of columns) of the input image.  Default is 64.

       -height
              The height (number of rows) of the input image.  Default is 48.



SEE ALSO
       ppm(5)



netpbm documentation                                                                            03 March 2001                                                                         411toppm User Manual(0)
