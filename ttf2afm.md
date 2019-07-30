TTF2AFM(1)                                                                       General Commands Manual                                                                       TTF2AFM(1)

NAME
       ttf2afm - utility to generate AFM files for TrueType fonts

SYNOPSIS
       ttf2afm [OPTIONS] FONTFILE

DESCRIPTION
       ttf2afm is used to generate Adobe Font Metrics (AFM) files for TrueType (TTF) fonts to allow them to be used with TeX.

       ttf2afm takes the name of a TrueType font file as a required argument.  It may also take one or more options from the list below (-i and -u are mutually exclusive).

OPTIONS
       -i     force printing glyph names in form `index'decnum

       -u     force printing glyph names in form `uni'hexnum

       -c name
              write encoding tables to file name.eMN, where M is the platform ID and N is the encoding ID

       -v     print program version

       -e enc encode AFM output using encoding vector from enc

       -o outfile
              output to file outfile instead of standard output

       -m num use Unicode mapping num in the font

       Platform numbers can be one of

       0      Apple Unicode

       1      Macintosh

       2      ISO

       3      Microsoft

       Encodings can be

       0      Roman (if platform is Macintosh)

       0      Symbol (if platform is Microsoft)

       1      Unicode (if platform is Microsoft)

SEE ALSO
       afm2tfm(1),  afm2pl(1).   FontForge  (http://fontforge.sf.net).  LCDF TypeTools (http://lcdf.org).  A closer look at TrueType fonts and pdfTeX, Han The Thanh (http://tug.org/TUG‐
       boat/tb30-1/tb94thanh.pdf).

BUGS
       Send bug reports to <pdftex@tug.org> (public mailing list).

AUTHOR
       ttf2afm is part of pdfTeX and was written by Han The Thanh.

       This manual page was originally written by C.M. Connelly, for the Debian GNU/Linux system, and updated by Karl Berry and others.

Web2C 2019/dev                                                                         8 March 2016                                                                            TTF2AFM(1)
