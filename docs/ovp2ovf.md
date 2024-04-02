OVP2OVF(1)                                                                       General Commands Manual                                                                       OVP2OVF(1)

NAME
       ovp2ovf - convert a virtual property-list file into a virtual font file and its associated font metric file

SYNOPSIS
       ovp2ovf [OPTIONS] OVPFILE[.ovp] [OVFFILE[.ovf] [OFMFILE[.ofm]]]

DESCRIPTION
       ovp2ovf translates a human-readable virtual property list (OVP) file, OVPFILE, into a virtual font (OVF) file, OVFFILE and its companion font metric (OFM) file, OFMFILE.

       The program also works with TeX VP files, producing VF and TFM files.  (ovp2ovf is based on the WEB source code for vptovf(1).)

OPTIONS
       -help  display a brief summary of syntax and options

       -verbose
              display progress reports

       -version
              output version information and exit

FILES
       OFMFILE
              Omega Font Metric file

       OVFFILE
              Omega Virtual Font file

       OVPFILE
              Omega Virtual Property List file

BUGS
       None known, but report any found to <omega@ens.fr> (mailing list).  You should also check to see if the bug is in vptovf(1).

SEE ALSO
       omega(1), ofm2opl(1), ovf2ovp(1), pltotf(1), tftopl(1), vftovp(1), vptovf(1)

       Draft Manual for the Omega System (omega-manual.dvi).

       Web page: <http://www.gutenberg.eu.org/omega/>

AUTHOR
       According to the WEB documentation:

              VPtoVF  is  an  extended  version  of  the program PLtoTF, which is part of the standard TeXware library.  OVP2OVF is an extended version of VPtoVF that allows much larger
              fonts.  The idea of a virtual font was inspired by the work of David R. Fuchs who designed a similar set of conventions in 1984 while developing a device driver for Arbor‐
              Text, Inc.  He wrote a somewhat similar program called PLFONT.

       The primary authors of Omega are John Plaice <plaice@cse.unsw.edu.au> and Yannis Haralambous <yannis@fluxus-virus.com>.

       This  manual  page was written by C.M. Connelly <cmc@debian.org>, for the Debian GNU/Linux system.  It may be used by other distributions without contacting the author.  Any mis‐
       takes or omissions in the manual page are my fault; inquiries about or corrections to this manual page should be directed to me (and not to the primary author).

Web2C 2019/dev                                                                         16 June 2015                                                                            OVP2OVF(1)
