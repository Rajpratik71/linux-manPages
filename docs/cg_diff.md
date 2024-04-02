CG_DIFF(1)                                                        Release 3.12.0                                                        CG_DIFF(1)

NAME
       cg_diff - compares two Cachegrind output files

SYNOPSIS
       cg_diff [options] cachegrind-out-file1 cachegrind-out-file2

DESCRIPTION
       cg_diff takes two output files produced by the Valgrind tool Cachegrind, computes the difference and prints the result in the same format
       that Cachegrinds outputs.

OPTIONS
       -h --help
           Show the help message.

       --version
           Show the version number.

       --mod-filename=<expr> [default: none]
           Specifies a Perl search-and-replace expression that is applied to all filenames. Useful for removing minor differences in paths between
           two different versions of a program that are sitting in different directories.

       --mod-funcname=<expr> [default: none]
           Like --mod-filename, but for filenames. Useful for removing minor differences in randomized names of auto-generated functions generated
           by some compilers.

SEE ALSO
       cg_annotate(1), valgrind(1), $INSTALL/share/doc/valgrind/html/index.html or http://www.valgrind.org/docs/manual/index.html.

AUTHOR
       Nicholas Nethercote.

Release 3.12.0                                                      12/06/2016                                                          CG_DIFF(1)
