Tifftopnm User Manual(0)                                                                                                                                                             Tifftopnm User Manual(0)



NAME
       tifftopnm - convert a TIFF file into a PNM image


SYNOPSIS
       tifftopnm

       [-alphaout={alpha-filename,-}] [-headerdump] [-verbose] [-respectfillorder] [-byrow] [-orientraw] [tiff-filename]



DESCRIPTION
       This program is part of Netpbm(1)

       tifftopnm  reads  a  TIFF file as input and produces a PNM image as output.  The type of the output file depends on the input file - if it's black and white, tifftopnm generates a PBM image; if it's
       grayscale, it generates a PGM image; otherwise, the output is PPM.  The program tells you which type it is writing.

       If the TIFF file contains multiple images (multiple 'directories'), tifftopnm generates a multi-image PNM output stream.  Before Netpbm 10.27 (March 2005), however, it would just ignore all but  the
       first input image.

       The  tiff-filename  argument  names  the regular file that contains the Tiff image.  If you specify '-' or don't specify this argument, tfftopnm uses Standard Input. In either case, the file must be
       seekable.  That means no pipe, but any regular file is fine.


   TIFF Capability
       pamtotiff uses the Libtiff.org TIFF library (or whatever equivalent you provide) to interpret the TIFF input.  So the set of files it is able to interpret is determined mostly by that library.

       This program cannot read every possible TIFF file -- there are myriad variations of the TIFF format.  However, it does understand monochrome and gray scale,  RGB,  RGBA  (red/green/blue  with  alpha
       channel),  CMYK  (Cyan-Magenta-Yellow-Black  ink color separation), and color palette TIFF files.  An RGB file can have either single plane (interleaved) color or multiple plane format.  The program
       reads 1-8 and 16 bit-per-sample input, the latter in either bigendian or littlendian encoding.  Tiff directory information may also be either bigendian or littlendian.

       There are many TIFF formats that tifftopnm can read only if the image is small enough to fit in memory.  tifftopnm uses the TIFF library's TIFFRGBAImageGet() function to process the TIFF image if it
       can get enough memory for TIFFRGBAImageGet() to store the whole image in memory at once (that's what TIFFRGBAImageGet() does).  If not, tifftopnm uses a more primitive row-by-row conversion strategy
       using the raw data returned by TIFFReadScanLine() and native intelligence.  That native intelligence does not know as many formats as TIFFRGBAImageGet() does.  And certain compressed formats  simply
       cannot be read with TIFFReadScanLine().

       Before Netpbm 10.11 (October 2002), tifftopnm never used TIFFRGBAImageGet(), so it could not interpret many of the formats it can interpret today.

       There  is  no  fundamental  reason  that this program could not read other kinds of TIFF files even when they don't fit in memory all at once.  The existing limitations are mainly because no one has
       asked for more.


   Output Image
       The PNM output has the same maxval as the Tiff input, except that if the Tiff input is colormapped (which implies a maxval of 65535) the PNM output has a maxval of 255.  Though this  may  result  in
       lost  information, such input images hardly ever actually have more color resolution than a maxval of 255 provides and people often cannot deal with PNM files that have maxval > 255.  By contrast, a
       non-colormapped Tiff image that doesn't need a maxval > 255 doesn't have a maxval > 255, so when tifftopnm sees a non-colormapped maxval > 255, it takes it seriously and produces a  matching  output
       maxval.

       Another  exception  is where the TIFF maxval is greater than 65535, which is the maximum allowed by the Netpbm formats.  In that case, tifftopnm uses a maxval of 65535, and you lose some information
       in the conversion.


OPTIONS
       You may abbreviate any option to its shortest unique prefix.  You may use two hyphens instead of one in options.  You may separate an option and its value either by an equals sign or white space.



       -alphaout=alpha-filename
              tifftopnm creates a PGM file containing the alpha channel values in the input image.  If the input image doesn't contain an alpha channel, the alpha-filename file contains all zero (transpar-
              ent) alpha values.  If you don't specify -alphaout,

              tifftopnm does not generate an alpha file, and if the input image has an alpha channel, tifftopnm simply discards it.

              If you specify - as the filename, tifftopnm writes the alpha output to Standard Output and discards the image.

              See pamcomp(1)
               for one way to use the alpha output file.


       -respectfillorder
              By  default,  tifftopnm   ignores  the  'fillorder' tag in the TIFF input, which means it may incorrectly interpret the image.  To make it follow the spec, use this option.  For a lengthy but
              engaging discussion of why tifftopnm works this way and how to use the -respectfillorder option, see the note on fillorder below.


       -byrow This option can make tifftopnm run faster.

              tifftopnm has two ways to do the conversion from Tiff to PNM, using respectively two facilities of the TIFF library:




       Whole Image
              Decode the entire image into memory at once, using TIFFRGBAImageGet(), then convert to PNM and output row by row.


       Row By Row
              Read, convert, and output one row at a time using TIFFReadScanline()



              Whole Image is preferable because the Tiff library does more of the work, which means it understands more of the Tiff format possibilities now and in the future.  Also, some  compressed  TIFF
              formats don't allow you to extract an individual row.

              Row  By  Row  uses far less memory, which means with large images, it can run in environments where Whole Image cannot and may also run faster.  And because Netpbm code does more of the work,
              it's possible that it can be more flexible or at least give better diagnostic information if there's something wrong with the TIFF.

              The Netpbm native code may do something correctly that the TIFF library does incorrectly, or vice versa.

              In Netpbm, we stress function over performance, so by default we try Whole Image first, and if we can't get enough memory for the decoded image or TIFFRGBAImageGet() fails, we  fall  back  to
              Row By Row.  But if you specify the -byrow option, tifftopnm will not attempt Whole Image.  If Row By Row does not work, it simply fails.

              See Color Separation (CMYK) TIFFs ⟨#cmyk⟩  for a description of one way Row By Row makes a significant difference in your results.

              Whole  Image  costs  you precision when your TIFF image uses more than 8 bits per sample.  TIFFRGBAImageGet() converts the samples to 8 bits.  tifftopnm then scales them back to maxval 65535,
              but the lower 8 bits of information is gone.

              In many versions of the TIFF library, TIFFRGBAImageGet() does not correctly interpret TIFF files in which the raster orientation is column-major (i.e. a row of the raster is a column  of  the
              image).  With such a TIFF library and file, you must use -byrow to get correct output.

              Before Netpbm 10.11 (October 2002), tifftopnm always did Row By Row.  Netpbm 10.12 always tried Whole Image first.  -byrow came in with Netpbm 10.13 (January 2003).


       -orientraw
              A  TIFF  stream contains raster data which can be arranged in the stream various ways.  Most commonly, it is arranged by rows, with the top row first, and the pixels left to right within each
              row, but many other orientations are possible.

              The common orientation is the same on the Netpbm formats use, so tifftopnm can do its jobs quite efficiently when the TIFF raster is oriented that way.

              But if the TIFF raster is oriented any other way, it can take a considerable amount of processing for tifftopnm to convert it to Netpbm format.

              -orientraw says to produce an output image that represents the raw raster in the TIFF stream rather than the image the TIFF stream is supposed to represent.  In the output, the top left  cor-
              ner  corresponds  to the start of the TIFF raster, the next pixel to the right is the next pixel in the TIFF raster, etc.  tifftopnm can do this easily, but you don't get the right image out.
              You can use pamflip to turn the output into the image the TIFF stream represents (but if you do that, you pretty much lose the benefit of -orientraw).

              With this option, tifftopnm always uses the Row By Row method (see -byrow).

              This option was new in Netpbm 10.42 (March 2008).  Before that, tifftopnm generally produces arbitrary results with TIFF images that have an orientation other than the common one.


       -verbose
              Print extra messages to Standard Error about the conversion.


       -headerdump
              Dump TIFF file information to stderr.  This information may be useful in debugging TIFF file conversion problems.




