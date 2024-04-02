mcd(1)                                                                                  General Commands Manual                                                                                 mcd(1)

Name
       mcd - change MSDOS directory

Note of warning
       This manpage has been automatically generated from mtools's texinfo documentation, and may not be entirely accurate or complete.  See the end of this man page for details.

Description
       The mcd command is used to change the mtools working directory on the MS-DOS disk. It uses the following syntax:

          mcd [msdosdirectory]

       Without arguments, mcd reports the current device and working directory.  Otherwise, mcd changes the current device and current working directory relative to an MS-DOS file system.

       The  environmental  variable MCWD may be used to locate the file where the device and current working directory information is stored.  The default is `$HOME/.mcwd'.  Information in this file
       is ignored if the file is more than 6 hours old.

       Mcd returns 0 on success or 1 on failure.

       Unlike MS-DOS versions of CD, mcd can be used to change to another device. It may be wise to remove old `.mcwd' files at logout.

See Also
       Mtools' texinfo doc

Viewing the texi doc
       This manpage has been automatically generated from mtools's texinfo documentation. However, this process is only approximative, and some items, such as crossreferences, footnotes and  indices
       are  lost  in this translation process.  Indeed, these items have no appropriate representation in the manpage format.  Moreover, not all information has been translated into the manpage ver‐
       sion.  Thus I strongly advise you to use the original texinfo doc.  See the end of this manpage for instructions how to view the texinfo doc.

       *      To generate a printable copy from the texinfo doc, run the following commands:

                     ./configure; make dvi; dvips mtools.dvi

       *      To generate a html copy,  run:

                     ./configure; make html

       A premade html can be found at `http://www.gnu.org/software/mtools/manual/mtools.html'

       *      To generate an info copy (browsable using emacs' info mode), run:

                     ./configure; make info

       The texinfo doc looks most pretty when printed or as html.  Indeed, in the info version certain examples are difficult to read due to the quoting conventions used in info.

mtools-4.0.18                                                                                   09Jan13                                                                                         mcd(1)
