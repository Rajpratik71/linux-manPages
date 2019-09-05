foo2ddst(1)                                                                             General Commands Manual                                                                            foo2ddst(1)

NAME
       foo2ddst - Convert Ghostscript pbmraw into a DDST printer stream

SYNOPSIS
       foo2ddst [options] <pbmraw-file >ddst-file

DESCRIPTION
       foo2ddst converts Ghostscript pbmraw to monochrome DDST streams, for driving the Ricoh Aficio SP 112, the Ricoh Aficio SP 201, and other DDST-based printers.

COMMAND LINE OPTIONS
   Normal Options
       These are the options used to select the parameters of a print job that are usually controlled on a per job basis.

       -d duplex
              Duplex code to send to printer [1].
              │        │               │
              │1   off │ 2   long edge │ 3   short edge

       -g xpixxypix
              Set page dimensions in pixels [5100x6600].

       -m media
              Media code to send to printer [1].

              ──────────────────────────
              Media            Code
              ──────────────────────────
              plain&recycled    1
              paper             2
              thin              3
              thick             4
              recycled          5

       -p paper
              Paper code to send to printer [1].

              ┌──────────────────────┬──────────────────┐
              │ 1   letter           │  5   A4          │
              │ 2   legal            │  6   A5          │
              │ 3   executive        │  7   A6          │
              │ 4   invoice(5.5x8.5) │  8   B5 JIS      │
              │                      │ 10   16k 197x273 │
              │11   16k 184x260      │ 12   16k 195x270 │
              └──────────────────────┴──────────────────┘
       -n copies
              Number of copies [1].

       -r xresxyres
              Set device resolution in pixels/inch [600x600].

       -s source
              Source (InputSlot) code to send to printer [7].

              ┌───────────┬────────────┐
              │1   tray 1 │ 2   manual │
              └───────────┴────────────┘
       -t     Draft mode.  Every other pixel is white.

       -T density
              Print density (1-5).  The default is 3 (medium).

       -J filename
              Filename string to send to printer.

       -U username
              Username string to send to printer.

   Printer Tweaking Options
       These are the options used to customize the operation of foo2ddst for a particular printer.

       -u xoffxyoff
              Set the offset of the start of the printable region from the upper left corner, in pixels [0x0].

       -l xoffxyoff
              Set the offset of the end of the printable region from the lower right corner, in pixels [0x0].

       -L mask
              Send logical clipping amounts implied by -u/-l in the ZjStream [3].

              0   don't send any logical clipping amounts
              1   only send Y clipping amount
              2   only send X clipping amount
              3   send both X and Y clipping amounts

       -A     AllIsBlack: convert C=1,M=1,Y=1 to just K=1.  Works with bitcmyk input only.

       -B     BlackClears: K=1 forces C,M,Y to 0.  Works with bitcmyk input only.

   Debugging Options
       These options are used for debugging foo2ddst.

       -S plane
              Output just a single color plane from a color print and print it on the black plane.  The default is to output all color planes.

              1   Cyan
              2   Magenta
              3   Yellow
              4   Black

       -D level
              Set Debug level [0].

EXAMPLES
       Create a black and white DDST stream:

              gs -q -dBATCH -dSAFER -dQUIET -dNOPAUSE
                  -sPAPERSIZE=letter -r1200x600 -sDEVICE=pbmraw
                  -sOutputFile=- - < testpage.ps
              | foo2ddst -r1200x600 -g10200x6600 -p1 >testpage.zm

FILES
       /usr/bin/foo2ddst

SEE ALSO
       foo2ddst-wrapper(1), ddstdecode(1)
       https://github.com/madlynx/ricoh-sp100

AUTHOR
       Rick Richardson <rick.richardson@comcast.net>
       http://foo2ddst.rkkda.com/

