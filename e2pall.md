e2pall(1)                                                                                 teTeX                                                                                 e2pall(1)

NAME
       e2pall - convert all EPS files in a LaTeX document to PDF

SYNOPSIS
       e2pall TEXFILE

DESCRIPTION
       e2pall searches through TEXFILE for \includegraphics commands to find the base names of image files.  When it finds one, e2pall runs epstopdf(1) to create a PDF file from the EPS
       file.

       e2pall will check to be sure that an existing PDF file is up-to-date with the EPS file, and will not run epstopdf(1) if the PDF file is newer than the EPS file.

BUGS
              Seems to be broken

              Cannot handle \input{filename} or \includegraphics{filename} split over more than one line

              Must be run from same directory as the LaTeX file

              Does not look down $TEXINPUTS

              Cannot handle documents that use \include commands

              Assumes all files included with \includegraphics are EPS files

SEE ALSO
       epstopdf(1)

AUTHOR
       e2pall was written by Jody Klymak <jklymak@apl.washington.edu> and published in a posting to the <pdftex@tug.org> (mailing list).

       This manual page was written by C.M. Connelly <c@eskimo.com>, for the Debian GNU/Linux system.  It may be used by other distributions without contacting the author.  Any mistakes
       or omissions in the manual page are my fault; inquiries about or corrections to this manual page should be directed to me (and not to the primary author).

teTeX                                                                                  August 2000                                                                              e2pall(1)
