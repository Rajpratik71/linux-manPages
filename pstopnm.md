Pstopnm User Manual(0)                                                                                                                                                                 Pstopnm User Manual(0)



NAME
       pstopnm - convert a PostScript file to a PNM image


SYNOPSIS
       pstopnm

       [-stdout]

       [-forceplain]

       [-help]

       [-dpi=dpi]

       [-xsize=pixels] [-ysize=pixels]

       [-xborder=frac] [-yborder=frac] [-landscape]

       [-portrait]

       [-nocrop]

       [-pbm

       |-pgm

       |-ppm]

       [-llx=s] [-lly=s] [-urx=s] [-ury=s]

       [-verbose]

       [-xmax=pixels] [-ymax=pixels]

       [-textalphabits={1,2,4}]


       psfile[.ps]


OPTION USAGE
       Minimum  unique  abbreviation  of  option  is  acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.


DESCRIPTION
       This program is part of Netpbm(1)

       pstopnm reads a PostScript file as input and produces PBM, PGM, or PPM images as output.  This program simply uses GhostScript to render a PostScript file with its PNM device drivers.  If you  don't
       have  GhostScript  installed  or  the version you have installed was not built with the relevant PNM device drivers, pstopnm will fail.  You can see if you have the proper environment by issuing the
       command gs --help .  If it responds and lists under 'Available Devices' pbm, pbmraw, pgm, pgmraw, pnm, pnmraw, ppm, or ppmraw, you're in business.

       It's important to understand that pstopnm is a Netpbm image file format converter only in the broadest sense of the word, because Postscript is far from an image file format.  What pstopnm really is
       is a Postscript renderer - an image generator.  One place you'll notice the difference is where you expect pstopnm | pnmtops to be idempotent (which is not the case).  There are details on this kind
       of conversion below.

       pstopnm uses the value of the GHOSTSCRIPT environment variable as the file name for the Ghostscript program.  If GHOSTSCRIPT is not set, pstopnm searches your PATH for a regular file named  gs.   If
       it doesn't find one, it assumes Ghostscript is in the file /usr/bin/gs.

       pstopnm does not use the Netpbm libraries to generate the output files, so may not be entirely consistent with most Netpbm programs.

       psfile[.ps]  is the name of the input file.  pstopnm will add the ps to the end of the name you specify if no file exists by the exact name you specify, but one with added does.  For Standard Input,
       use - or just don't give any argument.

       If you use the -stdout  option or your input is from Standard Input, pstopnm outputs images of all the pages as a multi-image file to Standard Output.  Otherwise, pstopnm creates one file  for  each
       page  in  the  Postscript input.  The files are named as follows: If the input file is named psfile.ps, the name of the files will be psfile001.ppm, psfile002.ppm, etc.  The filetype suffix is .ppm,
       .pgm, or .pbm, depending on which kind of output you choose with your invocation options.  If the input file name does not end in .ps, the whole file name is used in the output file name.  For exam-
       ple, if the input file is named psfile.old, the output file name is psfile.old001.ppm, etc.

       Note that the output file selection is inconsistent with most Netpbm programs, because it does not default to Standard Output.  This is for historical reasons, based on the fact that the Netpbm for-
       mats did not always provide for a sequence of images in a single file.

       When your input is from Standard Input, you may feed multiple Encapsulated Postscript documents, one after another, and pstopnm converts every document and places it in the Standard Output stream as
       an image.  But if your input is from a named file, pstopnm expects the file to be an Encapsulated Postscript file, which means it contains only one Enapsulated Postscript document.  If the file con-
       tains multiple concatenated documents, pstopnm ignores every document but the first.  This distinction does not exist for non-EPSF Postscript input &mdash; pstopnm generates an output image for each
       page of the input regardless of whether the input is from Standard Input or from a named file.

       Note that you can generated both kinds of files &mdash; concatenated EPSF and multi-page non-EPSF &mdash; with pnmtops, selecting with the -setpage option.

       Each  output image contains a rectangular area of the page to which it pertains.  See the Dimensions section ⟨#dimensions⟩  for details on what part of the input image goes into the output image and
       how big it is in the output and what borders and margins are in the output image.

       It has been reported that on some Postscript Version 1 input, Ghostscript, and therefore pstopnm, produces no output.  To solve this problem, you can convert the file to Postscript  Version  3  with
       the program ps2ps.  It is reported that the program pstops does not work.


   Dimensions
       This section describes what part of the input image gets used in the output and the dimensions of the output, including borders and background.

       Note that an output image is associated with a single input page.

       pstopnm starts by taking a rectangular area from the input page.  That is called the subject image.

       pstopnm may add borders to the subject image to form what is called the bordered subject image.

       pstopnm places the bordered subject image in the center of the output image and clips the edges as necessary to fit the computed output image size.

       The location of the subject image in the Postscript input page is defined by four numbers, the lower left corner and the upper right corner x and y coordinates.  These coordinates are usually speci-
       fied by the BoundingBox DSC statement (a Postscript comment) in the PostScript file, but they can be overridden by the user by specifying one or more of the following options: -llx, -lly, -urx,  and
       -ury.

       The presence and thickness of a border to be added to the subject image to form the bordered subject image is controlled by the options -xborder and -yborder.  If pstopnm does not find a BoundingBox
       statement in the input, and you don't specify image area coordinates on the command line, pstopnm uses default values.  If your input is from Standard Input, pstopnm does  not  use  the  BoundingBox
       values (because of the technical difficulty of extracting that information and still feeding the file to Ghostscript), so you either have to specify the image area coordinates or take the default.

       The  output  image  size  is a confusing thing.  In a Postscript file, things have spatial dimensions.  For example, a particular line may be 3 centimeters long.  A Postscript printer is supposed to
       print the line 3 centimeters long, using however many pixels that takes, without regard to how big the sheet of paper on which it is printing is.  In a PNM image, by contrast, there  is  no  spatial
       dimension; there are only pixels.  You might have a line that is 100 pixels long, but the PNM image says nothing about how long that line should be on a printed page.

       pstopnm fills the role of a Postscript printer.  The PNM image is a virtual printed page.  pstopnm must determine how many pixels it will use in the output image to represent an inch of input image,
       which is the "output device resolution."  Think of it as the number of dots per inch the virtual printer prints on the virtual page.

       The simplest thing is for you to tell pstopnm exactly what output device resolution to use, using the -dpi option.  If you say for example -dpi=300 and the bordered subject image is 2  inches  by  3
       inches, the PNM output will be 600 pixels by 900 pixels.  Using this method, the output device resolution has to be the same in both directions.

       Or you can set the output image dimensions with -xsize and -ysize.  For example, if you say -xsize=1200 -ysize=1800 and the bordered subject image is 2 inches wide by 3 inches high, the output image
       is 1200 by 1800 pixels, with each pixel representing 1/600 inch of input image.

       In the unlikely event that you want different output device resolutions in the two directions, you could use -xsize and -ysize to do that.  In the above example, if you change -ysize to 900, a pixel
       still represents 1/600 inch horizontally, but 1/300 inch vertically.

       If you specify one of -xsize and -ysize and not the other, pstopnm defaults the other such that the output device resolution is the same in both directions.

       The 'x' and 'y' of -xsize and -ysize refer to the image being printed on the page, not the page.  So if pstopnm prints it in landscape orientation, 'x' would pertain to the vertical direction on the
       page, i.e. the vertical direction in the output PNM image.

       If you specify neither the output size nor the output device resolution, pstopnm does some weird computation which exists mainly for historical reasons:

       If you specify -nocrop, pstopnm uses the values of -xmax and -ymax for the output image dimensions.  These default to 612 and 792 pixels, respectively.

       The final case, the default, is where you don't specify any size or resolution options or -nocrop.  This is the most complicated case.  In this case, pstopnm first chooses an output  device  resolu-
       tion that would generate the number of pixels indicated by -xmax and -ymax from the bordered subject image.  Then, based on that resolution, it chooses an output image size that is just large enough
       to accommodate the subject image (no borders).  Remember (above) that pstopnm trims the edges of the bordered subject image to fit the computed output size.



   Ghostscript Limitations
       Tests done in 2013 with Ghostscript 8.71 indicate that Ghostscript's pgmraw output driver has some kind of rounding error that causes the pixel values to change slightly, and that means pstopnm gen-
       erates incorrect output when you have monochrome Postscript input.  But with color Postscript input, pstopnm uses Ghostscript's ppmraw output driver and generates correct PPM output.



   Usage Notes
       There is some good advice on converting to and from Postscript, in the document Postcript File Conversions (1)
        by Andrew T. Young.

       Reversible Conversion

       If you're trying to do the equivalent of the naive pnmtops | pstopnm, the following steps will do it.

           $ pnmtops -nocenter -equalpixels -dpi 72 -noturn testimg.ppm > testimg.ps
           $ pstopnm -xborder=0 -yborder=0 -xsize=XSIZE -ysize=YSIZE \
               -portrait -stdout -quiet testimg.ps >testimg2.ppm

       XSIZE  and  YSIZE above are the image dimensions, which you can get from testimg.ps like in the following example (the grep, awk and echo commands are just to help demonstrate how the other commands
       work - you wouldn't use those in a program).

           $ grep "BoundingBox" testimg.ps
           %%BoundingBox: 0 0 227 149

           $ awk  '/%%BoundingBox/ {print $4,$5}' testimg.ps
            227 149

           $ xysize=$(awk  '/%%BoundingBox/ {print "-xsize="$4,"-ysize="$5}' testimg.ps)
           $ echo $xysize

            -xsize=227 -ysize=149

           $ pstopnm -xborder=0 -yborder=0 $xysize -portrait ... testimg.ps

       Note that Ghostscript bugs can keep this from doing a perfect reversible conversion.



OPTIONS
       -forceplain
               forces the output file to be in plain (text) format.  Otherwise, it is in raw (binary) format.  See pbm(5) , etc.


       -llx=bx
              selects bx as the lower left corner x coordinate (in inches) on the Postscript input page of the subject image.  See the Dimensions section ⟨#dimensions⟩ .


       -lly=by
              selects by as the lower left corner y coordinate (in inches) on the Postscript input page of the subject image.  See the Dimensions section ⟨#dimensions⟩ .


       -landscape
              renders the image in landscape orientation.

              If you specify neither -portrait nor -landscape, pstopnm chooses the orientation that best fits the image on the output page.

              Landscape means printed sideways on the page, not printed the long way.  Those are different things if the long edge of the page is the top one.


       -portrait
              renders the image in portrait orientation.

              See -landscape.


       -nocrop
              This option causes pstopnm to make the output image exactly the dimensions of the bordered subject image.  By default, pstopnm makes the output image the dimensions  specified  by  -xmax  and
              -ymax.  See the Dimensions section ⟨#dimensions⟩ .


       -pbm

       -pgm

       -ppm   selects the format of the output file.  By default, all files are rendered as PPM.


       -stdout
              causes output to go to Standard Output instead of to regular files, one per page (see description of output files above).  Use pnmsplit to extract individual pages from Standard Output.


       -urx=tx
              selects tx as the upper right corner x coordinate (in inches) on the Postscript input page of the subject image.  See the Dimensions section ⟨#dimensions⟩ .


       -ury=ty
              selects ty as the upper right corner y coordinate (in inches) on the Postscript input page of the subject image.  See the Dimensions section ⟨#dimensions⟩ .



       -verbose
              prints processing information to stdout.


       -xborder=frac
              specifies that the left and right borders added to the subject image are to be frac times the subject image width.  The default value is 0.1.  See the Dimensions section ⟨#dimensions⟩ .



       -xmax=xmax
              specifies that the output image is to be xmax pixels wide.  The default is 612.  See the Dimensions section ⟨#dimensions⟩ .



       -xsize=xsize
              specifies that the output image is to be xsize pixels wide.  See the Dimensions section ⟨#dimensions⟩ .


       -yborder=frac
              specifies that the top and bottom borders added to the subject image are to be frac times the subject image height.  The default value is 0.1.  See the Dimensions section ⟨#dimensions⟩ .



       -ymax=ymax
              specifies that the output image is to be ymax pixels high.  The default is 792.  See the Dimensions section ⟨#dimensions⟩ .


       -ysize=ysize
              specifies that the output image is to be ymax pixels high.  See the Dimensions section ⟨#dimensions⟩ .


       -dpi=dpi
              specifies  the  output  device resolution, in dots per inch, of the Postscript printer that pstopnm simulates.  This is the number of PNM pixels pstopnm generates for each inch of image.  See
              the Dimensions section ⟨#dimensions⟩ .

              This option was new in Netpbm 10.21 (March 2004).


       -textalphabits={1,2,4}
              This controls subsample antialiasing of text.  Antialiasing is a form of smoothing that eliminates jagged edges on characters.  Subsample antialiasing is a kind of antialiasing that uses sub-
              pixels in a box, and the value of this option is the size of that box.  4 gives you the best looking output, while 1 causes no antialiasing.  Smaller numbers make pnmtops use less CPU time.

              Pstopnm uses Ghostscript's TextAlphaBits parameter for this.

              The default is 4.

              This option was new in Netpbm 10.53 (December 2010).  Older versions of pstopnm do no antialiasing.





LIMITATIONS
       The  program will produce incorrect results with PostScript files that initialize the current transformation matrix.  In these cases, page translation and rotation will not have any effect.  To ren-
       der these files, probably the best bet is to use the following options:

           pstopnm -xborder 0 -yborder 0 -portrait -nocrop file.ps

       Additional options may be needed if the document is supposed to be rendered on a medium different from letter-size paper.


SEE ALSO
       gs, pnmtops(1) , psidtopgm(1) , pbmtolps(1) , pbmtoepsi(1) , pnmsplit(1) , pstofits




COPYRIGHT
       Copyright (c) 1992 Smithsonian Astrophysical Observatory

       PostScript is a Trademark of Adobe Systems Incorporated.



AUTHOR
       Alberto Accomazzi, WIPL, Center for Astrophysics.



netpbm documentation                                                                           06 December 2013                                                                        Pstopnm User Manual(0)
