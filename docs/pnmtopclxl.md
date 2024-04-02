Pnmtopclxl User Manual(0)                                                                                                                                                           Pnmtopclxl User Manual(0)



NAME
       pnmtopclxl - convert a PNM image to an HP LaserJet PCL XL printer stream


SYNOPSIS
       pnmtopclxl  <br>{  [-dpi=N]  [-xoffs=N]  [-yoffs=N]  [-center]  [-duplex={vertical|horizontal}] [-format=paperformat] [-feeder=N] [-copies=N] [-rendergray] [-jobsetup=filename] <br>| -embedded <br>}
       [-colorok] pnmfile1 pnmfile2 ...

       Minimum unique abbreviation of option is acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of  the  equals  sign  to  separate  an
       option name from its value.



DESCRIPTION
       This program is part of Netpbm(1)

       pnmtopclxl  reads  one  or  more PNM input streams, each containing one or more PNM images, and generates a sequence of output pages in the HP PCL-XL (formerly named PCL 6) printer control language.
       You can send this stream to a PCL-XL printer to print the images.

       Alternatively, you can make pnmtopclxl generate just the PCL-XL instructions to print an image, which you can embed in your own PCL-XL stream to place an image on  one  of  your  pages.   (-embedded
       option).

       If the input is PPM, the output is a color printer stream (the PCL color space is RGB).  Otherwise, the output is grayscale (the PCL color space is grayscale).  If you want a grayscale output from a
       color input, run your input through ppmtopgm(1) -colorok option for more information about choosing between color and grayscale.

       The output goes to Standard Output.  All of the pages go to one file, concatenated in the same order as the input images.



OPTIONS
       -dpi=N This option selects the resolution of the image (not the printer!).  N is the resolution in dots per inch, from 1 to 65535.  The default is 300.


       -xoffs=N
              This option and -yoffs determine the location on the page of the upper left corner of each image.  Note that the image may have built in borders too, which would make the  main  image  within
              more left and down that what you specify here.

              -xoffs and -yoffs specify the distance from the left of the page and from the top of the page, respectively, in inches, of the upper left corner of the image.  The default for each is zero.

              These options are meaningless if you specify -center.


       -yoffs N
              See -xoffs.


       -center
              This option tells pnmtopclxl to center each image on the page.  If you don't specify this option, the position of an image on the page is determined by -xoffs and -yoffs (or their defaults).


       -duplex={vertical|horizontal}
              This  option  causes  pnmtopclxl  to create a printer stream that prints pages on both sides of the sheet of paper.  vertical means to print them so that the left edge of both pages is on the
              same edge of the sheet, while horizontal means the more usual duplexing where the top of both pages is on the same edge of the sheet.


       -format=paperformat
              This option selects the media (e.g. paper size) that the printer control stream specifies.  paperformat is one of the following self-explanatory keywords:



       ·      letter

       ·      legal

       ·      a3

       ·      a4

       ·      a5

       ·      a6

       ·      jb4

       ·      jb5

       ·      jb6

       ·      exec

       ·      ledger

       ·      b5envelope

       ·      c5envelope

       ·      com10envelope

       ·      monarchenvelope

       ·      dlenvelope

       ·      jpostcard

       ·      jdoublepostcard


              The default is letter.


       -feeder=N
              This options selects the media source (e.g. paper tray) that the printer control stream specifies.


       -copies=N
              This option specifies the number of copies that the printer control stream tells the printer to print.


       -rendergray
              This option causes pnmtopclxl to include in the output stream a command to set the RENDERMODE environment variable to GRAYSCALE, which typically causes  the  printer  to  print  in  grayscale
              regardless of the colors in the input, and may cause it to run much faster even if the image is grayscale anyway.

              This option was new in Netpbm 10.29 (August 2005).


       -jobsetup=filename
              This option causes pnmtopclxl to include arbitrary job setup PJL commands at the beginning of the output stream.  It reads them from the named file.

              pnmtopclxl does not inspect these commands in any way, but it does expect them to be job setup commands.  If you have garbage in your file, you will hear from the printer.

              This option was new in Netpbm 10.29 (August 2005).


       -colorok
              This  option  simply tells pnmtopclxl not to warn you if you supply a color input and therefore get color output.  By default, pnmtopclxl issues a warning any time it produces a color printer
              stream because it is usually a mistake.  It's a mistake because PCL XL is mainly used for laser printers, and laser printers are mainly black and white.  If you send a color print stream to a
              black  and  white printer, it typically refuses to print anything, and even if it manages to convert it to black and white and print it, it takes 3 times as long to transmit a color stream to
              the printer than to transmit the grayscale image that gives the same result.


       -embedded
              Without this option, pnmtopclxl generates an entire printer control stream that sets up the printer, ejects pages, and places a lone image on each page.  With the option, pnmtopclxl generates
              only the instructions to generate the image itself.  This is not useful all by itself, but you can embed it in a suitable PCL-XL stream in order to add an image to it.

              This makes sense only for a single image, so you cannot specify multiple input files and if an input file has multiple images in it, pnmtopclxl ignores any after the first (it won't even read
              them).

              All the options that control the printer control stream outside the image itself, such as -xoffs and -feeder are invalid with -embedded.

              This option was new in Netpbm 10.54 (March 2011).





SEE ALSO
       ppmtolj(1) , pbmtolj(1) , ppmtopj(1) , ppmtopjxl(1) , thinkjettopbm(1) , ppm(5)



HISTORY
       pnmtopclxl was added to Netpbm in Release 10.6 (July 2002).  It was contributed by Jochen Karrer.



netpbm documentation                                                                            22 March 2011                                                                       Pnmtopclxl User Manual(0)
