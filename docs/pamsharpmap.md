Pamsharpmap User Manual(0)                                                                                                                                                         Pamsharpmap User Manual(0)



NAME
       pamsharpmap - create map of sharpness in a PNM/PAM image


SYNOPSIS
       pamsharpmap [imagefile]


DESCRIPTION
       This program is part of Netpbm(1)

       pamsharpmap reads a Netpbm image (PNM or PAM) and produces an image that shows how sharp it is at each location.

       Sharpness is a measure of how suddenly (in space) colors change in the image.  pamsharpmap computes the sharpness of each component color (R, G, B) separately and produces a pixel whose intensity of
       each component color is directly proportional to the sharpness of that component color at the same location in the input image.  Thus, at a point where the image is very sharp in its red  and  green
       components, but dull in its blue component, you will see a yellow pixel in the output.

       pamsharpmap computes sharpness at a point simply as the average difference in intensity between the pixel at that point and the 8 pixels surrounding it.

       At the edges of the image, where there are not 8 pixels surrounding a pixel, pamsharpmap assumes the image is extended with a black border.

       pamsharpmap assumes that the image is a PNM or PNM equivalent PAM.  If it isn't, the results are not necessarily meaningful.

       The output image is the same dimensions, depth, and tuple type as the input, and has maxval 255.


SEE ALSO
       pamsharpness(1) , pammasksharpen(1) , pamedge(1) , pam(5) , pnm(5)



HISTORY
       pamsharpmap was added to Netpbm in Release 10.21 (March 2004).  Bryan Henderson derived it from the program pnmsharp by B.W. van Schooten and distributed as part of the Photopnmtools package.



netpbm documentation                                                                           07 February 2004                                                                    Pamsharpmap User Manual(0)
