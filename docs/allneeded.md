allneeded(1)                                                                              teTeX                                                                              allneeded(1)

NAME
       allneeded - force the calculation of all fonts now needed

SYNOPSIS
       allneeded [-r] files ...

DESCRIPTION
       allneeded forces the calculation of all fonts that are needed to preview a set of dvi files. Just specify where the program should search for files on the commandline.  The fonts
       generation is triggered by running dvips(1) over all accessible dvi-files. Therefore, the fonts are created in the resolution needed by dvips.

       If the -r flag is specified, the command dvired(1) will be used instead of dvips.

       allneeded does not recalculate existing fonts (as long as the Metafont mode does not change).

SEE ALSO
       allec(1), allcm(1), dvips(1), dvired(1).

AUTHOR
       Thomas Esser <te@dbs.uni-hannover.de>

teTeX                                                                                     11/94                                                                              allneeded(1)
