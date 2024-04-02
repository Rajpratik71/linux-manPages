foo2slx-wrapper(1)                                                                      General Commands Manual                                                                     foo2slx-wrapper(1)

NAME
       foo2slx-wrapper - Convert Postscript into a SLX printer stream

SYNOPSIS
       foo2slx-wrapper [options] [ps-file]

DESCRIPTION
       foo2slx-wrapper is a Foomatic compatible printer wrapper for the foo2slx printer driver.  This script reads a Postscript ps-file or standard input and converts it to Software Imaging K.K. SLX
       printer format for driving the Lexmark C500 network color laser printer and other SLX-based printers.

       This script can be used in a standalone fashion, but is intended to be called from a printer spooler system which uses the Foomatic printer database.

COMMAND LINE OPTIONS
   Normal Options
       These are the options used to select the parameters of a print job that are usually controlled on a per job basis.

       -c     Print in color (else monochrome).

       -m media
              Media code to send to printer [0].

              ───────────────────────
              Media          SLX
              ───────────────────────
              plain           0
              transparency    1
              labels          2
              thick1          3
              envelope1       4
              thin            5
              thick2          6
              envelope2       7
              middle          8
              special         9

       -p paper
              Paper size code to send to printer [6].

              ┌───────────────┬─────────────┐
              │ 6   letter    │  2   A4     │
              │ 9   legal     │  4   B5     │
              │ 8   executive │  5   B5iso  │
              │10   env #10   │ 11   env DL │
              └───────────────┴─────────────┘
       -n copies
              Number of copies [1].

       -r xresxyres
              Set device resolution in pixels/inch [1200x600].

       -s source
              Source (Input Slot) code to send to printer [0].

              ┌─────────┬───────────────┐
              │0   auto │ 1   cassette1 │
              └─────────┴───────────────┘
       -2 -3 -4 -5 -6 -8 -9 -10 -12 -14 -15 -16 -18
              Print in N-up.  Requires the psutils package.

       -o orient
              Orientation used for N-up.

              Portrait    -op   (normal)
              Landscape   -ol   (rotated 90 degrees anticlockwise)
              Seascape    -os   (rotated 90 degrees clockwise)

   Printer Tweaking Options
       These are the options used to customize the operation of foo2slx for a particular printer.

       -u xoffxyoff
              Set the offset of the start of the printable region from the upper left corner, in pixels [varies with paper size].  The defaults should work on the 2200DL and  2300DL,  and  have  not
              been tested on any other printers.

       -l xoffxyoff
              Set the offset of the end of the printable region from the lower right corner, in pixels [varies with paper size].  The defaults should work on the 2200DL and 2300DL, and have not been
              tested on any other printers.

       -L mask
              Send the logical clipping values from -u/-l in the ZjStream.  foo2slx-wrapper always runs Ghostscript with the ideal page dimensions, so that the scale of the image is correct, regard‐
              less  whether  or  not the printer has unprintable regions.  This option is used to move the position of the clipped image back to where it belongs on the page.  The default is to send
              the amount which was clipped by -u and -l, and should be good in most cases.

              0   don't send any logical clipping amounts
              1   only send Y clipping amount
              2   only send X clipping amount
              3   send both X and Y clipping amounts

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
       These options are used for debugging foo2slx and its wrapper.

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

              foo2slx-wrapper testpage.ps > testpage.zm
              slxdecode < testpage.zm
              lpr -P raw testpage.zm

       Create a color ZjStream stream from a Postscript document:

              foo2slx-wrapper -c testpage.ps > testpage.zc

FILES
       /usr/bin/foo2slx-wrapper

SEE ALSO
       foo2slx(1), slxdecode(1)

AUTHOR
       Rick Richardson <rick.richardson@comcast.net>
       http://foo2slx.rkkda.com/

