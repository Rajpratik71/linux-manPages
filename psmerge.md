PSMERGE(1)                                                    General Commands Manual                                                   PSMERGE(1)

NAME
       psmerge - filter to merge several PostScript files into one

SYNOPSIS
       psmerge [ -oout.ps ] file.ps ...

DESCRIPTION
       Psmerge  merges  PostScript  documents into a single document. It only works in the specific case the the files were created using the same
       application, with the same device setup and resources (fonts, procsets, patterns, files, etc) loaded.

       If the -o option is used, output will be sent to the file named, otherwise it will go to standard output.

       Psmerge will merge multiple files concatenated into a single file as if they were in separate files.

AUTHOR
       Copyright (C) Angus J. C. Duggan 1991-1995

SEE ALSO
       psbook(1), psselect(1), pstops(1), epsffit(1), psnup(1), psresize(1), psmerge(1), fixscribeps(1), getafm(1), fixdlsrps(1), fixfmps(1), fix‐
       psditps(1), fixpspps(1), fixtpps(1), fixwfwps(1), fixwpps(1), fixwwps(1), extractres(1), includeres(1), showchar(1)

TRADEMARKS
       PostScript is a trademark of Adobe Systems Incorporated.

BUGS
       psmerge is for a very specific case; it does not merge files in the general case.

                                                          PSUtils Release 1 Patchlevel 17                                               PSMERGE(1)
