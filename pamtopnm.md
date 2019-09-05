Pamtopnm User Manual(0)                                                                                                                                                               Pamtopnm User Manual(0)



NAME
       pamtopnm - convert PAM image to PBM, PGM, or PPM


SYNOPSIS
       pamtopnm

       [-assume]

       [pnmfile]

       Minimum  unique  abbreviation  of  option  is  acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.


DESCRIPTION
       This program is part of Netpbm(1)

       pamtopnm reads a PAM image as input and produces an equivalent PBM, PGM, or PPM (i.e. PNM) image, whichever is most appropriate, as output.

       pamtopnm assumes the PAM image represents the information required for a PBM, PGM, or PPM image if its tuple type is 'BLACKANDWHITE', 'GRAYSCALE', or 'RGB' and its depth and maxval are  appropriate.
       If this is not the case, pamtopnm fails.

       However, you can override the tuple type requirement with the -assume option.

       pamtopnm produces a PPM image if the input PAM has depth 3 or 4; it produces PGM or PBM if the input PAM has depth 1 or 2.  Whether it produced PGM or PBM depends upon the maxval: PBM for 1, PGM for
       anything higher.  The tuple type does not play a role in determining the output type.  You can use Netpbm programs such as pgmtopgm to generate a different PNM output, but remember that Netpbm  pro-
       gram that expects PGM input will take PBM and so on.

       As with any Netpbm program that reads PAM images, pamtopnm also reads PNM images as if they were PAM.  In that case, pamtopnm's functions reduces to simply copying the input to the output.  But this
       can be useful in a program that doesn't know whether its input is PAM or PNM but needs to feed it to a program that only recognizes PNM.


OPTIONS
       -assume
              When you specify -assume, you tell pamtopnm that you personally vouch for the fact that the tuples contain the same data as belongs in the channels of a PBM, PGM, or PPM file.  The depth must
              still conform, though, so to truly force a conversion, you may have to run the input through pamchannel first.  But be careful with -assume.  When you -assume, you make an -ass of u and me.




SEE ALSO
       pbmtopgm(1) , pamditherbw(1) , pgmtoppm(1) , ppmtopgm(1) , pam(5) , pnm(5) , pbm(5) , pgm(5) , ppm(5)




HISTORY
       pamtopnm was new, along with the PAM format, in Netpbm 9.7 (August 2000).



netpbm documentation                                                                             10 May 2010                                                                          Pamtopnm User Manual(0)
