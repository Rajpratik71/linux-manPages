Pnmsmooth User Manual(0)                                                                                                                                                             Pnmsmooth User Manual(0)



NAME
       pnmsmooth - smooth out an image


SYNOPSIS
       pnmsmooth [-width=cols] [-height=rows] [pnmfile] [-size]

       Minimum  unique  abbreviations  of  options is acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.


DESCRIPTION
       This program is part of Netpbm(1)

       pnmsmooth smoothes out an image by replacing each pixel with the average of its width X height neighbors.  It is implemented as a progam  that  invokes  pnmconvol  with  an  appropriate  convolution
       matrix.


OPTIONS
       -width=cols

       -height=rows
              These options specify the dimensions of the convolution matrix.  Default dimensions are 3 wide and 3 high.

              Before  Netpbm  10.49 (December 2009), the maximum size of the convolution matrix is limited by the maxval of the image such that width * height * 2 must not exceed the maxval.  (use pamdepth
              to increase the maxval if necessary).

              These options were new in Netpbm 10.32 (February 2006).  Before that, use -size.


       -size  This deprecated option exists in current Netpbm for backward compatibility.  It was obsoleted by -width and -height in Netpbm 10.32 (February 2006).

              When you use this option, the first two program arguments are the width and height, respectively, of the convolution matrix and do the same thing as the -width and -height option values.  The
              third (optional) program argument is the input file name.

              In  reality,  in old pnmsmooth, the width and height are two values of the -size option, but the modern Netpbm command syntax paradigm doesn't allow an option with multiple values, so instead
              -size is an option with no value and width and height are program arguments.  That has the fortunate effect of making the following command mean the  same  in  current  pnmsmooth  as  in  old
              pnmsmooth:
                   pnmsmooth -size 5 5 infile.ppm >outfile.ppm


       -dump=dumpfile
              This options makes pnmsmooth only show you the convolution matrix.  It writes to Standard Output a pnmconvol -matrix option value that represents the matrix.  It does not invoke pnmconvol and
              does not produce an output image.

              Before Netpbm 10.49 (December 2009), this option is rather different.  It takes a file name as a value, and it writes to that file the convolution matrix as a PGM file (as used to be the nor-
              mal input for pnmconvol).






SEE ALSO
       pnmconvol(1) , pnm(5)



HISTORY
       Before  Netpbm 10.32 (February 2006), pnmsmooth did not use the modern Netpbm command line parser, so had an unconventional command line syntax.  Most importantly, you could not use an equal sign or
       double hyphens in the options.

       Before Netpbm 10.49 (December 2009), there was a -dump option.  This strange option caused pnmsmooth not to do any smoothing or produce any output image but instead write the convolution  matrix  it
       would have used, as PGM file such as pnmconvol used to use, to a file you specify.  The idea was you could then use that file with a separate invocation of pnmconvol.

       Then,  in Netpbm 10.49, there was a rather different -dump option with a similar purpose: It caused pnmsmooth to write to Standard Error a string suitable as a value for the pnmconvol -matrix option
       (an option that was new in Netpbm 10.49).

       But in Netpbm 10.51 (June 2010), pnmconvol started using the even newer pnmconvol -normalize option (new in 10.50), which made specifying the convolution  matrix  for  the  kind  of  smoothing  that
       pnmsmooth does trivial, so -dump disappeared from pnmsmooth.

       (There  were  also ease of implementation issues that kept us from simply keeping the original -dump around for backward compatibility: As we modified pnmsmooth to take advantage of the new features
       of pnmconvol, which pnmsmooth uses internally, the information needed to implement -dump was no longer available in the program).



netpbm documentation                                                                           19 December 2009                                                                      Pnmsmooth User Manual(0)
