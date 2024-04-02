Pamrgbtopng User Manual(0)                                                                                                                                                         Pamrgbtopng User Manual(0)



NAME
       pamrgbatopng - convert PAM color/transparency image to PNG


SYNOPSIS
       pamrgbatopng [pamfile]

       Minimum  unique  abbreviation  of  option  is  acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.


DESCRIPTION
       This program is part of Netpbm(1)

       pamrgbatopng reads a PAM image with the RGB_ALPHA tuple type (a color visual image with transparency) and produces an equivalent PNG image as output.

       The input image if from the file named by the pamfile argument, or Standard Input if you don't specify pamfile.  The output goes to Standard Output.

       The maxval of the input image must be 255.  You can use pamdepth to change the maxval of an image to 255 if necessary.

       pnmtopng(1)
        is a much more powerful program for generating PNG images from Netpbm images, but it cannot take PAM images with transparency as input.  To supply transparency information, you must supply it in  a
       separate PGM image.  That makes it considerably less convenient to use.

       (But note that pnmtopng takes PAM images, even with RGB_ALPHA tuple type just fine -- it just ignores the alpha plane).

       Netpbm's strategic direction is to add to pnmtopng all the capabilities of pamrgbatopng and retire pamrgbatopng.  But there's no telling when that will happen.



OPTIONS
       None.


SEE ALSO
       pam(5)

       pnmtopng(1)

       pngtopam(1)



HISTORY
       pamrgbatopng was new in Netpbm 10.30 (October 2005).



netpbm documentation                                                                             24 July 2006                                                                      Pamrgbtopng User Manual(0)
