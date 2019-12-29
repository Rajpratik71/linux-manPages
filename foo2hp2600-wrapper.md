foo2hp2600-wrapper(1)                   General Commands Manual                  foo2hp2600-wrapper(1)

NAME
       foo2hp2600-wrapper - Convert Postscript into a ZJS printer stream

SYNOPSIS
       foo2hp2600-wrapper [options] [ps-file]

DESCRIPTION
       foo2hp2600-wrapper  is  a  Foomatic  compatible  printer wrapper for the foo2hp printer driver.
       This script reads a Postscript ps-file or  standard  input  and  converts  it  to  Zenographics
       ZjStream  printer  format  for  driving the Hewlett-Packard 2600n color laser printer and other
       Zenographics-based printers.

       This script can be used in a standalone fashion, but is intended to be called  from  a  printer
       spooler system which uses the Foomatic printer database.

COMMAND LINE OPTIONS
   Normal Options
       These  are the options used to select the parameters of a print job that are usually controlled
       on a per job basis.

       -b bits
              Number of bits per plane. 1 or 2. [1].

       -c     Print in color (else monochrome).

       -d duplex
              Duplex code to send to printer [1].
              │        │               │
              │1   off │ 2   long edge │ 3   short edge

       -m media
              Media code to send to printer [1].

              ──────────────────────────
              Media          HPLJ 2600n
              ──────────────────────────
              plain               1
              preprinted        514
              letterhead        513
              transparency        2
              prepunched        515
              labels            265
              bond              260
              recycled          516
              color             512
              tough             276
              envelope          267
              light             258
              heavy             262
              cardstock         261
              lightglossy       268
              glossy            269
              heavyglossy       270
              cover             277
              photo             278

       -p paper
              Paper size code to send to printer [1].

              ┌─────────────────┬─────────────┐
              │ 1   letter      │  9   A4     │
              │ 5   legal       │ 11   A5     │
              │ 7   executive   │ 13   B5jis  │
              │20   env #10     │ 27   env DL │
              │28   env C5      │ 34   env B5 │
              │37   env Monarch │             │
              └─────────────────┴─────────────┘
       -n copies
              Number of copies [1].

       -r xresxyres
              Set device resolution in pixels/inch [1200x600].

       -s source
              Source (Input Slot) code to send to printer [7].
              │           │
              │1   tray 2 │ 4   manual/tray 1
              │2   tray 3 │ 7   auto

       -t     Draft mode.  Every other pixel is white.

       -2 -3 -4 -5 -6 -8 -9 -10 -12 -14 -15 -16 -18
              Print in N-up.  Requires the psutils package.

       -o orient
              Orientation used for N-up.

              Portrait    -op   (normal)
              Landscape   -ol   (rotated 90 degrees anticlockwise)
              Seascape    -os   (rotated 90 degrees clockwise)

   Printer Tweaking Options
       These are the options used to customize the operation of foo2hp for a particular printer.

       -u xoffxyoff
              Set the offset of the start of the printable region from the upper left corner, in  pix‐
              els  [varies  with  paper size].  The defaults should work on the 2200DL and 2300DL, and
              have not been tested on any other printers.

       -l xoffxyoff
              Set the offset of the end of the printable region from the lower right corner, in pixels
              [varies  with  paper size].  The defaults should work on the 2200DL and 2300DL, and have
              not been tested on any other printers.

       -L mask
              Send the logical clipping values from -u/-l in the ZjStream.  foo2hp2600-wrapper  always
              runs  Ghostscript with the ideal page dimensions, so that the scale of the image is cor‐
              rect, regardless whether or not the printer has unprintable  regions.   This  option  is
              used  to  move  the  position of the clipped image back to where it belongs on the page.
              The default is to send the amount which was clipped by -u and -l, and should be good  in
              most cases.

              0   don't send any logical clipping amounts
              1   only send Y clipping amount
              2   only send X clipping amount
              3   send both X and Y clipping amounts

       -O parm=val
              Alignment  of  CMYK.   parm is c, m, y, or k.  val is in rows.  Multiple options are al‐
              lowed.  The default is "-Oc=0 -Om=0 -Oy=0 -Ok=0".

       -P     Do not send START_PLANE codes on monochrome output.  May be needed by  some  monochrome-
              only printers, such as the HP LaserJet 1000.

       -X padlen
              Add extra zero padding to the end of BID segments.  The default is 16 bytes.  Padding 16
              bytes of zeroes is needed for older ZjStream printers, such as the Minolta 2200DL and HP
              LaserJet 1000, and seems harmless to newer ones, such as the Minolta 2300DL.  So the de‐
              fault should be good for all cases.

       -z model
              Model: Model: 0=HP CLJ 1600/2600n; 1=HP CLJ CP1215

   Color Tweaking Options
       These are the options used to control the quality of color output.  Color  correction  is  cur‐
       rently a WORK IN PROGRESS.

       -g gsopts
              Additional  options  to pass to Ghostscript, such as -g“-dDITHERPPI=nnn”, etc.  This op‐
              tion may appear more than once.

       -G profile.icm
              Convert profile.icm to a Postscript color  rendering  dictionary  (CRD)  using  foo2zjs-
              icc2ps and adjust the printer colors by using the Postscript setcolorrendering operator.
              If profile.icm is none.icm, then prepare for ordering a ICM custom printer profile (i.e.
              from www.ICCFactory.com).

       -G gamma-file.ps
              Prepend gamma-file.ps to the Postscript input to perform color correction using the set‐
              colortransfer Postscript operator.  For example, the file might contain:
              {0.333 exp} {0.333 exp} {0.333 exp} {0.333 exp} setcolortransfer

       -I intent
              Select profile intent from the ICM file.   0=Perceptual,  1=Colorimetric,  2=Saturation,
              3=Absolute.  Default is 0 (perceptual).

   Debugging Options
       These options are used for debugging foo2hp and its wrapper.

       -S plane
              Output  just  a  single  color plane from a color print and print it on the black plane.
              The default is to output all color planes.

              1   Cyan
              2   Magenta
              3   Yellow
              4   Black

       -D level
              Set Debug level [0].

EXAMPLES
       Create a monochrome ZjStream from a Postscript document, examine it, and then print it using  a
       RAW print queue:

              foo2hp2600-wrapper testpage.ps > testpage.zm
              zjsdecode < testpage.zm
              lpr -P raw testpage.zm

       Create a color ZjStream stream from a Postscript document:

              foo2hp2600-wrapper -c testpage.ps > testpage.zc

FILES
       /usr/bin/foo2hp2600-wrapper

SEE ALSO
       foo2hp(1), zjsdecode(1)

AUTHOR
       Rick Richardson <rick.richardson@comcast.net>
       http://foo2hp.rkkda.com/

