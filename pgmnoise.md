Pgmnoise User Manual(0)                                                                                                                                                               Pgmnoise User Manual(0)



NAME
       pgmnoise - create a PGM image made up of white noise


SYNOPSIS
       pgmnoise width height

       [-maxval=n] [-randomseed=integer]

       Minimum  unique  abbreviations  of  option are acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.



DESCRIPTION
       This program is part of Netpbm(1)

       pgmnoise creates a PGM image that is made up of pixels of random brightness.

       You specify the dimensions of the image with the width and height arguments.

       The randomness in the image is limited before Netpbm 10.37 (December 2006) -- if you run the program twice in the same second, you may get identical output.



OPTIONS
       -maxval=n
              The maxval of the generated image.

              Default is 255.

              This option was new in Netpbm 10.63 (June 2013).


       -randomseed=integer
              This is the seed for the random number generator that generates the pixels.

              Use this to ensure you get the same image on separate invocations.

              By default, pgmnoise uses a seed derived from the time of day and process ID, which gives you fairly uncorrelated results in multiple invocations.

              This option was new in Netpbm 10.45 (December 2008).




SEE ALSO
       pgm(5)



AUTHOR
       Copyright (C) 1993 by Frank Neumann



netpbm documentation                                                                             27 June 2013                                                                         Pgmnoise User Manual(0)
