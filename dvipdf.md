DVIPDF(1)                                     Ghostscript                                    DVIPDF(1)

NAME
       dvipdf - Convert TeX DVI file to PDF using ghostscript and dvips

SYNOPSIS
       dvipdf [ options ] input.dvi [ output.pdf ] ...

DESCRIPTION
       This  script invokes dvips(1) with the -q option, and pipes its output into gs(1) with the fol‐
       lowing options:

                                   -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite

       as well as -sOutputFile and any options from the command-line.

SEE ALSO
       gs(1), dvips(1)

VERSION
       This document was last revised for Ghostscript version 9.27.

AUTHOR
       Artifex Software, Inc. are the primary maintainers of Ghostscript.  This manpage by George Fer‐
       guson.

9.27                                         4 April 2019                                    DVIPDF(1)
