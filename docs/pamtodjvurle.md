Pamtodjvurle User Manual(0)                                                                                                                                                       Pamtodjvurle User Manual(0)



NAME
       pamtodjvurle - convert a Netpbm image to DjVu Color RLE format


SYNOPSIS
       pamtodjvurle

       [-transparent color] [netpbmfile [rlefile]]

       Minimum unique abbreviation of options in acceptable.


DESCRIPTION
       This program is part of Netpbm(1)

       pamtodjvurle reads a Netpbm image (PNM or PAM equivalent of PNM) as input and produces DjVu Color RLE format as output.


OPTIONS
       -transparent colorname
              This option indicates which color in the image should be considered transparent.

              Specify the color (color) as described for the argument of the ppm_parsecolor() library routine ⟨libppm.html#colorname⟩ .

              Default is 'white'.



SEE ALSO
       pbmtodjvurle(1)

       pam(5)



HISTORY
       pamtodjvurle  was  new  in  Netpbm  10.22 (April 2004) but a program that did almost the same thing, called ppmtodjvurle, was in Netpbm 10.21 (March 2004).  The latter was written and contributed to
       Netpbm by Scott Pakin <scott+pbm@pakin.org>.  pamtodjvurle uses techniques taken from ppmtodjvurle, but no code is copied between them.



netpbm documentation                                                                            10 April 2004                                                                     Pamtodjvurle User Manual(0)