NOTES
   Fillorder
       There is a piece of information in the header of a TIFF image called 'fillorder.' The TIFF specification quite clearly states that this value tells the order in which bits are arranged in a byte  in
       the  description  of  the  image's pixels.  There are two options, assuming that the image has a format where more than one pixel can be represented by a single byte: 1) the byte is filled from most
       significant bit to least significant bit going left to right in the image; and 2) the opposite.

       However, there is confusion in the world as to the meaning of fillorder.  Evidence shows that some people believe it has to do with byte order when a single value is represented by two bytes.

       These people cause TIFF images to be created that, while they use a MSB-to-LSB fillorder, have a fillorder tag that says they used LSB-to-MSB.  A program that properly interprets a TIFF  image  will
       not end up with the image that the author intended in this case.

       For a long time, tifftopnm did not understand fillorder itself and assumed the fillorder was MSB-to-LSB regardless of the fillorder tag in the TIFF header.  And as far as I know, there is no legiti-
       mate reason to use a fillorder other than MSB-to-LSB.  So users of tifftopnm were happily using those TIFF images that had incorrect fillorder tags.

       So that those users can continue to be happy, tifftopnm today continues to ignore the fillorder tag unless you tell it not to.  (It does, however, warn you when the fillorder tag does not  say  MSB-
       to-LSB that the tag is being ignored).

       If  for some reason you have a TIFF image that actually has LSB-to-MSB fillorder, and its fillorder tag correctly indicates that, you must use the -respectfillorder option on tifftopnm to get proper
       results.

       Examples of incorrect TIFF images are at ftp://weather.noaa.gov.  ⟨ftp://weather.noaa.gov.⟩  They are apparently created by a program called faxtotiff.

       This note was written on January 1, 2002.



   Color Separation (CMYK) TIFFs
       Some TIFF images contain color information in CMYK form, whereas PNM images use RGB.  There are various formulas for converting between these two forms, and tifftopnm can use either of two.

       The TIFF library (Version 3.5.4 from libtiff.org) uses Y=(1-K)*(1-B) (similar for R and G) in its TIFFRGBAImageGet() service.  When tifftopnm works in Whole Image mode,  it  uses  that  service,  so
       that's the conversion you get.

       But when tifftopnm runs in Row By Row mode, it does not use TIFFRGBAImageGet(), and you get what appears to be more useful: Y=1-(B+K).  This is the inverse of what pnmtotiffcmyk does.

       See the -byrow option for more information on Whole Image versus Row By Row mode.

       Before Netpbm 10.21 (March 2004), tifftopnm used the Y=(1-K)*(1-B) formula always.



SEE ALSO
       pnmtotiff(1) , pnmtotiffcmyk(1) , pamcomp(1) , pnm(5)



AUTHOR
       Derived by Jef Poskanzer from tif2ras.c, which is Copyright (c) 1990 by Sun Microsystems, Inc.  Author: Patrick J. Naughton (naughton@wind.sun.com).



netpbm documentation                                                                             12 July 2009                                                                        Tifftopnm User Manual(0)
