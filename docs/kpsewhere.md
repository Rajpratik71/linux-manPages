kpsewhere(1)                                                                              teTeX                                                                              kpsewhere(1)

NAME
       kpsewhere - Expanding kpsewhich to separately iterate over each texmf tree listed in $TEXMF.

SYNOPSIS
       kpsewhere  [ kpsewhich-OPTIONS... ] COMMAND

DESCRIPTION
       kpsewhere  is an extension to kpsewhich (as where is for which in tcsh).  The intention is to provide a way to check for conflicts/shadowed files. It will, however, only find one
       file per TEXMF tree.

OPTIONS
       -h|--help
              show a short help message

       *      all other options are directly handed to kpsewhich

SEE ALSO
       kpsewhich(1)

       Kpathsea: A library for path searching (info or DVI file)

       Web page: <http://tug.org/teTeX/>

BUGS
       None known, but report any bugs found to <tetex@dbs.uni-hannover.de> (mailing list).

AUTHOR
       kpsewhere was written by Hans Fredrik Nordhaug <hans.fredrik@nordhaug.no>, additions by Thomas Esser <te@dbs.uni-hannover.de>, in 2003 and  2004.   kpsewhere  is  in  the  public
       domain.

       This manual page was written by Frank Küster <frank@kuesterei.ch>, for the Debian GNU/Linux system.  It is also in the public domain and may be used and changed by others without
       contacting the author.  Any mistakes or omissions in the manual page are my fault; inquiries about or corrections to this manual page should be directed to me  (and  not  to  the
       primary author).

teTeX                                                                                   March 2004                                                                           kpsewhere(1)
