MKNFONTS(1)                                                   General Commands Manual                                                  MKNFONTS(1)

NAME
       mknfonts - create nfont packages

SYNOPSIS
       mknfonts [options] files...

DESCRIPTION
       This  manual  page  documents  briefly the mknfonts command.  This manual page was written for the Debian distribution because the original
       program does not have a manual page.

       mknfonts doesn't completely automate the process of creating nfont-packages, but it can do most of the bulk work for you. Just put a  bunch
       of  fonts  (.ttf,  .pfa, .pfb, .afm, ...; most formats that freetype can handle and provide postscript names for) in an empty directory and
       run:

       mknfonts *

       You'll get a bunch of packages ready to be moved to .../Library/Fonts/. For  best  results,  you'll  want  to  review  the  packages.  Most
       traits/weights  (besides the really standard ones) won't be handled automatically, so you'll have to add or tweak them manually if you want
       GNUstep to know about them.

OPTIONS
       These programs follow the usual GNU command line syntax, with long options starting with two dashes (`-').

SEE ALSO
       GNUstep(7).

AUTHOR
       This manual page was written by Gürkan Sengün <gurkan@linuks.mine.nu>, for the Debian project (but may be used by others).

                                                                  March 12, 2004                                                       MKNFONTS(1)
