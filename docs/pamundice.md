Pamundice User Manual(0)                                                                                                                                                             Pamundice User Manual(0)



NAME
       pamundice - combine grid of images (tiles) into one


EXAMPLE
           $ pamdice myimage.ppm -outstem=myimage_part -width=10 -height=8
           $ pamundice myimage_part_%1d_%1a.ppm -across=10 -down=8 >myimage.ppm

           $ pamundice myimage.ppm myimage_part_%2a -across=13 -hoverlap=9



SYNOPSIS
       pamundice

       [-across=n]

       [-down=n]

       [-hoverlap=pixels]

       [-voverlap=pixels]

       [-verbose]

       input_filename_pattern

       You can use the minimum unique abbreviation of the options.  You can use two hyphens instead of one.  You can separate an option name from its value with white space instead of an equals sign.


DESCRIPTION
       This program is part of Netpbm(1)

       pamundice reads a bunch of Netpbm images as input and combines them as a grid of tiles into a single output image of the same kind on Standard Output.

       You can optionally make the pieces overlap.

       See the input_filename_pattern argument for information on naming of the input files.

       The  input  images  must  all have the same format (PAM, PPM, etc.)  and maxval and for PAM must have the same depth and tuple type.  All the images in a rank (horizontal row of tiles) must have the
       same height.  All the images in a file (vertical column of tiles) must have the same width.  But it is not required that every rank have the same height or every file have the same width.

       pamdice is the inverse of pamundice.  You can use pamundice to reassemble an image sliced up by pamdice.  You can use pamdice to recreate the tiles of an image created by pamundice, but to  do  this
       the original ranks must all have been the same height except for the bottom one and the original files must all have been the same width except the right one.

       One  use for this is to make pieces that take less computer resources than the whole image to process.  For example, you might have an image so large that an image editor can't read it all into mem-
       ory or processes it very slowly.  You can split it into smaller pieces with pamdice, edit one at a time, and then reassemble them with pamundice.

       An alternative to join images in a single direction (i.e. a single rank or a single file) is pnmcat.  pnmcat gives you more flexibility than pamundice in identifying the input images: you can supply
       them on Standard Input or as a list of arbitrarily named files.

       To join piecewise photographs, use pnmstitch instead of pamundice, because it figures out where the pieces overlap, even if they don't overlap exactly vertically or horizontally.

       To create an image of the same tile repeated in a grid, that's pnmtile.

       pnmindex  does  a  similar  thing to pamundice: it combines a bunch of small images in a grid into a big one.  But its purpose is to produce a an index image of the input images.  So it leaves space
       between them and has labels for them, for example.


ARGUMENTS
       There is one non-option argument, and it is mandatory: input_filename_pattern.  This tells pamundice what files contain the input tiles.

       pamundice reads the input images from files which are named with a pattern that indicates their positions in the combined image.  For example, tile_00_05.ppm could be the 6th tile over  in  the  1st
       rank, while tile_04_01 is the 2nd tile over in the 5th rank.

       You  cannot  supply  any of the data on Standard Input, and the files must be the kind that pamundice can close and reopen and read the same image a second time (e.g. a regular file is fine; a named
       pipe is probably not).

       input_filename_pattern is a printf-style pattern.  (See the standard C library printf subroutine).  For the example above, it would be tile_%2d_%2a.ppm.  The only possible conversion specifiers are:




       d      'down': The rank (row) number, starting with 0.


       a      'across': The file (column) number, starting with 0.


       %      The per cent character (%).



       The number between the % and the conversion specifier is the precision and is required.  It says how many characters of the file name are described by that conversion.  The rank or  file  number  is
       filled with leading zeroes as necessary.

       So the example tile_%2d_%2a.ppm means to get the name of the file that contains the tile at Rank 0, File 5, you:




       ·      replace the '%2d' with the rank number, as a 2 digit decimal number: '00'


       ·      Replace the '%2a' with the file number, as a 2 digit decimal number: '05'


       Note that this pattern describes file names that pamdice produces, except that the precision may be more or less.  (pamdice uses however many digits are required for the highest numbered image).



OPTIONS
       -across=N
              This is the number of tiles across in the grid, i.e. the number of tiles in each rank, or the number of files.

              Default is 1.



       -down=N
              This is the number of tiles up and down in the grid, i.e. the number of tiles in each file, or the number of ranks.

              Default is 1.


       -hoverlap=pixels
              This  is  the  amount in pixels to overlap the tiles horizontally.  pamundice clips this much off the right edge of every tile before joining it to the adjacent image to the right.  The tiles
              along the right edge remain whole.

              There must not be any input image narrower than this.

              Note that this undoes the effect of the same -hoverlap option of pamdice.

              Default is zero -- no overlap.


       -voverlap=pixels
              This is analogous to -hoverlap, but pamundice clips the bottom edge of each image before joining it to the one below.


       -verbose
              Print information about the processing to Standard Error.




HISTORY
       pamundice was new in Netpbm 10.39 (June 2007).  Before that, pnmcat is the best substitute.



SEE ALSO
       pamundice(1) , pnmcat(1) , pnmindex(1) , pnmtile(1) , pnm(5)

       pam(5)



netpbm documentation                                                                             1 April 2007                                                                        Pamundice User Manual(0)
