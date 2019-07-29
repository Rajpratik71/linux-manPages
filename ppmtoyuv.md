Ppmtoyuv User Manual(0)                                                                                                                                                               Ppmtoyuv User Manual(0)



NAME
       ppmtoyuv - convert a PPM image to an Abekas YUV file


SYNOPSIS
       ppmtoyuv [ppmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       ppmtoyuv reads a PPM image as input and produces an Abekas YUV file as output.

       The  output  file contains a raster of four byte YUV codes, each uniquely associated with two side-by-side pixels in the image.  The raster contains rows in order from top to bottom, and within each
       row columns from left to right.  So the output file size in bytes is twice the number of pixels in the image.

       Each YUV code is associated with two pixels from the input image that we will call the left pixel and the right pixel.  The 2nd byte of the code is the Y value of the left pixel.  The  4th  byte  of
       the  code  is the Y value of the right pixel.  The 1st byte of the code is an average of the U value of the pixel to the left of the left pixel, the left pixel, and the right pixel.  The 3rd byte of
       the code is analogous for V values.  These averages are weighted arithmetic means where the left pixel is weighted double what the other two pixels are weighted.

       This format is reminiscent of but rather different from the common YUV 4:2:0 format (aka YUV 420) and the similar YUV 4:4:4, YUV 4:2:2, YUV 4:1:1, YUV 4:1:1s, and  YUV  4:1:0.   In  YUV  4:2:0,  the
       raster  is  different  for  even numbered lines and odd numbered lines.  On even numbered lines, there are twice as many bits for Y of each pixel as for U or V.  On odd numbered lines, there are the
       same number of bits for Y as on even numbered lines, but no bits at all for U and V.

       Another YUV-based format is YUV4MPEG2, which is a movie format normally used with MJPEGTools ⟨http://mjpeg.sourceforge.net⟩ .  Netpbm does not have converters for this format, but MJPEGTools does.


SEE ALSO
       yuvtoppm(1) , ppmtoeyuv(1) , ppmtoyuvsplit(1) , ppm(5) , pnmtoy4m ⟨http://mjpeg.sourceforge.net⟩ , y4mtopnm ⟨http://mjpeg.sourceforge.net⟩



AUTHOR
       Marc Boucher marc@PostImage.COM, based on Example Conversion Program, A60/A64 Digital Video Interface Manual, page 69.

       Copyright (C) 1991 by DHD PostImage Inc.

       Copyright (C) 1987 by Abekas Video Systems Inc.



netpbm documentation                                                                             06 June 2005                                                                         Ppmtoyuv User Manual(0)
