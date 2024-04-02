GFTOPK(1)                                                                        General Commands Manual                                                                        GFTOPK(1)

NAME
       gftopk - convert generic font files to packed font files

SYNOPSIS
       gftopk [-v] gf_file_name [pk_file_name]

DESCRIPTION
       This manual page is not meant to be exhaustive.  The complete documentation for this version of TeX can be found in the info file or manual Web2C: A TeX implementation.

       The  gftopk  program  converts  a  generic  font  file output by, for example, mf(1), to a packed font file for use by DVI-reading programs. Packed font files (pk files) are much
       smaller than the corresponding gf files, so they are generally the font format of choice.

       The gf_file_name on the command line must be complete. Because the resolution is part of the extension, it would not make sense to append a default extension as is done with  TeX
       or DVI-reading software. The pk_file_name defaults to the same (stripped) name as gf_file_name, and it is placed in the current working directory with the pk suffix replacing gf.
       For example, the input file cmr10.300gf would become cmr10.300pk.

OPTIONS
       Unless the -v switch is given, gftopk operates silently.  With -v, the version number of the program and statistics about the packing are output to stdout.

ENVIRONMENT
       gftopk looks for gf_file_name first in the current directory.  If it is not present there, it uses the environment variable GFFONTS.  If that is not set,  it  uses  the  variable
       TEXFONTS.  If that is not set, it uses the system default.

       See tex(1) for the details of the searching.

SEE ALSO
       gftype(1), pktogf(1), pktype(1).
       Donald E. Knuth et al., Metafontware.

AUTHORS
       Tomas Rokicki wrote the program. It was published as part of the Metafontware technical report, available from the TeX Users Group.  Paul Richards originally ported it to Unix.

Web2C 2019/dev                                                                         16 June 2015                                                                             GFTOPK(1)
