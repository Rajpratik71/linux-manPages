foo2hiperc-wrapper(1)                   General Commands Manual                  foo2hiperc-wrapper(1)

NAME
       foo2hiperc-wrapper - Convert Postscript into a HIPERC printer stream

SYNOPSIS
       foo2hiperc-wrapper [options] [ps-file]

DESCRIPTION
       foo2hiperc-wrapper  is a Foomatic compatible printer wrapper for the foo2hiperc printer driver.
       This script reads a Postscript ps-file or standard input and converts  it  to  the  Oki  HIPERC
       printer format for driving the Oki C310dn, C3100, C3200, C3300n, C3400n, C5100n, C5500n, C5600n
       and the C5800n HIPERC printers.

       This script can be used in a standalone fashion, but is intended to be called  from  a  printer
       spooler system which uses the Foomatic printer database.

COMMAND LINE OPTIONS
   Normal Options
       These  are the options used to select the parameters of a print job that are usually controlled
       on a per job basis.

       -c     Print in color (else monochrome).

       -C colormode
              Color correction mode [0].

              10   ICM color profile (using -G *.icm file)

       -d duplex
              Duplex code to send to printer [1].
              │        │               │
              │1   off │ 2   long edge │ 3   short edge

       -m media
              Media code to send to printer [0].

              ──────────────────────────
              Media          HIPERC
              ──────────────────────────
              plain            0
              labels           1
              transparency     2

       -p paper
              Paper size code to send to printer [2].

              ┌─────────────┬─────────────────────┐
              │ 1   A4      │  2   letter         │
              │ 3   legal   │ -    -              │
              │ 5   A5      │  6   B5jis          │
              │ 7   A6      │  8   env Monarch    │
              │ 9   env DL  │ 10   env C5         │
              │11   env #10 │ 12   executive      │
              │13   env #9  │ 14   legal 13.5"    │
              │15   A3      │ 16   tabloid/ledger │
              └─────────────┴─────────────────────┘
       -n copies
              Number of copies [1].

       -r xresxyres
              Set device resolution in pixels/inch [600x600].

       -s source
              Source (Input Slot) code to send to printer [0].
              │                │
              │0   auto select │
              │1   tray1       │ 2   tray2
              │3   multi       │ 4   manual

       -t     Draft mode.  Every other pixel is white.

       -2 -3 -4 -5 -6 -8 -9 -10 -12 -14 -15 -16 -18
              Print in N-up.  Requires the psutils package.

       -o orient
              Orientation used for N-up.

              Portrait    -op   (normal)
              Landscape   -ol   (rotated 90 degrees anticlockwise)
              Seascape    -os   (rotated 90 degrees clockwise)

   Printer Tweaking Options
       These are the options used to customize the operation of foo2hiperc for a particular printer.

       -u xoffxyoff
              Set the offset of the start of the printable region from the upper left corner, in  pix‐
              els [varies with paper size].

       -l xoffxyoff
              Set the offset of the end of the printable region from the lower right corner, in pixels
              [varies with paper size].

       -L mask
              Send the logical clipping values from -u/-l in the  HIPERC  stream.   foo2hiperc-wrapper
              always  runs  Ghostscript with the ideal page dimensions, so that the scale of the image
              is correct, regardless whether or not the printer has unprintable regions.  This  option
              is  used to move the position of the clipped image back to where it belongs on the page.
              The default is to send the amount which was clipped by -u and -l, and should be good  in
              most cases.

              0   don't send any logical clipping amounts
              1   only send Y clipping amount
              2   only send X clipping amount
              3   send both X and Y clipping amounts

       -z model
              Model  is  0 for non-A3 sized printers, and 1 for A3/Tabloid/Ledger sized printers (i.e.
              C810, etc.).  The default is 0.

       -Z compressed
              Use uncompressed (0) or compressed (1) JBIG data.

   Color Tweaking Options
       These are the options used to control the quality of color output.  Color  correction  is  cur‐
       rently a WORK IN PROGRESS.

       -g gsopts
              Additional  options  to pass to Ghostscript, such as -g“-dDITHERPPI=nnn”, etc.  This op‐
              tion may appear more than once.

       -G profile.icm
              Convert profile.icm to a Postscript color  rendering  dictionary  (CRD)  using  foo2zjs-
              icc2ps and adjust the printer colors by using the Postscript setcolorrendering operator.
              (WORK IN PROGRESS).

       -G gamma-file.ps
              Prepend gamma-file.ps to the Postscript input to perform color correction using the set‐
              colortransfer Postscript operator.  For example, the file might contain:
              {0.333 exp} {0.333 exp} {0.333 exp} {0.333 exp} setcolortransfer

       -I intent
              Select  profile  intent  from the ICM file.  0=Perceptual, 1=Colorimetric, 2=Saturation,
              3=Absolute.  Default is 0 (perceptual).

   Debugging Options
       These options are used for debugging foo2hiperc and its wrapper.

       -S plane
              Output just a single color plane from a color print and print it  on  the  black  plane.
              The default is to output all color planes.

              1   Cyan
              2   Magenta
              3   Yellow
              4   Black

       -D level
              Set Debug level [0].

EXAMPLES
       Create a monochrome HIPERC stream from a Postscript document, examine it, and then print it us‐
       ing nc(1) or netcat(1):

              foo2hiperc-wrapper testpage.ps > testpage.hc
              hipercdecode < testpage.hc
              nc 192.168.1.NNN 9100 < testpage.hc

       Create a color HIPERC stream from a Postscript document:

              foo2hiperc-wrapper -c testpage.ps > testpage.hc

FILES
       /usr/bin/foo2hiperc-wrapper

SEE ALSO
       foo2hiperc(1), hipercdecode(1)

AUTHOR
       Rick Richardson <rick.richardson@comcast.net>
       http://foo2hiperc.rkkda.com/

