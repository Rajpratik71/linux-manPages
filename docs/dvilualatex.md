LATEX(1)                                                                         General Commands Manual                                                                         LATEX(1)

NAME
       latex, pdflatex, xelatex, lualatex, dvilualatex, cslatex, pdfcslatex, platex, uplatex, lamed - structured text formatting and typesetting

SYNOPSIS
       latex [first-line]

DESCRIPTION
       This manual page is a mere skeleton.

       The  LaTeX  language is described in the book LaTeX - A Document Preparation System.  LaTeX is a TeX macro package, not a modification to the TeX source program, so all the capa‐
       bilities described in tex(1) are present.

       The LaTeX macros encourage writers to think about the content of their documents, rather than the form.  The ideal, very difficult to realize, is to have no  formatting  commands
       (like ``switch to italic'' or ``skip 2 picas'') in the document at all; instead, everything is done by specific markup instructions: ``emphasize'', ``start a section''.

       The primary source of documentation for LaTeX is the LaTeX manual referenced below.

       lualatex, pdflatex, pdfcslatex, platex, uplatex, xelatex are LaTeX formats based on the respective engines.  All output PDF by default.
       lamed is the Aleph-based LaTeX format (DVI output).
       dvilualatex is LuaTeX-based and outputs DVI.
       cslatex is csTeX-based (primitives integrated into pdfTeX) and outputs DVI.

       On some systems latex209 and slitex may still be available for compatibility with older versions of LaTeX.  These should not be used for new texts.

SEE ALSO
       amstex(1), luatex(1), pdftex(1), tex(1), xetex(1).

       Leslie Lamport, LaTeX - A Document Preparation System, Addison-Wesley, 1985, ISBN 020115790X.

       Frank Mittelbach, Michel Goossens, Johannes Braams, David Carlisle, and Chris Rowley, LaTeX Companion, Addison-Wesley, 2004, ISBN 0201362996 (2nd edition).

       The LaTeX home page is http://latex-project.org.
       A list of some LaTeX tutorials is at http://www.tex.ac.uk/cgi-bin/texfaq2html?label=man-latex.
       An unofficial reference manual for LaTeX is at https://ctan.org/pkg/latex2e-help-texinfo.

Web2C 2018                                                                            30 April 2018                                                                              LATEX(1)
