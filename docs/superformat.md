superformat(1)                                                                           General Commands Manual                                                                           superformat(1)

Name
       superformat - format floppies

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
          superformat [-D dos-drive] [-v verbosity-level] [-b begin-track]
          [-e end-track] [--superverify] [--dosverify]
          [--noverify] [--verify_later] [--zero-based]
          [-G format-gap] [-F final-gap] [-i interleave] [-c chunksize]
          [-g gap] [--absolute-skew absolute-skew] [--head-skew head-skew]
          [--track-skew track-skew] [--biggest-last] drive [media-description]

       superformat  is used to format disks with a capacity of up to 1992K HD or 3984K ED.  See section Extended formats, for a detailed description of these formats. See section Media description, for
       a detailed description of the syntax for the media description.  If no media description is given, superformat formats a disk in the highest available density  for  that  drive,  using  standard
       parameters (i.e. no extra capacity formats).

       When the disk is formatted, superformat automatically invokes mformat in order to put an MS-DOS filesystem on it. You may ignore this filesystem, if you don't need it.

       Superformat  allows one to format 2m formats.  Be aware, however, that these 2m formats were specifically designed to hold an MS-DOS filesystem, and that they take advantage of the fact that the
       MS-DOS filesystem uses redundant sectors on the first track (the FAT, which is represented twice). The second copy of the FAT is not represented on the disk.

       High capacity formats are sensitive to the exact rotation speed of the drive and the resulting difference in raw capacity.  That's why superformat performs a measurement of the disks raw  capac‐
       ity  before  proceeding with the formatting.  This measurement is rather time consuming, and can be avoided by storing the relative deviation of the drive capacity into the drive definition file
       file. See section Drive descriptions, for more details on this file. The line to be inserted into the drive definition file is printed by superformat after performing its measurement.   However,
       this  line  depends  on the drive and the controller.  Do not copy it to other computers.  Remove it before installing another drive or upgrade your floppy controller.  Swap the drive numbers if
       you swap the drives in your computer.

Common Options
       Many options have a long and a short form.

       -h
       --help Print the help.

       -D drive
       --dosdrive dos-drive
              Selects DOS drive letter for mformat (for example a: or b:).  The colon may be omitted.  The default is derived from the minor device number.  If the drive letter cannot be  guessed,  and
              is not given on the command line, mformat is skipped.

       -v verbosity-level
       --verbosity verbosity-level
              Sets  the verbosity level. 1 prints a dot for each formatted track. 2 prints a changing sign for each formatted track (- for formatting the first head, = for formatting the second head, x
              for verifying the first head, and + for verifying the second head). 3 prints a complete line listing head and track. 6 and 9 print debugging information.

       --superverify
              Verifies the disk by first reading the track, than writing a pattern of U's, and then reading it again.  This is useful as some errors only show up after the disk has once  been  written.
              However, this is also slower.

       -B
       --dosverify
              Verifies  the  disk  using the mbadblocks program.  mbadblocks marks the bad sectors as bad in the FAT.  The advantage of this is that disks which are only partially bad can still be used
              for MS-DOS filesystems.

       -V
       --verify_later
              Verifies the whole disk at the end of the formatting process instead of at each track. Verifying the disk at each track has the advantage of detecting errors early on.

       -f
       --noverify
              Skips the verification altogether.

       --print-drive-deviation
              Does not format, but prints the drive deviation. If file /etc/driveprm exists and provides a deviation for the drive, nothing is printed and the disk is not formatted.

