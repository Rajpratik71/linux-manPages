SPLITDIFF(1)                                                                                   Man pages                                                                                  SPLITDIFF(1)

NAME
       splitdiff - separate out incremental patches

SYNOPSIS
       splitdiff [-a] [-d] [-D dir] [-p n] [-E] [file]

       splitdiff {[--help] | [--version]}

DESCRIPTION
       If you have a patch file composed of several incremental patches, you can use splitdiff to separate them out. You may want to do this in preparation for re-combining them with combinediff(1).

       The effect of running splitdiff is to separate its input into a set of output files, with no output file patching the same file more than once.

OPTIONS
       -a
           Split out every single file-level patch.

       -d
           Create file names such as a_b.c.patch for a patch that modifies a/b.c.

       -D dir
           Write output files into subdirectory dir. Implies -d.

       -p n
           Strip the first n components of the pathname to aid comparisons.

       -E
           Don't use .patch filename extension when writing output files.

       --help
           Display a short usage message.

       --version
           Display the version number of splitdiff.

SEE ALSO
       combinediff(1), lsdiff(1)

AUTHOR
       Tim Waugh <twaugh@redhat.com>
           Package maintainer

patchutils                                                                                    4 Nov 2014                                                                                  SPLITDIFF(1)
