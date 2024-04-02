Pamtopam User Manual(0)                                                                                                                                                               Pamtopam User Manual(0)



NAME
       pamtopam - copy PAM image


SYNOPSIS
       pamtopam


DESCRIPTION
       This program is part of Netpbm(1)

       pamtopam  simply  copies a PAM image from Standard Input to Standard Output.  This may seem an unnecessary duplication of cat, but remember that a PAM program can read a PBM, PGM, or PPM image as if
       it were PAM.  So pamtopam can read either a PBM, PGM, PPM, or PAM image and produce a PAM image as output.

       Even that is of limited usefulness because of the fact that almost any program to which you would feed the resulting PAM image could also just take the original image directly.   However,  sometimes
       you really want a true PAM image.

       You can do a more general job of translating PAM/PNM to PAM with pamchannel.



SEE ALSO
       pamtopnm(1) , ppmtoppm(1) , pgmtopgm(1) , pam(5) , pnm(5) , ppm(5) , pgm(5) , pbm(5)



HISTORY
       This program was added to Netpbm in Release 10.41 (December 2007).



netpbm documentation                                                                             October 2007                                                                         Pamtopam User Manual(0)
