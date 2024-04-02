kpsetool(1)                                                                               teTeX                                                                               kpsetool(1)

NAME
       kpsetool - script to make teTeX-style kpsetool, kpsexpand, and kpsepath available

SYNOPSIS
       kpsetool  [ OPTIONS... ] COMMAND

       kpsexpand [ OPTIONS... ] STRING

       kpsepath  [ OPTIONS... ] PATHTYPE

DESCRIPTION
       kpsetool is a Bourne shell script that makes a teTeX-style kpsetool, kpsexpand, and kpsepath available.  kpsetool uses web2c´s (new) kpsexpand binary, so the syntax for kpsexpand
       is incompatible with teTeX´s as of version 0.4.

OPTIONS
       -m mode
              set Metafont mode

       -n progname
              pretend to be progname to kpathsea

       -p     act like kpsepath(1)

       -v     act like kpsexpand(1)

       -w     act like kpsewhich(1)

USAGE
       PATHTYPE can be

       base   Metafont memory dump

       bib    BibTeX bibliography source

       bst    BibTeX style files

       cnf    Kpathsea runtime configuration files

       dvips_config
              dvips config files

       dvips_header
              dvips header files

       fmt    TeX memory dump

       gf     generic font bitmap

       mem    MetaPost memory dump

       mf     Metafont source

       mfpool Metafont program strings

       mp     MetaPost source

       mppool MetaPost program strings

       mpsupport
              MetaPost support files

       pict   Other kinds of figures

       pk     packed bitmap font

       tex    TeX source

       texpool
              TeX program strings

       tfm    TeX font metrics

       troff_font
              troff fonts

       vf     virtual font

SEE ALSO
       kpsewhich(1)

       Kpathsea: A library for path searching (info or DVI file)

       Web page: <http://tug.org/teTeX/>

BUGS
       None known, but report any bugs found to <tetex@dbs.uni-hannover.de> (mailing list).

AUTHOR
       kpsetool was written by Thomas Esser <te@dbs.uni-hannover.de> in March, 1997.  kpsetool is in the public domain.

       This manual page was written by C.M. Connelly <c@eskimo.com>, for the Debian GNU/Linux system.  It may be used by other distributions without contacting the author.  Any mistakes
       or omissions in the manual page are my fault; inquiries about or corrections to this manual page should be directed to me (and not to the primary author).

teTeX                                                                                 September 2000                                                                          kpsetool(1)
