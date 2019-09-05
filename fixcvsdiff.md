FIXCVSDIFF(1)                                                                                  Man pages                                                                                 FIXCVSDIFF(1)

NAME
       fixcvsdiff - fix problematic diff files

SYNOPSIS
       fixcvsdiff [-p] [-b] [file...]

DESCRIPTION
       fixcvsdiff modifies diff files created from the cvs diff command, where files have been added or removed. CVS tends to create diff files that patch(1) mis-interprets. The diff file must
       retain the lines beginning with “Index:” in order for the correction to work.

OPTIONS
       -b
           Keep a .bak backup file.

       -p
           Print out the cvs add and cvs remove commands that must be made after applying the diff, but before running cvs commit.

SEE ALSO
       diff(1), patch(1), cvs(1)

AUTHORS
       Tim Waugh <twaugh@redhat.com>
           Package maintainer

       Amir Karger <karger@post.harvard.edu>
           Author of the original perl script and man page

       John Levon <moz@compsoc.man.ac.uk>
           Author of the original perl script and man page

patchutils                                                                                    7 Dec 2001                                                                                 FIXCVSDIFF(1)
