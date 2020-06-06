DEHTMLDIFF(1)                                                                                   Man pages                                                                                   DEHTMLDIFF(1)

NAME
       dehtmldiff - get usable diff from an HTML page

SYNOPSIS
       dehtmldiff [file...]

       dehtmldiff {[--help] | [--version]}

DESCRIPTION
       dehtmldiff creates usable diff files from HTML pages. This is useful in the scenario where a patch has been posted to a mailing list viewable via a web page.

       The corrected diff is sent to standard output. Note that you will probably need to use the -l option when applying the patch, in order to ignore any whitespace differences there may be.

OPTIONS
       --help
           Display a short usage message.

       --version
           Display the version number of dehtmldiff.

LIMITATIONS
       The way this command works is fairly primitive; it boils down to some simple text replacements, followed by an unwrapdiff pass. As a result, all of the limitations that apply to unwrapdiff also
       apply to dehtmldiff.

AUTHOR
       Tim Waugh <twaugh@redhat.com>
           Package maintainer

patchutils                                                                                   17 January 2003                                                                                DEHTMLDIFF(1)
