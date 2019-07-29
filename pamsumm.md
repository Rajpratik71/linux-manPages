Pamsumm User Manual(0)                                                                                                                                                                 Pamsumm User Manual(0)



NAME
       pamsumm - Summarize the samples in a Netpbm image arithmetically


SYNOPSIS
       pamsumm { -sum | -mean | -min | -max } [-normalize] [-brief] [imagefile]

       All options can be abbreviated to their shortest unique prefix.  You may use two hyphens instead of one.  You may separate an option name and its value with white space instead of an equals sign.


DESCRIPTION
       This program is part of Netpbm(1)

       pamsumm reads a Netpbm image (PNM or PAM) and performs a summary function over all the samples in all the rows, columns, and planes and prints the result to Standard Output.

       pamsumm  performs  the operation on the actual sample values.  In the case of a PGM or PPM or PAM equivalent (i.e. a visual image), this is not the same as the light intensities represented by those
       samples.  See the format specifications of PGM(5) , PPM(5) , and PAM(5) , for the precise meanings of samples in these formats.  If you want to do arithmetic on light intensities of  such  a  visual
       image, you can use pnmgamma to convert it to one with samples proportional to light intensity, and then use pamsumm on the result.

       If  you  want  to summarize by column (e.g. add up the columns separately), use pamsummcol.  If you want to summarize by row, use a combination of pamsummcol and pamflip.  If you want to summarize a
       particular plane, use pamchannel to extract it and then pamsumm.



OPTIONS
       You must specify exactly one of -sum, -mean, -min, or -max.



       -sum

              This option makes the summary function addition.


       -mean

              This option makes the summary function arithmetic mean.


       -min

              This option makes the summary function arithmetic minimum.


       -max

              This option makes the summary function arithmetic maximum.


       -normalize

              This option causes each sample to be normalized to a fraction
                   (in the range 0..1) so the result is independent of the image's
                   maxval.  E.g. if you request the mean of an image which has maxval
                   200 and all the samples have value 50, pamsumm will give you
                   50 as an answer.  But pamsumm -normalize will give you .25.

              If instead you want a result that is independent of maxval but still
                   in integers, you can use pamdepth to convert the input to some
                   standard maxval and not use -normalize.  For example, if you want
                   the mean brightness of a PPM image, on a scale of 0 to 99, do

                  pamdepth 99 myimage.ppm | pamsumm -mean

              This option was new in Netpbm 10.22 (April 2004)


       -brief

              This option causes pamsumm to display the answer as a bare
                   number, rather than in a complete sentence.

              This option was new in Netpbm 10.22 (April 2004)




SEE ALSO
       pamsumm(1) , pam(5) ,


HISTORY
       pamsumm was added to Netpbm in Release 10.21 (March 2004).



netpbm documentation                                                                           26 October 2012                                                                         Pamsumm User Manual(0)
