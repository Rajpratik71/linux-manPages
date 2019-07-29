Pgmmedian User Manual(0)                                                                                                                                                             Pgmmedian User Manual(0)



NAME
       pgmmedian - apply a median filter to a PGM file


SYNOPSIS
       pgmmedian

       [-width=n]

       [-height=n]

       [-type=median_type]

       [-cutoff=int]

       [pnmfile]

       Minimum  unique  abbreviation  of  option  is  acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.



DESCRIPTION
       This program is part of Netpbm(1)

       pgmmedian applies a median filter to a PGM image, using either the histogram sort or select kth value method to determine the median.

       A median filter is a convolution filter in which the value of a pixel in the output is the median of a certain set of pixels in the neighborhood of the corresponding input pixel.  The effect  is  to
       eliminate locally extreme values.  Such pixels typically show up as speckles.

       See the -type and -cutoff options for information on how pgmmedian chooses between the two methods.



OPTIONS
       -cutoff int
              This option provides the cutoff value that pgmmedian uses to decide between using the histogram sort or select kth value method to find the median.

              If  (maxval  /  ((width  *  height) - 1)), where maxval is the maxval of the image and width and height are the dimensions of the mask, is less than the cutoff value, pgmmedian uses histogram
              sort.  Otherwise, it uses kth value.

              This option has no effect if you specify -type.

              The default is 250


       -width=n
              Width of the median mask to apply.

              Default is 3.


       -height=n
              Height of the median mask to apply.

              Default is 3.


       -type median_type
              This option selects which method to use to find median regardless of cutoff value.  Choices are histogram_sort and select.

              By default, pgmmedian decides which method to use as described under the -cutoff option.




REFERENCES
       ·      'Collected Algorithms from ACM' Volume II, Algorithm 489 by Robert W. Floyd


       ·      'A Fast Two-Dimensional Median Filtering Algorithm' in 'IEEE Transactions on Acoustics, Speech, and Signal Processing' Vol. ASSP-27, No. 1, February 1979


       ·      'Digital Image Processing Algorithms' by Ioannis Pitas, Prentice Hall, 1993 ISBN 0-13-145814-0





SEE ALSO
       pgmnoise(1) , pamaddnoise(1) , pnmconvol(1) , pgmmorphconv(1) , pgm(5)



HISTORY
       pgmmedian was added to Netpbm in Version 10.29 (August 2005).  It had been distributed by Mike Burns via his own web site before that (and continued to be so).



AUTHOR
       Copyright (C) 1996 by Mike Burns <burns@cac.psu.edu>



netpbm documentation                                                                            28 August 2005                                                                       Pgmmedian User Manual(0)
