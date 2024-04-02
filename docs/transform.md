transform(1)                                              GNU Triangulated Surface utils                                              transform(1)

NAME
       transform - apply geometric transformations to the input.

SYNOPSIS
       transform [OPTIONS] < file.gts

DESCRIPTION
       This manual page documents briefly the transform command.

OPTIONS
       This  program follow the usual GNU command line syntax, with long options starting with two dashes (`-').  A summary of options is included
       below.

       -r ANGLE, --rx=ANGLE
              Rotate around x-axis (ANGLE in degrees).

       -m ANGLE, --ry=ANGLE
              Rotate around y-axis.

       -m ANGLE, --rz=ANGLE
              Rotate around z-axis.

       -s FACTOR, --scale=FACTOR
              Scale by FACTOR.

       -R FACTOR, --sx=FACTOR
              Scale x-axis by FACTOR.

       -M FACTOR, --sy=FACTOR
              Scale y-axis by FACTOR.

       -N FACTOR, --sz=FACTOR
              Scale z-axis by FACTOR.

       -t V, --tx=V
              Translate of V along x-axis.

       -u V, --ty=V
              Translate of V along y-axis.

       -w V, --tz=V
              Translate of V along z-axis.

       -i, --revert
              Turn surface inside out.

       -o, --normalize
              Fit the resulting surface in a cube of size 1 centered at the origin.

       -v, --verbose
              Print statistics about the surface.

       -h, --help
              Display the help and exit.

AUTHOR
       transform was written by Stephane Popinet <popinet@users.sourceforge.net>.

       This manual page was written by Ruben Molina <rmolina@udea.edu.co>, for the Debian project (but may be used by others).

                                                                   June 2, 2008                                                       transform(1)
