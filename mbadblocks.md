mbadblocks(1)                           General Commands Manual                          mbadblocks(1)

Name
       mbadblocks - tests a floppy disk, and marks the bad blocks in the FAT

Note of warning
       This  manpage has been automatically generated from mtools's texinfo documentation, and may not
       be entirely accurate or complete.  See the end of this man page for details.

Description
       The mbadblocks command is used to mark some clusters on an MS-DOS filesystem bad.  It  has  the
       following syntax:

       mbadblocks [-s sectorlist|-c clusterlist|-w] drive:

       If  no command line flags are supplied, Mbadblocks scans an MS-DOS filesystem for bad blocks by
       simply trying to read them and flag them if read fails. All blocks that are unused are scanned,
       and if detected bad are marked as such in the FAT.

       This  command  is  intended to be used right after mformat.  It is not intended to salvage data
       from bad disks.

Command line options
       c file
              Use a list of bad clusters, rather than scanning for bad clusters itself.

       s file
              Use a list of bad sectors (counted from beginning of filesystem), rather than trying for
              bad clusters itself.

       w      Write  a  random  pattern  to each cluster, then read it back and flag cluster as bad if
              mismatch. Only free clusters are tested in such a way, so any file data is preserved.

Bugs
       Mbadblocks should (but doesn't yet :-( ) also try to salvage bad blocks which  are  in  use  by
       reading them repeatedly, and then mark them bad.

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

mtools-4.0.23                                   10Dec18                                  mbadblocks(1)
