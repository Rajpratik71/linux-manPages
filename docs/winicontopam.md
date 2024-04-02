Winicontopam User Manual(0)                                                                                                                                                       Winicontopam User Manual(0)



NAME
       winicontopam - convert a Microsoft Windows icon file into a Netpbm PAM file



SYNOPSIS
       winicontopam [-image=index | -allimages] [-andmasks] [-verbose] [icon_file]

       All options can be abbreviated to their shortest unique prefix.  You may use two hyphens instead of one to designate an option.  You may use either white space or equals signs between an option name
       and its value.


DESCRIPTION
       This program is part of Netpbm(1)

       winicontopam reads a Microsoft Windows icon file and converts it to one or more RGB_ALPHA Netpbm PAM files.

       The alpha channel is copied from the 8-bit transparency data from the icon, if present.  If no 8-bit transparency data is available, the alpha channel is constructed from  the  so-called  &lsquo;AND
       mask&rsquo;.

       The output goes to Standard Output.

       The output is a multi-image PAM file.  If you want a separate file for each image, use pamsplit(1)



OPTIONS
       In  addition  to  the  options  common  to  all  programs based on libnetpbm (most notably -quiet, see Common Options ⟨index.html#commonoptions⟩ ), winicontopam recognizes the following command line
       options:




       -allimages
              Convert all images in the input.

              You may not specify this together with -image.

              By default, winicontopam converts only the one &lsquo;best quality&rsquo; image (largest, then most bits per pixel).


       -image=index
              Convert image number index (starting with zero).

              You may not specify this together with -allimages.

              By default, winicontopam converts the &lsquo;best quality&rsquo; image (largest, then most bits per pixel).


       -andmasks
              If the image to be extracted contains both 8-bit transparency data and AND mask, write a five-channel Netpbm PAM file with the AND mask stored to the fifth plane.


       -verbose
              Print more messages





SEE ALSO
       ·

              pamtowinicon(1)


       ·

              winicontoppm(1)


       ·

              pamsplit(1)


       ·

              pam(5)


       ·

              winicon(1)



       For information on the PNG format, see http://schaik.com/png ⟨http://schaik.com/png⟩ .



HISTORY
       winicontopam was new in Netpbm 10.63 (June 2013).  It obsoleted winicontoppm by providing more function and conforming better to Netpbm conventions.



AUTHOR
       Copyright (C) 2013 by Ludolf Holzheid.

       Translated to Netpbm coding style by Bryan Henderson.



netpbm documentation                                                                            12 April 2013                                                                     Winicontopam User Manual(0)
