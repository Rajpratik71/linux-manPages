foo2zjs-wrapper(1)                                            General Commands Manual                                           foo2zjs-wrapper(1)

NAME
       foo2zjs-wrapper - Convert Postscript into a ZJS printer stream

SYNOPSIS
       foo2zjs-wrapper [options] [ps-file]

DESCRIPTION
       foo2zjs-wrapper  is  a Foomatic compatible printer wrapper for the foo2zjs printer driver.  This script reads a Postscript ps-file or stan‐
       dard input and converts it to Zenographics ZjStream printer format for driving the Minolta/QMS 2300 DL  network  color  laser  printer  and
       other Zenographics-based printers.

       This script can be used in a standalone fashion, but is intended to be called from a printer spooler system which uses the Foomatic printer
       database.

COMMAND LINE OPTIONS
   Normal Options
       These are the options used to select the parameters of a print job that are usually controlled on a per job basis.

       -c     Print in color (else monochrome).

       -C colormode
              Color correction mode [0].

               1   Photos (using m2300w CRDs)
               2   Photos and text (using m2300w CRDs)
               3   Graphics and text (using m2300w CRDs)
              10   ICM color profile (using -G *.icm file)

       -d duplex
              Duplex code to send to printer [1].
              │        │               │
              │1   off │ 2   long edge │ 3   short edge

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
              Paper size code to send to printer [1].

              ───────────────────────────────────────────────────────────
                                 MC 2300DL   HP 1018   HP P1102       HP
              Paper                HP 1005   HP 1020   HP P1606   CP1025
                                       -z0       -z1        -z2      -z3
              ───────────────────────────────────────────────────────────
              letter                     1         1          1        1
              legal                      5         5          5        5
              executive                  7         7          7        7
              A4                         9         9          9        9
              A5                        11        11         11       11
              B5jis                     13        13         13       13
              env #10                   20        20         20       20
              env DL                    27        27         27       27
              env CL                    28        28         28       28
              env B5                    34        34         34       34
              env Monarch               37        37         37       37
              postcard (japan)          na       260         43       43
              B5iso                     na       259         na       na
              A6                        na       262         70       70
              double postcard           na       261         82       82
               rotated
              16k 197x273               na       257        257      257
              fanfold german            na       258        258      258
               legal
              16k 184x260               na        na        263      263
              16k 195x270               na        na        264      264
              photo 4x6                 na        na         na      268
              photo 5x8                 na        na         na      269
              photo 10x15               na        na         na      270

       -n copies
              Number of copies [1].

       -r xresxyres
              Set device resolution in pixels/inch [1200x600].

       -s source
              Source (Input Slot) code to send to printer [7].
              │          │
              │1   upper │ 4   manual
              │2   lower │ 7   auto

       -t     Draft mode.  Every other pixel is white.

       -T density
              Print density (1-5).  The default is 3 (medium).

       -2 -3 -4 -5 -6 -8 -9 -10 -12 -14 -15 -16 -18
              Print in N-up.  Requires the psutils package.

       -o orient
              Orientation used for N-up.

              Portrait    -op   (normal)
              Landscape   -ol   (rotated 90 degrees anticlockwise)
              Seascape    -os   (rotated 90 degrees clockwise)

   Printer Tweaking Options
       These are the options used to customize the operation of foo2zjs for a particular printer.

       -u xoffxyoff
              Set the offset of the start of the printable region from the upper left corner, in pixels [varies with paper  size].   The  defaults
              should work on the 2200DL and 2300DL, and have not been tested on any other printers.

       -l xoffxyoff
              Set  the  offset  of  the end of the printable region from the lower right corner, in pixels [varies with paper size].  The defaults
              should work on the 2200DL and 2300DL, and have not been tested on any other printers.

       -L mask
              Send the logical clipping values from -u/-l in the ZjStream.  foo2zjs-wrapper always runs Ghostscript with  the  ideal  page  dimen‐
              sions,  so  that  the  scale of the image is correct, regardless whether or not the printer has unprintable regions.  This option is
              used to move the position of the clipped image back to where it belongs on the page.  The default is to send the  amount  which  was
              clipped by -u and -l, and should be good in most cases.

              0   don't send any logical clipping amounts
              1   only send Y clipping amount
              2   only send X clipping amount
              3   send both X and Y clipping amounts

       -P     Do not send START_PLANE codes on monochrome output.  May be needed by some monochrome-only printers, such as the HP LaserJet 1000.

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

   Color Tweaking Options
       These are the options used to control the quality of color output.  Color correction is currently a WORK IN PROGRESS.

       -g gsopts
              Additional options to pass to Ghostscript, such as -g“-dDITHERPPI=nnn”, etc.  This option may appear more than once.

       -G profile.icm
              Convert profile.icm to a Postscript color rendering dictionary (CRD) using foo2zjs-icc2ps and adjust the printer colors by using the
              Postscript setcolorrendering operator.  (WORK IN PROGRESS).

       -G gamma-file.ps
              Prepend gamma-file.ps to the Postscript input to perform color correction using the setcolortransfer Postscript operator.  For exam‐
              ple, the file might contain:
              {0.333 exp} {0.333 exp} {0.333 exp} {0.333 exp} setcolortransfer

       -I intent
              Select profile intent from the ICM file.  0=Perceptual, 1=Colorimetric, 2=Saturation, 3=Absolute.  Default is 0 (perceptual).

   Debugging Options
       These options are used for debugging foo2zjs and its wrapper.

       -S plane
              Output just a single color plane from a color print and print it on the black plane.  The default is to output all color planes.

              1   Cyan
              2   Magenta
              3   Yellow
              4   Black

       -D level
              Set Debug level [0].

EXAMPLES
       Create a monochrome ZjStream from a Postscript document, examine it, and then print it using a RAW print queue:

              foo2zjs-wrapper testpage.ps > testpage.zm
              zjsdecode < testpage.zm
              lpr -P raw testpage.zm

       Create a color ZjStream stream from a Postscript document:

              foo2zjs-wrapper -c testpage.ps > testpage.zc

FILES
       /usr/bin/foo2zjs-wrapper

SEE ALSO
       foo2zjs(1), zjsdecode(1)

AUTHOR
       Rick Richardson <rick.richardson@comcast.net>
       http://foo2zjs.rkkda.com/

