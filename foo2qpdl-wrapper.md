foo2qpdl-wrapper(1)                                                                      General Commands Manual                                                                      foo2qpdl-wrapper(1)

NAME
       foo2qpdl-wrapper - Convert Postscript into a QPDL printer stream

SYNOPSIS
       foo2qpdl-wrapper [options] [ps-file]

DESCRIPTION
       foo2qpdl-wrapper is a Foomatic compatible printer wrapper for the foo2qpdl printer driver.  This script reads a Postscript ps-file or standard input and converts it to Samsung/Xerox QPDL printer
       format for driving the Samsung CLP-300, CLX-2160, CLX-3160, CLP-315, CLX-3175, CLP-600, CLP-610, CLP-620, CLP-360, CLP-365, and Xerox Phaser 6110 QPDL printers.

       This script can be used in a standalone fashion, but is intended to be called from a printer spooler system which uses the Foomatic printer database.

COMMAND LINE OPTIONS
   Normal Options
       These are the options used to select the parameters of a print job that are usually controlled on a per job basis.

       -c     Print in color (else monochrome).

       -C colormode
              Color correction mode [0].

               1   CRD
              10   ICM color profile (using -G *.icm file)

       -d duplex
              Duplex code to send to printer [1].
              │        │               │
              │1   off │ 2   long edge │ 3   short edge

       -m media
              Media code to send to printer [0].

              ────────────────────────
              Media          QPDL
              ────────────────────────
              plain            0
              thick            1
              thin             2
              bond             3
              color            4
              card             5
              labels           6
              envelope         7
              preprinted       8
              cotton           9
              recycled        10
              transparency    11
              archive         12

       -p paper
              Paper size code to send to printer [0].

              ┌──────────────┬──────────────────┐
              │ 0   letter   │  1   legal       │
              │ 2   A4       │  3   executive   │
              │ 6   env #10  │  7   env Monarch │
              │ 8   env C5   │  9   env DL      │
              │11   B5jis    │ 12   B5iso       │
              │16   A5       │ 17   A6          │
              │23   env C6   │ 24   folio       │
              │25   env 6.75 │ 26   env #9      │
              │28   oficio   │                  │
              └──────────────┴──────────────────┘
       -n copies
              Number of copies [1].

       -r xresxyres
              Set device resolution in pixels/inch [1200x600].

       -s source
              Source (Input Slot) code to send to printer [255].
              │          │
              │1   auto  │ 2   manual
              │3   multi │ 4   tray1

       -t     Draft mode.  Every other pixel is white.

       -2 -3 -4 -5 -6 -8 -9 -10 -12 -14 -15 -16 -18
              Print in N-up.  Requires the psutils package.

       -o orient
              Orientation used for N-up.

              Portrait    -op   (normal)
              Landscape   -ol   (rotated 90 degrees anticlockwise)
              Seascape    -os   (rotated 90 degrees clockwise)

   Printer Tweaking Options
       These are the options used to customize the operation of foo2qpdl for a particular printer.

       -u xoffxyoff
              Set the offset of the start of the printable region from the upper left corner, in pixels [varies with paper size].

       -l xoffxyoff
              Set the offset of the end of the printable region from the lower right corner, in pixels [varies with paper size].

       -L mask
              Send the logical clipping values from -u/-l in the QPDL stream.  foo2qpdl-wrapper always runs Ghostscript with the ideal page dimensions, so that  the  scale  of  the  image  is  correct,
              regardless whether or not the printer has unprintable regions.  This option is used to move the position of the clipped image back to where it belongs on the page.  The default is to send
              the amount which was clipped by -u and -l, and should be good in most cases.

              0   don't send any logical clipping amounts
              1   only send Y clipping amount
              2   only send X clipping amount
              3   send both X and Y clipping amounts

       -z model
              Printer model. Model 0 is the default.

              model   Description
              0       CLP-300, CLX-2160, CLX-3160
              1       CLP-600
              2       CLP-310, CLP-315, CLP-610, CLX-3175
              3       CLP-620, CLP-360, CLP-365

   Color Tweaking Options
       These are the options used to control the quality of color output.  Color correction is currently a WORK IN PROGRESS.

       -a parm=val
              Color Adjust.  parm is b, c, s, cr, mg, yb for brightness, contrast, saturation, cyan-red balance, magenta-green balance, and yellow-blue balance.  val is 0 to 100.  Multiple options  are
              allowed.  The default is "-ab=50 -ac=50 -as=50 -acr=50 -amg=50 -ayb=50".  This only works when the -z3 (e.g. CLP-365) model is set!

       -g gsopts
              Additional options to pass to Ghostscript, such as -g“-dDITHERPPI=nnn”, etc.  This option may appear more than once.

       -G profile.icm
              Convert  profile.icm  to  a  Postscript  color  rendering dictionary (CRD) using foo2zjs-icc2ps and adjust the printer colors by using the Postscript setcolorrendering operator.  (WORK IN
              PROGRESS).

       -G gamma-file.ps
              Prepend gamma-file.ps to the Postscript input to perform color correction using the setcolortransfer Postscript operator.  For example, the file might contain:
              {0.333 exp} {0.333 exp} {0.333 exp} {0.333 exp} setcolortransfer

       -I intent
              Select profile intent from the ICM file.  0=Perceptual, 1=Colorimetric, 2=Saturation, 3=Absolute.  Default is 0 (perceptual).

   Debugging Options
       These options are used for debugging foo2qpdl and its wrapper.

       -S plane
              Output just a single color plane from a color print and print it on the black plane.  The default is to output all color planes.

              1   Cyan
              2   Magenta
              3   Yellow
              4   Black

       -D level
              Set Debug level [0].

EXAMPLES
       Create a monochrome QPDL stream from a Postscript document, examine it, and then print it using a RAW print queue:

              foo2qpdl-wrapper testpage.ps > testpage.zm
              qpdldecode < testpage.zm
              lpr -P raw testpage.zm

       Create a color QPDL stream from a Postscript document:

              foo2qpdl-wrapper -c testpage.ps > testpage.zc

FILES
       /usr/bin/foo2qpdl-wrapper

SEE ALSO
       foo2qpdl(1), qpdldecode(1)

AUTHOR
       Rick Richardson <rick.richardson@comcast.net>
       http://foo2qpdl.rkkda.com/

