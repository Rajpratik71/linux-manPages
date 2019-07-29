foo2hp(1)                                                                               General Commands Manual                                                                              foo2hp(1)

NAME
       foo2hp - Convert Ghostscript pbmraw or bitcmyk format into a ZJS printer stream

SYNOPSIS
       foo2hp [options] <pbmraw-file >zjs-file

       foo2hp [options] <bitcmyk-file >zjs-file

       foo2hp [options] <cups-file >zjs-file

DESCRIPTION
       foo2hp  converts Ghostscript pbmraw, bitcmyk, or cups output formats to monochrome or color ZJS streams, for driving the Hewlett-Packard 2600n color laser printer and other Zenographics-based
       printers.

COMMAND LINE OPTIONS
   Normal Options
       These are the options used to select the parameters of a print job that are usually controlled on a per job basis.

       -b bits
              Bits per plane if autodetect doesn't work (1 or 2) [1].

       -c     Force color mode if autodetect doesn't work.

       -d duplex
              Duplex code to send to printer [1].
              │        │               │
              │1   off │ 2   long edge │ 3   short edge

       -g xpixxypix
              Set page dimensions in pixels [10200x6600].

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
              Paper code to send to printer [1].

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
              Set device resolution in pixels/inch [600x600].

       -s source
              Source (InputSlot) code to send to printer [7].
              │           │
              │1   tray 2 │ 7   auto
              │2   tray 1 │

       -t     Draft mode.  Every other pixel is white.

       -J filename
              Filename string to send to printer.

       -U username
              Username string to send to printer.

   Printer Tweaking Options
       These are the options used to customize the operation of foo2hp for a particular printer.

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

       -O c,m,y,k
              Alignment of CMYK in rows. The default is 0,0,0,0.

       -P     Do not send START_PLANE codes on monochrome output.  May be needed by some black and white only printers, such as the HP LaserJet 1000.

       -A     AllIsBlack: convert C=1,M=1,Y=1 to just K=1.  Works with bitcmyk input only.

       -B     BlackClears: K=1 forces C,M,Y to 0.  Works with bitcmyk input only.

       -X padlen
              Add extra zero padding to the end of BID segments.  The default is 16 bytes.

   Debugging Options
       These options are used for debugging foo2hp.

       -S plane
              Output just a single color plane from a color print and print it on the black plane.  The default is to output all color planes.

              1   Cyan
              2   Magenta
              3   Yellow

              4   Black

       -D level
              Set Debug level [0].

EXAMPLES
       Create a black and white ZJS stream:

              gs -q -dBATCH -dSAFER -dQUIET -dNOPAUSE
                  -sPAPERSIZE=letter -r600x600 -sDEVICE=pbmraw
                  -sOutputFile=- - < testpage.ps
              | foo2hp -r600x600 -g5100x6600 -p1 >testpage.zm

       Create a color ZJS stream:

              gs -q -dBATCH -dSAFER -dQUIET -dNOPAUSE
                  -sPAPERSIZE=letter -g5100x6600 -r600x600 -sDEVICE=bitcmyk
                  -sOutputFile=- - < testpage.ps
              | foo2hp -r600x600 -g5100x6600 -p1 >testpage.zc

FILES
       /usr/bin/foo2hp

SEE ALSO
       foo2hp2600-wrapper(1), zjsdecode(1)

AUTHOR
       Rick Richardson <rick.richardson@comcast.net>
       http://foo2hp.rkkda.com/

