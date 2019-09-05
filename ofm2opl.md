OFM2OPL(1)                                                                       General Commands Manual                                                                       OFM2OPL(1)

NAME
       ofm2opl - convert Omega and TeX font-metric files to property-list files

SYNOPSIS
       ofm2opl [options] ofmname[.ofm] [oplfile[.opl]]

DESCRIPTION
       ofm2opl translates a binary Omega Font Metrics file, ofmname, into a human-readable property-list form.  The program writes to standard output (by default) or to a file specified
       as oplfile.

       The program also works with TeX TFM files, producing TeX PL files.

OPTIONS
       (Same as ovf2ovp).

       -charcode-format=type
              output character codes according to type, either `hex', `octal' or `ascii'.  Default is `hex'; `ascii' says to use ASCII for letters and digits, hex for all else.

       -char-format=stype
              output character codes according to stype, either `num' or `ascii'. Default is `num'; `ascii' as in -charcode-format.  (These two redundant options  both  exist  only  for
              historical compatibility.)

       -num-format=ntype
              output numbers according to ntype, either `hex' or `octal'; default is hex.

       -text-format=ttype
              output coding scheme and family according to ttype, either `mixed' or `upper' case; default is mixed.

       -help  display a brief summary of syntax and options

       -verbose
              display progress reports

       -version
              output version information and exit

FILES
       OFMNAME
              an Omega Font Metric file

       OPLFILE
              an Omega Property List file

BUGS
       Send  bug  reports to <http://lists.tug.org/tex-k> (mailing list); may also check if the same bug is present in tftopl(1).  General discussion of Omega (and Aleph) can take place
       on the <http://lists.tug.org/omega> mailing list.

SEE ALSO
       omega(1), aleph(1), opl2ofm(1), pltotf(1), tftopl(1).

AUTHOR
       According to the WEB documentation:

              The first TFtoPL program was designed by Leo Guibas in the summer of 1978.  Contributions by Frank Liang, Doug Wyatt, and Lyle Ramshaw also had a significant effect on the
              evolution of the present code.

              Extensions for an enhanced ligature mechanism were added by D.E. Knuth in 1989.

              Extensions to handle extended font metric files (``OFM'') were added by John Plaice in December 1995 and January 1996, resulting in the new program OFM2OPL.

       ofm2opl is based on the WEB source code for tftopl(1), although nowadays it is a link to omfonts, implemented entirely in C.

       The primary authors of Omega are John Plaice and Yannis Haralambous.  Omega (and Aleph) are now maintained as part of TeX Live.

       This  manual  page was written by C.M. Connelly <cmc@debian.org>, for the Debian GNU/Linux system.  It may be used by other distributions without contacting the author.  Any mis‐
       takes or omissions in the manual page are my fault; inquiries about or corrections to this manual page should be directed to me (and not to the primary author).

Web2C 2019/dev                                                                        14 April 2016                                                                            OFM2OPL(1)
