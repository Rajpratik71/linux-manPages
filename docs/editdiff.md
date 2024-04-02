REDIFF(1)                                                                                      Man pages                                                                                     REDIFF(1)

NAME
       rediff, editdiff - fix offsets and counts of a hand-edited diff

SYNOPSIS
       rediff ORIGINAL EDITED

       rediff EDITED

       rediff {[--help] | [--version]}

       editdiff FILE

       editdiff {[--help] | [--version]}

DESCRIPTION
       You can use rediff to correct a hand-edited unified diff. Take a copy of the diff you want to edit, and edit it without changing any offsets or counts (the lines that begin “@@”). Then run
       rediff, telling it the name of the original diff file and the name of the one you have edited, and it will output the edited diff file but with corrected offsets and counts.

       A small script, editdiff, is provided for editing a diff file in-place.

       The types of changes that are currently handled are:

       ·   Modifying the text of any file content line (of course).

       ·   Adding new line insertions or deletions.

       ·   Adding, changing or removing context lines. Lines at the context horizon are dealt with by adjusting the offset and/or count.

       ·   Adding a single hunk (@@-prefixed section).

       ·   Removing multiple hunk (@@-prefixed sections).

       Alternatively, if only one argument is provided, it is taken to be the edited file and the counts and offsets are adjusted as appropriate. Some assumptions are made when used in this mode.
       See recountdiff(1) for more information.

OPTIONS
       --help
           Display a short usage message.

       --version
           Display the version number of rediff.

SEE ALSO
       interdiff(1), recountdiff(1)

AUTHOR
       Tim Waugh <twaugh@redhat.com>
           Package maintainer

patchutils                                                                                    13 May 2002                                                                                    REDIFF(1)
