foo2lava-wrapper(1)                                                                      General Commands Manual                                                                      foo2lava-wrapper(1)

NAME
       foo2lava-wrapper - Convert Postscript into a LAVAFLOW or OPL printer stream

SYNOPSIS
       foo2lava-wrapper [options] [ps-file]

DESCRIPTION
       foo2lava-wrapper  is  a  Foomatic  compatible  printer wrapper for the foo2lava printer driver.  This script reads a Postscript ps-file or standard input and converts it to Zenographics LAVAFLOW
       printer format for driving the Konica Minolta magicolor 1600W color laser printer, the Konica Minolta magicolor 1680MF/1690MF AIO printer, the Konica Minolta magicolor 2480/2490 MF AIO  printer,
       the Konica Minolta magicolor 2530 DL network color laser printer, and other Zenographics-based LAVAFLOW printers.

       This script can be used in a standalone fashion, but is intended to be called from a printer spooler system which uses the Foomatic printer database.

COMMAND LINE OPTIONS
   Normal Options
       These are the options used to select the parameters of a print job that are usually controlled on a per job basis.

       -c     Print in color (else monochrome).

       -C colormode
              Color correction mode [0].

               1   Photos (using m2300w CRDs)
               2   Photos and text (using m2300w CRDs)
               3   Graphics and text (using m2300w CRDs)
              10   ICM color profile (using -G *.icm file)

       -d duplex
              Duplex code to send to printer [1].
              │        │               │
              │1   off │ 2   long edge │ 3   short edge

       -m media
              Media code to send to printer [0].

              ──────────────────────────
              Media          2530DL
              ──────────────────────────
              plain             0
              transparency      4
              thick stock      20
              envelope         22
              letterhead       23
              postcard         25
              labels           26
              recycled         27

       -p paper
              Paper size code to send to printer [2].

              ┌──────────────────┬─────────────────────┐
              │  1   executive   │  25   A5            │
              │  2   letter      │  26   A4            │
              │  3   legal       │  45   B5jis         │
              │ 80   env Monarch │  65   B5iso         │
              │ 81   env #10     │  90   env DL        │
              │ 91   env C5      │  92   env B5        │
              │835   4x6" photo  │ 837   10x15cm photo │
              └──────────────────┴─────────────────────┘
       -n copies
              Number of copies [1].

       -r xresxyres
              Set device resolution in pixels/inch [1200x600].

       -s source
              Source (Input Slot) code to send to printer [255].
              │           │
              │1   Tray 1 │ 255   auto
              │4   Tray 2 │

       -t     Draft mode.  Every other pixel is white.

       -2 -3 -4 -5 -6 -8 -9 -10 -12 -14 -15 -16 -18
              Print in N-up.  Requires the psutils package.

       -o orient
              Orientation used for N-up.

              Portrait    -op   (normal)
              Landscape   -ol   (rotated 90 degrees anticlockwise)
              Seascape    -os   (rotated 90 degrees clockwise)

   Printer Tweaking Options
       These are the options used to customize the operation of foo2lava for a particular printer.

       -u xoffxyoff
              Set  the  offset of the start of the printable region from the upper left corner, in pixels [varies with paper size].  The defaults should work on the 2200DL and 2300DL, and have not been
              tested on any other printers.

       -l xoffxyoff
              Set the offset of the end of the printable region from the lower right corner, in pixels [varies with paper size].  The defaults should work on the 2200DL and 2300DL, and  have  not  been
              tested on any other printers.

       -L mask
              Send  the  logical  clipping values from -u/-l in the LAVAFLOW stream.  foo2lava-wrapper always runs Ghostscript with the ideal page dimensions, so that the scale of the image is correct,
              regardless whether or not the printer has unprintable regions.  This option is used to move the position of the clipped image back to where it belongs on the page.  The default is to send
              the amount which was clipped by -u and -l, and should be good in most cases.

              0   don't send any logical clipping amounts
              1   only send Y clipping amount
              2   only send X clipping amount
              3   send both X and Y clipping amounts

       -z model
              Model.  The  default is [0].

              model   protocol   Description
              0       LAVAFLOW   magicolor 2490 MF
              0       LAVAFLOW   magicolor 2530 DL
              1       OPL        magicolor 2480 MF
              2       LAVAFLOW   magicolor 1600W
              2       LAVAFLOW   magicolor 1680MF
              2       LAVAFLOW   magicolor 1690MF

   Color Tweaking Options
       These are the options used to control the quality of color output.  Color correction is currently a WORK IN PROGRESS.

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
       These options are used for debugging foo2lava and its wrapper.

       -S plane
              Output just a single color plane from a color print and print it on the black plane.  The default is to output all color planes.

              1   Cyan
              2   Magenta
              3   Yellow
              4   Black

       -D level
              Set Debug level [0].

EXAMPLES
       Create a monochrome LAVAFLOW stream from a Postscript document, examine it, and then print it using a RAW print queue:

              foo2lava-wrapper testpage.ps > testpage.zm
              lavadecode < testpage.zm
              lpr -P raw testpage.zm

       Create a color LAVAFLOW stream from a Postscript document:

              foo2lava-wrapper -c testpage.ps > testpage.zc

FILES
       /usr/bin/foo2lava-wrapper

SEE ALSO
       foo2lava(1), lavadecode(1) opldecode(1)

AUTHOR
       Rick Richardson <rick.richardson@comcast.net>
       http://foo2zjs.rkkda.com/

