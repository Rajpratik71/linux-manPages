Pbmtoppa User Manual(0)                                                                                                                                                               Pbmtoppa User Manual(0)



NAME
       pbmtoppa - convert PBM image to HP Printer Performance Architecture (PPA)


SYNOPSIS
       pbmtoppa [pbm_file [ppa_file]]


DESCRIPTION
       This program is part of Netpbm(1)

       pbmtoppa  converts page images in PBM format to Hewlett Packard's PPA (Printer Performance Architecture) format, which is the data stream format expected by some HP 'Windows-only' printers including
       the HP Deskjet 820C series, the HP DeskJet 720 series, and the HP DeskJet 1000 series.

       pbm_file is the file specification of the input file or - for Standard Input.  The default is Standard Input.

       The input file contains one or more PBM images, with each one being a single page.  Each image must have the exact dimensions of a page (at 600 pixels per inch in both  directions).   Significantly,
       this is the format that Ghostscript produces.

       ppa_file is the file specification of the output file or - for Standard Output.  The default is Standard Output.

       To print Postscript on an HP PPA printer, just use Ghostscript with the pbmraw (or pbm) device driver.

       You can generate a test page for use with this program with pbmpage.

       You  can  also  set  up  a  printer  filter  so  you  can  submit  PBM input directly to your print queue.  See the documentation for your print spooler for information on how to do that, or look in
       hp820install.doc for an example lpd print filter for Postscript and text files.

       Sometimes, pbmtoppa generates a file which the printer will not print (because pbmtoppa's input is unprintable).  When this happens, all three lights blink to signal  the  error.   This  is  usually
       because  there  is  material  outside  of  the  printer's  printable area.  To make the file print, increase the margins via pbmtoppa options or a configuration file.  See the section on calibration
       ⟨#calibration⟩  below.


   About PPA
       The PPA printer language is a far lower level language than most.  When you use a PPA printer, most of the processing that a conventional printer does is done instead on  the  computer  end  of  the
       wire.   In  particular,  pbmtoppa  has  to do 'swath cutting,' and 'sweep formatting,' which other printers do themselves.  There is very little intelligence inside a PPA printer; pbmtoppa generates
       direct controls for the printer's hardware.

       The design goal of PPA was to reduce the cost of a printer by exploiting computing resources already present in the computer that requests the printing.  CPU power, ROM, and RAM requirements  inside
       the printer are all reduced compared to a conventional printer.

       PPA was new in 1997.  It was preceded by Hewlett Packard's PCL (Printer Control Language) language.  HP manufactured PPA printers for only a few years, and no one else ever did.


OPTIONS
       -v version
              printer version (720, 820, or 1000)


       -x xoff
              horizontal offset adjustment in 1/600 inches.


       -y yoff
              vertical offset adjustment in 1/600 inches.


       -t topmarg
              top margin in 1/600 inches    (default: 150 = 0.25 inch)


       -l leftmarg
              left margin in 1/600 inches   (default: 150 = 0.25 inch)


       -r rightmarg
              right margin in 1/600 inches (default: 150 = 0.25 inch)


       -b botmarg
              bottom margin in 1/600 inches (default: 150 = 0.25 inch)


       -s paper
              paper size: us or a4.  Default is us.


       -d dpi Print resolution in dots per inch.


       -f cfgfile
              Read parameters from the configuration file named cfgfile.  See CONFIGURATION FILES ⟨#configfile⟩



       The  offset  adjustments  you specify with -x and -y accumulate.  I.e. if you specify them multiple times, the total offset adjustment is the sum of the adjustments you specify.  -x 60 -x 120 is the
       same as -x 180.

       The -v option undoes any preceding -x and -y options, leaving the horizontal and vertical adjustments their default values.



CONFIGURATION FILES
       You can use a configuration file to specify parameters rather than use invocation options.  pbmtoppa processes the file /etc/pbmtoppa.conf, if it exists, before processing any options.  It then pro-
       cesses each configuration file named by a -f option in order, applying the parameters from the configuration file as if they were invocation options used in the place of the -f option.

       Configuration files have the following format:

       #Comment
       key1 value1
       key2 value2
       [etc.]

       Valid  keys  are  version,  xoffset, yoffset, topmargin, leftmargin, rightmargin, bottommargin, papersize, or any non-null prefix of these words.  Valid values are the same as with the corresponding
       invocation parameters.


EXAMPLES
       Print a test pattern:
       pbmpage | pbmppa >/dev/lp1

       Print three pages:
       cat page1.pbm page2.pbm page3.pbm | pbmppa >/dev/lp1

       Print the Postscript file myfile.ps:
       gs -sDEVICE=rawpbm -q -dNOPAUSE -r600 \
          -sOutputFile=- myfile.ps ;\
       | pbmtoppa | lpr


CALIBRATION
       To be able to print successfully and properly, you need to tell pbmtoppa an X and a Y offset appropriate for your printer to use when generating the page.  You can specify these offsets with the  -x
       and -y invocation options or with the xoff and yoff parameters in a pbmtoppa configuration file.

       To determine the correct offsets, use the pbmpage program.

       If  while  trying  to  do  this calibration, the printer refuses to print a page, but just blinks all three lights, specify large margins (e.g. 600 pixels -- one inch) via pbmpage invocation options
       while doing the calibration.

       For example:
       pbmpage | pbmtoppa >/dev/lp1
       or
       pbmpage | pbmtoppa | lpr -l

       (if your printer filter recognizes the '-l' (direct output) parameter).

       In the test pattern, the grid is marked off in pixel coordinate numbers.  Unfortunately, these coordinates are probably cut off before the edge of the paper.  You'll have to use a ruler to  estimate
       the pixel coordinate of the left and top edges of the actual sheet of paper (should be within +/- 300, may be negative; there are 600 pixels per inch).

       Add these coordinates to the X and Y offsets by either editing the configuration file or using the -x  and -y command-line parameters.

       When  pbmtoppa  is  properly  calibrated, the center mark should be in the center of the paper.  Also, the margins should be able to be as small as 1/4 inch without causing the printer to choke with
       'blinking lights syndrome'.


RED HAT LINUX INSTALLATION
       RedHat users may find the following tip from Panayotis Vryonis <vrypan@hol.gr> helpful.  The same should work for the 820 and 1000, but it hasn't been tested.  Also, use the pbmraw GSDriver  if  you
       have it; it's faster.

       Here is a tip to integrate HP720C support in RedHat's printtool:

       Install pbmtoppa. Copy pbmtoppa to /usr/bin.

       Edit 'printerdb' (in my system it is found in /usr/lib/rhs/rhs-printfilters ) and append the following lines:


       ----------------------Cut here-----------------------

       StartEntry: DeskJet720C
         GSDriver: pbm
         Description: {HP DeskJet 720C}
         About: { \
               This driver drives the HP DeskJet 720C \
               inkjet printer. \
               It does not support color printing. \
               IMPORTANT! Insert \
                  '- | pbm2ppa -' \
               in the 'Extra GS Options ' field.\
             }

         Resolution: {600} {600} {}

       EndEntry
       ----------------------------------------------------


       Now you can add an HP720C printer just like any other, using printtool.


SEE ALSO
       pbmpage(1) , pstopnm(1) , pbm(5)


       This  program was derived from pbm2ppa.  pbm2ppa is obsolete and has been replaced by pnm2ppa, which does the same things as pbmtoppa except it also works with color and has lots more features.  See
       http://pnm2ppa.sourceforge.net ⟨http://pnm2ppa.sourceforge.net⟩  for more information about the PPA protocol and the separately distributed pnm2ppa program.

       The file INSTALL-MORE in the pbmtoppa directory of the Netpbm source code contains detailed instructions on setting up a system to use pbmtoppa to allow convenient printing on HP PPA  printers.   It
       was written by Michael Buehlmann.


AUTHOR
       Tim Norman.  Copyright (C) 1998.  Licensed under GNU Public License

       Manual page by Bryan Henderson, May 2000.



netpbm documentation                                                                             01 May 2005                                                                          Pbmtoppa User Manual(0)
