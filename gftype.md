GFTYPE(1)                                                                        General Commands Manual                                                                        GFTYPE(1)

NAME
       gftype - translate a generic font file for humans to read

SYNOPSIS
       gftype [-i] [-m] gf_file_name [output_file_name]

DESCRIPTION
       This manual page is not meant to be exhaustive.  The complete documentation for this version of TeX can be found in the info file or manual Web2C: A TeX implementation.

       The  gftype  program  translates a gf (generic font) file output by, for example, mf(1), to a file that humans can read.  It also serves as a gf file-validating program (i.e., if
       gftype can read it, it's correct) and as an example of a gf-reading program for other software that wants to read gf files.

       The gf_file_name on the command line must be complete. Because the resolution is part of the extension, it would not make sense to append a default extension as is done with  TeX
       or DVI-reading software. If no output_file_name is specified, the output goes to stdout.

OPTIONS
       The output file includes bitmap images of the characters, if -i is given on the command line, and a symbolic listing of the gf commands, if -m is specified.

ENVIRONMENT
       gftype looks for gf_file_name using the environment variable GFFONTS.  If that is not set, it uses the variable TEXFONTS.  If that is not set, it uses the system default.

SEE ALSO
       dvitype(1), pktype(1).
       Donald E. Knuth et al., Metafontware.

AUTHORS
       David  Fuchs and Don Knuth wrote the program.  It was published as part of the Metafontware technical report, available from the TeX Users Group.  Paul Richards originally ported
       it to Unix.

Web2C 2019/dev                                                                         16 June 2015                                                                             GFTYPE(1)
