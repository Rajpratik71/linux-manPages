mcat(1)                                                                                 General Commands Manual                                                                                mcat(1)

Name
       mcat - dump raw disk image

Note of warning
       This manpage has been automatically generated from mtools's texinfo documentation, and may not be entirely accurate or complete.  See the end of this man page for details.

Description
       The mcat command is used to copy an entire disk image from or to the floppy device. It uses the following syntax:

       mcat [-w] drive:

       Mcat performs the same task as the Unix cat command. It is included into the mtools package, since cat cannot access remote floppy devices offered by the mtools floppy daemon.  Now it is pos‐
       sible to create boot floppies remotely.

       The default operation is reading. The output is written to stdout.

       If the -w option is specified, mcat reads a disk-image from stdin and writes it to the given device.  Use this carefully! Because of the low-level nature of  this  command,  it  will  happily
       destroy any data written before on the disk without warning!

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

mtools-4.0.18                                                                                   09Jan13                                                                                        mcat(1)
