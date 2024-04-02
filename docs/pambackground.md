Pambackground User Manual(0)                                                                                                                                                     Pambackground User Manual(0)



NAME
       pambackground - create a mask of the background area of an image


SYNOPSIS
       pambackground

       [netpbmfile]

       [-verbose=]

       Minimum  unique  abbreviations  of options are acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.



DESCRIPTION
       This program is part of Netpbm(1)

       pambackground reads a PNM or PAM image as input.  It generates as output a PAM image that identifies the background area of the image (a mask).

       To identify the background, pambackground assumes the image is a foreground image, smaller than the total image size, placed over a single-color background.  It  assumes  that  foreground  image  is
       solid  --  it  does  not  have holes through which the background can be seen.  So in specific, pambackground first identifies the background color, then finds all contiguous pixels of that color in
       regions touching any edge of the image.  Think of it as starting at each of the four edges and moving inward as far as possible until it hits pixels of another color (the foreground image).

       pambackground identifies the background color as follows: If any 3 corners of the image are the same color, that's the background color.  If not, but 2 corners are the  same  color,  the  background
       color  is  the color of a pair of identically colored corners in this priority order: top, right, left, bottom.  If no two corners have the same color, the background color is the color of the upper
       left corner.

       In a typical photograph, the area that you would consider the background is many shades of a color, so to pambackground it is multiple colors and pambackground will  not  meaningfully  identify  the
       background of your image.  To use pambackground in this case, you might use ppmchange to change all similar colors to a single one first.  For example, if the photograph is a building against a blue
       sky, where nothing remotely sky-blue appears in the building, you could use ppmchange to change all pixels within 20% of 'SkyBlue' to SkyBlue, then run pambackground on it.

       In Release 10.37, pambackground does not really do what is promised above.  It can't see places where the background appears in the middle of a row (think of the sky between  two  buildings).   From
       Release 10.38 forward, it snakes through whatever passages it has to to find all the background.

       The  PAM that pambackground creates has a single plane, with a maxval of 1.  The sample value 1 means background; 0 means foreground.  There is no tuple type.  Some older programs (but none that are
       part of Netpbm) don't know what a PAM is and expect a mask to be in the form of a PGM or PBM image.  To convert pambackground's output to PBM, use pamtopnm -assume.  To convert to PGM, use pgmtopgm.

       netpbmfile is the file specification of the input file, or - to indicate Standard Input.  The default is Standard Input.

       A common use for a background mask is with pamcomp.  You could replace the entire background (or foreground) of your image with something else.

       Another common use is to make an image with the background transparent (in some image format that has a concept of transparency; not Netpbm formats) so that image can be overlaid onto another  image
       later.  Netpbm's converters to image formats that have transparency (e.g. PNG) let you use the mask that pambackground generates to identify the transparent areas for the output.

       To  simply make a mask of all the areas of a specified color, use ppmcolormask.  If you have a unique background color (one that doesn't occur in the foreground) and know what it is, this can create
       a background mask in cases that pambackground cannot: where there are see-through holes in the foreground image.


OPTIONS
       -verbose
              Tell interesting facts about the process.




SEE ALSO
       ppmcolormask(1) , pamcomp(1) , pamtopnm(1) , pgmtopgm(1) , pnm(5) , pam(5) ,


HISTORY
       pambackground was new in Netpbm 10.37 (December 2006).



netpbm documentation                                                                           31 December 2006                                                                  Pambackground User Manual(0)
