OVF2OVP(1)                                                                       General Commands Manual                                                                       OVF2OVP(1)

NAME
       ovf2ovp - convert virtual font file and associated font metrics to property-list format

SYNOPSIS
       ovf2ovp [options] ovfname[.ovf] [ofmname[.ofm] [ovpfile[.ovp]]]

DESCRIPTION
       ovf2ovp translates a virtual font (OVF) file, ovfname, and its companion font metric (OFM) file, ofmname, into a human-readable property-list format.  The program writes to stan‐
       dard output (by default) or to a file specified as ovpname.

       The program also works with TeX VF and TFM files, producing TeX VPL files.

OPTIONS
       (Same as ofm2opl).

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
       ovpfile
              Omega Virtual Property List file

       ofmname
              Omega Font Metric file

       ovfname
              Omega Virtual Font file

BUGS
       Send  bug  reports to <http://lists.tug.org/tex-k> (mailing list); may also check if the same bug is present in vftovp(1).  General discussion of Omega (and Aleph) can take place
       on the <http://lists.tug.org/omega> mailing list.

SEE ALSO
       omega(1), aleph(1), ofm2opl(1), ovp2ovf(1), pltotf(1), tftopl(1), vftovp(1), vptovf(1)

AUTHOR
       According to the WEB documentation:

              VFtoVP is an extended version of the program TFtoPL, which is part of the standard TeXware library.  The idea of a virtual font was inspired by the work of David R.  Fuchs
              who designed a similar set of conventions in 1984 while developing a device driver for ArborText, Inc.  He wrote a somewhat similar program called AMFtoXPL.

       Thus, ovf2ovp is based on the WEB source code for vftovp(1), although nowadays it is a link to omfonts, implemented entirely in C.

       The primary authors of Omega are John Plaice and Yannis Haralambous.  Omega (and Aleph) are now maintained as part of TeX Live.

       This  manual  page was written by C.M. Connelly <cmc@debian.org>, for the Debian GNU/Linux system.  It may be used by other distributions without contacting the author.  Any mis‐
       takes or omissions in the manual page are my fault; inquiries about or corrections to this manual page should be directed to me (and not to the primary author).

Web2C 2019/dev                                                                        14 April 2016                                                                            OVF2OVP(1)
