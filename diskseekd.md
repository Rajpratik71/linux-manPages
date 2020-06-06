diskseekd(1)                                                                             General Commands Manual                                                                             diskseekd(1)

Name
       diskseek, diskseekd - disk seek daemon; simulates Messy Dos' drive cleaning effect

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
       Several  people  have  noticed  that Linux has a bad tendency of killing floppy drives. These failures remained completely mysterious, until somebody noticed that they were due to huge layers of
       dust accumulating in the floppy drives. This cannot happen under Messy Dos, because this excuse for an operating system is so unstable that it crashes roughly every 20 minutes (actually less  if
       you  are running Windows).  When rebooting, the BIOS seeks the drive, and by doing this, it shakes the dust out of the drive mechanism. diskseekd simulates this effect by seeking the drive peri‐
       odically.  If it is called as diskseek, the drive is sought only once.

Options
       The syntax for diskseekd is as follows:

          diskseekd [-d drive] [-i interval] [-p pidfile]

       -d drive
              Selects the drive to seek.  By default, drive 0 (`/dev/fd0') is sought.

       -i interval
              Selects the cleaning interval, in seconds.  If the interval is 0, a single seek is done. This is useful when calling diskseek from a crontab.  The default is 1000 seconds (about  16  min‐
              utes) for diskseekd and 0 for diskseek.

       -p pidfile
              Stores the process id of the diskseekd daemon into pidfile instead of the default `/var/run/diskseekd.pid'.

Bugs
       1.     Other aspects of Messy Dos' flakiness are not simulated.

       2.     This section lacks a few smileys.

See Also
       Fdutils' texinfo doc

fdutils-5.5                                                                                      03Mar05                                                                                     diskseekd(1)
