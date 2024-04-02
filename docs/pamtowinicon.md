Pamtowinicon User Manual(0)                                                                                                                                                       Pamtowinicon User Manual(0)



NAME
       pamtowinicon - convert Netpbm PAM images to a Microsoft Windows icon file


SYNOPSIS
       pamtowinicon [-pngthreshold=threshold] [-truetransparent] [-verbose] [pam_file]

       All options can be abbreviated to their shortest unique prefix.  You may use two hyphens instead of one to designate an option.  You may use either white space or equals signs between an option name
       and its value.


DESCRIPTION
       This program is part of Netpbm(1)

       pamtowinicon reads an RGB_ALPHA Netpbm PAM file and converts it to a Microsoft Windows icon file.

       The output goes to Standard Output.

       The input is a multi-image PAM file; each image becomes an icon in the output file.  If you have input images in multiple files, you can simply combine them with cat and  pass  the  result  to  pam-
       towinicon.



OPTIONS
       In  addition  to  the  options  common  to  all  programs based on libnetpbm (most notably -quiet, see Common Options ⟨index.html#commonoptions⟩ ), pamtowinicon recognizes the following command line
       options:



       -pngthreshold=threshold
              pamtowinicon encodes images with resolutions above or equal threshold by threshold as PNG by running pnmtopng(1) using the more traditional BMP format.

              When the program uses PNG encoding for a 5-channel PAM with separate AND mask (see below), it discards the AND mask.

              The default value for threshold is 128.


       -truetransparent
              Make all pixels outside the opaque area black, avoiding inversion and other effects on the background of the image (see WindowsIcons(1) ).


       -verbose
              Print more messages





IMAGES
       pamtowinicon reads a (multi-image) Netpbm PAM file as input and outputs an single Windows icon file containing those images.

       The images in the icon file are in the same order as in the PAM input.



   PAM Input
       pamtowinicon interprets the PAM images as follows, based on the number of channels.

       <TABLE  summary="Image  type  based  on  number  of  channels"  border=1   align="center">   <TR><TH>channels</TH><TH>image</TH></TR>   <TR><TD>1</TD><TD>fully   opaque   grayscale   image</TD></TR>
       <TR><TD>2</TD><TD>grayscale image with alpha channel</TD></TR> <TR><TD>3</TD><TD>fully opaque color image</TD></TR> <TR><TD>4</TD><TD>color image with alpha channel</TD></TR> <TR><TD>5</TD><TD>color
       image with alpha channel and additional AND mask</TD></TR> </TABLE>

       The tuple types of the PAMs are irrelevant.



   AND Mask
       The so-called &lsquo;AND mask&rsquo; is a special feature of Microsoft Windows icons.  It is required for all BMP encoded images.  At the first sight, the AND mask is a 1-bit alpha channel,  but  it
       is also used for e.g. shading the icon while dragging.  See WindowsIcons(1)
        for details.

       If  there  is no explicit AND mask, but transparency data in the input image, pamtowinicon sets the AND mask to opaque where the sample in the alpha channel is below maxval, and to transparent else-
       where.

       If no transparency data is present in the input image, pamtowinicon assumes the whole image to be fully opaque.



   BMP Output
       When BMP encoding an image, pamtowinicon tries to use the most compact BI_RGB format allowed for icon images with a color depth of eight bits per channel.

       pamtowinicon generates neither 16-bit BI_RGB nor BI_BITFIELDS BMP encoded images, even if the maxval of the input PAM is not 255.



SEE ALSO
       ·

              winicontopam(1)


       ·

              ppmtowinicon(1)


       ·

              pam(5)


       ·

              WindowsIcons(1)



       For information on the PNG format, see http://schaik.com/png ⟨http://schaik.com/png⟩ .



HISTORY
       pamtowinicon was new in Netpbm 10.63 (June 2013).  It obsoleted ppmtowinicon by providing more function and conforming better to Netpbm conventions.



AUTHOR
       Copyright (C) 2013 by Ludolf Holzheid.

       Translated to Netpbm coding style by Bryan Henderson.



netpbm documentation                                                                            12 April 2013                                                                     Pamtowinicon User Manual(0)
