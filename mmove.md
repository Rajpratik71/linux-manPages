mmove(1)                                                      General Commands Manual                                                     mmove(1)

Name
       mmove - move or rename an MSDOS file or subdirectory

Note of warning
       This  manpage  has been automatically generated from mtools's texinfo documentation, and may not be entirely accurate or complete.  See the
       end of this man page for details.

Description
       The mmove command is used to moves or renames an existing MS-DOS file or subdirectory.
       mmove [-v] [-D clash_option] sourcefile targetfile
       mmove [-v]  [-D clash_option] sourcefile [ sourcefiles... ] targetdirectory

       Mmove moves or renames an existing MS-DOS file or subdirectory. Unlike the MS-DOS version of MOVE, mmove is able  to  move  subdirectories.
       Files  or  directories  can  only be moved within one file system. Data cannot be moved from MS-DOS to Unix or vice-versa.  If you omit the
       drive letter from the target file or directory, the same letter as for the source is assumed.  If you omit the drive letter from all param‐
       eters, drive a: is assumed by default.

See Also
       Mtools' texinfo doc

Viewing the texi doc
       This  manpage  has  been automatically generated from mtools's texinfo documentation. However, this process is only approximative, and some
       items, such as crossreferences, footnotes and indices are lost in this translation process.  Indeed, these items have no appropriate repre‐
       sentation  in  the manpage format.  Moreover, not all information has been translated into the manpage version.  Thus I strongly advise you
       to use the original texinfo doc.  See the end of this manpage for instructions how to view the texinfo doc.

       *      To generate a printable copy from the texinfo doc, run the following commands:

                     ./configure; make dvi; dvips mtools.dvi

       *      To generate a html copy,  run:

                     ./configure; make html

       A premade html can be found at `http://www.gnu.org/software/mtools/manual/mtools.html'

       *      To generate an info copy (browsable using emacs' info mode), run:

                     ./configure; make info

       The texinfo doc looks most pretty when printed or as html.  Indeed, in the info version certain examples are difficult to read due  to  the
       quoting conventions used in info.

mtools-4.0.18                                                         09Jan13                                                             mmove(1)
