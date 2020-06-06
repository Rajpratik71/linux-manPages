UNWRAPDIFF(1)                                                                                   Man pages                                                                                   UNWRAPDIFF(1)

NAME
       unwrapdiff - demangle word-wrapped patches

SYNOPSIS
       unwrapdiff [-v] [file...]

       unwrapdiff {[--help] | [--version]}

DESCRIPTION
       unwrapdiff demangles patches that have been word-wrapped, in an attempt to make them useful.

       The corrected diff is sent to standard output. Note that you will probably need to use the -l option when applying the patch, in order to ignore any whitespace differences there may be.

OPTIONS
       -v
           Verbose operation. A list of lines that are modified in a way that might be wrong is sent to stderr.

       --help
           Display a short usage message.

       --version
           Display the version number of unwrapdiff.

LIMITATIONS
       Some heuristics are used to decide whether use a space to recombine a wrapped line, or just join them together. Currently this is done by comparing with last three characters of a line with the
       first two characters of its continuation, and using a space if any of them are different.

       The patch needs to have been valid before being word-wrapped.

       The last line of a hunk is nearly always ambiguous. If the next line begins “@@”, “Index: ”, “diff ” or “--- ” then it is taken to be complete; otherwise it is unwrapped using the next line.

AUTHOR
       Tim Waugh <twaugh@redhat.com>
           Package maintainer

patchutils                                                                                   17 January 2003                                                                                UNWRAPDIFF(1)
