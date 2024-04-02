Pamsummcol User Manual(0)                                                                                                                                                           Pamsummcol User Manual(0)



NAME
       pamsummcol - summarize (sum, average, etc) a Netpbm image by column


SYNOPSIS
       pamsummcol { -sum | -mean | -min | -max } [imagefile]

       All options can be abbreviated to their shortest unique prefix.  You may use two hyphens instead of one.  You may separate an option name and its value with white space instead of an equals sign.


DESCRIPTION
       This program is part of Netpbm(1)

       pamsummcol  reads a Netpbm image (PNM or PAM) and performs a summary function over all the rows in each column (sum, mean, etc.).  It produces an image of the same kind that the same width and depth
       as the input, and one row high.  Its sample values are the result of the summary.

       pamsummcol performs the summary operation on each plane independently.

       pamsummcol performs the operation on the actual sample values, not on the light intensities represented by them in the case that the image is a PGM or PPM image.

       If you want to summarize by row instead of by column, run the input through pamflip first (and if you want the output to be a single column instead of a single row, use pamflip again).

       If you want to summarize over the entire image (getting a one-tuple output image), use pamsumm to get a summary row, pamflip to turn that into a column, the pamsumm again to summarize the column.

       If you want to summarize the individual samples in an entire image, instead of by tuple, use pamsumm.

       pamsummcol performs the operation on the actual sample values, not on the light intensities represented by them in the case that the image is a PGM or PPM image  or  PAM  equivalent.   You  can  use
       pnmgamma to convert such an image to one with samples proportional to light intensity, and then use pamsummcol on the result.

       You can achieve the same thing as pamsummcol -mean with pamscale.  Just scale vertically to a single row, without scaling horizontally at all.  Use the pixel mixing method.



OPTIONS
       You must specify exactly one of -sum, -mean, -min, or -max.



       -sum

              This option makes the summary function addition.
                   In each column and plane of the output row, the sample value is the
                   sum of all the samples values in the same column and plane of the input.
                   If a result is greater than the image maxval, it is clipped to
                   the maxval.


       -mean

              This option makes the summary function arithmetic mean.
                   In each column and plane of the output row, the sample value is the
                   mean of all the samples values in the same column and plane of the input.


       -min

              This option makes the summary function arithmetic minimum.
                   In each column and plane of the output row, the sample value is the
                   minimum of all the samples values in the same column and plane of
                   the input.


       -max

              This option makes the summary function arithmetic maximum.
                   In each column and plane of the output row, the sample value is
                   the maximum of all the samples values in the same column and
                   plane of the input.




SEE ALSO
       pamsumm(1) , pamscale(1) , pamfunc(1) , pamarith(1) , pamscale(1) , pam(5) ,


HISTORY
       pamsummcol was added to Netpbm in Release 10.21 (March 2004).



netpbm documentation                                                                           25 January 2009                                                                      Pamsummcol User Manual(0)
