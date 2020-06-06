foo2oak-wrapper(1)                                                                       General Commands Manual                                                                       foo2oak-wrapper(1)

NAME
       foo2oak-wrapper - Convert Postscript into an OAKT printer stream

SYNOPSIS
       foo2oak-wrapper [options] [ps-file]

DESCRIPTION
       foo2oak-wrapper  is a Foomatic compatible printer wrapper for the foo2oak printer driver.  This script reads a Postscript ps-file or standard input and converts it to Oak Technology OAKT printer
       format for driving the HP Color LaserJet 1500 laser printer, Kyocera KM-1636/KM-2035 copiers, and other OAKT-based printers.

       This script can be used in a standalone fashion, but is intended to be called from a printer spooler system which uses the Foomatic printer database.

COMMAND LINE OPTIONS
   Normal Options
       These are the options used to select the parameters of a print job that are usually controlled on a per job basis.

       -b bits
              Number of bits per plane (1 or 2) [1].

       -c     Print in color (else monochrome).

       -d duplex
              Duplex code to send to printer [1].
              │        │               │
              │1   off │ 2   long edge │ 3   short edge

       -m media
              Media code to send to printer [1].

              ─────────────────────────────────────
              Media          HP CLJ 1500   KM-1635
                                 -z0         -z1
              ─────────────────────────────────────
              autoselect           0           0
              plain                1           1
              preprinted           2           2
              letterhead           3           3
              transparency         4           4
              prepunched           5           5
              labels               6           6
              bond                 7           7
              recycled             8           8
              color                9           9
              cardstock           10          10
              envelope            11          11
              light               13         na
              tough               14         na
              vellum             na           15
              rough              na           16
              thick              na           19
              highqual           na           20

       -p paper
              Paper size code to send to printer [1].

              ┌─────────────────┬─────────────────┐
              │  1   letter     │   3   ledger    │
              │  5   legal      │   6   statement │
              │  7   executive  │   8   A3        │
              │  9   A4         │  11   A5        │
              │ 12   B4         │  13   B5jis     │
              │ 14   folio      │  19   env9      │
              │ 20   env10      │  27   envDL     │
              │ 28   envC5      │  30   envC4     │
              │ 37   envMonarch │ 257   A6        │
              │258   B6         │ 259   B5iso     │
              │260   env6       │                 │
              └─────────────────┴─────────────────┘
       -n copies
              Number of copies [1].

       -r xresxyres
              Set device resolution in pixels/inch [600x600].

       -s source
              Source (Input Slot) code to send to printer [7].
              │           │
              │1   tray1  │ 2   tray2
              │4   manual │ 7   auto

       -2 -3 -4 -5 -6 -8 -9 -10 -12 -14 -15 -16 -18
              Print in N-up.  Requires the psutils package.

       -o orient
              Orientation used for N-up.

              Portrait    -op   (normal)
              Landscape   -ol   (rotated 90 degrees anticlockwise)
              Seascape    -os   (rotated 90 degrees clockwise)

   Printer Tweaking Options
       These are the options used to customize the operation of foo2oak for a particular printer.

       -u xoffxyoff
              Set the offset of the start of the printable region from the upper left corner, in pixels [varies with paper size].  The defaults should work on the 2200DL and 2300DL, and have  not  been
              tested on any other printers.

       -l xoffxyoff
              Set  the  offset  of the end of the printable region from the lower right corner, in pixels [varies with paper size].  The defaults should work on the 2200DL and 2300DL, and have not been
              tested on any other printers.

       -L mask
              Send the logical clipping values from -u/-l in the OAKT stream.  foo2oak-wrapper always runs Ghostscript with the ideal page dimensions, so that the scale of the image is correct, regard‐
              less  whether  or not the printer has unprintable regions.  This option is used to move the position of the clipped image back to where it belongs on the page.  The default is to send the
              amount which was clipped by -u and -l, and should be good in most cases.

              0   don't send any logical clipping amounts
              1   only send Y clipping amount
              2   only send X clipping amount
              3   send both X and Y clipping amounts

       -z model
              Model is 0 for the HP Color LaserJet 1500, and 1 for the Kyocera KM-1635/KM-2035 copiers.  The default is 0.

   Color Tweaking Options
       These are the options used to control the quality of color output.  Color correction is currently a WORK IN PROGRESS.

       -g gsopts
              Additional options to pass to Ghostscript, such as -g“-dDITHERPPI=nnn”, etc.  This option may appear more than once.

       -G profile.icm
              Convert profile.icm to a Postscript color rendering dictionary (CRD) using foo2zjs-icc2ps and adjust the printer colors by using  the  Postscript  setcolorrendering  operator.   (WORK  IN
              PROGRESS).

       -G gamma-file.ps
              Prepend gamma-file.ps to the Postscript input to perform color correction using the setcolortransfer Postscript operator.  For example, the file might contain:
              {0.333 exp} {0.333 exp} {0.333 exp} {0.333 exp} setcolortransfer

       -I intent
              Select profile intent from the ICM file.  0=Perceptual, 1=Colorimetric, 2=Saturation, 3=Absolute.  Default is 0 (perceptual).

   Debugging Options
       These options are used for debugging foo2oak and its wrapper.

       -S plane
              Output just a single color plane from a color print and print it on the black plane.  The default is to output all color planes.

              1   Cyan
              2   Magenta
              3   Yellow
              4   Black

       -D level
              Set Debug level [0].

EXAMPLES
       Create a monochrome OAKT stream from a Postscript document, examine it, and then print it using a RAW print queue:

              foo2oak-wrapper testpage.ps > testpage.oak
              oakdecode < testpage.oak
              lpr -P raw testpage.oak

       Create a color OAKT stream from a Postscript document:

              foo2oak-wrapper -c testpage.ps > testpage.oak

FILES
       /usr/bin/foo2oak-wrapper

SEE ALSO
       foo2oak(1), oak(1)

AUTHOR
       Rick Richardson <rick.richardson@comcast.net>
       http://foo2oak.rkkda.com/

