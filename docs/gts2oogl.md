gts2oogl(1)                                               GNU Triangulated Surface utils                                               gts2oogl(1)

NAME
       gts2oogl - converts a GTS file to OOGL file format (Geomview).

SYNOPSIS
       gts2oogl [OPTIONS] < input.srf > output.oogl

DESCRIPTION
       This manual page documents briefly the gts2oogl command.

OPTIONS
       This  program follow the usual GNU command line syntax, with long options starting with two dashes (`-').  A summary of options is included
       below.

       -G, --gnuplot
              Writes isolines in gnuplot format.

       --component
              Color faces according to the component they belong too.

       --quality
              Color faces according to their quality.

       --area Color faces according to their area.

       --incomp
              Color incompatible faces.

       -f VAL, --fold=VAL
              Color faces which make an angle smaller than VAL degrees with any of their neighbors.

       -t, --faces
              Output individual faces.

       --epv  Color vertices according to number of edges per vertex.

       -H C, --height=C
              Color vertices according to their C coordinate.

       -g, --gaussian
              Color vertices according to Gaussian curvature.

       -C, --curvature
              Color vertices according to mean curvature.

       --boundary
              Output boundary edges.

       -e A, --feature=A
              Output `feature' edges defined by angle A.

       --non-manifold
              Output non-manifold edges.

       --duplicate
              Output duplicate edges.

       -i N, --isolines=N
              Draw N isolines (levels of constant altitude).

       -I L, --isolines=L
              Draw isoline at level L.

       --cmap=FILE
              Load FILE as colormap.

       -m VAL, --min=VAL
              Use VAL as minimum scaling value.

       -M VAL, --max=VAL
              Use VAL as maximum scaling value.

       -r, --reverse
              Reverse colormap.

       -n, --nosurface
              Do not output surface.

       -F C, --flatten=C
              Set C coordinate to average value.

       -v, --verbose
              Display surface statistics.

       -h, --help
              Display the help and exit.

AUTHOR
       gts2oogl was written by Stephane Pipinet <popinet@users.sourceforge.net>.

       This manual page was written by Ruben Molina <rmolina@udea.edu.co>, for the Debian project (but may be used by others).

                                                                   June 2, 2008                                                        gts2oogl(1)
