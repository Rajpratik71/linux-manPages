floppymeter(1)                                                                           General Commands Manual                                                                           floppymeter(1)

Name
       floppymeter - measure raw capacity and exact rotation speed of floppy drive

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
          floppymeter [-f] [-w warmup-delay] [-W window]
          [-c cycles] [-h] drive

       The  floppymeter  program  measures  characteristic parameters of a floppy drive and floppy controller, such as the rotation speed of the drive, the data transfer rate of the controller, and the
       resulting raw capacity of a disk track.  To use this program, insert a disposable floppy in the drive, and type floppymeter --density, where density describes the density of the  disk  used  for
       the test. (Should be one of dd, hd or ed). CAUTION: the data on the disk will be erased.  This program should be used to verify whether the drive and controller are out of tolerance if you expe‐
       rience problems with some high capacity formats.  It only needs to be run once per drive: although a disk is needed to perform the measurements, the measured data only depend on  the  drive  and
       the controller, and not on the disk.

       To  measure  the raw capacity of the disk track, the floppymeter program formats the first track of the drive in a special way that allows it to read the raw data (gaps and headers) of the disk.
       Thus, all data previously stored on that disk is lost.

       The rotation speed is measured by timing the return time of a readid command.  In order to gain more precision, the command is issued many times in a row. During this phase, the number of  rota‐
       tions since the start of the test, the average time per rotation since the start, and a sliding average of the times of the last 30 rotations is printed, and updated continuously.

       The data transfer rate is deduced from the two parameters above.

       At the end of the program, all parameters (raw capacity, duration of one rotation, and data transfer rate) are printed again, as well as their relative deviation to the standard value.  Finally,
       it suggests a capacity deviation description line, which can be directly pasted into the drive definition file (See section Drive descriptions.).

       Usually, the data transfer rate should not deviate more than 150 ppm from the expected value, and the rotation speed of the drive should not deviate more than 3000 ppm from the  expected  value.
       If these deviations are bigger, you may get problems with certain high capacity formats.

       If the raw capacity of the drive is too small, some high capacity formats may become unformattable on this drive/controller combo.

       If  on  the  other  hand,  the raw capacity of the drive is too big, you may get problems when writing to a disk formatted by this drive on another drive with a smaller raw capacity. In order to
       avoid this, increase superformats gap parameter (-G).

       -h     Prints a short help

       --dd   Tells the program that we use a Double Density disk.

       --hd   Tells the program that we use a High Density disk.

       --ed   Tells the program that we use an Extra Density disk.

       -f     Runs the measurement non interactively.  With this option, the program doesn't ask for confirmation, and doesn't display the continuously updated values during the rotation speed measure‐
              ment.

       -W Window
              This value describes how many rotations are used for the computation of the sliding average. Default is 30.

       -c cycles
              Describes the number of rotations clocked during the rotations speed determination test. Default is 1000.

Bugs
       This program is quite new, and may have bugs. Here are a few suggested tests to check its sanity:

       *      The deviation of the data transfer rate solely depends on the controller. It should not be different between two drives connected to the same controller. However, the drive rotation speed
              may be different for different drives.

       *      All data transfer rates (for double, high and extra density) are derived from a same master frequency. Thus the deviation of the data transfer rate should be independent  of  the  density
              used.

See Also
       Fdutils' texinfo doc

fdutils-5.5                                                                                      03Mar05                                                                                   floppymeter(1)
