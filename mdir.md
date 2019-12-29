mdir(1)                                 General Commands Manual                                mdir(1)

Name
       mdir - display an MSDOS directory

Note of warning
       This  manpage has been automatically generated from mtools's texinfo documentation, and may not
       be entirely accurate or complete.  See the end of this man page for details.

Description
       The mdir command is used to display an MS-DOS directory. Its syntax is:

       mdir [-/] [-f] [-w] [-a] [-b] msdosfile [ msdosfiles...]

       Mdir displays the contents of MS-DOS directories, or the entries for some MS-DOS files.

       Mdir supports the following command line options:

       /      Recursive output, just like MS-DOS' -s option

       w      Wide output.  With this option, mdir prints the filenames across the page  without  dis‐
              playing the file size or creation date.

       a      Also list hidden files.

       f      Fast.   Do  not  try to find out free space.  On larger disks, finding out the amount of
              free space takes up some non trivial amount of time, as the whole FAT must  be  read  in
              and  scanned.   The  -f  flag bypasses this step.  This flag is not needed on FAT32 file
              systems, which store the size explicitly.

       b      Concise listing. Lists each directory name or filename,  one  per  line  (including  the
              filename  extension). This switch displays no heading information and no summary. Only a
              newline separated list of pathnames is displayed.

       An error occurs if a component of the path is not a directory.

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

mtools-4.0.23                                   10Dec18                                        mdir(1)
