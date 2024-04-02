alldc(1)                                                                                  teTeX                                                                                  alldc(1)

NAME
       allec - force the most important ec-fonts to be calculated

SYNOPSIS
       allec [-r]

DESCRIPTION
       allec  forces  a large number of ec-style Fonts to be calculated as pixel files.  This is done through running dvips(1) over a certain test-file. Therefore, the fonts are created
       in the resolution needed by dvips.

       If the -r flag is specified, the command dvired(1) will be used instead of dvips.

       alldc does not recalculate existing fonts (as long as the Metafont mode does not change).

SEE ALSO
       allcm(1), allneeded(1), dvips(1), dvired(1).

AUTHOR
       Thomas Esser <te@dbs.uni-hannover.de>

teTeX                                                                                     11/94                                                                                  alldc(1)
