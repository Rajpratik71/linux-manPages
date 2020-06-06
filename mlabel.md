mlabel(1)                                                                                General Commands Manual                                                                                mlabel(1)

Name
       mlabel - make an MSDOS volume label

Note of warning
       This manpage has been automatically generated from mtools's texinfo documentation, and may not be entirely accurate or complete.  See the end of this man page for details.

Description
       The mlabel command adds a volume label to a disk. Its syntax is:
       mlabel [-vcsn] [-N serial] drive:[new_label]

       Mlabel  displays the current volume label, if present. If new_label is not given, and if neither the c nor the s options are set, it prompts the user for a new volume label.  To delete an exist‐
       ing volume label, press return at the prompt.

       The label is limited to 11 single-byte characters, e.g. Name1234567.

       Reasonable care is taken to create a valid MS-DOS volume label.  If an invalid label is specified, mlabel changes the label (and displays the new label  if  the  verbose  mode  is  set).  Mlabel
       returns 0 on success or 1 on failure.

       Mlabel supports the following options:

       c      Clears an existing label, without prompting the user

       s      Shows the existing label, without prompting the user.

       n      Assigns a new (random) serial number to the disk

       N serial
              Sets the supplied serial number. The serial number should be supplied as an 8 digit hexadecimal number, without spaces

See Also
       Mtools' texinfo doc

Viewing the texi doc
       This manpage has been automatically generated from mtools's texinfo documentation. However, this process is only approximative, and some items, such as crossreferences, footnotes and indices are
       lost in this translation process.  Indeed, these items have no appropriate representation in the manpage format.  Moreover, not all information has been  translated  into  the  manpage  version.
       Thus I strongly advise you to use the original texinfo doc.  See the end of this manpage for instructions how to view the texinfo doc.

       *      To generate a printable copy from the texinfo doc, run the following commands:

                     ./configure; make dvi; dvips mtools.dvi

       *      To generate a html copy,  run:

                     ./configure; make html

       A premade html can be found at `http://www.gnu.org/software/mtools/manual/mtools.html'

       *      To generate an info copy (browsable using emacs' info mode), run:

                     ./configure; make info

       The texinfo doc looks most pretty when printed or as html.  Indeed, in the info version certain examples are difficult to read due to the quoting conventions used in info.

mtools-4.0.18                                                                                    09Jan13                                                                                        mlabel(1)
