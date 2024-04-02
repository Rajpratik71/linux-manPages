Pngtopam User Manual(0)                                                                                                                                                               Pngtopam User Manual(0)



NAME
       pngtopam - convert a PNG image into a Netpbm image


SYNOPSIS
       pngtopam [-verbose] [-alphapam | -alpha | -mix] [-background=color] [-gamma=value] [-text=filename] [-time] [-byrow] [pngfile]

       Minimum  unique  abbreviation  of  option  is  acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.


DESCRIPTION
       This program is part of Netpbm(1)

       pngtopam reads a PNG image (Portable Network Graphics) as input and produces a Netpbm image as output.  The type of the output file depends on the input file - if it's black & white,  pngtopam  cre-
       ates  a  PBM file.  If it's grayscale, pngtopam creates a PGM file.  Otherwise, it creates a PPM file.  Except that with the -alphapam option, it always creates a PAM file.  That file has tuple type
       GRAYSCALE_ALPHA or RGB_ALPHA depending on whether the input has color or not.

       To convert in the other direction, use pnmtopng or pamrgbatopng.  The former is more powerful in almost every way, except that only the latter can recognize transparency information in a  PAM  file,
       as  you  might generate with pngtopam -alphapam.  To use pnmtopng with a PAM file with transparency, you can separate out the transparency channel with pamchannel and feed it to pnmtopng separately.
       But you may want to use pngtopam -alpha instead of pngtopam -alphapam if you're going to be converting back.



OPTIONS
       -verbose
              Display various information about the input PNG image and the conversion process.

              If you want even more information about the PNG image, use pngcheck (not part of Netpbm).


       -alphapam
              Produce a single output image containing the main image (foreground) and the alpha channel or transparency mask.  This image is in the PAM format with tuple  type  of  either  GRAYSCALE_ALPHA
              (which has a depth of 2 channels) or RGB_ALPHA (which has a depth of 4 channels).

              You can specify only one of -alphapam, -alpha, and -mix.  With none of them, pngtopam produces an image of the foreground of the input image and discards transparency information.

              Note that converting in the other direction, the pamtopng converter won't recognize the transparency information you generate with -alphapam, but pamrgbatopng will.

              This option was new in Netpbm 10.44 (September 2008).


       -alpha Output the alpha channel or transparency mask of the image. The result is either a PBM file or a PGM file, depending on whether different levels of transparency appear.

              pngtopam discards the main image (the foreground).

              You can specify only one of -alphapam, -alpha, and -mix.  With none of them, pngtopam produces an image of the foreground of the input image and discards transparency information.


       -mix   Compose the image with the transparency or alpha mask against a background.  The background color is determined by the bKGD chunk in the PNG, except that you can override it with -background.
              If the PNG has no bKGD chunk and you don't specify -background, the background color is white.

              You can specify only one of -alphapam, -alpha, and -mix.  With none of them, pngtopam produces an image of the foreground of the input image and discards transparency information.


       -background=color
              This option specifies the background color with which to mix the image when you specify -mix.

              color is as described for the argument of the ppm_parsecolor() library routine ⟨libppm.html#colorname⟩ .

              Examples:



       ·      -background=rgb:01/ff/80

       ·      -background=rgbi:1/255/128


              If you don't specify -background, the background color is what is specified in the PNG image, and if the PNG doesn't specify anything, white.

              You cannot specify -background unless you also specify -mix.  Before Netpbm 10.27 (March 2005), you could specify -background without -mix and it was just ignored.  (This caused  a  usability
              problem).



       -gamma=value
              This  option  causes  pngtopam  to  respect  the image gamma information in the PNG file (from the gAMA chunk).  Probably by historical accident, pngtopam ignores that information by default,
              assuming the image uses the same gamma transformation as a Netpbm image, so the output image has different colors than the PNG file actually represents if the PNG doesn't  actually  do  that.
              (However, it is rare for a PNG file to use a gamma transformation different from what the Netpbm formats specify, or if it does, to specify with a gAMA chuck what that is).

              But  when you do specify -gamma, you get a rather strange additional function, probably a historical mistake: pngtopam incorporates the specified screen gamma value into the output pixels, so
              that the samples in the Netpbm output deviate from the Netpbm format specifications and are appropriate raw intensity values to send to the display.  This function essentially just  exercises
              the  ability  of  the  PNG library to make gamma corrections to the pixels as it reads them from the PNG file to produce values appropriate for sending to a certain display in certain viewing
              conditions.  It's a strange function because it has nothing to do with PNG and because in Netpbm, the normal way to make gamma corrections appropriate for sending to a ceratin display in cer-
              tain viewing conditions is with the program pngtopam, applied to the normal output of pngtopam.

              If  you  specify  -gamma,  but the PNG image does not specify what gamma transformation it uses (there is no gAMA chunk), pngtopam assumes a simple power transformation with an image gamma of
              1.0.  That is probably not not the actual image gamma; it is much more likely to be .45.

              Because the gammas of uncompensated monitors are around 2.6, which results in an image-gamma of 0.45, some typical situations are: when the image-gamma is 0.45 (use -verbose to check) and the
              picture  is  too light, your system is gamma-corrected, so convert with '-gamma 1.0'.  When no gAMA chunk is present or the image-gamma is 1.0, use 2.2 to make the picture lighter and 0.45 to
              make the picture darker.

              One oddity to be aware of when using -gamma on an image with transparency: The PNG image specifies that a certain color is transparent, i.e. every pixel in the image of that color  is  trans-
              parent.  But pngtopam interprets this as applying to the gamma-corrected space, and there may be less precision in that space than in the original, which means multiple uncorrected colors map
              to the same corrected color.  So imagine that the image contains 3 shades of white (gray) and specifies that one of them is transparent.  After gamma correction, those three shades are indis-
              tinguishable, so pngtopam considers pixels of all three shades to be transparent.



       -text=file
              Writes the tEXt and zTXt chunks to a file, in a format as described in the pnmtopng user manual.  These chunks contain text comments or annotations.


       -time  Prints the tIME chunk to stderr.


       -byrow This option can make pngtopam run faster or in environments where it would otherwise fail.

              pngtopam has two ways to do the conversion from PNG to PAM, using respectively two facilities of the PNG library:




       Whole Image
              Decode the entire image into memory at once, using png_read_image(), then convert to PAM and output row by row.


       Row By Row
              Read, convert, and output one row at a time using png_read_row().



              Whole  Image is generally preferable because the PNG library does more of the work, which means it understands more of the PNG format possibilities now and in the future.  Also, if the PNG is
              interlaced, pngtopam does not know how to assemble the rows in the right order.

              Row By Row uses far less memory, which means with large images, it can run in environments where Whole Image cannot and may also run faster.  And because Netpbm code does more  of  the  work,
              it's possible that it can be more flexible or at least give better diagnostic information if there's something wrong with the PNG.

              The Netpbm native code may do something correctly that the PNG library does incorrectly, or vice versa.

              In Netpbm, we stress function over performance, so by default pngtopam uses Whole Image.  You can select Row By Row with -byrow if you want the speed or resource requirement improvement.

              -byrow was new in Netpbm 10.54 (March 2011).



       -orientraw
              A  TIFF  stream contains raster data which can be arranged in the stream various ways.  Most commonly, it is arranged by rows, with the top row first, and the pixels left to right within each
              row, but many other orientations are possible.

              The common orientation is the same on the Netpbm formats use, so tifftopnm can do its jobs quite efficiently when the TIFF raster is oriented that way.

              But if the TIFF raster is oriented any other way, it can take a considerable amount of processing for tifftopnm to convert it to Netpbm format.




