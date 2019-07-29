INCLUDERES(1)                                                 General Commands Manual                                                INCLUDERES(1)

NAME
       includeres - filter to include resources in a PostScript document

SYNOPSIS
       includeres < document.ps > output.ps

DESCRIPTION
       Includeres  includes resources (fonts, procsets, patterns, files, etc) in place of %%IncludeResource comments in a PostScript document. The
       resources are searched for in the current directory and the system default directory under the  resource  name,  and  with  an  appropriate
       extension.  The pipeline

                                                         extractres file.ps | includeres >out.ps

       will  move  all  resources  appearing  in  a  document to the document prologue, removing redundant copies. The output file can then be put
       through page re-arrangement filters such as psnup or pstops safely.

FILES
       /usr/lib/psutils - system resource directory.

AUTHOR
       Copyright (C) Angus J. C. Duggan 1991-1995

SEE ALSO
       psbook(1), psselect(1), pstops(1), epsffit(1), psnup(1), psresize(1), psmerge(1), fixscribeps(1), getafm(1), fixdlsrps(1), fixfmps(1), fix‐
       psditps(1), fixpspps(1), fixtpps(1), fixwfwps(1), fixwpps(1), fixwwps(1), extractres(1), includeres(1), showchar(1)

TRADEMARKS
       PostScript is a trademark of Adobe Systems Incorporated.

BUGS
       includeres does not alter the %%DocumentNeededResources comments.

                                                          PSUtils Release 1 Patchlevel 17                                            INCLUDERES(1)
