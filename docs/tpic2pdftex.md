TPIC2PDFTEX(1)                                                                       Tex Live Manpage                                                                      TPIC2PDFTEX(1)

NAME
       tpic2pdftex - convert tpic \specials for use by pdftex

SYNOPSIS
       pic -t somefile.pic | tpic2pdftex > somefile.tex

       Process somefile.tex by pdftex/pdflatex.

DESCRIPTION
       Experimental awk script for conversion of tpic \specials as produced by (groff-)pic into pdfTeX \pdfliteral sections for further processing by pdftex.

NOTES
       Current version: 1.97.

       tpic \special description see e. g.: Goossens, Rahtz, Mittelbach: The LaTeX Graphics Companion, Addison-Wesley, 1997, pp. 464.

BUGS
       Spline  curve  shapes  not  fully authentic (unknown algorithm).  Bounding box does not care for line thickness (groff pic feature).  Splines might be outside bounding box.  Fill
       color does not work correctly for arrowheads (pic limitation).

SEE ALSO
       pic(1), grap(1), groff(1), awk(1), pdftex(1).

GNU                                                                                     2008-08-01                                                                         TPIC2PDFTEX(1)
