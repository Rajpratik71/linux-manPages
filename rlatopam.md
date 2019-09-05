Rlatopam User Manual(0)                                                                                                                                                               Rlatopam User Manual(0)



NAME
       rlatopam - convert Alias/Wavefront RLA and RPF image files to PAM image files.


SYNOPSIS
       rlatopam

       [rlafile]


DESCRIPTION
       This program is part of Netpbm(1)

       rlatopam converts an Alias RLA (run-length encoded type A) or RPF (rich pixel format) image to a PAM image file.  The output PAM file can be grayscale or RGB, with or without an alpha channel.

       rlafile is the file name of the input file.  If you omit this parameter, rlatopam reads the image from Standard Input.

       There is no program in Netpbm that converts the other direction.x


SEE ALSO
       pam(5)



HISTORY
       rlatopam was new in Netpbm 10.32 (February 2006).


AUTHOR
       Simon Walton Matte World Digital



netpbm documentation                                                                           13 January 2006                                                                        Rlatopam User Manual(0)
