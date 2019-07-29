Pamdice User Manual(0)                                                                                                                                                                 Pamdice User Manual(0)



NAME
       pamdice - slice a Netpbm image into many horizontally and/or vertically


EXAMPLE
           $ pamdice myimage.ppm -outstem=myimage_part -width=10 -height=8
           $ pamundice myimage_part_%1d_%1a.ppm -across=10 -down=8 >myimage.ppm

           $ pamdice myimage.ppm -outstem=myimage_part -height=12 -voverlap=9



SYNOPSIS
       pamdice

       -outstem=filenamestem

       [-width=width]

       [-height=height]

       [-hoverlap=hoverlap]

       [-voverlap=voverlap]

       [-verbose]

       [filename]

       You can use the minimum unique abbreviation of the options.  You can use two hyphens instead of one.  You can separate an option name from its value with white space instead of an equals sign.


DESCRIPTION
       This program is part of Netpbm(1)

       pamdice  reads  a  PAM,  PBM,  PGM,  or PPM image as input and splits it horizontally and/or vertically into equal size pieces and writes them into separate files as the same kind of image.  You can
       optionally make the pieces overlap.

       See the -outstem option for information on naming of the output files.

       The -width and -height options determine the size of the output pieces.

       pamundice can rejoin the images.  For finer control, you can also use

       pnmcat.

       One use for this is to make pieces that take less computer resources than the whole image to process.  For example, you might have an image so large that an image editor can't read it all into  mem-
       ory or processes it very slowly.  With pamdice, you can split it into smaller pieces, edit one at a time, and then reassemble them.

       Another use for this is to print a large image in small printer-sized pieces that you can glue together.  ppmglobe does a similar thing; it lets you glue the pieces together into a sphere.

       If you want to cut pieces from an image individually, not in a regular grid, use pamcut.



OPTIONS
       -outstem=filenamestem
              This  option  determines the names of the output files.  Each output file is named filenamestem_y_x.type where filenamestem is the value of the -outstem option, x and y are the horizontal and
              vertical locations, respectively, in the input image of the output image, zero being the leftmost and top, and type is .pbm, .pgm, .ppm, or .pam, depending on the type of image.


       -width=width
              gives the width in pixels of the output images.  The rightmost pieces are smaller than this if the input image is not a multiple of width pixels wide.


       -height=height
              gives the height in pixels of the output images.  The bottom pieces are smaller than this if the input image is not a multiple of height pixels high.


       -hoverlap=hoverlap
              gives the horizontal overlap in pixels between output images.  Each image in a row will overlap the previous one by hoverlap pixels.  By default, there is no overlap.

              This option was new in Netpbm 10.23 (July 2004).


       -voverlap=voverlap
              gives the vertical overlap in pixels between output images.  Each row of images will overlap the previous row by voverlap pixels.  By default, there is no overlap.

              This option was new in Netpbm 10.23 (July 2004).


       -verbose
              Print information about the processing to Standard Error.




HISTORY
       pamdice was new in Netpbm 9.25 (March 2002).

       Before Netpbm 10.29 (August 2005), there was a limit of 100 slices in each direction.


SEE ALSO
       pamundice(1) , pamcut(1) , pnmcat(1) , pgmslice(1) , ppmglobe(1)

       pnm(5)

       pam(5)



netpbm documentation                                                                             1 April 2007                                                                          Pamdice User Manual(0)
