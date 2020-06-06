foo2oak(1)                                                                               General Commands Manual                                                                               foo2oak(1)

NAME
       foo2oak - Convert Ghostscript pbmraw, pgmraw or bitcmyk format into an OAKT printer stream

SYNOPSIS
       foo2oak [options] <pbmraw-file >OAKT-file

       foo2oak [options] <pgmraw-file >OAKT-file

       foo2oak [options] <bitcmyk-file >OAKT-file

DESCRIPTION
       foo2oak  converts  Ghostscript  pbmraw  or  bitcmyk output formats to monochrome or color OAKT streams, for driving the HP Color LaserJet 1500 laser printer, Kyocera KM-1636/KM-2035 copiers, and
       other OAKT-based printers.

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

              ────────────────────
              Media          Code
              ────────────────────
              autoselect       0
              plain            1
              preprinted       2
              letterhead       3
              transparency     4
              prepunched       5
              labels           6
              bond             7
              recycled         8
              color            9
              cardstock       10
              envelope        11
              light           13
              tough           14
              vellum          15
              rough           16
              thick           19
              highqual        20

       -p paper
              Paper code to send to printer [1].

              ┌─────────────────┬─────────────────┐
              │  1   letter     │   3   ledger    │
              │  5   legal      │   6   statement │
              │  7   executive  │   8   A3        │
              │  9   A4         │  11   A5        │
              │ 12   B4         │  13   B5jis     │
              │ 14   folio      │  19   env9      │
              │ 20   env10      │  27   envDL     │
              │ 28   envC5      │  30   envC4     │
              │ 37   envMonarch │ 257   A6        │
              │258   B6         │ 259   B5iso     │
              │260   env6       │                 │
              └─────────────────┴─────────────────┘
       -n copies
              Number of copies [1].

       -r xresxyres
              Set device resolution in pixels/inch [600x600].

       -s source
              Source (InputSlot) code to send to printer [7].
              │           │
              │1   tray1  │ 2   tray2
              │4   manual │ 7   auto

       -J filename
              Filename string to send to printer.

       -U username
              Username string to send to printer.

   Printer Tweaking Options
       These are the options used to customize the operation of foo2oak for a particular printer.

       -u xoffxyoff
              Set the offset of the start of the printable region from the upper left corner, in pixels [0x0].

       -l xoffxyoff
              Set the offset of the end of the printable region from the lower right corner, in pixels [0x0].

       -L mask
              Send logical clipping amounts implied by -u/-l in the OAKT stream [3].

              0   don't send any logical clipping amounts
              1   only send Y clipping amount
              2   only send X clipping amount
              3   send both X and Y clipping amounts

       -A     AllIsBlack: convert C=1,M=1,Y=1 to just K=1.  Works with bitcmyk input only.

       -B     BlackClears: K=1 forces C,M,Y to 0.  Works with bitcmyk input only.

       -M mirror
              Mirror bytes. Mirror is 0 for Kyocera KM-1635/KM-2035 and 1 for the HP Color LaserJet 1500. The default is 1.

       -z model
              Model is 0 for the HP Color LaserJet 1500, and 1 for the Kyocera KM-1635/KM-2035 copiers.  The default is 0.

   Debugging Options
       These options are used for debugging foo2oak.

       -S plane
              Output just a single color plane from a color print and print it on the black plane.  The default is to output all color planes.

              1   Cyan
              2   Magenta
              3   Yellow
              4   Black

       -D level
              Set Debug level [0].

EXAMPLES
       Create a black and white OAKT stream:

              gs -q -dBATCH -dSAFER -dQUIET -dNOPAUSE
                  -sPAPERSIZE=letter -r600x600 -sDEVICE=pbmraw
                  -sOutputFile=- - < testpage.ps
              | foo2oak -r600x600 -g5100x6600 -p1 >testpage.oak

       Create a color OAKT stream:

              gs -q -dBATCH -dSAFER -dQUIET -dNOPAUSE
                  -sPAPERSIZE=letter -g5100x6600 -r600x600 -sDEVICE=bitcmyk
                  -sOutputFile=- - < testpage.ps
              | foo2oak -r600x600 -g5100x6600 -p1 >testpage.oak

FILES
       /usr/bin/foo2oak

SEE ALSO
       foo2oak-wrapper(1), oakdecode(1)

AUTHOR
       Rick Richardson <rick.richardson@comcast.net>
       http://foo2oak.rkkda.com/

