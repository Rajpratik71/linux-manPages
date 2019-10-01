dvired(1)                                                                                           teTeX                                                                                           dvired(1)



NAME
       dvired - print dvi-files

SYNOPSIS
       dvired [ options ] file

DESCRIPTION
       dvired behaves like dvips, except for the fact that two logical pages are put onto each physical sheet of paper.

       For options, see dvips(1).  This program only interprets the following options:

       -o file - redirect output into file.

       -P printer - direct output to printer.

       -f - direct output to stdout.

       Any other option is passed directly to dvips.


EXAMPLES
       It is assumed that the PRINTER-variable is set.

       dvired -Plw foo - send output to printer lw.
       dvired -o foo.ps foo - send output to file foo.ps.
       dvired -pp4-7 foo - send 4 pages (reduced onto 2 sheets) of foo to the printer.
       dvired foo -f | ghostview - - preview output with ghostview.


SEE ALSO
       dvips(1)

BUGS
       dvired is fixed on A4 paper size. If you want to use it with other paper, you have to change the settings within the source.

AUTHOR
       Thomas Esser <te@dbs.uni-hannover.de>



teTeX                                                                                               09/94                                                                                           dvired(1)
