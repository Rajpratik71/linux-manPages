mdeltree(1)                                                                             General Commands Manual                                                                            mdeltree(1)

Name
       mdeltree - recursively delete an MSDOS directory and its contents

Note of warning
       This manpage has been automatically generated from mtools's texinfo documentation, and may not be entirely accurate or complete.  See the end of this man page for details.

Description
       The mdeltree command is used to delete an MS-DOS file. Its syntax is:

       mdeltree [-v] msdosdirectory [msdosdirectories...]

       Mdeltree removes a directory and all the files and subdirectories it contains from an MS-DOS file system. An error occurs if the directory to be removed does not exist.

See Also
       Mtools' texinfo doc

Viewing the texi doc
       This  manpage has been automatically generated from mtools's texinfo documentation. However, this process is only approximative, and some items, such as crossreferences, footnotes and indices
       are lost in this translation process.  Indeed, these items have no appropriate representation in the manpage format.  Moreover, not all information has been translated into the  manpage  ver‐
       sion.  Thus I strongly advise you to use the original texinfo doc.  See the end of this manpage for instructions how to view the texinfo doc.

       *      To generate a printable copy from the texinfo doc, run the following commands:

                     ./configure; make dvi; dvips mtools.dvi

       *      To generate a html copy,  run:

                     ./configure; make html

       A premade html can be found at `http://www.gnu.org/software/mtools/manual/mtools.html'

       *      To generate an info copy (browsable using emacs' info mode), run:

                     ./configure; make info

       The texinfo doc looks most pretty when printed or as html.  Indeed, in the info version certain examples are difficult to read due to the quoting conventions used in info.

mtools-4.0.18                                                                                   09Jan13                                                                                    mdeltree(1)
