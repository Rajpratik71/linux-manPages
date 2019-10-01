PKTOGF(1)                                                                                  General Commands Manual                                                                                  PKTOGF(1)



NAME
       pktogf - convert packed font files to generic font files

SYNOPSIS
       pktogf [-v] pk_file_name [gf_file_name]

DESCRIPTION
       This manual page is not meant to be exhaustive.  The complete documentation for this version of TeX can be found in the info file or manual Web2C: A TeX implementation.

       The pktogf program converts a packed font file (pk) to a generic font file (gf).  Packed font files are much smaller than the corresponding gf files, but some DVI readers only understand gf files.

       The pk_file_name on the command line must be complete. Because the resolution is part of the extension, it would not make sense to append a default extension as is done with TeX or DVI-reading soft‐
       ware. The gf_file_name defaults to the same (stripped) name as pk_file_name, and it is placed in the current working directory with the gf suffix replacing pk.  For example, the input file  io.300pk
       would become io.300gf.

OPTIONS
       Unless the -v switch is given, pktogf operates silently.  With -v, the version number of the program and statistics about the unpacking are output to stdout.

ENVIRONMENT
       pktogf looks for pk_file_name using the environment variable PKFONTS.  If that is not set, it uses the variable TEXPKS.  If that is not set, it uses TEXFONTS.  If that is not set, it uses the system
       default.

       See tex(1) for the details of the searching.

SEE ALSO
       gftopk(1), gftype(1), pktype(1).
       Donald E. Knuth et al., Metafontware.

AUTHORS
       Tomas Rokicki wrote the program.  Pierre MacKay adapted it for compilation with web2c.



Web2C 2012                                                                                     14 December 1993                                                                                     PKTOGF(1)
