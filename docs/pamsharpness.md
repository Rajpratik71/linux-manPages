Pamsharpness User Manual(0)                                                                                                                                                       Pamsharpness User Manual(0)



NAME
       pamsharpness - measure the sharpness of a PNM/PAM image


SYNOPSIS
       pamsharpness [imagefile]


DESCRIPTION
       This program is part of Netpbm(1)

       pamsharpness reads a Netpbm image (PNM or PAM) and prints a message to Standard Output giving a number that tells how sharp it is.

       Sharpness  is  a  measure of how suddenly (in space) colors change in the image.  pamsharpness computes the sharpness of the image as the average difference in intensity between each pixel and its 8
       surrounding pixels, in each of the color components (R, G, B).

       pamsharpness does not include the edges of the image, where there are not 8 pixels surrounding a pixel, in its computation.

       pamsharpness assumes that the image is a PNM or PNM equivalent PAM.  If it isn't, the results are not necessarily meaningful.


SEE ALSO
       pamsharpmap(1) , pammasksharpen(1) , pam(5) , pnm(5)



HISTORY
       pamsharpness was added to Netpbm in Release 10.21 (March 2004).  Bryan Henderson derived it from the program pnmsharp by B.W. van Schooten and distributed as part of the Photopnmtools package.



netpbm documentation                                                                           07 February 2004                                                                   Pamsharpness User Manual(0)
