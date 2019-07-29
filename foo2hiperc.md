foo2hiperc(1)                                                 General Commands Manual                                                foo2hiperc(1)

NAME
       foo2hiperc - Convert Ghostscript pbmraw or bitcmyk format into a HIPERC printer stream

SYNOPSIS
       foo2hiperc [options] <pbmraw-file >hiperc-file

       foo2hiperc [options] <bitcmyk-file >hiperc-file

       foo2hiperc [options] <pksmraw-file >hiperc-file

DESCRIPTION
       foo2hiperc  converts  Ghostscript  pbmraw,  bitcmyk,  or  pksmraw output formats to monochrome or color HIPERC streams, for driving the Oki
       C310dn, C3100, C3200, C3300n, C3400n, C5100n, C5500n, C5600n, and the C5800n HIPERC printers.

COMMAND LINE OPTIONS
   Normal Options
       These are the options used to select the parameters of a print job that are usually controlled on a per job basis.

       -c     Force color mode if autodetect doesn't work.

       -d duplex
              Duplex code to send to printer [1].
              │        │               │
              │1   off │ 2   long edge │ 3   short edge

       -g xpixxypix
              Set page dimensions in pixels [5100x6600].

       -m media
              Media code to send to printer [0].

              ──────────────────────────
              Media          HIPERC
              ──────────────────────────
              plain            0
              labels           1
              transparency     2

       -p paper
              Paper code to send to printer [2].

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
              Source (InputSlot) code to send to printer [0].

              │0   auto select │
              │1   tray1       │ 2   tray2
              │3   multi       │ 4   manual

       -t     Draft mode.  Every other pixel is white.

       -J filename
              Filename string to send to printer.

       -U username
              Username string to send to printer.

   Printer Tweaking Options
       These are the options used to customize the operation of foo2hiperc for a particular printer.

       -u xoffxyoff
              Set the offset of the start of the printable region from the upper left corner, in pixels [0x0].

       -l xoffxyoff
              Set the offset of the end of the printable region from the lower right corner, in pixels [0x0].

       -L mask
              Send logical clipping amounts implied by -u/-l in the HIPERC stream [3].

              0   don't send any logical clipping amounts
              1   only send Y clipping amount
              2   only send X clipping amount
              3   send both X and Y clipping amounts

       -A     AllIsBlack: convert C=1,M=1,Y=1 to just K=1.  Works with bitcmyk input only.

       -B     BlackClears: K=1 forces C,M,Y to 0.  Works with bitcmyk input only.

       -Z compressed
              Use uncompressed (0) or compressed (1) JBIG data.

   Debugging Options
       These options are used for debugging foo2hiperc.

       -S plane
              Output just a single color plane from a color print and print it on the black plane.  The default is to output all color planes.

              1   Cyan
              2   Magenta
              3   Yellow
              4   Black

       -D level
              Set Debug level [0].

EXAMPLES
       Create a black and white HIPERC stream:

              gs -q -dBATCH -dSAFER -dQUIET -dNOPAUSE
                  -sPAPERSIZE=letter -r600x600 -sDEVICE=pbmraw
                  -sOutputFile=- - < testpage.ps
              | foo2hiperc -r600x600 -g5100x6600 -p0 >testpage.zm

       Create a color HIPERC stream:

              gs -q -dBATCH -dSAFER -dQUIET -dNOPAUSE
                  -sPAPERSIZE=letter -g5100x6600 -r600x600 -sDEVICE=bitcmyk
                  -sOutputFile=- - < testpage.ps
              | foo2hiperc -r600x600 -g5100x6600 -p0 >testpage.zc

FILES
       /usr/bin/foo2hiperc

SEE ALSO
       foo2hiperc-wrapper(1), hipercdecode(1)

AUTHOR
       Rick Richardson <rick.richardson@comcast.com>
       http://foo2hiperc.rkkda.com/

