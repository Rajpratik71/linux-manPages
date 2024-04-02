makefloppies(8)                                                                          System Manager's Manual                                                                          makefloppies(8)

Name
       MAKEFLOPPIES - Creates the default floppy device nodes.

Note
       This  manpage has been automatically generated from fdutils's texinfo documentation.  However, this process is only approximative, and some items, such as cross-references, footnotes and indices
       are lost in this translation process.  Indeed, these items have no appropriate representation in the manpage format.  Moreover, only the items specific to each command have been translated,  and
       the general information about fdutils has been dropped in the manpage version.  Thus I strongly advise you to use the original texinfo doc.

       *      To generate a printable copy from the texinfo doc, run the following commands:

                     ./configure; make dvi; dvips fdutils.dvi

       *      To generate a HTML copy,  run:

                     ./configure; make html

              A pre-made HTML can be found at: `http://www.tux.org/pub/knaff/fdutils'

       *      To generate an info copy (browsable using emacs' info mode), run:

                     ./configure; make info

       The texinfo doc looks most pretty when printed or as HTML.  Indeed, in the info version certain examples are difficult to read due to the quoting conventions used in info.

Description
          MAKEFLOPPIES [-tlvng] [drives]

       The  MAKEFLOPPIES  shell script creates the new floppy block device node.  It uses the floppycontrol program to translate the minor device numbers into meaningful names. It also uses these names
       to decide whether to create a given block device file or not, depending on the type of the physical drive (for instance, for a 3 1/2 drive, the formats corresponding to a 5  1/4  drive  are  not
       created).

       If you have more than two floppy drives, you need to tell the kernel the CMOS types of those additional drives using the floppy=drive,type,cmos lilo option.

       If the drives  parameter is given, only the device nodes for the listed drives are made. By default, all only the two first drives are tried.

       MAKEFLOPPIES does not work if you redefine your default formats.

       Caution: MAKEFLOPPIES removes already existing floppy device nodes.

Options
       -t     Use the old naming convention for 3 1/2 devices (e.g. `fd0H720' instead of `fd0u720').

       -m     Base the name for the created devices on the type of the media (e.g. `fd0h720' instead of `fd0u720').

       -l     Local. Creates device nodes in the local directory, not /dev

       -v     Verbose

       -n     Dry run. (just report what would be done, do not do anything)

       -g     Group.  Allow read/write access to floppy devices only for group `floppy'

Bugs
       The MAKEFLOPPIES script does not work on redefined "default" formats, If you redefine default formats, you need to create the needed device nodes manually.

See Also
       Fdutils' texinfo doc

fdutils-5.5                                                                                      03Mar05                                                                                  makefloppies(8)
