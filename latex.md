LATEX(1)                                                                                   General Commands Manual                                                                                   LATEX(1)



NAME
       latex, elatex, lambda, pdflatex - structured text formatting and typesetting

SYNOPSIS
       latex [first-line]

DESCRIPTION
       This manual page is not meant to be exhaustive.  The complete documentation for this version of TeX can be found in the info file or manual Web2C: A TeX implementation.

       The  LaTeX  language is described in the book LaTeX - A Document Preparation System.  LaTeX is a TeX macro package, not a modification to the TeX source program, so all the capabilities described in
       tex(1) are present.

       The LaTeX macros encourage writers to think about the content of their documents, rather than the form.  The ideal, very difficult to realize, is to have no formatting  commands  (like  ``switch  to
       italic'' or ``skip 2 picas'') in the document at all; instead, everything is done by specific markup instructions: ``emphasize'', ``start a section''.

       The primary source of documentation for LaTeX is the LaTeX manual referenced below, and the local guide in the file local-guide.tex or local.tex or some such.

       elatex is the e-TeX extended mode version of LaTeX format.

       lambda is the Omega version of the LaTeX format.

       pdflatex is the pdfTeX version of the LaTeX format.

       On some systems latex209 and slitex are available for compatibility with older versions of LaTeX.  These should not be used for new texts.

SEE ALSO
       amslatex(1), amstex(1), pdflatex(1), pdftex(1), tex(1).

       Leslie Lamport, LaTeX - A Document Preparation System, Addison-Wesley, 1985, ISBN 020115790X.

       Frank Mittelbach, Michel Goossens, Johannes Braams, David Carlisle, and Chris Rowley, LaTeX Companion, Addison-Wesley, 2004, ISBN 0201362996 (2nd edition).

       LaTeX  Graphics  Companion, available as part of a boxed set: The LaTeX Companions, Revised Boxed Set : A Complete Guide and Reference for Preparing, Illustrating, and Publishing Technical Documents
       (2nd Edition), by Frank Mittelbach, Michel Goossens, Sebastian Rahtz, Helmut Kopka, Patrick W. Daly (Addison-Wesley, 2004, ISBN 0321269446).



Web2C 2012                                                                                       14 May 2010                                                                                         LATEX(1)
