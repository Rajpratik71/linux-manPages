OPL2OFM(1)                                                                       General Commands Manual                                                                       OPL2OFM(1)

NAME
       opl2ofm - convert Omega and TeX property-list files to font-metric files

SYNOPSIS
       opl2ofm [OPTIONS] OPLFILE[.opl] [OFMFILE[.ofm]]

DESCRIPTION
       opl2ofm  translates  a property-list format file, OPLFILE, into the binary Omega Font Metric format.  The program writes to standard output (by default) or to a file specified as
       OFMFILE.

       The program also works with TeX PL files, producing TeX TFM files.  (opl2ofm is based on the WEB source code for pltotf(1).)

OPTIONS
       -help  display a brief summary of syntax and options

       -verbose
              display progress reports

       -version
              output version information and exit

BUGS
       None known, but report any found to <omega@ens.fr> (mailing list).  You should also check to see if the bug is present in pltotf(1).

SEE ALSO
       omega(1), ofm2opl(1), pltotf(1), tftopl(1).

       Draft Manual for the Omega System (omega-manual.dvi).

       Web page: <http://www.gutenberg.eu.org/omega/>

AUTHOR
       According to the WEB documentation:

              The first PLtoTF program was designed by Leo Guibas in the summer of 1978.  Contributions by Frank Liang, Doug Wyatt, and Lyle Ramshaw also had a significant effect on the
              evolution of the present code.

              Extensions for an enhanced ligature mechanism were added by D.E. Knuth in 1989.

              Extensions to handle extended font metric files (``OFM'') were added by John Plaice in December 1995 and January 1996, resulting in the new program OPL2OFM.

       The primary authors of Omega are John Plaice <plaice@cse.unsw.edu.au> and Yannis Haralambous <yannis@fluxus-virus.com>.

       This  manual  page was written by C.M. Connelly <cmc@debian.org>, for the Debian GNU/Linux system.  It may be used by other distributions without contacting the author.  Any mis‐
       takes or omissions in the manual page are my fault; inquiries about or corrections to this manual page should be directed to me (and not to the primary author).

Web2C 2019/dev                                                                         16 June 2015                                                                            OPL2OFM(1)
