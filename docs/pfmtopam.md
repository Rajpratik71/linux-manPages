Pfmtopam User Manual(0)                                                                                                                                                               Pfmtopam User Manual(0)



NAME
       pamtopfm - Convert PFM (Portable Float Map) image to Netpbm format


SYNOPSIS
       pfmtopam [-maxval=n] [-verbose] [imagefile]

       All options can be abbreviated to their shortest unique prefix.  You may use two hyphens instead of one.  You may separate an option name and its value with white space instead of an equals sign.


DESCRIPTION
       This program is part of Netpbm(1)

       pfmtopam reads a PFM (Portable Float Map) image and converts it to PAM.

       See pamtopfm(1)
        for a description of PFM.

       If you want one of the older, more portable Netpbm formats, run the output through pamtopnm.

       pamtopfm creates a PAM with tuple type 'RGB' or 'GRAYSCALE' depending on whether or not the PFM is in the color subformat.

       Use pamtopfm(1)
        to convert a PFM image to Netpbm format.



OPTIONS
       -maxval=n

              This specifies the maxval for the PAM.  Default is 255.


       -verbose

              This causes pfmtopam to display messages describing
                   the PFM input file.




SEE ALSO
       pamtopfm(1) , pam(5) ,


HISTORY
       pfmtopam was added to Netpbm in Release 10.22 (April 2004).



netpbm documentation                                                                            10 April 2004                                                                         Pfmtopam User Manual(0)
