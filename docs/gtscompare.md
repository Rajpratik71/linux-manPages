gtscompare(1)                                             GNU Triangulated Surface utils                                             gtscompare(1)

NAME
       gtscompare - compare two GTS files.

SYNOPSIS
       gtscompare [OPTIONS] FILE1 FILE2 DELTA

DESCRIPTION
       This manual page documents briefly the gtscompare command.

       DELTA is the sampling length expressed as a fraction of the bounding box diagonal of the second surface.

OPTIONS
       This  program follow the usual GNU command line syntax, with long options starting with two dashes (`-').  A summary of options is included
       below.

       -s, --symmetric
              Symmetric statistics.

       -i, --image
              Output visualisation mesh.

       -c FILE, --cmap=FILE
              Load FILE as colormap.

       -m VAL, --min=VAL
              Use VAL as minimum scaling value.

       -M VAL, --max=VAL
              Use VAL as maximum scaling value.

       -r, --reverse
              Reverse colormap.

       -l, --log
              Use log scale.

       -h, --help
              Display the help and exit.

AUTHOR
       gtscompare was written by Stephane Popinet <popinet@users.sourceforge.net>.

       This manual page was written by Ruben Molina <rmolina@udea.edu.co>, for the Debian project (but may be used by others).

                                                                   June 2, 2008                                                      gtscompare(1)
