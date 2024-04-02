pnm2ppa(5 Feb 2000)                                                                                                                                                                       pnm2ppa(5 Feb 2000)



NAME
       pbm2ppa - convert portable bitmap (PBM) to HP's Printing Performance Architecture (PPA) file format

SYNOPSIS
       pbm2ppa [options] [ <infile] > [ <outfile]> ] ]


DESCRIPTION
       Reads portable bitmap (PBM) format as input.  Outputs a stream suitable for processing by  Hewlett-Packard's range of Printing Performance Architecture (PPA) printers.  pnm2ppa supports the HP 710c,
       712c, 720c, 722c, 820c, and 1000c series printers.

       (Portable bitmap (PBM) format output can be produced from PostScript(tm) input by the GhostScript driver "pbmraw".)

OPTIONS
       infile Input file infile is either a path to a file or device, or '-' to indicate stdin (defaults to stdin)



       outfile
              Output file outfile is either a path to a file or device, or '-' to indicate stdout (defaults to stdout)



       -b bottommargin
              Sets the bottom margin bottommargin in units of 1/600 inches (e.g.,  -b 150 = 0.25")



       -d     Displays the current configuration



       -f configfile
              Overrides reading the configuration from /etc/pnm2ppa.conf, and uses configfile instead.



       -h     Displays program usage




       -l leftmargin
              Sets the left margin leftmargin in units of 1/600 inches (e.g., -l 150 = 0.25")



       -r rightmargin
              Sets the right margin rightmargin in units of 1/600 inches (e.g., -r 150 = 0.25")


       -s papersize
              Sets the paper size. Possible values for papersize are a4 (A4), letter or us (US Letter, 8.5"x11"), and legal (US Legal, 8.5"x14").  The default is US Letter.


       -t topmargin
              Sets the top margin topmargin in units of 1/600 inches (ie -t 150 = 0.25")


       -v printertype
              Selects the printer model.  Possible values of printertype are: 710, 712, 720, 722, 820 and 1000.  The default is the HP DeskJet 7X0 Series (710, 712, 720, 722).



       -x xoffset
              Sets the x-offset xoffset from the left of the page. Units are 1/600 inches


       -y yoffset
              Sets the y-offset yoffset from the top of the page. Units are 1/600 inches



NOTES
       The configuration file is read in first. Command line arguments then modify the resulting definitions.

       The -x and -y options accumulate. The -v option resets all definitions back to an inbuilt default for that printer and should be used before subsequent -b -l -r, -t,  -x, and -y arguments.

SEE ALSO
       pbm(5)


FILES
       /etc/pbm2ppa.conf
              Default configuration file



AUTHOR
       This code is licensed under the GNU Public License version 2. See LICENSE for details.

       (c) 1998  Tim Norman

HISTORY
       This program was written by Tim Norman. It originally supported black and white output on the 820 series. This program is almost obsolete; its successor pnm2ppa will support color printing.

BUGS
       This is a stable driver, but does not support color printing.










                                                                                                                                                                                          pnm2ppa(5 Feb 2000)
