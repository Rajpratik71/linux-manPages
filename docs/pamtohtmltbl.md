Pamtohtmltbl User Manual(0)                                                                                                                                                       Pamtohtmltbl User Manual(0)



NAME
       pamtohtmltbl - convert pnm/pam visual image to an HTML table


SYNOPSIS
       pamtohtmltbl [-transparent=color] [-verbose] [file]

       Minimum  unique  abbreviation  of  option  is  acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.


DESCRIPTION
       This program is part of Netpbm(1)

       pamtohtmltbl converts a visual image to an HTML table with one cell per pixel.  The cell is empty, but its background color is that of the pixel.

       file is a PBM, PGM, PPM, or PAM file.  If PAM, it must be a standard visual image of tuple type RGB, GRAYSCALE, or BLACKANDWHITE, or something equivalent with extra  higher  numbered  channels,  but
       pamtohtmltbl doesn't check the tuple type; it just assumes.

       Note that the more normal way to include a visual image in an HTML document is with a <IMG> tag.

       Not  all  web  browsers render tables as pamtohtmltbl expects, and therefore show a grossly distorted image.  Internet Explorer 7 on Windows and Opera 9.02 on Windows have been seen to work; Firefox
       2.0.0.16 on the same Windows system has been seen not to.


OPTIONS
       -transparent=color
              This option indicates that pixels of the specified color are to be transparent in the HTML table.  The table cell for a pixel of this color will have no background color specified.

              Specify the color (color) as described for the argument of the ppm_parsecolor() library routine ⟨libppm.html#colorname⟩ .



       -verbose
              This option causes pamtohtmltbl to display messages about the conversion process.


SEE ALSO
       pnm(5)

       pam(5)



HISTORY
       pamtohtmltbl was new in Netpbm 10.15 (April 2003).



AUTHORS
       Alexander B. Ivanov (SSH) wrote a program he called pnm2html.  Bryan Henderson adapted it to use the Netpbm libraries and handle PAM images and follow Netpbm conventions, and named it pamtohtmltbl.



netpbm documentation                                                                           13 October 2008                                                                    Pamtohtmltbl User Manual(0)