SEE ALSO
       pnmtopng(1) , pnmtopng(1) , ptot, pnmgamma(1) , pnm(5)


       For information on the PNG format, see http://schaik.com/png ⟨http://schaik.com/png⟩ .


NOTE
       A PNG image contains a lot of information that can't be represented in Netpbm formats.  Therefore, you lose information when you convert to another format with "pngtopam | pnmtoxxx".  If there is  a
       specialized converter that converts directly to the other format, e.g. ptot to convert from PNG to TIFF, you'll get better results using that.


LIMITATIONS
       There could be an option to include PNG comment chunks in the output image as PNM comments instead of putting them in a separate file.

       The program could be much faster, with a bit of code optimizing.  As with any Netpbm program, speed always takes a back seat to quick present and future development.


HISTORY
       pngtopam  was  new  in Netpbm 10.44, as a replacement for pngtopnm.  The main improvement over pngtopnm was that it could generate a PAM image with a transparency channel, whereas with pngtopnm, you
       would have to extract the transparency channel as a separate file, in a separate run.

       pngtopnm was new in Netpbm 8.1 (March 2000), the first big change to the package in Netpbm's renaissance.  It and pnmtopng were simply copied from the  pnmtopng package (1)
        by Greg Roelofs.  Those were based on simpler reference applications by Alexander Lehmann <alex@hal.rhein-main.de> and Willem van Schaik <willem@schaik.com> and distributed with their PNG library.

       Nearly all of the code has changed since it was copied from the pnmtopng package, most of it just to improve maintainability.



AUTHORS
       Copyright (C) 1995-1997 by Alexander Lehmann and Willem van Schaik.



netpbm documentation                                                                             22 July 2008                                                                         Pngtopam User Manual(0)
