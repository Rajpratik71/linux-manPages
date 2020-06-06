mshowfat(1)                                                                              General Commands Manual                                                                              mshowfat(1)

Name
       mshowfat - shows FAT clusters allocated to file

Note of warning
       This manpage has been automatically generated from mtools's texinfo documentation, and may not be entirely accurate or complete.  See the end of this man page for details.

Description
       The mshowfat command is used to display the FAT entries for a file.  Syntax:

       mshowfat [-o offset] files

       If no offset is given, a list of all clusters occupied by the file is printed. If an offset is given, only the number of the cluster containing that offset is printed.

See Also
       Mtools' texinfo doc

Viewing the texi doc
       This manpage has been automatically generated from mtools's texinfo documentation. However, this process is only approximative, and some items, such as crossreferences, footnotes and indices are
       lost in this translation process.  Indeed, these items have no appropriate representation in the manpage format.  Moreover, not all information has been  translated  into  the  manpage  version.
       Thus I strongly advise you to use the original texinfo doc.  See the end of this manpage for instructions how to view the texinfo doc.

       *      To generate a printable copy from the texinfo doc, run the following commands:

                     ./configure; make dvi; dvips mtools.dvi

       *      To generate a html copy,  run:

                     ./configure; make html

       A premade html can be found at `http://www.gnu.org/software/mtools/manual/mtools.html'

       *      To generate an info copy (browsable using emacs' info mode), run:

                     ./configure; make info

       The texinfo doc looks most pretty when printed or as html.  Indeed, in the info version certain examples are difficult to read due to the quoting conventions used in info.

mtools-4.0.18                                                                                    09Jan13                                                                                      mshowfat(1)
