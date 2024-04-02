xdfcopy(1)                                                                               General Commands Manual                                                                               xdfcopy(1)

Name
       xdfcopy - copy and format XDF disks in Linux

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
          xdfcopy [-format-id] [-d] [-n] [-h head-skew] [-t cylinder-skew] [-T
          end-cylinder] [source] target

       Xdfcopy is a utility to copy and format XDF disks. XDF (eXtended Density Format) is a format used by OS/2 which can hold 1840KB of data (on a 3 1/2 high density disk). Its advantage over 2m for‐
       mats is that it is faster: 38KB/s. Because of this fast speed, I extended the XDF standard to higher capacities (1992KB) with a transfer rate of 45KB/s. I called the new formats XXDF.

       This program works best with kernels newer than 2.0.0.

       If both source and target are given, xdfcopy copies the disk image from file to floppy disk or vice-versa. When copying to a floppy disk, the disk is first formatted, unless  the  -n  option  is
       given.

       If no source is given, the target is only formatted. In this case, the target must be a floppy drive.

Options
   Selecting a format
       Formats are selected by the format_id. The following formats are understood:

       0      Formats a 5 1/4 XDF disk (1520 KB, 45.6 KB/s).

       1      Formats a 3 1/2 high density XDF disk (1840 KB, 38.3 KB/s).

       2      Formats a 3 1/2 extra density XDF disk (3680 KB, 102 KB/s)

       3      Formats a 3 1/2 high density XXDF disk (1920 KB, 45 KB/s)

       4      Formats a 3 1/2 extra density XXDF disk (3840 KB, 90 KB/s)

Misc options
       -D dosdrive
              Describes  the DOS drive letter for mformat. If this option is given, an MS-DOS filesystem is automatically installed on the disk after the low-level format is complete. In order for this
              to work, the drive has to be configured to accept the 23x2x80 geometry in your /etc/mtools or your ~/.mtoolsrc file. Moreover, this only works with a version of mtools that is more recent
              than 3.0.

              Example of a working mtoolsrc line:

                 A /dev/fd0  0  0 0  0

              Examples of a non-working mtoolsrc line:

                 A /dev/fd0 12 80 2 18

       -n     Don't format the disk before copying the disk image to the disk.

Options for power users
       -t cylinder skew
              Uses a different track skew than the default (14). For more details on skews, see section  superformat. In this version of xdfcopy, the -t parameter is ignored.

       -h head skew
              Uses a different head skew than the default (0) In this version, this parameter is ignored

       -d     Debugging. For each read or write operation, the time it took to complete the operation is printed (in milliseconds). This can be used to optimize the skews.

       -T end-cylinders
              Tells how many cylinders to format.  With the XXDF formats, it is actually possible to format up to 83 cylinders, yielding a format of up to 1992KB on a 3 1/2 high density disk.

See Also
       Fdutils' texinfo doc

fdutils-5.5                                                                                      03Mar05                                                                                       xdfcopy(1)
