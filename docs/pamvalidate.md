Pamvalidate User Manual(0)                                                                                                                                                         Pamvalidate User Manual(0)



NAME
       pamvalidate - validate Netpbm image format


SYNOPSIS
       pamvalidate



DESCRIPTION
       This program is part of Netpbm(1)

       pamvalidate  copies  a Netpbm image from Standard Input to Standard Output, except that if there are certain violations of the image format in the input, pamvalidate fails without producing any out-
       put.

       This is most useful in a pipeline, before a stage you don't want to start working on Netpbm input until it knows it can get all the way through it.  For example, assume you are converting PPM images
       to  PNG  and  you don't want to produce a partial PNG file under any circumstance.  If you just use pnmtopng, and the PPM input is truncated halfway through the raster, pnmtopng fails, but also pro-
       duces about half of a PNG file.  To prevent that, pass your PPM input through pamvalidate on its way to pnmtopng.  Then, pamvalidate will fail, and consequently the pipeline will fail,  before  pnm-
       topng has seen any input and therefore before pnmtopng has produced any output.

       These are the kinds of format violations pamvalidate detects:



       ·      A purported sample value exceeds the declared maxval.

       ·      The stream ends prematurely.


       This program works on multi-image streams, producing a corresponding output stream.

       See pamfix for a way to salvage an invalid Netpbm image stream.



OPTIONS
       None.



SEE ALSO
       pam(5)

       pnm(5)

       pamfix(1)




HISTORY
       pamvalidate was new in Netpbm 10.66 (March 2014).



netpbm documentation                                                                            22 March 2014                                                                      Pamvalidate User Manual(0)
