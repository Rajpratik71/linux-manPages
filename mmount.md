mmount(1)                               General Commands Manual                              mmount(1)

Name
       mmount - mount an MSDOS disk

Note of warning
       This  manpage has been automatically generated from mtools's texinfo documentation, and may not
       be entirely accurate or complete.  See the end of this man page for details.

Description
       The mmount command is used to mount an MS-DOS disk. It is only available on  Linux,  as  it  is
       only useful if the OS kernel allows configuration of the disk geometry. Its syntax is:

       mmount msdosdrive [mountargs]

       Mmount  reads  the  boot  sector  of an MS-DOS disk, configures the drive geometry, and finally
       mounts it passing mountargs to mount.  If no mount arguments are specified, the name of the de‐
       vice is used. If the disk is write protected, it is automatically mounted read only.

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

mtools-4.0.23                                   10Dec18                                      mmount(1)
