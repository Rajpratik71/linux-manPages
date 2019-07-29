NORMALIZ(1)                                                      Normaliz Project                                                      NORMALIZ(1)

NAME
       Normaliz - tool for computations in affine monoids, vector configurations, lattice polytopes, and rational cones.

SYNOPSIS
       normaliz [options] PROJECT

DESCRIPTION
              runs normaliz on PROJECT.in

OPTIONS
       -S     compute sublattice

       -s     compute support hyperplanes

       -t     compute triangulation

       -v     compute volume

       -n     compute Hilbert basis (with full triangulation)

       -N     compute Hilbert basis (with partial triangulation)

       -q     compute Hilbert (quasi-)polynomial

       -p     compute Hilbert (quasi-)polynomial and degree 1 elements

       -h     compute Hilbert basis and Hilbert polynomial (default)

       -1     compute degree 1 elements

       -y     compute Stanley decomposition

       -C     compute class group

       -M     compute module generators over original monoid

       -d     computation mode: dual

       -r     computation mode: approximate

       -b     computation mode: bottom decomposition

       -k     computation mode: keep order

       --<PROP>
              compute the ConeProperty <PROP>

       -f, --files
              write the files .out .gen .inv .cst

       -a, --all-files
              write all output files (except .tri)

       -T     write the file .tri (triangulation)

       --<SUFFIX>
              write the file .<SUFFIX> where <SUFFIX> can be on of cst, egn, esp, ext, gen, ht1, inv, lat, mod, typ

       -B, --BigInt
              directly use indefinite precision arithmetic

       -i, --ignore
              ignore the compute options set in the input file

       -x=<T> limit the number of threads to <T>

       -?, --help
              print this help text and exit

       -c, --verbose
              verbose (prints control data)

       --version
              print version info and exit

       Please report bugs to <normaliz@uos.de> or directly to our issue tracker: https://github.com/Normaliz/Normaliz/issues

AUTHORS
       Winfried Bruns, Bogdan Ichim, Tim Romer, Christof Soeger

COPYRIGHT
       Copyright (C) 2007-2015  Winfried Bruns, Bogdan Ichim, Christof Soeger

       Copyright © 2007-2015  The Normaliz Team, University of Osnabrueck.  This program comes with ABSOLUTELY NO WARRANTY; This is free software,
       and you are welcome to redistribute it under certain conditions; See COPYING for details.

Normaliz (Debian 3.0.0+ds-3ubuntu1)                                January 2016                                                        NORMALIZ(1)
