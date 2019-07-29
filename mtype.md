mtype(1)                                                                                General Commands Manual                                                                               mtype(1)

Name
       mtype - display contents of an MSDOS file

Note of warning
       This manpage has been automatically generated from mtools's texinfo documentation, and may not be entirely accurate or complete.  See the end of this man page for details.

Description
       The mtype command is used to display contents of an MS-DOS file. Its syntax is:

       mtype [-ts] msdosfile [ msdosfiles... ]

       Mtype displays the specified MS-DOS file on the screen.

       In addition to the standard options, Mtype allows the following command line options:

       t      Text file viewing.  Mtype translates incoming carriage return/line feeds to line feeds.

       s      Mtype strips the high bit from the data.

       The mcd command may be used to establish the device and the current working directory (relative to MS-DOS), otherwise the default is A:/.

       Mtype returns 0 on success, 1 on utter failure, or 2 on partial failure.

       Unlike the MS-DOS version of TYPE, mtype allows multiple arguments.

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

mtools-4.0.18                                                                                   09Jan13                                                                                       mtype(1)
