gtscheck(1)                                               GNU Triangulated Surface utils                                               gtscheck(1)

NAME
       gtscheck - checks that a surface defines a closed, orientable non self-intersecting manifold.

SYNOPSIS
       gtscheck [OPTION] < FILE

DESCRIPTION
       This manual page documents briefly the gtscheck command.

OPTIONS
       These  programs  follow  the  usual GNU command line syntax, with long options starting with two dashes (`-').  A summary of options is in‐
       cluded below.

       -v, --verbose
              Print statistics about the surface.

       -h, --help
              Display the help and exit.

EXIT STATUS
       The return status reflects the error encountered: 0 none 1 the input file is not a valid GTS file 2 the surface is not an orientable  mani‐
       fold 3 the surface is an orientable manifold but is self-intersecting

AUTHOR
       gtscheck was written by Stephane Popinet <popinet@users.sourceforge.net>.

       This manual page was written by Ruben Molina <rmolina@udea.edu.co>, for the Debian project (but may be used by others).

                                                                   June 2, 2008                                                        gtscheck(1)
