foo2xqx(1)                                                                              General Commands Manual                                                                             foo2xqx(1)

NAME
       foo2xqx - Convert Ghostscript pbmraw into a XQX printer stream

SYNOPSIS
       foo2xqx [options] <pbmraw-file >xqx-file

DESCRIPTION
       foo2xqx  converts  Ghostscript  pbmraw to monochrome XQX streams, for driving the HP LaserJet P1005/P1006/P1007/P1008, the HP LaserJet P1505, the HP LaserJet P2014, the HP LaserJet M1005 MFP,
       the HP LaserJet M1120 MFP, the HP LaserJet Pro M1212nf MFP, and other XQX-based printers.

COMMAND LINE OPTIONS
   Normal Options
       These are the options used to select the parameters of a print job that are usually controlled on a per job basis.

       -d duplex
              Duplex code to send to printer [1].
              │        │               │
              │1   off │ 2   long edge │ 3   short edge

       -g xpixxypix
              Set page dimensions in pixels [10200x6600].

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
              Paper code to send to printer [1].

              ┌──────────────────┬───────────────────┐
              │  1   letter      │   9   A4          │
              │  5   legal       │  11   A5          │
              │  7   executive   │  13   B5          │
              │ 20   env #10     │  27   env DL      │
              │ 28   env C5      │  34   env B5      │
              │ 37   env Monarch │ 257   16k 197x273 │
              │263   16k 184x260 │ 264   16k 195x270 │
              └──────────────────┴───────────────────┘
       -n copies
              Number of copies [1].

       -r xresxyres
              Set device resolution in pixels/inch [1200x600].

       -s source
              Source (InputSlot) code to send to printer [7].

              ┌──────────┬────────────┐
              │1   upper │ 4   manual │
              │2   lower │ 7   auto   │
              └──────────┴────────────┘
       -t     Draft mode.  Every other pixel is white.

       -T density
              Print density (1-5).  The default is 3 (medium).

       -J filename
              Filename string to send to printer.

       -U username
              Username string to send to printer.

   Printer Tweaking Options
       These are the options used to customize the operation of foo2xqx for a particular printer.

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
       These options are used for debugging foo2xqx.

       -S plane
              Output just a single color plane from a color print and print it on the black plane.  The default is to output all color planes.

              1   Cyan
              2   Magenta
              3   Yellow
              4   Black

       -D level
              Set Debug level [0].

EXAMPLES
       Create a black and white XQX stream:

              gs -q -dBATCH -dSAFER -dQUIET -dNOPAUSE
                  -sPAPERSIZE=letter -r1200x600 -sDEVICE=pbmraw
                  -sOutputFile=- - < testpage.ps
              | foo2xqx -r1200x600 -g10200x6600 -p1 >testpage.zm

FILES
       /usr/bin/foo2xqx

SEE ALSO
       foo2xqx-wrapper(1), xqxdecode(1)

AUTHOR
       Rick Richardson <rick.richardson@comcast.net>
       http://foo2xqx.rkkda.com/

