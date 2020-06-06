FLIPDIFF(1)                                                                                     Man pages                                                                                     FLIPDIFF(1)

NAME
       flipdiff - exchange the order of two incremental patches

SYNOPSIS
       flipdiff [[-p n] | [--strip-match=n]] [[-U n] | [--unified=n]] [[-d PAT] | [--drop-context=PAT]] [[-q] | [--quiet]] [[-z] | [--decompress]] [[-b] | [--ignore-space-change]] [[-B] |
                [--ignore-blank-lines]] [[-i] | [--ignore-case]] [[-w] | [--ignore-all-space]] [--in-place] diff1 diff2

       flipdiff {[--help] | [--version]}

DESCRIPTION
       flipdiff exchanges the order of two patch files that apply one after the other. The patches must be “clean”: the context lines must match and there should be no mis-matched offsets.

       The swapped patches are sent to standard output, with a marker line (“=== 8< === cut here === 8< ===”) between them, unless the --in-place option is passed. In that case, the output is written
       back to the original input files.

OPTIONS
       -p n, --strip-match=n
           When comparing filenames, ignore the first n pathname components from both patches. (This is similar to the -p option to GNU patch(1).)

       -q, --quiet
           Quieter output. Don't emit rationale lines at the beginning of each patch.

       -U n, --unified=n
           Attempt to display n lines of context (requires at least n lines of context in both input files). (This is similar to the -U option to GNU diff(1).)

       -d pattern, --drop-context=PATTERN
           Don't display any context on files that match the shell wildcard pattern. This option can be given multiple times.

           Note that the interpretation of the shell wildcard pattern does not count slash characters or periods as special (in other words, no flags are given to fnmatch). This is so that
           “*/basename”-type patterns can be given without limiting the number of pathname components.

       -i, --ignore-case
           Consider upper- and lower-case to be the same.

       -w, --ignore-all-space
           Ignore whitespace changes in patches.

       -b, --ignore-space-change
           Ignore changes in the amount of whitespace.

       -B, --ignore-blank-lines
           Ignore changes whose lines are all blank.

       -z, --decompress
           Decompress files with extensions .gz and .bz2.

       --in-place
           Write output to the original input files.

       --help
           Display a short usage message.

       --version
           Display the version number of flipdiff.

LIMITATIONS
       This is only been very lightly tested, and may not even work. Using --in-place is not recommended at the moment.

       There are some cases in which it is not possible to meaningfully flip patches without understanding the semantics of the content. This program only uses complete lines that appear at some stage
       during the application of the two patches, and never composes a line from parts.

       Because of this, it is generally a good idea to read through the output to check that it makes sense.

AUTHOR
       Tim Waugh <twaugh@redhat.com>
           Package maintainer

patchutils                                                                                   23 January 2009                                                                                  FLIPDIFF(1)
