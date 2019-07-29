mren(1)                                                       General Commands Manual                                                      mren(1)

Name
       mren - rename an existing MSDOS file

Note of warning
       This  manpage  has been automatically generated from mtools's texinfo documentation, and may not be entirely accurate or complete.  See the
       end of this man page for details.

Description
       The mren command is used to rename or move an existing MS-DOS file or subdirectory. Its syntax is:

       mren [-voOsSrRA] sourcefile targetfile

       Mren renames an existing file on an MS-DOS file system.

       In verbose mode, Mren displays the new filename if the name supplied is invalid.

       If the first syntax is used (only one source file), and if the target name doesn't contain any slashes or colons, the  file  (or  subdirec‐
       tory) is renamed in the same directory, instead of being moved to the current mcd directory as would be the case with mmove. Unlike the MS-
       DOS version of REN, mren can be used to rename directories.

See Also
       Mtools' texinfo doc

Viewing the texi doc
       This manpage has been automatically generated from mtools's texinfo documentation. However, this process is only  approximative,  and  some
       items, such as crossreferences, footnotes and indices are lost in this translation process.  Indeed, these items have no appropriate repre‐
       sentation in the manpage format.  Moreover, not all information has been translated into the manpage version.  Thus I strongly  advise  you
       to use the original texinfo doc.  See the end of this manpage for instructions how to view the texinfo doc.

       *      To generate a printable copy from the texinfo doc, run the following commands:

                     ./configure; make dvi; dvips mtools.dvi

       *      To generate a html copy,  run:

                     ./configure; make html

       A premade html can be found at `http://www.gnu.org/software/mtools/manual/mtools.html'

       *      To generate an info copy (browsable using emacs' info mode), run:

                     ./configure; make info

       The  texinfo  doc looks most pretty when printed or as html.  Indeed, in the info version certain examples are difficult to read due to the
       quoting conventions used in info.

mtools-4.0.18                                                         09Jan13                                                              mren(1)
