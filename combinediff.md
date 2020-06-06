COMBINEDIFF(1)                                                                                  Man pages                                                                                  COMBINEDIFF(1)

NAME
       combinediff - create a cumulative unified patch from two incremental patches

SYNOPSIS
       combinediff [[-p n] | [--strip-match=n]] [[-U n] | [--unified=n]] [[-d PAT] | [--drop-context=PAT]] [[-q] | [--quiet]] [[-z] | [--decompress]] [[-b] | [--ignore-space-change]] [[-B] |
                   [--ignore-blank-lines]] [[-i] | [--ignore-case]] [[-w] | [--ignore-all-space]] [[--interpolate] | [--combine]] diff1 diff2

       combinediff {[--help] | [--version]}

DESCRIPTION
       combinediff creates a unified diff that expresses the sum of two diffs. The diff files must be listed in the order that they are to be applied. For best results, the diffs must have at least
       three lines of context.

       Since combinediff doesn't have the advantage of being able to look at the files that are to be modified, it has stricter requirements on the input format than patch(1) does. The output of GNU
       diff will be okay, even with extensions, but if you intend to use a hand-edited patch it might be wise to clean up the offsets and counts using recountdiff(1) first.

       Note, however, that the two patches must be in strict incremental order. In other words, the second patch must be relative to the state of the original set of files after the first patch was
       applied.

       The diffs may be in context format. The output, however, will be in unified format.

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

       --interpolate
           Run as “interdiff”. See interdiff(1) for more information about how the behaviour is altered in this mode.

       --combine
           Run as “combinediff”. This is the default.

       --help
           Display a short usage message.

       --version
           Display the version number of combinediff.

BUGS
       The -U option is a bit erratic: it can control the amount of context displayed for files that are modified in both patches, but not for files that only appear in one patch (which appear with the
       same amount of context in the output as in the input).

SEE ALSO
       interdiff(1)

AUTHOR
       Tim Waugh <twaugh@redhat.com>
           Package maintainer

patchutils                                                                                     23 Jan 2009                                                                                 COMBINEDIFF(1)
