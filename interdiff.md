INTERDIFF(1)                                                                                    Man pages                                                                                    INTERDIFF(1)

NAME
       interdiff - show differences between two diff files

SYNOPSIS
       interdiff [[-p n] | [--strip-match=n]] [[-U n] | [--unified=n]] [[-d PAT] | [--drop-context=PAT]] [[-q] | [--quiet]] [[-z] | [--decompress]] [[-b] | [--ignore-space-change]] [[-B] |
                 [--ignore-blank-lines]] [[-i] | [--ignore-case]] [[-w] | [--ignore-all-space]] [[--interpolate] | [--combine] | [--flip]] [--no-revert-omitted] diff1 diff2

       interdiff {[--help] | [--version]}

DESCRIPTION
       interdiff creates a unified format diff that expresses the difference between two diffs. The diffs must both be relative to the same files. For best results, the diffs must have at least three
       lines of context.

       To reverse a patch, use /dev/null for diff2.

       To reduce the amount of context in a patch, use:

           interdiff -U1 /dev/null patchfile

       Since interdiff doesn't have the advantage of being able to look at the files that are to be modified, it has stricter requirements on the input format than patch(1) does. The output of GNU diff
       will be okay, even with extensions, but if you intend to use a hand-edited patch it might be wise to clean up the offsets and counts using recountdiff(1) first.

       Note, however, that the two patches must both be relative to the versions of the same original set of files.

       The diffs may be in context format. The output, however, will be in unified format.

OPTIONS
       -h
           Ignored, for compatibility with older versions of interdiff. This option will go away soon.

       -p n, --strip-match=n
           When comparing filenames, ignore the first n pathname components from both patches. (This is similar to the -p option to GNU patch(1).)

       -q, --quiet
           Quieter output. Don't emit rationale lines at the beginning of each patch.

       -U n, --unified=n
           Attempt to display n lines of context (requires at least n lines of context in both input files). (This is similar to the -U option to GNU diff(1).)

       -d PATTERN, --drop-context=PATTERN
           Don't display any context on files that match the shell wildcard PATTERN. This option can be given multiple times.

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
           Run as “interdiff”. This is the default.

       --combine
           Run as “combinediff”. See combinediff(1) for more information about how the behaviour is altered in this mode.

       --no-revert-omitted
           (For interpolation mode only) When a file is changed by the first patch but not by the second, don't revert that change.

       --help
           Display a short usage message.

       --version
           Display the version number of interdiff.

EXAMPLES
       Basic usage:

           interdiff -z 3.2pre1.patch.gz 3.2pre2.patch.gz

       Reversing a patch:

           interdiff patch /dev/null

       Reversing part of a patch (and ignoring the rest):

           filterdiff -i file.c patchfile | \
             interdiff /dev/stdin /dev/null

BUGS
       There are currently no known bugs in interdiff; but there are some caveats. If you find a bug, please report it (along with a minimal test case) to Tim Waugh <twaugh@redhat.com>.

       There are some sets of patches in which there is just not enough information to produce a proper interdiff. In this case, the strategy employed is to revert the original patch and apply the new
       patch. This, unfortunately, means that interdiffs are not guaranteed to be reversible.

SEE ALSO
       combinediff(1)

AUTHORS
       Tim Waugh <twaugh@redhat.com>
           Package maintainer

       Michael K. Johnson <johnsonm@redhat.com>
           Original man page contributor

patchutils                                                                                     23 June 2009                                                                                  INTERDIFF(1)