Advanced Options
       Usually, superformat uses sensible default values for these options, which you normally don't need to override.  They are intended for expert users.  Most of them should only be needed in  cases
       where the hardware or superformat itself has bugs.

       -b begin-track
       --begin_track  begin-track
              Describes the track where to begin formatting.  This is useful if the previous formatting failed halfway through.  The default is 0.

       -e end-track
       --end_track end-track
              Describes  where  to stop formatting. end_track is the last track to be formatted plus one. This is mainly useful for testing purposes. By default, this is the same as the total number of
              tracks.  When the formatting stops, the final skew is displayed (to be used as absolute skew when you'll continue).

       -S sizecode
       --sizecode sizecode
              Set the sector size to be used. The sector size is 128 * (2 ^ sizecode).  Sector sizes below 512 bytes are not supported, thus sizecode must be at least 2.  By  default  512  is  assumed,
              unless you ask for more sectors than would fit with 512 bytes.

       --stretch stretch
              Set  the  stretch factor. The stretch factor describes how many physical tracks to skip to get to the next logical track (2 ^ stretch).  On double density 5 1/4 disks, the tracks are fur‐
              ther apart from each other.

       -G fmt-gap
       --format_gap fmt-gap
              Set the formatting gap. The formatting gap tells how far the sectors are away from each other. By default, this is chosen so as to evenly distribute the sectors along the track.

       -F final-gap
       --final_gap final-gap
              Set the formatting gap to be used after the last sector.

       -i interleave
       --interleave interleave
              Set the sector interleave factor.

       -c chunksize
       --chunksize chunksize
              Set the size of the chunks. The chunks are small auxiliary sectors used during formatting. They are used to handle heterogeneous sector sizes (i.e. not all sectors have the same size) and
              negative formatting gaps.

       --biggest-last
              For MSS formats, make sure that the biggest sector is last on the track.  This makes the format more reliable on drives which are out of spec.

       --zero-based
              Formats  the disk with sector numbers starting at 0, rather than 1. Certain CP/M boxes or Music synthesizers use this format. Those disks can currently not be read/written to by the stan‐
              dard Linux read/write API; you have to use fdrawcmd to access them.  As disk verifying is done by this API, verifying is automatically switched off when formatting zero-based.

Sector skewing options
       In order to maximize the user data transfer rate, the sectors are arranged in such a way that sector 1 of the new track/head comes under the head at the very moment when the drive  is  ready  to
       read  from  that track, after having read the previous track. Thus the first sector of the second track is not necessarily near the first sector of the first track.  The skew value describes for
       each track how far sector number 1 is away from the index mark. This skew value changes for each head and track. The amount of this change depends on how fast the disk spins,  and  on  how  much
       time is needed to change the head or the track.

       --absolute_skew absolute-skew

              Set the absolute skew. This skew value is used for the first formatted track.  It is expressed in raw bytes.

       --head_skew head-skew

              Set the head skew. This is the skew added for passing from head 0 to head 1.  It is expressed in raw bytes.

       --track_skew track-skew

              Set the track skew. This is the skew added for seeking to the next track.  It is expressed in raw bytes.

       Example: (absolute skew=3, head skew=1, track skew=2)

          track 0 head 0: 4,5,6,1,2,3   (skew=3)
          track 0 head 1: 3,4,5,6,1,2   (skew=4)

          track 1 head 0: 1,2,3,4,5,6   (skew=0)
          track 1 head 1: 6,1,2,3,4,5   (skew=1)

          track 2 head 0: 4,5,6,1,2,3   (skew=3)
          track 2 head 1: 3,4,5,6,1,2   (skew=4)

       N.B. For simplicity's sake, this example expresses skews in units of sectors. In reality, superformat expects the skews to be expressed in raw bytes.

Media description
       Please see the Media description section in the full fdutils documentation:
       - Texinfo documentation (info fdutils)
       - HTML documentation in /usr/share/doc/fdutils/Fdutils.html
       - or DVI documentation in /usr/share/doc/fdutils/Fdutils.dvi.gz

Examples
       In all the examples of this section, we assume that drive 0 is a 3 1/2 and drive 1 a 5 1/4.

       The following example shows how to format a 1440K disk in drive 0:

          superformat /dev/fd0 hd

       The following example shows how to format a 1200K disk in drive 1:

          superformat /dev/fd1 hd

       The following example shows how to format a 1440K disk in drive 1:

          superformat /dev/fd1 hd sect=18

       The following example shows how to format a 720K disk in drive 0:

          superformat /dev/fd0 dd

       The following example shows how to format a 1743K disk in drive 0 (83 cylinders times 21 sectors):

          superformat /dev/fd0 sect=21 cyl=83

       The following example shows how to format a 1992K disk in drive 0 (83 cylinders times 2 heads times 12 KB per track)

          superformat /dev/fd0 tracksize=12KB cyl=83 mss

       The following example shows how to format a 1840K disk in drive 0. It will have 5 2048-byte sectors, one 1024-byte sector, and one 512-byte sector per track:

          superformat /dev/fd0 tracksize=23b mss 2m ssize=2KB

       All these formats can be autodetected by mtools, using the floppy driver's default settings.

Troubleshooting
       FDC busy, sleeping for a second
              When  another  program accesses a disk drive on the same controller as the one being formatted, superformat has to wait until the other access is finished.  If this happens, check whether
              any other program accesses a drive (or whether a drive is mounted), kill that program (or unmount the drive), and the format should proceed normally.

       I/O errors during verification
              Your drive may be too far out of tolerance, and you may thus need to supply a margin parameter.  Run floppymeter (see section  floppymeter) to find  out  an  appropriate  value  for  this
              parameter, and add the suggested margin parameter to the command line

Bugs
       Opening up new window while superformat is running produces overrun errors. These errors are benign, as the failed operation is automatically retried until it succeeds.

See Also
       Fdutils' texinfo doc

fdutils-5.5                                                                                      03Mar05                                                                                   superformat(1)
