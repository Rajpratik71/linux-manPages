FINDHYPH(1)                                                                                                                                                                   FINDHYPH(1)

NAME
       findhyph – find words hyphenated by TeX in a document

INSTALLATION
       Copy findhyph or findhyph.bat (depending on OS used) to a directory included in system PATH. Perl interpreter is required to be in "/usr/bin/" for Unix-like systems or in PATH
       when using findhyph.bat.

SYNOPSIS
       findhyph [options] foo.log

DESCRIPTION
       To use this program:

       1)  set "\tracingparagraphs=1" in a TeX document foo.tex and run:

       2)  tex foo.tex

       3)  findhyph [options] foo.log

       If you are setting "\looseness=<N>" to optimize paragraphs, you need to pass that information to the file foo.log in a form "@looseness=<N>" (on a separate line). You can use a
       macro like "\def\setlooseness#1{\looseness=#1 \immediate\write-1{@looseness=#1}}" for this purpose. If the paragraph contains material in display math mode, you need to use the
       macro in all split parts of the paragraph.

OPTIONS
       -c  display hyphenated words in context

       -f  display font selectors and other strings starting with a backslash character

       -v  display program version

       -p  generate file containing information about one-letter prepositions and conjunctions left at the end of line

       -l=STRING
           use prepositions/conjunctions listed in STRING instead of default list of prepositions and conjunctions "kKsSvVzZoOuUiIA" used for Slovak and Czech language

OUTPUT FILES
       foo.hyph
           List of hyphenated words. All punctuation characters, parentheses and other character immediately preceding or following displayed words are included in this list. TeX
           constructs which are too difficult to display ("\hbox{}", "\mark{}" etc.) are shown as "[]". Math mode is indicated by "$" sign.

           Page numbers in square brackets refer to LOG file and may occasionally differ from the typeset document. The reason is that TeX may need to break more paragraphs than it
           would eventually fit on the page in order to find a page break.

           Words hyphenated in footnotes are listed before the words hyphenated in the paragraph in which the footnote is referenced.

       foo.prep
           List of prepositions if option -p is used.

HISTORY
       1.0 (2001-04-08)

       ·   public release

       2.0 (2009-08-10)

       ·   fixes in line breaks detection algorithm; support for the third pass of line breaking algorithm in TeX (positive "\emergencystretch"); support for discretionary breaks in the
           first pass

       ·   page number detection improved (recognized negative page numbers, compound page numbers when "\count1" to "\count9" registers are non-zero and "[nn{mapfile}]",
           "[nn<picture>]" and "[nn<newline>" formats used by pdfTeX; false page number detection should be much more rare)

       ·   configurable list of prepositions and conjunctions

       ·   hyphenated words can be displayed in context

       ·   suggestions and testing by Pavel Stříž

       3.0 (2012-02-01)

       ·   fixed a bug when total paragraph demerits are negative

       ·   "\looseness" setting is now taken into account (thanks to Karel Horák for identifying the issue)

       3.1 (2012-11-03)

       ·   fixed displaying of hyphenated ligatures (bug reported by Karel Horák)

       3.2 (2012-11-21)

       ·   improved example definition of the "\setlooseness" macro (thanks to Karl Berry)

       3.3 (2013-06-18)

       ·   fixed the manual page as suggested by Eric S. Raymond

       3.4 (2015-10-18)

       ·   fixed processing of logs produced using ε-TeX's "\lastlinefit" option (bug reported by Karel Horák)

       ·   fixed cross-platform handling of linebreaks in the input file

LICENSE
       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either
       version 2 of the License, or any later version.

AUTHOR
       Copyright (c) Martin Budaj <m.b@speleo.sk> 2000, 2001, 2009, 2012, 2015

perl v5.20.2                                                                            2015-10-18                                                                            FINDHYPH(1)
