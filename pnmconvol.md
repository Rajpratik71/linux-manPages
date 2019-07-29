Pnmconvol User Manual(0)                                                                                                                                                             Pnmconvol User Manual(0)



NAME
       pnmconvol - general MxN convolution on a Netpbm image


SYNOPSIS
       pnmconvol { -matrix=convolution_matrix | -matrixfile=filename[,filename[, ...]]  } [netpbmfile]

       pnmconvol convolution_matrix_file [-normalize] [-nooffset] [netpbmfile]

       Minimum  unique  abbreviation  of  option  is  acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.



DESCRIPTION
       This program is part of Netpbm(1)

       pnmconvol reads a Netpbm image as input, convolves it with a specified convolution matrix, and writes a Netpbm image as output.

       Convolution means replacing each pixel with a weighted average of the nearby pixels.  The weights and the area to average are determined by the convolution matrix  (sometimes  called  a  convolution
       kernel), which you supply in one of several ways.  See
        Convolution Matrix ⟨#convolutionmatrix⟩ .

       At the edges of the convolved image, where the convolution matrix would extend over the edge of the image, pnmconvol just copies the input pixels directly to the output.

       The  convolution  computation  can  result  in a value which is outside the range representable in the output.  When that happens, pnmconvol just clips the output, which means brightness is not con-
       served.



   Convolution Matrix
       There are three ways to specify the convolution matrix:



       ·      directly with a -matrix option.


       ·      In a file (or set of them) named by a -matrixfile option, whose contents are similar to a -matrix option value.


       ·      With a special PNM file.


       The PNM file option is the hardest, and exists only because until Netpbm 10.49 (December 2009), it was the only way.

       The regular convolution matrix file is slightly easier to read than the -matrix option value, and makes your command line less messy, but requires you to manage a separate file.  With the file,  you
       can have separate convolution matrices for the individual color components, which you can't do with -matrix.

       In any case, the convolution matrix pnmconvol uses is a matrix of real numbers.  They can be whole or fractional, positive, negative, or zero.

       The  convolution  matrix  always  has  an odd width and height, so that there is a center element.  pnmconvol figuratively places that center element over a pixel of the input image and weights that
       pixel and its neighbors as indicated by the convolution matrix to produce the pixel in the same location of the output image.

       For a normal convolution, where you're neither adding nor subtracting total value from the image, but merely moving it around, you'll want to make sure that all the numbers in the matrix add  up  to
       1.  If they don't, pnmconvol warns you.

       The  elements  of the matrix are actually tuples, one for each sample in the input.  (I.e. if the input is an RGB image, each element of the convolution matrix has one weight for red, one for green,
       and one for blue.


       Directly On the Command Line

       An example of a -matrix option is

           -matrix=0,.2,0;.2,.2,.2;0,.2,0

       The value consists of each row of the matrix from top to bottom, separated by semicolons.  Each row consists of the elements of the row from left to right, separated by commas.  You must  of  course
       have the same number of elements in each row.  Each element is a decimal floating point number and is the weight to give to each component of a pixel that corresponds to that matrix location.

       Note that when you supply this option via a shell, semicolon (';') probably means something to the shell, so use quotation marks.

       There is no way with this method to have different weights for different components of a pixel.

       The  -normalize  option  is often quite handy with -matrix because it lets you quickly throw together the command without working out the math to make sure the matrix isn't biased.  Note that if you
       use the -normalize option, the weights in the matrix aren't actually the numbers you specify in the -matrix option.


       Regular Matrix File

       Specify the name of the matrix file with a -matrixfile option.  Or specify a list of them, one for each plane of the image.

       Examples:

           -matrixfile=mymatrix

           -matrixfile=myred,mygreen,myblue

       Each file applies to one plane of the image (e.g. red, green, or blue), in order.  The matrix in each file must have the same dimensions.  If the input image has more planes than the number of files
       you specify, the first file applies to the extra planes as well.

       pnmconvol interprets the file as text, with lines delimited by Unix newline characters (line feeds).

       Each line of the file is one row of the matrix, in order from top to bottom.

       For  each  row,  the  file  contains  a floating point decimal number for each element in the row, from left to right, separated by spaces.  This is not just any old white space -- it is exactly one
       space.  Two spaces in a row mean you've specified a null string for an element (which is invalid).  If you want to line up your matrix visually, use leading and trailing zeroes in the floating point
       numbers to do it.

       There is no way to put comments in the file.  There is no signature or any other metadata in the file.

       Note that if you use the -normalize option, the weights in the matrix aren't actually what is in the file.


       PNM File

       Before Netpbm 10.49 (December 2009), this was the only way to specify a convolution matrix.  pnmconvol used this method in an attempt to exploit the generic matrix processing capabilities of Netpbm,
       but as the Netpbm formats don't directly allow matrices with the kinds of numbers you need in a convolution matrix, it is quite cumbersome.  In fact, there simply is no way to specify some  convolu-
       tion  matrices with a legal Netpbm image, so make it work, pnmconvol has to relax the Netpbm file requirement that sample values be no greater than the image's maxval.  I.e. it isn't even a real PNM
       file.

       The way you select this method of supplying the convolution matrix is to not specify -matrix or -matrixfile.  When you do that, you must specify a second non-option argument -- that is the  name  of
       the PNM file (or PNM equivalent PAM file).

       There are two ways pnmconvol interprets the PNM convolution matrix image pixels as weights: with offsets, and without offsets.

       The  simpler  of the two is without offsets.  That is what happens when you specify the -nooffset option.  In that case, pnmconvol simply normalizes the sample values in the PNM image by dividing by
       the maxval.

       For example, here is a sample convolution file that causes an output pixel to be a simple average of its corresponding input pixel and its 8 neighbors, resulting in a smoothed image:

           P2
           3 3
           18
           2 2 2
           2 2 2
           2 2 2

       (Note that the above text is an actual PGM file -- you can cut and paste it.  If you're not familiar with the plain PGM format, see thePGMformatspecification(5) ).

       pnmconvol divides each of the sample values (2) by the maxval (18) so the weight of each of the 9 input pixels gets is 1/9, which is exactly what you want to keep the overall brightness of the image
       the same.  pnmconvol creates an output pixel by multiplying the values of each of 9 pixels by 1/9 and adding.

       Note that with maxval 18, the range of possible values is 0 to 18.  After scaling, the range is 0 to 1.

       For  a normal convolution, where you're neither adding nor subtracting total value from the image, but merely moving it around, you'll want to make sure that all the scaled values in (each plane of)
       your convolution PNM add up to 1, which means all the actual sample values add up to the maxval.

       When you don't specify -nooffset, pnmconvol applies an offset, the purpose of which is to allow you to indicate negative weights even though PNM sample values are never negative.  In this case, pnm-
       convol  subtracts  half  the  maxval  from each sample and then normalizes by dividing by half the maxval.  So to get the same result as we did above with -nooffset, the convolution matrix PNM image
       would have to look like this:

           P2
           3 3
           18
           10 10 10
           10 10 10
           10 10 10

       To see how this works, do the above-mentioned offset: 10 - 18/2 gives 1.  The normalization step divides by 18/2 = 9, which makes it 1/9 - exactly what you  want.   The  equivalent  matrix  for  5x5
       smoothing would have maxval 50 and be filled with 26.

       Note that with maxval 18, the range of possible values is 0 to 18.  After offset, that's -9 to 9, and after normalizing, the range is -1 to 1.

       The  convolution file will usually be a PGM, so that the same convolution gets applied to each color component.  However, if you want to use a PPM and do a different convolution to different colors,
       you can certainly do that.



   Other Forms of Convolution
       pnmconvol does only arithmetic, linear combination convolution.  There are other forms of convolution that are especially useful in image processing.

       pgmmedian does median filtering, which is a form of convolution where the output pixel value, rather than being a linear combination of the pixels in the window, is the median of a certain subset of
       them.

       pgmmorphconv does dilation and erosion, which is like the median filter but the output value is the minimum or maximum of the values in the window.



OPTIONS
       -matrix=convolution_matrix
              The value of the convolution matrix.  See Convolution Matrix ⟨#matrixopt⟩ .

              You may not specify both this and -matrixfile.

              This option was new in Netpbm 10.49 (December 2009).  Before that, use a PNM file for the convolution matrix.


       -matrixfile=filename
              This specifies that you are supplying the convolution matrix in a file and names that file.  See Convolution Matrix ⟨#matrixfile⟩ .

              You may not specify both this and -matrix.

              This option was new in Netpbm 10.49 (December 2009).  Before that, use a PNM file for the convolution matrix.


       -normalize
              This  option says to adjust the weights in your convolution matrix so they all add up to one.  You usually want them to add up to one so that the convolved result tends to have the same over-
              all brightness as the input.  With -normalize, pnmconvol scales all the weights by the same factor to make the sum one.  It does this for each plane.

              This can be quite convenient because you can just throw numbers into the matrix that have roughly the right relationship to each other and let pnmconvol do the work of normalizing them.   And
              you can adjust a matrix by raising or lowering certain weights without having to modify all the other weights to maintain normalcy.  And you can use friendly integers.

              Example:

                  $ pnmconvol myimage.ppm -normalize -matrix=1,1,1;1,1,1;1,1,1

              This is of course a basic 3x3 average, but without you having to specify 1/9 (.1111111) for each weight.

              This option has no effect when you specify the convolution matrix via pseudo-PNM file.

              This option was new in Netpbm 10.50 (March 2010).


       -nooffset=
              This is part of the obsolete PNM image method of specifying the convolution matrix.  See Convolution Matrix ⟨#matrixpnm⟩ .




HISTORY
       The -nooffset option was new in Netpbm 10.23 (July 2004), making it substantially easier to specify a convolution matrix, but still hard.  In Netpbm 10.49 (December 2009), the PNM convolution matrix
       tyranny was finally ended with the -matrix and -matrixfile options.  In between, pnmconvol was broken for a while because the Netpbm library started enforcing the requirement that a sample value not
       exceed  the  maxval of the image.  pnmconvol used the Netpbm library to read the PNM convolution matrix file, but in the pseudo-PNM format that pnmconvol uses, a sample value sometimes has to exceed
       the maxval.



SEE ALSO
       pnmsmooth(1) , pgmmorphconv(1) , pgmmedian(1) , pnmnlfilt(1) , pgmkernel(1) , pamgauss(1) , pammasksharpen(1) , pnm(5)



AUTHORS
       Copyright (C) 1989, 1991 by Jef Poskanzer.  Modified 26 November 1994 by Mike Burns, burns@chem.psu.edu



netpbm documentation                                                                           03 January 2010                                                                       Pnmconvol User Manual(0)
