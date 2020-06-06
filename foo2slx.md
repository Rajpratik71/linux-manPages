foo2slx(1)                                                                               General Commands Manual                                                                               foo2slx(1)

NAME
       foo2slx - Convert Ghostscript pbmraw or bitcmyk format into a SLX printer stream

SYNOPSIS
       foo2slx [options] <pbmraw-file >slx-file

       foo2slx [options] <bitcmyk-file >slx-file

       foo2slx [options] <pksmraw-file >slx-file

DESCRIPTION
       foo2slx converts Ghostscript pbmraw, bitcmyk, or pksmraw output formats to monochrome or color SLX streams, for driving the Lexmark C500 network color laser printer and other SLZ-based printers.
       The SLX stream is a variant of ZjStream produced by Software Imaging K.K.

COMMAND LINE OPTIONS
   Normal Options
       These are the options used to select the parameters of a print job that are usually controlled on a per job basis.

       -c     Force color mode if autodetect doesn't work.

       -g xpixxypix
              Set page dimensions in pixels [10200x6600].

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
              Paper code to send to printer [6].

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
              Source (InputSlot) code to send to printer [0].

              │0   auto │ 1   cassette1

   Printer Tweaking Options
       These are the options used to customize the operation of foo2slx for a particular printer.

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
              These options are used for debugging foo2slx.

       -S plane
              Output just a single color plane from a color print and print it on the black plane.  The default is to output all color planes.

              1   Cyan
              2   Magenta
              3   Yellow
              4   Black

       -D level
              Set Debug level [0].

EXAMPLES
       Create a black and white SLX stream:

              gs -q -dBATCH -dSAFER -dQUIET -dNOPAUSE
                  -sPAPERSIZE=letter -r1200x600 -sDEVICE=pbmraw
                  -sOutputFile=- - < testpage.ps
              | foo2slx -r1200x600 -g10200x6600 -p1 >testpage.zm

       Create a color SLX stream:

              gs -q -dBATCH -dSAFER -dQUIET -dNOPAUSE
                  -sPAPERSIZE=letter -g10200x6600 -r1200x600 -sDEVICE=bitcmyk
                  -sOutputFile=- - < testpage.ps
              | foo2slx -r1200x600 -g10200x6600 -p1 >testpage.zc

FILES
       /usr/bin/foo2slx

SEE ALSO
       foo2slx-wrapper(1), slxdecode(1)

AUTHOR
       Rick Richardson <rick.richardson@comcast.net>
       http://foo2slx.rkkda.com/

