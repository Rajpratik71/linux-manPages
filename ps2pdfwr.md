PS2PDFWR(1)                                                                                    Ghostscript                                                                                    PS2PDFWR(1)

NAME
       ps2pdfwr - Convert PostScript to PDF without specifying CompatibilityLevel, using ghostscript

SYNOPSIS
       ps2pdfwr  [options...] {input.[e]ps|-} [output.pdf|-]

DESCRIPTION
       This wrapper script invokes gs(1) with following arguments

                                                                                     -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite

       as well as the appropriate -dOutputFile argument, all preceded and followed by any command-line arguments. Finally, the security option -dSAFER is prepended before all the other options.

       The version-specific ps2pdf scripts all invoke this one with the addition of the respective compatibility level option.

SEE ALSO
       gs(1), ps2pdf(1)

VERSION
       This document was last revised for Ghostscript version 9.26.

AUTHOR
       Artifex Software, Inc. are the primary maintainers of Ghostscript.  This manpage by George Ferguson.

9.26                                                                                         20 November 2018                                                                                 PS2PDFWR(1)
