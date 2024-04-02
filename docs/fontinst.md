fontinst(1)                                                                               teTeX                                                                               fontinst(1)

NAME
       fontinst - utility to run TeX as fontinst

SYNOPSIS
       fontinst package

DESCRIPTION
       fontinst runs tex(1) with the --progname flag set to pretend to be the program fontinst (affecting Karl Berry paths).

       Typing

       fontinst fontinst.sty

       will start tex(1) and give the user an interactive prompt (*) where fontinst commands can be typed (such as \latinfamily{ptm}{}\bye).

SEE ALSO
       tex(1)

       The fontinst manual, fontinst.tex.

       Web page: <http://tug.org/applications/fontinst/>

BUGS
       None known, but report any bugs found to tex-fonts@tug.org (mailing list).

AUTHOR
       Thomas Esser <te@dbs.uni-hannover.de>

       This manual page was written by C.M. Connelly <c@eskimo.com>, for the Debian GNU/Linux system.  It may be used by other distributions without contacting the author.  Any mistakes
       or omissions in the manual page are my fault; inquiries about or corrections to this manual page should be directed to me (and not to the primary author).

teTeX                                                                                    May 2000                                                                             fontinst(1)
