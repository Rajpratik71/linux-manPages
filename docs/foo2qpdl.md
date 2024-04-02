foo2qpdl(1)                                                                             General Commands Manual                                                                            foo2qpdl(1)

NAME
       foo2qpdl - Convert Ghostscript pbmraw or bitcmyk format into a QPDL printer stream

SYNOPSIS
       foo2qpdl [options] <pbmraw-file >qpdl-file

       foo2qpdl [options] <bitcmyk-file >qpdl-file

       foo2qpdl [options] <pksmraw-file >qpdl-file

DESCRIPTION
       foo2qpdl  converts  Ghostscript  pbmraw, bitcmyk, or pksmraw output formats to monochrome or color QPDL streams, for driving the Samsung CLP-300, CLX-2160, CLP-600, CLX-3160, CLP-610 CLP-620,
       CLP-360, CLP-365, and the Xerox Phaser 6110 QPDL printers.

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

              ────────────────────────
              Media          QPDL
              ────────────────────────
              plain            0
              thick            1
              thin             2
              bond             3
              color            4
              card             5
              labels           6
              envelope         7
              preprinted       8
              cotton           9
              recycled        10
              transparency    11
              archive         12

       -p paper
              Paper code to send to printer [0].

              ┌──────────────┬──────────────────┐
              │ 0   letter   │  1   legal       │
              │ 2   A4       │  3   executive   │
              │ 6   env #10  │  7   env Monarch │
              │ 8   env C5   │  9   env DL      │
              │11   B5jis    │ 12   B5iso       │
              │16   A5       │ 17   A6          │
              │23   env C6   │ 24   folio       │
              │25   env 6.75 │ 26   env #9      │
              │28   oficio   │ 21   custom      │
              └──────────────┴──────────────────┘
       -n copies
              Number of copies [1].

       -r xresxyres
              Set device resolution in pixels/inch [1200x600].

       -s source
              Source (InputSlot) code to send to printer [255].
              │          │
              │1   auto  │ 2   manual
              │3   multi │ 4   tray1

       -t     Draft mode.  Every other pixel is white.

       -J filename
              Filename string to send to printer.

       -U username
              Username string to send to printer.

   Printer Tweaking Options
       These are the options used to customize the operation of foo2qpdl for a particular printer.

       -a b,c,s,cr,mg,yb
              Color Adjust: brightness, contrast, saturation, cyan-red balance, magenta-green balance, and yellow-blue balance from 0 to 100.  The default is 50,50,50,50,50,50.  This only works when
              the -z3 (e.g. CLP-365) model is set!

       -u xoffxyoff
              Set the offset of the start of the printable region from the upper left corner, in pixels [0x0].

       -l xoffxyoff
              Set the offset of the end of the printable region from the lower right corner, in pixels [0x0].

       -L mask
              Send logical clipping amounts implied by -u/-l in the QPDL stream [3].

              0   don't send any logical clipping amounts
              1   only send Y clipping amount
              2   only send X clipping amount
              3   send both X and Y clipping amounts

       -A     AllIsBlack: convert C=1,M=1,Y=1 to just K=1.  Works with bitcmyk input only.

       -B     BlackClears: K=1 forces C,M,Y to 0.  Works with bitcmyk input only.

       -z model
              Printer model. Model 0 is the default.

              model   Description
              0       CLP-300, CLX-2160, CLX-3160
              1       CLP-600
              2       CLP-310, CLP-315, CLP-610, CLX-3175
              3       CLP-620, CLP-360, CLP-365

   Debugging Options
       These options are used for debugging foo2qpdl.

       -S plane
              Output just a single color plane from a color print and print it on the black plane.  The default is to output all color planes.

              1   Cyan
              2   Magenta
              3   Yellow
              4   Black

       -D level
              Set Debug level [0].

EXAMPLES
       Create a black and white QPDL stream:

              gs -q -dBATCH -dSAFER -dQUIET -dNOPAUSE
                  -sPAPERSIZE=letter -r1200x600 -sDEVICE=pbmraw
                  -sOutputFile=- - < testpage.ps
              | foo2qpdl -r1200x600 -g10200x6600 -p0 >testpage.zm

       Create a color QPDL stream:

              gs -q -dBATCH -dSAFER -dQUIET -dNOPAUSE
                  -sPAPERSIZE=letter -g10200x6600 -r1200x600 -sDEVICE=bitcmyk
                  -sOutputFile=- - < testpage.ps
              | foo2qpdl -r1200x600 -g10200x6600 -p0 >testpage.zc

FILES
       /usr/bin/foo2qpdl

SEE ALSO
       foo2qpdl-wrapper(1), qpdldecode(1)

AUTHOR
       Rick Richardson <rick.richardson@comcast.com>
       http://foo2qpdl.rkkda.com/

