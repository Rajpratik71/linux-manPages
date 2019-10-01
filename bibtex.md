BIBTEX(1)                                                                                         Web2C 2012                                                                                        BIBTEX(1)



NAME
       bibtex - make a bibliography for (La)TeX

SYNOPSIS
       bibtex [-min-crossrefs=number] [-terse] auxname[.aux]

DESCRIPTION
       This manual page is not meant to be exhaustive.  The complete documentation for this version of TeX can be found in the info file or manual Web2C: A TeX implementation.

       BibTeX  reads  the top-level auxiliary (.aux) file auxname that was output during the running of latex(1) or tex(1) and creates a bibliography (.bbl) file that will be incorporated into the document
       on subsequent runs of LaTeX or TeX.

       BibTeX looks up, in bibliographic database (.bib) files specified by the \bibliography command, the entries specified by the \cite and \nocite commands in the LaTeX or TeX source file.   It  formats
       the information from those entries according to instructions in a bibliography style (.bst) file (specified by the \bibliographystyle command, and it outputs the results to the .bbl file.

       The  LaTeX  manual explains what a LaTeX source file must contain to work with BibTeX.  Appendix B of the manual describes the format of the .bib files. The `BibTeXing' document describes extensions
       and details of this format, and it gives other useful hints for using BibTeX.

OPTIONS
       The -min-crossrefs option defines the minimum number of crossref required for automatic inclusion of the crossref'd entry on the citation list; the default is two.  With the  -terse  option,  BibTeX
       operates silently.  Without it, a banner and progress reports are printed on stdout.

ENVIRONMENT
       BibTeX  searches the directories in the path defined by the BSTINPUTS environment variable for .bst files. If BSTINPUTS is not set, it uses the system default.  For .bib files, it uses the BIBINPUTS
       environment variable if that is set, otherwise the default.  See tex(1) for the details of the searching.

       If the environment variable TEXMFOUTPUT is set, BibTeX attempts to put its output files in it, if they cannot be put in the current directory.  Again, see tex(1).  No special searching is  done  for
       the .aux file.

FILES
       *.bst  Bibliography style files.

       btxdoc.tex
              ``BibTeXing'' - LaTeXable documentation for general BibTeX users

       btxhak.tex
              ``Designing BibTeX Styles'' - LaTeXable documentation for style designers

       btxdoc.bib
              database file for those two documents

       xampl.bib
              database file giving examples of all standard entry types

       btxbst.doc
              template file and documentation for the standard styles

       All those files should be available somewhere on your system.

       The host math.utah.edu has a vast collection of .bib files available for anonymous ftp, including references for all the standard TeX books and a complete bibliography for TUGboat.

SEE ALSO
       latex(1), tex(1).
       Leslie Lamport, LaTeX - A Document Preparation System, Addison-Wesley, 1985, ISBN 0-201-15790-X.

AUTHOR
       Oren  Patashnik, Stanford University.  This man page describes the web2c version of BibTeX.  Other ports of BibTeX, such as Donald Knuth's version using the Sun Pascal compiler, do not have the same
       path searching implementation, or the command-line options.



bibtex 0.99d                                                                                   1 February 2010                                                                                      BIBTEX(1)
