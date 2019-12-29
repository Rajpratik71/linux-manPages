pnm2ppa(1)                              General Commands Manual                             pnm2ppa(1)

NAME
       pnm2ppa - convert portable anymap (PNM) images to HP's PPA printer format.

SYNOPSIS
       pnm2ppa [options] [ -i infile ] [ -o outfile ]

DESCRIPTION
       Reads  portable  anymap  (PNM)  format  as  input.  Binary  PNM formats pnmraw = {ppmraw (color
       pixmap), pgmraw (graymap), and pbmraw (black-and-white bitmap)} are strongly preferred.  Output
       stream  can  be  locally processed by Hewlett-Packard's Printing Performance Architecture (PPA)
       printers (HP DeskJet 710C, 712C, 720C, 722C, 820C, and 1000C series).

       (PNM format output can be produced from PostScript(tm) input by the GhostScript output  devices
       "pbmraw", "pgmraw" or "ppmraw",  or by "pnmraw", which will choose one of these  formats as ap‐
       propriate for the document.)  pnm2ppa assumes the input resolution is 600dpi (or 300dpi if  the
       command-line  option --dpi300 is used): input at higher/lower resolutions will result in a cor‐
       respondingly larger/smaller printed image, provided it is within  the  printer's  allowed  size
       range.

OPTIONS
       -b bottommargin
              Sets  the bottom margin bottommargin in units of 1/600 inches (e.g.,  -b 150 corresponds
              to 0.25").

       -B blackness
              Sets the black ink density blackness in drops per pixel (0,1,2,3,4).

       --bi   Force bidirectional print sweeps.

       --bw   Disables the color cartridge; will print in grey scale using only the black cartridge.

       -d     Displays the current configuration.

       --dpi300
              Treat input resolution as 300dpi instead of 600dpi.

       --eco  Econofast mode: lower print quality that is faster and saves ink.

       -f configFile
              Re-reads   configuration   from   configFile   (after   initially   reading   it    from
              /etc/pnm2ppa.conf).

       -F GammaFile
              Overrides  reading  the  color-correction  table  (Gamma  curve)  from  the default file
              /etc/pnm2ppa.gamma, and uses GammaFile instead.

       --fd   Enable fast ordered dithering instead of using the slower, but  beautiful,  Floyd-Stein‐
              berg dithering. (Has no effect in --bw mode.)

       -g     Prints a page of color intensity samples (for comparison with gamma.ppm data produced by
              calibrate_ppa).  This is part of a color-correction procedure; see  COLOR.txt  for  more
              details.

       -h, --help
              Displays program usage.

       -i infile
              Input file infile is either a path to a PPM file, or '-' to indicate stdin  (defaults to
              stdin).

       -l leftmargin
              Sets the left margin leftmargin in units of 1/600 inches (e.g., -l  150  corresponds  to
              0.25").

       --noGamma
              Switches off any color-correction.

       -o outfile | -
              Output file outfile is either a path to a file or device, or '-' to indicate stdout (de‐
              faults to stdout).

       -p     Disables the black ink cartridge; i.e.,  print  using only the color ink cartridge, even
              for printing "black".  This might be useful for printing high-quality color  images.

       -r rightmargin
              Sets  the right margin rightmargin in units of 1/600 inches (e.g., -r 150 corresponds to
              0.25").

       -s papersize
              Sets the default paper size (now used only for color-correction output produced  by  the
              -g  option).  In normal use, pnm2ppa now instead reads the paper dimensions from pnm in‐
              put file headers, and checks that it is a valid papersize for the given  printer  model.
              Possible values for papersize are a4 (A4), letter or us (US Letter, 8.5"x11"), legal (US
              Legal, 8.5"x14").  The default is US Letter.

       -t topmargin
              Sets the top margin topmargin in units of 1/600 inches (ie -t 150 corresponds to 0.25").

       --uni  Force unidirectional (left to right) print sweeps.  Useful if "shearing"  is  a  problem
              for high quality color images.

       -v printertype
              Selects  the printer model.  Possible values of printertype are: 710, 712, 720, 722, 820
              and 1000.  The default is the HP DeskJet 7X0 Series (710, 712, 720, 722).

       --verbose
              Displays the program's System Log messages on the standard output, as well.

       --version
              Displays the program's version information.

       -x xoffset
              Sets the x-offset xoffset from the left of the page. Units are 1/600 inches.

       -y yoffset
              Sets the y-offset yoffset from the top of the page. Units are 1/600 inches.

NOTES
       The default configuration file /etc/pnm2ppa.conf  is read in first. Command line arguments then
       modify the resulting definitions.

       The -v option resets all definitions (margins, offsets, etc.)  back to the inbuilt defaults for
       that printer and should be used before subsequent -b, -l, -r, -t, -x and -y arguments.

SEE ALSO
       pnm(5), ppm(5), pbm(5)

FILES
       /etc/pnm2ppa.conf
              Default configuration file.

       /etc/pnm2ppa.gamma
              Default Gamma (color-correction) file.

AUTHOR
       This code is licensed under the GNU Public License version 2. See LICENSE for details.

       (c) 1998-1999  Tim Norman

       (c) 1999  Giorgio Marzano

       (c) 1999  Andrew van der Stock

       (c) 1998-2002  Various authors for many, many fixes

HISTORY
       This program was originally pbm2ppa, written by Tim Norman. It originally supported  black  and
       white  output  on  the 820 series.  Tim added nascent color support in early 1999. In May 1999,
       Giorgio Marzano started making real headway in getting color support working  properly.  Andrew
       van  der  Stock  has  maintained  the  code  since  September  1999,  and  made it available at
       http://sourceforge.net/projects/pnm2ppa.

BUGS
       Faint horizontal lines marking boundaries between print sweeps may be  visible.   You  may  get
       better results when printing images, with the options:
         -p --uni  (this may no longer apply since recent code improvements).

                                              23 Jun 2002                                   pnm2ppa(1)
