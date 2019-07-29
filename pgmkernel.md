Pgmkernel User Manual(0)                                                                                                                                                             Pgmkernel User Manual(0)



Table Contents ⟨#index⟩


NAME
       pgmkernel - generate a convolution kernel


SYNOPSIS
       pgmkernel [-weight=number] [-maxval=] {size | width height}

       Minimum  unique  abbreviation  of  option  is  acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.



DESCRIPTION
       This program is part of Netpbm(1)

       pgmkernel generates a convolution kernel that you can use with pnmconvol.  The kernel is one where the weight of each location is inversely proportional to its distance from the center of  the  ker-
       nel.

       pgmkernel generates a PGM image of width and height size if you specify one argument, or width width and height height if you specify two arguments.

       pgmkernel computes the convolution function K as follows.

              K(i,j) = 1 / ( 1 + w * sqrt(i^2 + j^2))

       where w is a coefficient specified via the -weight option.  i and j are measured in pixels.  K is zero everywhere beyond the specified kernel width and height.

       The sample values in the PGM output have this value scaled and biased using the protocol pnmconvol specifies for representing the real numbers K in PGM.



OPTIONS
       -weight=number
              The distance from the center is weighted by this; a higher number means the value falls off more quickly as you go away from the center.

              This must be a positive real number.

              The default is 6.0.


       -maxval=maxval
              The maxval for the PGM kernel.

              Default is 255.

              This option was new in Netpbm 10.65 (December 2013).  Before that, the maxval is always 255.





LIMITATIONS
       The computation time is proportional to width*height.  This increases rapidly with the increase of the kernel size.  A better approach could be using a FFT in these cases.


HISTORY
       Before Netpbm 10.65 (December 2013), the output was always in Plain (text) PGM format.  (Now, like standard Netpbm programs, the default is raw PGM and you can get Plain PGM with a -plain option).

       Before  Netpbm  10.65  (December  2013),  this manual said negative values for -weight were valid (as long as they were greater than -1.0).  But the program never worked with negative numbers and it
       isn't clear that the result would be useful, so -weight is now required to be nonnegative and the program fails gracefully if you specify a negative value.


SEE ALSO
       pnmconvol(1) , pnmsmooth(1)

       pamgauss(1)

       pgm(5)




AUTHOR
       Alberto Accomazzi (alberto@cfa.harvard.edu).



netpbm documentation                                                                           19 December 2013                                                                      Pgmkernel User Manual(0)
