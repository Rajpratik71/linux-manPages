Pnmmontage User Manual(0)                                                                                                                                                           Pnmmontage User Manual(0)



NAME
       pnmmontage - create a montage of PNM images


SYNOPSIS
       pnmmontage

       [-header=headerfile]

       [-quality=n]

       [-prefix=prefix]

       [-0|-1|-2|...|-9]

       [-data=filename]

       pnmfile...


DESCRIPTION
       This program is part of Netpbm(1)

       pnmmontage packs images of differing sizes into a minimum-area composite image.

       Areas of the output that cannot be occupied by an image are black.



OPTIONS
       -data=filename
              This option causes pnmmontage to write a file that describes in machine-readable form the positions of the original images within the packed image.  Here is an example:

                          :0:0:227:298
                          ../image1.ppm:0:0:227:149
                          ../image2.ppm:0:149:227:149

              There is a line for each component image and one for the composite.

              The 5 fields on each line are:



       ·      source image name (or null string indicating the line for the composite image)

       ·      Column number of upper left corner of the image

       ·      Row number of upper left corner of the image

       ·      width of the image (columns)

       ·      height of the image (rows)


              This option was new in Netpbm 10.6 (July 2002).


       -header=filename
              Tells  pnmmontage  to  write  a C header file of the locations of the original images within the packed image.  Each original image generates four #defines within the packed file: xxxX, xxxY,
              xxxSZX, and xxxSZY, where xxx is the name of the file, converted to all uppercase.  The output also includes #defines OVERALLX and OVERALLY, which specifies the  total  size  of  the  montage
              image.

              Here is an example:

                          #define OVERALLX 227
                          #define OVERALLY 298

                          #define X 0
                          #define Y 0
                          #define SZX 227
                          #define SZY 149

                          #define X 0
                          #define Y 149
                          #define SZX 227
                          #define SZY 149


       -prefix
              Tells pnmmontage to use the specified prefix on all of the #defines it generates.


       -quality
              Before  attempting  to  place the subimages, pnmmontage will calculate a minimum possible area for the montage; this is either the total of the areas of all the subimages, or the width of the
              widest subimage times the height of the tallest subimage, whichever is greater.  pnmmontage then initiates a problem-space search to find the best packing; if it finds a solution that is  (at
              least)  as good as the minimum area times the quality as a percent, it will break out of the search.  Thus, -quality=100 will find the best possible solution; however, it may take a very long
              time to do so.  The default is -quality=200.


       -0, -1, ... -9
              These options control the quality at a higher level than -quality; -0 is the worst quality (pick the first solution found), while -9 is the best quality (perform an exhaustive search of prob-
              lem space for the absolute best packing).  The higher the number, the slower the computation.  The default is -5.





NOTES
       Using -9 is very slow on all but the smallest image sets.

       The  minimum  area  arrangement  is  often not a convenient shape.  For example, it might be a tall, thin column of images, when you'd rather have something more square.  To force a minimum width or
       height, you can include a strut image - a black image that wide and one pixel high.  Similarly, you can use a vertical strut to force a minimum height.



SEE ALSO
       pnmcat(1) , pnmindex(1) , pnm(5) , pam(5) , pbm(5) , pgm(5) , ppm(5)



HISTORY
       pnmmontage was new in Netpbm 9.10 (January 2001).



AUTHOR
       Copyright (C) 2000 by Ben Olmstead.



netpbm documentation                                                                           22 November 2012                                                                     Pnmmontage User Manual(0)
