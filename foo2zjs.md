foo2zjs(1)                                                    General Commands Manual                                                   foo2zjs(1)

NAME
       foo2zjs - Convert Ghostscript pbmraw or bitcmyk format into a ZJS printer stream

SYNOPSIS
       foo2zjs [options] <pbmraw-file >zjs-file

       foo2zjs [options] <bitcmyk-file >zjs-file

       foo2zjs [options] <pksmraw-file >zjs-file

DESCRIPTION
       foo2zjs  converts  Ghostscript  pbmraw,  bitcmyk, or pksmraw output formats to monochrome or color ZJS streams, for driving the Minolta/QMS
       2300 DL network color laser printer and other Zenographics-based printers.

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

              ──────────────────────────────────────────────────────────────
                              2300DL   2200DL   HP 1018   HP P1102       HP
              Media          HP 1005            HP 1020   HP P1606   CP1025
                                 -z0      -z0       -z1        -z2      -z3
              ──────────────────────────────────────────────────────────────
              standard             1        1         1          1        1
              transparency         2        2         2          2        2
              envelope           257       na       267        267      267
              letterhead         259       na       513        513      513
              bond                na       na       260        260      260
              thick              261        4       261         na       na
              postcard           262       na        na         na       na
              rough               na       na       263        263      263
              heavy               na       na       262        262      262
              labels             263        3       263        265      265
              vellum              na       na       273        273      273
              medium              na       na        na        282      282
              extraheavy          na       na        na        283      283
              color               na       na       512        512      512
              light               na       na       258        258      258
              preprinted          na       na       514        514      514
              prepunched          na       na       515        515      515
              recycled            na       na       516        516      516

       -p paper
              Paper code to send to printer [1].

              ───────────────────────────────────────────────────────────────
                                     MC 2300DL   HP 1018   HP P1102       HP
              Paper                    HP 1005   HP 1020   HP P1606   CP1025
                                           -z0       -z1        -z2      -z3
              ───────────────────────────────────────────────────────────────
              letter                         1         1          1        1
              legal                          5         5          5        5
              executive                      7         7          7        7
              A4                             9         9          9        9
              A5                            11        11         11       11
              B5jis                         13        13         13       13
              env #10                       20        20         20       20
              env DL                        27        27         27       27
              env CL                        28        28         28       28
              env B5                        34        34         34       34
              env Monarch                   37        37         37       37
              postcard (japan)              na       260         43       43
              B5iso                         na       259         na       na
              A6                            na       262         70       70
              double postcard               na       261         82       82
               rotated
              16k 197x273                   na       257        257      257
              fanfold german legal          na       258        258      258
               legal
              16k 184x260                   na        na        263      263
              16k 195x270                   na        na        264      264
              photo 4x6                     na        na         na      268
              photo 5x8                     na        na         na      269
              photo 10x15                   na        na         na      270

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

       -T density
              Print density (1-5).  The default is 3 (medium).

       -J filename
              Filename string to send to printer.

       -U username
              Username string to send to printer.

   Printer Tweaking Options
       These are the options used to customize the operation of foo2zjs for a particular printer.

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

       -P     Do not send START_PLANE codes on monochrome output.  May be needed by some black and white only printers, such as  the  HP  LaserJet
              1000.

       -A     AllIsBlack: convert C=1,M=1,Y=1 to just K=1.  Works with bitcmyk input only.

       -B     BlackClears: K=1 forces C,M,Y to 0.  Works with bitcmyk input only.

       -X padlen
              Add  extra  zero  padding  to  the  end  of  BID segments.  The default is 16 bytes.  Padding 16 bytes of zeroes is needed for older
              ZjStream printers, such as the Minolta 2200DL and HP LaserJet 1000, and seems harmless to newer ones, such as  the  Minolta  2300DL.
              So the default should be good for all cases.

       -z model
              Model. Default is 0.

              0   KM 2300DL / HP 1000 / HP 1005
              1   HP 1018 / HP 1020 / HP 1022
              2   HP Pro P1102 / P1566 / P1606dn
              3   HP Pro CP1025

   Debugging Options
       These options are used for debugging foo2zjs.

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
              | foo2zjs -r1200x600 -g10200x6600 -p1 >testpage.zm

       Create a color ZJS stream:

              gs -q -dBATCH -dSAFER -dQUIET -dNOPAUSE
                  -sPAPERSIZE=letter -g10200x6600 -r1200x600 -sDEVICE=bitcmyk
                  -sOutputFile=- - < testpage.ps
              | foo2zjs -r1200x600 -g10200x6600 -p1 >testpage.zc

FILES
       /usr/bin/foo2zjs

SEE ALSO
       foo2zjs-wrapper(1), zjsdecode(1)

AUTHOR
       Rick Richardson <rick.richardson@comcast.net>
       http://foo2zjs.rkkda.com/

