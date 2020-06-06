foo2xqx-wrapper(1)                                                                       General Commands Manual                                                                       foo2xqx-wrapper(1)

NAME
       foo2xqx-wrapper - Convert Postscript into a XQX printer stream

SYNOPSIS
       foo2xqx-wrapper [options] [ps-file]

DESCRIPTION
       foo2xqx-wrapper is a Foomatic compatible printer wrapper for the foo2xqx printer driver.  This script reads a Postscript ps-file or standard input and converts it to XQX printer format for driv‐
       ing the HP LaserJet P1005/P1006/P1007/P1008, the HP LaserJet P1505, the HP LaserJet P2014, the HP LaserJet M1005 MFP, the HP LaserJet M1120 MFP, the HP LaserJet Pro M1212nf MFP, and  other  XQX-
       based printers.

       This script can be used in a standalone fashion, but is intended to be called from a printer spooler system which uses the Foomatic printer database.

COMMAND LINE OPTIONS
   Normal Options
       These are the options used to select the parameters of a print job that are usually controlled on a per job basis.

       -d duplex
              Duplex code to send to printer [1].
              │        │               │
              │1   off │ 2   long edge │ 3   short edge

       -m media
              Media code to send to printer [1].

              ─────────────────────────
              Media          M1005
              ─────────────────────────
              standard          1
              transparency      2
              envelope        257
              letterhead      259
              thick           261
              postcard        262
              labels          263

       -p paper
              Paper size code to send to printer [1].

              ┌──────────────────┬───────────────────┐
              │  1   letter      │   9   A4          │
              │  5   legal       │  11   A5          │
              │  7   executive   │  13   B5          │
              │ 20   env #10     │  27   env DL      │
              │ 28   env C5      │  34   env B5      │
              │ 37   env Monarch │ 257   16k 197x273 │
              │263   16k 184x260 │ 263   16k 195x270 │
              └──────────────────┴───────────────────┘
       -n copies
              Number of copies [1].

       -r xresxyres
              Set device resolution in pixels/inch [1200x600].

       -s source
              Source (Input Slot) code to send to printer [7].

              ┌──────────┬────────────┐
              │1   upper │ 4   manual │
              │2   lower │ 7   auto   │
              └──────────┴────────────┘
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
       These are the options used to customize the operation of foo2xqx for a particular printer.

       -u xoffxyoff
              Set  the  offset of the start of the printable region from the upper left corner, in pixels [varies with paper size].  The defaults should work on the 2200DL and 2300DL, and have not been
              tested on any other printers.

       -l xoffxyoff
              Set the offset of the end of the printable region from the lower right corner, in pixels [varies with paper size].  The defaults should work on the 2200DL and 2300DL, and  have  not  been
              tested on any other printers.

       -L mask
              Send the logical clipping values from -u/-l in the ZjStream.  foo2xqx-wrapper always runs Ghostscript with the ideal page dimensions, so that the scale of the image is correct, regardless
              whether or not the printer has unprintable regions.  This option is used to move the position of the clipped image back to where it belongs on the page.  The default is to send the amount
              which was clipped by -u and -l, and should be good in most cases.

              0   don't send any logical clipping amounts
              1   only send Y clipping amount
              2   only send X clipping amount
              3   send both X and Y clipping amounts

   Debugging Options
       These options are used for debugging foo2xqx and its wrapper.

       -D level
              Set Debug level [0].

EXAMPLES
       Create a monochrome ZjStream from a Postscript document, examine it, and then print it using a RAW print queue:

              foo2xqx-wrapper testpage.ps > testpage.xqx
              xqxdecode < testpage.xqx
              lpr -P raw testpage.xqx

FILES
       /usr/bin/foo2xqx-wrapper

SEE ALSO
       foo2xqx(1), xqxdecode(1)

AUTHOR
       Rick Richardson <rick.richardson@comcast.net>
       http://foo2xqx.rkkda.com/

