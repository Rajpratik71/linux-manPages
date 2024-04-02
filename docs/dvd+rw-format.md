DVD+RW-FORMAT(1)                                                                           General Commands Manual                                                                           DVD+RW-FORMAT(1)



NAME
       dvd+rw-format - formatting and blanking DVD and BD media program.

SYNOPSIS
       dvd+rw-format [-force[=full]] [-lead-out|-blank[=full]] [-ssa[=none|default|max|XXXm]] /dev/dvd


DESCRIPTION
       dvd+rw-format  is  a part of dvd+rw-tools suite and allows to format virgin DVD+RW or BD-RE media for the first use or blank already written DVD-RW.  Typical use cases of using dvd+rw-format is for‐
       matting DVD-RW to make them over-writable, blanking used DVD-RW to make them sequentially writable from scratch, formatting BD-RE and DVD-RAM with custom spare area sizes or re-formatting BD-RE  and
       DVD-RAM  to  change their spare size.  It is not possible to format CD-RW by dvd+rw-format, you can use cdrskin, xorriso or wodim utilities to blank them or cdrwtool to format them instead, see sec‐
       tion EXAMPLES.

       A DVD-RW accepts two disc modes: the Sequential Recording and the Restricted Overwrite. If a DVD-RW medium is in the latter one, it will behave much like DVD+RW.  By  default  DVD-RW  discs  are  in
       Sequential  Recording  mode,  but  can be put into Restricted Overwrite mode using dvd+rw-format when no options given.  Be aware, that only -blank=full, which lasts as long as full writing, makes a
       used sequential DVD-RW capable of performing multi-session, while fast blanked DVD-RW can only do Disk-At-Once.

       Virgin DVD-RW can be directly written without the need of a formatting operation, however a non-virgin DVD-RW in Sequential Recording mode needs to be blanked before writing a new  initial  session.
       Since a DVD-RW medium in the Restricted Overwrite mode behaves much like DVD+RW, it  can be written again without prior formatting the media.

       Virgin  BD-RE  and DVD+RW media may be initially formatted prior usage. Any-time later, growisofs program will take care of formatting it automatically whenever appropriate, while further formatting
       is not recommended, however it is possible.


OPTIONS
       -force[=full]
              Perform formatting even if the medium is formatted already. This is not recommended for BD-RE and DVD+RW media, since they need to be formatted only once. Use  -format=full  to  perform  full
              (lengthy) reformat in case of DVD-RAM or (lengthy) Full Certification in case of BD-RE.

       -lead-out
              Relocates  the lead-out next to outermost written sector as well as makes sure there is no virgin surface before it. This can make the medium more compatible with some DVD players. Previously
              written data is not affected by this operation.

       -blank[=full]
              Wipe data from DVD-RW media. Data on BD-RE and DVD+RW will we overwritten automatically, so there is no need to blank them explicitly.  Use -blank=full to change  DVD-RW  back  to  Sequential
              Recording mode.

       -ssa[=none|default|max|XXXm]
              Grow, eliminate, reset to default or maximize Supplementary Spare Area.


EXAMPLES
       Actual  device names vary from one operating system to another. We use /dev/dvd as a collective name or as symbolic link to the actual device if you wish. Under Linux it will most likely be a device
       such as "/dev/sr0" or "/dev/hda" for older Linux 2.6.

       To blank a CD-RW, you have to use another utility, e.g. wodim:

               wodim blank=fast -immed dev=/dev/cdrom
               cdrskin blank=all|fast|as_needed -immed dev=/dev/cdrom
               xorriso -outdev /dev/cdrom -blank all|fast|as_needed

       To format CD-RW, you can use cdrwtool:

               cdrwtool -d /dev/cdrom -q

       To blank a DVD-RW and put in the incremental sequential mode, run:

               dvd+rw-format -blank=full /dev/dvd

       To blank a DVD-RW and put in the Restricted Overwrite mode, run:

               dvd+rw-format -force /dev/dvd

       To overwrite data of BD-RE, DVD+RW, DVD-RW or DVD-RAM run:

               growisofs -Z /dev/dvd=/dev/zero

       To blank a DVD-RAM, you can use:

               dd if=/dev/zero of=/dev/dvd

       To relocate lead-out sector, run:

               dvd+rw-format -lead-out /dev/dvd


NOTES
       Note that DVD+RW re-formatting procedure does not substitute for blanking. If you want to nullify the media, e.g. for privacy reasons, do it explicitly with 'growisofs -Z /dev/dvd=/dev/zero'.

       When growisofs "runs into" blank Blu-ray Disc media or BD-RE, it gets pre-formatted with minimal spare area size of 256MB.


SEE ALSO
       Most up-to-date information on dvd+rw-tools is available at http://fy.chalmers.se/~appro/linux/DVD+RW/.

       growisofs(1), cdrskin(1), xorriso(1), wodim(1), cdrwtool(1)


AUTHORS
       Andy Polyakov <appro@fy.chalmers.se> stands for programming and on-line information.

       This manpage was created by Honza Horak <hhorak@redhat.com> and consulted by Thomas Schmitt <scdbackup@gmx.net>.


LICENSE
       dvd+rw-format is distributed under GNU GPL.




dvd+rw-tools 7.1                                                                                 24 Aug 2012                                                                                 DVD+RW-FORMAT(1)
