delaunay(1)                                               GNU Triangulated Surface utils                                               delaunay(1)

NAME
       delaunay - constructs the constrained Delaunay triangulation of the input

SYNOPSIS
       delaunay [OPTIONS] < file.gts

DESCRIPTION
       This manual page documents briefly the delaunay command. This command constructs the constrained Delaunay triangulation of the input

OPTIONS
       This  program follow the usual GNU command line syntax, with long options starting with two dashes (`-').  A summary of options is included
       below.

       -b, --hull
              Do not keep convex hull.

       -e, --noconst
              Do not add constrained edges.

       -S, --split
              Split constraints (experimental).

       -H, --holes
              Remove holes from the triangulation.

       -d, --duplicates
              Remove duplicate vertices.

       -r, --randomize
              Shuffle input vertex list.

       -c, --check
              Check Delaunay property.

       -f FNAME, --files=FNAME
              Generate evolution files.

       -o, --conform
              Generate conforming triangulation.

       -s N, --steiner=N
              Maximum number of Steiner points for conforming triangulation (default is no limit).

       -q Q, --quality=Q
              Set the minimum acceptable face quality.

       -a A, --area=A
              Set the maximum acceptable face area.

       -v, --verbose
              Print statistics about the triangulation.

       -h, --help
              Display the help and exit.

AUTHOR
       delaunay was written by Stephane Popinet <popinet@users.sourceforge.net>.

       This manual page was written by Ruben Molina <rmolina@udea.edu.co>, for the Debian project (but may be used by others).

                                                                   June 2, 2008                                                        delaunay(1)
