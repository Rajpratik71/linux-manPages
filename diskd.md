diskd(1)                                                                                 General Commands Manual                                                                                 diskd(1)

Name
       diskd - disk daemon; wait for disk to be inserted

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
       The diskd command has the following syntax:

          diskd [-d drive] [-i interval] [-e command]

       Diskd waits for a disk to be inserted into a given drive, and then either executes the command or exits. This program can be used to automatically mount a disk as soon as it is inserted.

Warning
       This  program  works  by  switching the motor on for a very short interval, and then seeking to track -1. This might damage hardware in the long run. Amigas, which also use these techniques, are
       known for having problems with their disk drives no longer spinning up properly after a few month of usage.

Options
       -d drive
              Selects the drive to observe for disk insertion. By default, drive 0 (/dev/fd0) is observed.

       -i interval
              Selects the polling interval. The interval is given in tenths of seconds. Default is 10 (one second).

       -e command
              Gives the command to be executed when a disk is inserted. If no command is given the program simply exits. Typically, the command mounts the disk. It can be a shell scripts  which  probes
              for several filesystems and disk geometries until it succeeds.

Bugs
       *      Automatic unmounting cannot yet be handled. It is indeed not enough to scan for disk removal, because when the disk is removed, it is already too late: There might be some buffers needing
              flushing.  However, the fdmountd program allows automatic unmounting by using the SYNC mount options, which switches off write buffering (see section  fdmount).

       *      The drive motor is running all the time, and on some computers, the drive led flickers at each time the drive is polled.

See Also
       Fdutils' texinfo doc

fdutils-5.5                                                                                      03Mar05                                                                                         diskd(1)
