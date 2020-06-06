mzip(1)                                                                                  General Commands Manual                                                                                  mzip(1)

Name
       mzip - change protection mode and eject disk on Zip/Jaz drive

Note of warning
       This manpage has been automatically generated from mtools's texinfo documentation, and may not be entirely accurate or complete.  See the end of this man page for details.

Description
       The mzip command is used to issue ZIP disk specific commands on Linux, Solaris or HP-UX. Its syntax is:

       mzip [-epqrwx]

       Mzip allows the following command line options:

       e      Ejects the disk.

       f      Force eject even if the disk is mounted (must be given in addition to -e).

       r      Write protect the disk.

       w      Remove write protection.

       p      Password write protect.

       x      Password protect

       u      Temporarily unprotect the disk until it is ejected.  The disk becomes writable, and reverts back to its old state when ejected.

       q      Queries the status

       To  remove  the password, set it to one of the password-less modes -r or -w: mzip will then ask you for the password, and unlock the disk.  If you have forgotten the password, you can get rid of
       it by low-level formatting the disk (using your SCSI adapter's BIOS setup).

       The ZipTools disk shipped with the drive is also password protected.  On MS-DOS or on a Mac, this password is automatically removed once the ZipTools have been installed.  From various  articles
       posted to Usenet, I learned that the password for the tools disk is APlaceForYourStuff.  Mzip knows about this password, and tries it first, before prompting you for a password.  Thus mzip -w z:
       unlocks the tools disk.  The tools disk is formatted in a special way so as to be usable both in a PC and in a Mac.  On a PC, the Mac file system appears as a hidden file  named  `partishn.mac'.
       You may erase it to reclaim the 50 Megs of space taken up by the Mac file system.

Bugs
       This  command  is a big kludge.  A proper implementation would take a rework of significant parts of mtools, but unfortunately I don't have the time for this right now. The main downside of this
       implementation is that it is inefficient on some architectures (several successive calls to mtools, which defeats mtools' caching).

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

mtools-4.0.18                                                                                    09Jan13                                                                                          mzip(1)
