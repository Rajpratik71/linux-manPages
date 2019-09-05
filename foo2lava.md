foo2lava(1)                                                                             General Commands Manual                                                                            foo2lava(1)

NAME
       foo2lava - Convert Ghostscript pbmraw or bitcmyk format into a LAVAFLOW or a OPL printer stream

SYNOPSIS
       foo2lava [options] <pbmraw-file >lava-file

       foo2lava [options] <bitcmyk-file >lava-file

       foo2lava [options] <pksmraw-file >lava-file

DESCRIPTION
       foo2lava  converts  Ghostscript pbmraw, bitcmyk, or pksmraw output formats to monochrome or color LAVAFLOW or OPL streams, for driving the Konica Minolta magicolor 2530 DL network color laser
       printer, the Konica Minolta magicolor 2480/2480 MF AIO printer, and other Zenographics-based LAVAFLOW printers.

COMMAND LINE OPTIONS
   Normal Options
       These are the options used to select the parameters of a print job that are usually controlled on a per job basis.

       -c     Force color mode if autodetect doesn't work.

       -d duplex
              Duplex code to send to printer [1].
              │        │               │
              │1   off │ 2   long edge │ 3   short edge

       -g xpixxypix
              Set page dimensions in pixels [10200x6600].

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
              Paper code to send to printer [2].

              ┌──────────────────┬─────────────────────┐
              │  1   executive   │  25   A5            │
              │  2   letter      │  26   A4            │
              │  3   legal       │  45   B5jis         │
              │ 80   env Monarch │  65   B5iso         │
              │ 81   env #10     │  90   env DL        │
              │ 91   env C5      │  92   env C6        │
              │835   4x6" photo  │ 837   10x15cm photo │
              └──────────────────┴─────────────────────┘
       -n copies
              Number of copies [1].

       -r xresxyres
              Set device resolution in pixels/inch [1200x600].

       -s source
              Source (InputSlot) code to send to printer [255].
              │           │
              │1   Tray 1 │ 255   auto
              │4   Tray 2 │

       -t     Draft mode.  Every other pixel is white.

       -J filename
              Filename string to send to printer.

       -U username
              Username string to send to printer.

   Printer Tweaking Options
       These are the options used to customize the operation of foo2lava for a particular printer.

       -u xoffxyoff
              Set the offset of the start of the printable region from the upper left corner, in pixels [0x0].

       -l xoffxyoff
              Set the offset of the end of the printable region from the lower right corner, in pixels [0x0].

       -L mask
              Send logical clipping amounts implied by -u/-l in the LAVAFLOW stream [3].

              0   don't send any logical clipping amounts
              1   only send Y clipping amount
              2   only send X clipping amount
              3   send both X and Y clipping amounts

       -A     AllIsBlack: convert C=1,M=1,Y=1 to just K=1.  Works with bitcmyk input only.

       -B     BlackClears: K=1 forces C,M,Y to 0.  Works with bitcmyk input only.

       -z model
              Model.  The  default is [0].

              model   protocol   Description
              0       LAVAFLOW   magicolor 2490 MF
              0       LAVAFLOW   magicolor 2530 DL
              1       OPL        magicolor 2480 MF
              2       LAVAFLOW   magicolor 1600W
              2       LAVAFLOW   magicolor 1680MF
              2       LAVAFLOW   magicolor 1690MF

   Debugging Options
       These options are used for debugging foo2lava.

       -S plane
              Output just a single color plane from a color print and print it on the black plane.  The default is to output all color planes.

              1   Cyan
              2   Magenta
              3   Yellow
              4   Black

       -D level
              Set Debug level [0].

EXAMPLES
       Create a black and white LAVAFLOW stream:

              gs -q -dBATCH -dSAFER -dQUIET -dNOPAUSE
                  -sPAPERSIZE=letter -r1200x600 -sDEVICE=pbmraw
                  -sOutputFile=- - < testpage.ps
              | foo2lava -r1200x600 -g10200x6600 -p1 >testpage.zm

       Create a color LAVAFLOW stream:

              gs -q -dBATCH -dSAFER -dQUIET -dNOPAUSE
                  -sPAPERSIZE=letter -g10200x6600 -r1200x600 -sDEVICE=bitcmyk
                  -sOutputFile=- - < testpage.ps
              | foo2lava -r1200x600 -g10200x6600 -p1 >testpage.zc

FILES
       /usr/bin/foo2lava

SEE ALSO
       foo2lava-wrapper(1), lavadecode(1)

AUTHOR
       Rick Richardson <rick.richardson@comcast.com>
       http://foo2zjs.rkkda.com/

