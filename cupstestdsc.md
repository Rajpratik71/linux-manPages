cupstestdsc(1)                                                                                    Apple Inc.                                                                                   cupstestdsc(1)



NAME
       cupstestdsc - test conformance of postscript files

SYNOPSIS
       cupstestdsc [ -h ] filename.ps [ ...  filenameN.ps ]
       cupstestdsc [ -h ] -

DESCRIPTION
       cupstestdsc  tests  the  conformance  of PostScript files to the Adobe PostScript Language Document Structuring Conventions Specification version 3.0. The results of testing and any other output are
       sent to the standard output. The second form of the command reads PostScript from the standard input.

LIMITATIONS
       cupstestdsc only validates the DSC comments in a PostScript file and does not attempt to validate the PostScript code itself.  Developers must ensure that the PostScript they  generate  follows  the
       rules defined by Adobe. Specifically, all pages must be independent of each other, code outside page descriptions may not affect the graphics state (current font, color, transform matrix, etc.), and
       device-specific commands such as setpagedevice should not be used.

SEE ALSO
       http://localhost:631/help
       Adobe PostScript Language Document Structuring Conventions Specification, Version 3.0.

COPYRIGHT
       Copyright 2007-2013 by Apple Inc.



20 March 2006                                                                                        CUPS                                                                                      cupstestdsc(1)
