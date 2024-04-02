foo2hbpl2(1)                                                                            General Commands Manual                                                                           foo2hbpl2(1)

NAME
       foo2hbpl2 - Convert Ghostscript pbmraw or bitcmyk format into a ZJS printer stream

SYNOPSIS
       foo2hbpl2 [options] <pbmraw-file >hbpl2-file

       foo2hbpl2 [options] <bitcmyk-file >hbpl2-file

       foo2hbpl2 [options] <pksmraw-file >hbpl2-file

DESCRIPTION
       foo2hbpl2  converts  Ghostscript  pbmraw,  bitcmyk, or pksmraw output formats to monochrome or color HBPL version 2 streams, for driving the Dell 1355, Dell C1765, Epson AcuLaser M1400, Epson
       AcuLaser CX17NF, Fuji Xerox DocuPrint CM205, Fuji Xerox DocuPrint CM215, Fuji Xerox DocuPrint M215, Fuji Xerox DocuPrint P205, Xerox Phaser 3010, Xerox Phaser 3040, Xerox WorkCentre 3045 MFP,
       and Xerox WorkCentre 6015 MFP printers.

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
              Media code to send to printer [1].

              ─────────────────
              Media       HBPL
              ─────────────────
              plain          1
              bond           2
              lwcard         3
              lwgcard        4
              labels         5
              envelope       6
              recycled       7
              plain2         8
              bond2          9
              lwcard2       10
              lwgcard2      11
              recycled2     12

       -p paper
              Paper code to send to printer [1].

              ────────────────────────────
              Paper                  HBPL
              ────────────────────────────
              A4                        1
              B5jis                     2
              A5                        3
              letter                    4

              executive                 5
              fanfold german legal      6
              folio                     6
              legal                     7
              env#10                    9
              envMonarch               10
              envC5                    11
              envDL                    12

       -n copies
              Number of copies [1].

       -r xresxyres
              Set device resolution in pixels/inch [1200x600].

       -s source
              Source (InputSlot) code to send to printer [7].
              │          │
              │1   upper │ 4   manual
              │2   lower │ 7   auto

       -t     Draft mode.  Every other pixel is white.

       -J filename
              Filename string to send to printer.

       -U username
              Username string to send to printer.

   Printer Tweaking Options
       These are the options used to customize the operation of foo2hbpl2 for a particular printer.

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

       -P     Do not send START_PLANE codes on monochrome output.  May be needed by some black and white only printers, such as the HP LaserJet 1000.

       -A     AllIsBlack: convert C=1,M=1,Y=1 to just K=1.  Works with bitcmyk input only.

       -B     BlackClears: K=1 forces C,M,Y to 0.  Works with bitcmyk input only.

       -X padlen
              Add extra zero padding to the end of BID segments.  The default is 16 bytes.  Padding 16 bytes of zeroes is needed for older ZjStream printers, such as the Minolta 2200DL and HP Laser‐
              Jet 1000, and seems harmless to newer ones, such as the Minolta 2300DL.  So the default should be good for all cases.

   Debugging Options
       These options are used for debugging foo2hbpl2.

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
                  -sPAPERSIZE=letter -r1200x600 -sDEVICE=pbmraw
                  -sOutputFile=- - < testpage.ps
              | foo2hbpl2 -r1200x600 -g10200x6600 -p1 >testpage.zm

       Create a color ZJS stream:

              gs -q -dBATCH -dSAFER -dQUIET -dNOPAUSE
                  -sPAPERSIZE=letter -g10200x6600 -r1200x600 -sDEVICE=bitcmyk
                  -sOutputFile=- - < testpage.ps
              | foo2hbpl2 -r1200x600 -g10200x6600 -p1 >testpage.zc

FILES
       /usr/bin/foo2hbpl2

SEE ALSO
       foo2hbpl2-wrapper(1), hbpldecode(1)

AUTHOR
       Rick Richardson <rick.richardson@comcast.net>
       Peter Korf <peter@niendo.de>
       http://foo2hbpl.rkkda.com/

