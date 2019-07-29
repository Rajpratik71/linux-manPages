mcopy(1)                                                      General Commands Manual                                                     mcopy(1)

Name
       mcopy - copy MSDOS files to/from Unix

Note of warning
       This  manpage  has been automatically generated from mtools's texinfo documentation, and may not be entirely accurate or complete.  See the
       end of this man page for details.

Description
       The mcopy command is used to copy MS-DOS files to and from Unix. It uses the following syntax:

          mcopy [-bspanvmQT] [-D clash_option] sourcefile targetfile
          mcopy [-bspanvmQT] [-D clash_option] sourcefile [ sourcefiles... ] targetdirectory
          mcopy [-tnvm] MSDOSsourcefile

       Mcopy copies the specified file to the named file, or copies multiple files to the named directory.  The source and target  can  be  either
       MS-DOS or Unix files.

       The  use  of  a  drive letter designation on the MS-DOS files, 'a:' for example, determines the direction of the transfer.  A missing drive
       designation implies a Unix file whose path starts in the current directory.  If a source drive letter is specified with  no  attached  file
       name (e.g. mcopy a: .), all files are copied from that drive.

       If  only  a  single, MS-DOS source parameter is provided (e.g. "mcopy a:foo.exe"), an implied destination of the current directory (`.') is
       assumed.

       A filename of `-' means standard input or standard output, depending on its position on the command line.

       Mcopy accepts the following command line options:

       t      Text file transfer.  Mcopy translates incoming carriage return/line feeds to line feeds when copying from MS-DOS to Unix, and  vice-
              versa when copying from Unix to MS-DOS.

       b      Batch mode. Optimized for huge recursive copies, but less secure if a crash happens during the copy.

       s      Recursive copy.  Also copies directories and their contents

       p      Preserves the attributes of the copied files

       Q      When mcopying multiple files, quits as soon as one copy fails (for example due to lacking storage space on the target disk)

       a      Text (ASCII) file transfer.  ASCII translates incoming carriage return/line feeds to line feeds.

       T      Text  (ASCII) file transfer with character set conversion.  Differs from -a in the ASCII also translates incoming PC-8 characters to
              ISO-8859-1 equivalents as far as possible.  When reading DOS files, untranslatable characters are replaced by '#'; when writing  DOS
              files, untranslatable characters are replaced by '.'.

       n      No confirmation when overwriting Unix files.  ASCII doesn't warn the user when overwriting an existing Unix file. If the target file
              already exists, and the -n option is not in effect, mcopy asks whether to overwrite the file  or  to  rename  the  new  file  (`name
              clashes') for details).  In order to switch off confirmation for DOS files, use -o.

       m      Preserve the file modification time.

       v      Verbose. Displays the name of each file as it is copied.

Bugs
       Unlike MS-DOS, the '+' operator (append) from MS-DOS is not supported. However, you may use mtype to produce the same effect:

          mtype a:file1 a:file2 a:file3 >unixfile
          mtype a:file1 a:file2 a:file3 | mcopy - a:msdosfile

See Also
       Mtools' texinfo doc

Viewing the texi doc
       This  manpage  has  been automatically generated from mtools's texinfo documentation. However, this process is only approximative, and some
       items, such as crossreferences, footnotes and indices are lost in this translation process.  Indeed, these items have no appropriate repre‐
       sentation  in  the manpage format.  Moreover, not all information has been translated into the manpage version.  Thus I strongly advise you
       to use the original texinfo doc.  See the end of this manpage for instructions how to view the texinfo doc.

       *      To generate a printable copy from the texinfo doc, run the following commands:

                     ./configure; make dvi; dvips mtools.dvi

       *      To generate a html copy,  run:

                     ./configure; make html

       A premade html can be found at `http://www.gnu.org/software/mtools/manual/mtools.html'

       *      To generate an info copy (browsable using emacs' info mode), run:

                     ./configure; make info

       The texinfo doc looks most pretty when printed or as html.  Indeed, in the info version certain examples are difficult to read due  to  the
       quoting conventions used in info.

mtools-4.0.18                                                         09Jan13                                                             mcopy(1)
