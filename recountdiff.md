RECOUNTDIFF(1)                                                       Man pages                                                      RECOUNTDIFF(1)

NAME
       recountdiff - recompute patch counts and offsets

SYNOPSIS
       recountdiff [file...]

       recountdiff {[--help] | [--version]}

DESCRIPTION
       recountdiff recomputes the counts and offsets in unified context diffs. It does this in two passes: first the counts are corrected by
       inspection of the actual patch lines, and then the offsets are adjusted according to the computed counts.

       The corrected diff is sent to standard output.

OPTIONS
       --help
           Display a short usage message.

       --version
           Display the version number of recountdiff.

LIMITATIONS
       There are some things that cannot be dealt with. If you have removed the first context line in a hunk, for example, there is no way for
       recountdiff to know that. For more precise fixing up, use rediff(1), which uses the original and modified diffs.

SEE ALSO
       rediff(1)

AUTHOR
       Tim Waugh <twaugh@redhat.com>
           Package maintainer

patchutils                                                          5 July 2002                                                     RECOUNTDIFF(1)
