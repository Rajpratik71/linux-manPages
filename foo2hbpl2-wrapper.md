foo2hbpl2-wrapper(1)                                                                    General Commands Manual                                                                   foo2hbpl2-wrapper(1)

NAME
       foo2hbpl2-wrapper - Convert Postscript into a ZJS printer stream

SYNOPSIS
       foo2hbpl2-wrapper [options] [ps-file]

DESCRIPTION
       foo2hbpl2-wrapper is a Foomatic compatible printer wrapper for the foo2hbpl2 printer driver.  This script reads a Postscript ps-file or standard input and converts it to Zenographics ZjStream
       printer format for driving the Dell 1355, Dell C1765, Epson AcuLaser M1400, Epson AcuLaser CX17NF, Fuji Xerox DocuPrint CM205, Fuji Xerox DocuPrint CM215, Fuji  Xerox  DocuPrint  P205,  Xerox
       Phaser 3010, Xerox Phaser 3040, Xerox WorkCentre 3045 MFP, and Xerox WorkCentre 6015 MFP printers.

       This script can be used in a standalone fashion, but is intended to be called from a printer spooler system which uses the Foomatic printer database.

COMMAND LINE OPTIONS
   Normal Options
       These are the options used to select the parameters of a print job that are usually controlled on a per job basis.

       -c     Print in color (else monochrome).

       -C colormode
              Color correction mode [0].

              10   ICM color profile (using -G *.icm file)

       -d duplex
              Duplex code to send to printer [1].
              │        │               │
              │1   off │ 2   long edge │ 3   short edge

       -m media
              Media code to send to printer [1].

              ─────────────────
              Media       HBPL
              ─────────────────
              plain          1
              bond           2
              lwcard         3
              lwgcard        4
              labels         5
              envelope       6
              recycled       7
              plain2         8
              bond2          9
              lwcard2       10
              lwgcard2      11
              recycled2     12

       -p paper
              Paper size code to send to printer [1].

              ────────────────────────────
              Paper                  HBPL
              ────────────────────────────
              A4                        1
              B5jis                     2
              A5                        3
              letter                    4

              executive                 5
              fanfold german legal      6
              folio                     6
              legal                     7
              env#10                    9
              envMonarch               10
              envC5                    11
              envDL                    12

       -n copies
              Number of copies [1].

       -r xresxyres
              Set device resolution in pixels/inch [1200x600].

       -s source
              Source (Input Slot) code to send to printer [7].
              │          │
              │1   upper │ 4   manual
              │2   lower │ 7   auto

       -t     Draft mode.  Every other pixel is white.

       -T density
              Print density (1-5).  The default is 3 (medium).

       -2 -3 -4 -5 -6 -8 -9 -10 -12 -14 -15 -16 -18
              Print in N-up.  Requires the psutils package.

       -o orient
              Orientation used for N-up.

              Portrait    -op   (normal)
              Landscape   -ol   (rotated 90 degrees anticlockwise)
              Seascape    -os   (rotated 90 degrees clockwise)

   Printer Tweaking Options
       These are the options used to customize the operation of foo2hbpl2 for a particular printer.

       -u xoffxyoff
              Set  the  offset  of  the start of the printable region from the upper left corner, in pixels [varies with paper size].  The defaults should work on the 2200DL and 2300DL, and have not
              been tested on any other printers.

       -l xoffxyoff
              Set the offset of the end of the printable region from the lower right corner, in pixels [varies with paper size].  The defaults should work on the 2200DL and 2300DL, and have not been
              tested on any other printers.

       -L mask
              Send  the  logical  clipping  values  from  -u/-l in the ZjStream.  foo2hbpl2-wrapper always runs Ghostscript with the ideal page dimensions, so that the scale of the image is correct,
              regardless whether or not the printer has unprintable regions.  This option is used to move the position of the clipped image back to where it belongs on the page.  The default  is  to
              send the amount which was clipped by -u and -l, and should be good in most cases.

              0   don't send any logical clipping amounts
              1   only send Y clipping amount
              2   only send X clipping amount
              3   send both X and Y clipping amounts

       -P     Do not send START_PLANE codes on monochrome output.  May be needed by some monochrome-only printers, such as the HP LaserJet 1000.

       -X padlen
              Add extra zero padding to the end of BID segments.  The default is 16 bytes.  Padding 16 bytes of zeroes is needed for older ZjStream printers, such as the Minolta 2200DL and HP Laser‐
              Jet 1000, and seems harmless to newer ones, such as the Minolta 2300DL.  So the default should be good for all cases.

   Color Tweaking Options
       These are the options used to control the quality of color output.  Color correction is currently a WORK IN PROGRESS.

       -g gsopts
              Additional options to pass to Ghostscript, such as -g“-dDITHERPPI=nnn”, etc.  This option may appear more than once.

       -G profile.icm
              Convert profile.icm to a Postscript color rendering dictionary (CRD) using foo2zjs-icc2ps and adjust the printer colors by using the Postscript setcolorrendering  operator.   (WORK  IN
              PROGRESS).

       -G gamma-file.ps
              Prepend gamma-file.ps to the Postscript input to perform color correction using the setcolortransfer Postscript operator.  For example, the file might contain:
              {0.333 exp} {0.333 exp} {0.333 exp} {0.333 exp} setcolortransfer

       -I intent
              Select profile intent from the ICM file.  0=Perceptual, 1=Colorimetric, 2=Saturation, 3=Absolute.  Default is 0 (perceptual).

   Debugging Options
       These options are used for debugging foo2hbpl2 and its wrapper.

       -S plane
              Output just a single color plane from a color print and print it on the black plane.  The default is to output all color planes.

              1   Cyan
              2   Magenta
              3   Yellow
              4   Black

       -D level
              Set Debug level [0].

EXAMPLES
       Create a monochrome ZjStream from a Postscript document, examine it, and then print it using a RAW print queue:

              foo2hbpl2-wrapper testpage.ps > testpage.prn
              hbpl2decode < testpage.prn
              lpr -P raw testpage.prn

       Create a color ZjStream stream from a Postscript document:

              foo2hbpl2-wrapper -c testpage.ps > testpage.prn

FILES
       /usr/bin/foo2hbpl2-wrapper

SEE ALSO
       foo2hbpl2(1), hbpldecode(1)

AUTHOR
       Rick Richardson <rick.richardson@comcast.net>
       http://foo2hbpl.rkkda.com/

