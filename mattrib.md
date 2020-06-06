mattrib(1)                                                                               General Commands Manual                                                                               mattrib(1)

Name
       mattrib - change MSDOS file attribute flags

Note of warning
       This manpage has been automatically generated from mtools's texinfo documentation, and may not be entirely accurate or complete.  See the end of this man page for details.

Description
       Mattrib is used to change MS-DOS file attribute flags. It has the following syntax:

       mattrib [-a|+a] [-h|+h] [-r|+r] [-s|+s] [-/]  [-p] [-X] msdosfile [ msdosfiles ... ]

       Mattrib adds attribute flags to an MS-DOS file (with the `+' operator) or remove attribute flags (with the `-' operator).

       Mattrib supports the following attribute bits:

       a      Archive bit.  Used by some backup programs to indicate a new file.

       r      Read-only bit.  Used to indicate a read-only file.  Files with this bit set cannot be erased by DEL nor modified.

       s      System bit.  Used by MS-DOS to indicate a operating system file.

       h      Hidden bit.  Used to make files hidden from DIR.

       Mattrib supports the following command line flags:

       /      Recursive.  Recursively list the attributes of the files in the subdirectories.

       X      Concise.  Prints  the attributes without any whitespace padding.  If neither the "/" option is given, nor the msdosfile contains a wildcard, and there is only one MS-DOS file parameter on
              the command line, only the attribute is printed, and not the filename.  This option is convenient for scripts

       p      Replay mode.  Outputs a series of mformat commands that will reproduce the current situation, starting from a situation as left by untarring the MS-DOS file  system.   Commands  are  only
              output  for  attribute  settings  that  differ  from  the  default (archive bit set for files, unset for directories).  This option is intended to be used in addition to tar. The readonly
              attribute is not taken into account, as tar can set that one itself.

See Also
       Mtools' texinfo doc

Viewing the texi doc
       This manpage has been automatically generated from mtools's texinfo documentation. However, this process is only approximative, and some items, such as crossreferences, footnotes and indices are
       lost  in  this  translation  process.   Indeed, these items have no appropriate representation in the manpage format.  Moreover, not all information has been translated into the manpage version.
       Thus I strongly advise you to use the original texinfo doc.  See the end of this manpage for instructions how to view the texinfo doc.

       *      To generate a printable copy from the texinfo doc, run the following commands:

                     ./configure; make dvi; dvips mtools.dvi

       *      To generate a html copy,  run:

                     ./configure; make html

       A premade html can be found at `http://www.gnu.org/software/mtools/manual/mtools.html'

       *      To generate an info copy (browsable using emacs' info mode), run:

                     ./configure; make info

       The texinfo doc looks most pretty when printed or as html.  Indeed, in the info version certain examples are difficult to read due to the quoting conventions used in info.

mtools-4.0.18                                                                                    09Jan13                                                                                       mattrib(1)
