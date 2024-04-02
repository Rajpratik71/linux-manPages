allcm(1)                                                                                  teTeX                                                                                  allcm(1)

NAME
       allcm - force the most important Computer-Modern-fonts to be calculated

SYNOPSIS
       allcm [-r]

DESCRIPTION
       allcm  forces  a  large number of Computer Modern Fonts to be calculated as pixel files.  This is done through running dvips(1) over a certain test-file. Therefore, the fonts are
       created in the resolution needed by dvips.

       If the -r flag is specified, the command dvired(1) will be used instead of dvips.

       allcm does not recalculate existing fonts (as long as the Metafont mode does not change).

SEE ALSO
       allec(1), allneeded(1), dvips(1), dvired(1).

AUTHOR
       Thomas Esser <te@dbs.uni-hannover.de>

teTeX                                                                                     11/94                                                                                  allcm(1)
