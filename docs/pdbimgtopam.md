Pdbimgtopam User Manual(0)                                                                                                                                                         Pdbimgtopam User Manual(0)



NAME
       pdbimgtopam - convert a Palm Pilot Image Viewer PDB Image to a PAM image


SYNOPSIS
       pdbimgtopam

       [-notefile=filename] [-verbose]

       [pdbimgfile]


DESCRIPTION
       This program is part of Netpbm(1)

       pdbimgtopam reads a Palm Pilot Image Viewer image (and Image record in a PDB file) as input, from Standard Input or palmfile, and produces a PAM image as output.

       If the Pilot image is monochrome, the PAM output has maxval 1.  Otherwise, it has maxval 255.  Note that Pilot images are always monochrome.  The PAM image has tuple type GRAYSCALE.



OPTIONS
       -verbose
              Display various interesting information about the input file and process.


       -notefile=filename
              Write the image note (if any) to the specified file.

              If you don't specify this, pdbimgtopam ignores any image note.




SEE ALSO
       pamtopdbimg(1) , pnmtopalm(1) , pam(5) ,


HISTORY
       pdbimgtopam was new in Netpbm 10.52 (September 2010).  It was modelled after Eric A. Howe's imgvtopbm package, which dates back to September 1997.



netpbm documentation                                                                          25 September 2010                                                                    Pdbimgtopam User Manual(0)
