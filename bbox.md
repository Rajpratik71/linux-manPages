BBOX(1)                                                                                   PS2EPS                                                                                  BBOX(1)

NAME
       bbox - prints out the bounding box of a rawppm or rawpbm image

SYNOPSIS
       bbox [-l] [-r] [-h] [-V] [rawpbmfile]

DESCRIPTION
       bbox reads a rawppm or rawpbm file and prints out the bounding box of the image (as postscript comment and in postscript points, i.e. 1/72dpi) as well as the high resolution
       bounding box. Input is read from standard input if no filename is specified. Example output:

                  %%BoundingBox: 12 253 829 837
                  %%HiResBoundingBox: 12.500000 253.000000 828.500000 837.00000

       bbox has only very limited memory requirements as it reads the input line by line and thus needs to store only one picture line in memory.

OPTIONS
       -h | --help
           Show summary of options.

       -V
           Show version of program.

       -r
           resolution of picture in dpi

       -l
           loose bounding box (integer bounding box is expanded by 1 point, hires bounding box is expanded by 0.5 points)

SEE ALSO
       ps2eps (1)

AUTHOR
       bbox was written by Roland Bless.

   ACKNOWLEDGMENTS
       Special thanks goes to Michael Sharpe from UCSD who suggested a lot of improvements for bbox to become more precise and robust, especially for small drawings.

       An earlier version of this manual page was originally written by Rafael Laboissiere <rafael@debian.org> for the Debian system. Thank you Rafael! Permission is granted to copy,
       distribute and/or modify this document under the terms of the GNU Free Documentation License, Version 1.1 or any later version published by the Free Software Foundation; with no
       Invariant Sections, no Front-Cover Texts and no Back-Cover Texts.

BUGS
       Though the code is quite small and the probability for bugs is now small, there may be some left somewhere between the lines. In case you find one, please send a short
       description with bbox version number to <roland@bless.de> (please allow some time to reply).

AUTHOR
       Roland Bless
           Author.

COPYRIGHT
       Copyright © 2003 Roland Bless

PS2EPS 1.68                                                                          January 22, 2004                                                                             BBOX(1)
