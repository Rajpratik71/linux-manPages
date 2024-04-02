CG_MERGE(1)                                                       Release 3.12.0                                                       CG_MERGE(1)

NAME
       cg_merge - merges multiple Cachegrind output files into one

SYNOPSIS
       cg_merge [options] [cachegrind-out-files...]

DESCRIPTION
       cg_merge sums together the outputs of multiple Cachegrind runs into a single output file.

OPTIONS
       -o outfile
           Write the profile data to outfile rather than to standard output.

SEE ALSO
       cg_annotate(1), valgrind(1), $INSTALL/share/doc/valgrind/html/index.html or http://www.valgrind.org/docs/manual/index.html.

AUTHOR
       Nicholas Nethercote.

Release 3.12.0                                                      12/06/2016                                                         CG_MERGE(1)
