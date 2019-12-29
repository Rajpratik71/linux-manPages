mtoolstest(1)                           General Commands Manual                          mtoolstest(1)

Name
       mtoolstest - tests and displays the configuration

Note of warning
       This  manpage has been automatically generated from mtools's texinfo documentation, and may not
       be entirely accurate or complete.  See the end of this man page for details.

Description
       The mtoolstest command is used to tests the mtools configuration files. To invoke it, just type
       mtoolstest  without any arguments.  Mtoolstest reads the mtools configuration files, and prints
       the cumulative configuration to stdout. The output can be used as a configuration  file  itself
       (although  you  might  want  to remove redundant clauses).  You may use this program to convert
       old-style configuration files into new style configuration files.

See Also
       Mtools' texinfo doc

Viewing the texi doc
       This manpage has been automatically generated from  mtools's  texinfo  documentation.  However,
       this  process is only approximative, and some items, such as crossreferences, footnotes and in‐
       dices are lost in this translation process.  Indeed, these items have no appropriate  represen‐
       tation  in the manpage format.  Moreover, not all information has been translated into the man‐
       page version.  Thus I strongly advise you to use the original texinfo doc.  See the end of this
       manpage for instructions how to view the texinfo doc.

       *      To generate a printable copy from the texinfo doc, run the following commands:

                     ./configure; make dvi; dvips mtools.dvi

       *      To generate a html copy,  run:

                     ./configure; make html

       A premade html can be found at `http://www.gnu.org/software/mtools/manual/mtools.html'

       *      To generate an info copy (browsable using emacs' info mode), run:

                     ./configure; make info

       The texinfo doc looks most pretty when printed or as html.  Indeed, in the info version certain
       examples are difficult to read due to the quoting conventions used in info.

mtools-4.0.23                                   10Dec18                                  mtoolstest(1)
