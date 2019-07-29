Giftopnm User Manual(0)                                                                                                                                                               Giftopnm User Manual(0)



NAME
       giftopnm - convert a GIF file into a PNM image


SYNOPSIS
       giftopnm [--alphaout={alpha-filename,-}] [-verbose] [-comments] [-image={N,all}] [-repair] [-quitearly] [GIFfile]

       Minimum  unique  abbreviation  of  option  is  acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.


DESCRIPTION
       This program is part of Netpbm(1)

       This is a graphics format converter from the GIF format to the PNM (i.e. PBM, PGM, or PPM) format.

       If the image contains only black and maximally bright white, the output is PBM.  If the image contains more than those two colors, but only grays, the output is PGM.  If  the  image  contains  other
       colors, the output is PPM.

        A  GIF  image contains rectangular pixels.  They all have the same aspect ratio, but may not be square (it's actually quite unusual for them not to be square, but it could happen).  The pixels of a
       Netpbm image are always square.  Because of the engineering complexity to do otherwise, giftopnm converts a GIF image to a Netpbm image pixel-for-pixel.  This means if the GIF pixels are not square,
       the Netpbm output image has the wrong aspect ratio.  In this case, giftopnm issues an informational message telling you to run pamscale to correct the output.


OPTIONS
       --alphaout=alpha-filename
              giftopnm   creates  a  PBM  file containing the transparency information from the input image.  This 'alpha image' is the same dimensions as the input image, and each pixel of the alpha image
              tells whether the corresponding pixel of the input image is transparent.  Black means transparent; white means opaque.  If you don't specify --alphaout, giftopnm does not  generate  an  alpha
              file, and if the input image has an alpha channel, giftopnm simply discards it.

              If you specify - as the filename, giftopnm writes the alpha output to Standard Output and discards the image.

              See pamcomp(1)
               for one way to use the alpha output file.


       -verbose
              Produce verbose output about the GIF file input.


       -comments
              With this option, giftopnm issues messages showing the GIF comments (A GIF89 stream can contain comments in comment extensions).

              By default, giftopnm ignores comment extensions.



       -image={N,all}
              This  option  identifies  which  image  from  the  GIF stream you want.  You can select either one image or all the images.  Select al the images with all.  Select one image by specifying its
              sequence number in the stream: 1, 2, 3, etc.

              The default is just Image 1.

              A GIF stream normally contains only one image, so you don't need this option.  But some streams, including animated GIFs, have multiple images.

              When you select multiple GIF images, the output is a PNM stream with multiple images.

              If you specify a single image, giftopnm must read and partially validate the images before that in the stream.  It may or may not do the same for the images after it; see -quitearly.

              The all value was added in Netpbm 10.16 (June 2003).  Earlier giftopnm can extract only one image.


       -repair
              This option makes giftopnm try to salvage what it can from an invalid GIF input.

              In particular, when giftopnm detects that the GIF input is invalid so that it is impossible to determine what the pixels are intended to be, it produces a single arbitrary color for all  fur-
              ther pixels in the image.  giftopnm processes the image from top to bottom, left to right, so this means the bottommost pixels will be this padding.

              giftopnm issues warning messages when it salvages an image in this way.

              Without this option, giftopnm fails when it detects invalid GIF input.  Any output it produces is arbitrary, and typically is not a valid PNM image.

              It  is  fairly  common  for  an image to be corrupted such that is started off as a valid GIF, but had the end of the file cut off.  An interrupted network transfer tends to do this.  In this
              case, giftopnm's salvage operation will produce a valid PNM image of the proper dimensions, but with a single arbitrary color for the pixels that were left out of the file.

              This option was new in Netpbm 10.38 (March 2007).  From 10.32 through 10.37, giftopnm always fails if it detects invalid GIF input.  Before 10.32, it succeeds  in  the  case  of  a  truncated
              image, and replaces the missing pixels with arbitrary colors, not necessarily all the same (The pre-10.32 behavior wasn't actually intended by the design).



       -quitearly
              This  option  makes  giftopnm stop reading its input file as soon as it has converted and output the images from the input that you requested.  By default, giftopnm reads until the end of the
              GIF stream, ignoring any data after the images you requested.

              Two reasons not to use this option:


       ·      The input file is a pipe and the process that is filling that pipe expects the pipe to take the entire stream and will fail or get stuck if it doesn't.


       ·      You want to validate the entire GIF stream.



              Two reasons to use this option:



       ·      It saves the time and other resources to read the end of the stream.

       ·      There are errors in the end of the stream that make giftopnm fail.


              This option has no effect if you also specify -image=all

              This option was new in Netpbm 10.35 (August 2006).  Before that, giftopnm always reads the entire stream.




RESTRICTIONS
       This does not correctly handle the Plain Text Extension of the GIF89 standard, since I did not have any example input files containing them.


SEE ALSO
       pamtogif(1) , ppmcolormask(1) , pamcomp(1) , http://www.lcdf.org/gifsicle ⟨http://www.lcdf.org/gifsicle⟩ , ppm(5)


AUTHOR
       Copyright (c) 1993 by David Koblas (koblas@netcom.com)


LICENSE
       As a historical note, for a long time if you used giftopnm, you were using a patent on the LZW compression method which was owned by Unisys, and in all probability you did not have  a  license  from
       Unisys  to  do  so.   Unisys typically asked $5000 for a license for trivial use of the patent.  Unisys never enforced the patent against trivial users, and made statements that it is much less con-
       cerned about people using the patent for decompression (which is what giftopnm does than for compression.  The patent expired in 2003.

       Rumor has it that IBM also owns a patent covering giftopnm.

       A replacement for the GIF format that has never required any patent license to use is the PNG format.



netpbm documentation                                                                          13 September 2012                                                                       Giftopnm User Manual(0)
