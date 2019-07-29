Pgmmake User Manual(0)                                                                                                                                                                 Pgmmake User Manual(0)



NAME
       pgmmake - create a PGM image of a specified gray level and dimensions


SYNOPSIS
       pgmmake [-maxval=maxval] graylevel width height

       All  options  can  be abbreviated to their shortest unique prefix.  You may use two hyphens instead of one to designate an option.  You may use either white space or an equals sign between an option
       name and its value.



DESCRIPTION
       This program is part of Netpbm(1)

       pgmmake produces a PGM image of the specified gray level, width, height, and maxval.

       Specify the gray level (graylevel) as a decimal floating point number in the range [0, 1].  E.g. 1 is white, 0 is black, and 0.5 is half luminosity gray.


EXAMPLES
           pgmmake 1 50 50
           pgmmake .2 50 100 -maxval=5



OPTIONS
       -maxval=maxval
                   The maxval for the generated image.  Default is 255.



SEE ALSO
       pbmmake(1) , ppmmake(1) , pgm(5)



HISTORY
       This program was new in Netpbm 10.32 (February 2006).

       With older Netpbm, use ppmmake and ppmtopgm.



netpbm documentation                                                                           19 February 2006                                                                        Pgmmake User Manual(0)
