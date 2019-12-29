minfo(1)                                General Commands Manual                               minfo(1)

Name
       minfo - print the parameters of a MSDOS filesystem

Note of warning
       This  manpage has been automatically generated from mtools's texinfo documentation, and may not
       be entirely accurate or complete.  See the end of this man page for details.

Description
       The minfo command prints the parameters of a MS-DOS file system, such  as  number  of  sectors,
       heads and cylinders.  It also prints an mformat command line which can be used to create a sim‐
       ilar MS-DOS file system on another media.  However, this doesn't work with 2m or XDF media, and
       with MS-DOS 1.0 file systems
       minfo drive:

       Minfo supports the following option:

       v      Prints a hexdump of the boot sector, in addition to the other information

See Also
       Mtools' texinfo doc

Viewing the texi doc
       This  manpage  has  been  automatically generated from mtools's texinfo documentation. However,
       this process is only approximative, and some items, such as crossreferences, footnotes and  in‐
       dices  are lost in this translation process.  Indeed, these items have no appropriate represen‐
       tation in the manpage format.  Moreover, not all information has been translated into the  man‐
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

mtools-4.0.23                                   10Dec18                                       minfo(1)
