floppycontrol(1)                                                                         General Commands Manual                                                                         floppycontrol(1)

Name
       floppycontrol - floppy driver configuration utility

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
          floppycontrol [-p] [--pollstate] [--printfdstate]
          [-a operation-abort-threshold] [-c read-track-threshold]
          [-r recalibrate-threshold] [-R reset-threshold]
          [-e reporting-threshold] [-f] [-x] [-d drive][-F] [-T]
          [-reset condition] [--debug] [--nodebug] [--messages]
          [--nomessages] [--broken_dcl] [--working_dcl] [--inverted_dcl]
          [--no_inverted_dcl] [--silent_dcl_clear] [--noisy_dcl_clear]
          [-ccmos-type] [-hlt hlt] [-hut hut] [-srt srt] [-o spindown]
          [-u spinup] [-s select-delay] [-rps rotations-per-second]
          [-O spindown-offset] [-track max-tracks] [-timeout seconds]
          [-C check-interval] [-n native-format]
          [-autodetect autodetection-sequence] [-P] [--clrwerror]
          [--printwerror] [-h]

       The floppycontrol program is used to configure the floppy driver.

General Options
       -h
       --help Print a help screen.

       -d drive
       --drive  drive
              Selects the drive to configure. The default is drive 0 (`/dev/fd0').

One time actions
       The following floppycontrol options don't set a configuration parameter, but perform a one-time action. They are available to anybody who has write access to the drive

       -f
       --flush
              Flushes (throws away) the dirty data buffers associated with this drive.

       -x
       --eject
              Ejects the disk out of the drive (Sparc). The dirty buffers are first committed to disk before ejecting it. Fails if the disk is mounted.

       --reset  condition
              Resets the FDC under condition . Condition may be one of the following:

              0      resets the FDC only if a reset is needed anyways,

              1      resets the FDC also if a raw command has been performed since the last reset, and

              2      resets the FDC unconditionally.

              This command may be needed after some failed raw commands (see section  fdrawcmd).

       -F
       --formatend
              Issues an end format ioctl. This might be needed after exiting a fdformat in an unclean way. superformat is not subject to this.

Printing current settings
       -T
       --type Print  out  the  drive  name  of a floppy device. This is used by the MAKEFLOPPIES script. The drive name is a letter (describing the drive type) followed by the capacity of the format in
              bytes. The letter is E for 3.5 ED drives, H for 3.5 HD drives, D for 3.5 DD drives, h for 5.25 HD drives and d for 5.25 DD drives. The drive type letter corresponds to  the  oldest  drive
              type  supporting the format of this device node (not necessarily the type of the drive referred by this node.)  For the generic format nodes (/dev/fd0 et al.)  the name of "native format"
              of the drive is printed, and for the default formats, if a generic format has been redefined, its name becomes (null).

       -p
       --print
              Prints out the configuration of the drive. The names of the various fields are the same as the names of the option to set them, see below.

       -P
       --printstate
              Prints out the cached internal state of the driver. The first line lists various attributes about the disk:

              drive present
              disk present
              disk writable
                     These are only updated when the drive is accessed.

              spinup
                     is the time when the motor became switched on for the last time.

              select
                     is the time when the drive became selected for the last time

              first_read
                     is the time when the first read request after the last spin up completed.

              probed_fmt
                     is the index of the autodetected format in the autodetection sequence for this drive.

              cylinder
                     is the cylinder where the drive head currently sits.  If this number is negative, it has the following meaning:

                     *      -1 means that the driver doesn't know, but the controller does (a seek command must be issued).

                     *      -2 means that the controller doesn't know either, but is sure that it not beyond the 80th track.  The drive needs a recalibration.

                     *      -3 means that the head may be beyond the 80th track.  The drive needs two successive recalibrations, because at each recalibration, the controller only issues 80  move  head
                            commands per recalibration.

              maxblock
                     is the highest block number that has been read.

              maxcylinder
                     is  a  boolean which is set when a sector that is not on cylinder 0/head 0 has been read.  These are used for smart invalidation of the buffer cache on geometry change.  The buffer
                     cache of the drive is only invalidated on geometry change when this change actually implies that a block that has already been read changes position. This  optimization  is  useful
                     for mtools which changes the geometry after reading the boot sector.

              generation
                     is  roughly  the  number of disk changes noticed since boot. Disk changes are noticed if the disk is actually changed, or if a flush command is issued and for both cases if any I/O
                     to/from the disk occurs. (i.e. if you insert several disks, but don't do any I/O to them, the generation number stays the same.)

              refs   is number of open file descriptors for this drive. It is always at least one, because floppycontrol's file descriptor is counted too.

              device
                     is format type (as derived from the minor device number) which is currently being used.

              last_checked
                     is date (in jiffies) when the drive was last checked for a disk change, and a disk was actually in the drive.

       --pollstate
              Polls the drive and then prints out the internal state of the driver.(--Printstate only prints out the cached information without actually polling the drive for a disk change.)

       --printfdcstate
              Prints out the state of the controller where the target drive is attached to.

              spec1
              spec2  are the current values of those registers.

              rate   is current data transfer rate

              rawcmd
                     is true if a raw command has been executed since the last reset. If this is the case, a reset will be triggered when a drive on the same FDC is next opened.

              dor    is the value of the digital output register. The 4 high bits are a bit mask describing which drives are spinning, the 2 low bits describe the selected drive, bit 2 is used to reset
                     the FDC, and bit 3 describes whether this FDC has hold of the interrupt and the DMA. If you have two FDCs, bit 3 is only set on one of them.

              version
                     is the version of the FDC. See `linux/include/linux/fdreg.h' for a listing of the FDC version numbers.

              reset  is true if a reset needs to be issued to the FDC before processing the next request.

              need_configure
                     is true if this FDC needs configuration by the FD_CONFIGURE command.

              has_fifo
                     is set if the FDC understands the FD_CONFIGURE command.

              perp_mode
                     describes the perpendicular mode of this FDC. 0 is non-perpendicular mode, 2 is HD perpendicular mode, 3 is ED perpendicular mode, and 1 is unknown.

              address
                     is the address of the first I/O port of the FDC.  Normally, this is 0x3f0 for the first FDC and 0x370 for the second.

Drive type configuration and autodetection
       The  following  options handle the different available drive types, such as double density vs. high density vs. extra density drives, and 5 1/4 drives vs 3 1/2 drives.  Usually the drive type is
       stored in a non-volatile memory, called CMOS, under the form of an integer ranging from 1 to 6.

       Different drive types are able to handle and autodetect different formats (different autodetection lists). They also have different "native format name". The native format is the "usual"  format
       with the highest capacity supported by the drive. (For example 720KB on a double density 3 1/2 drive, and 1.2MB on a high density 5 1/4 drive.)

       These settings are only changeable by the super user.

       -c cmos-type
       --cmos  cmos-type
              Set the virtual CMOS type of the floppy drive. This is useful if

              *      the physical CMOS type is wrong (this may happen with BIOSes which use a non-standard mapping),

              *      you have more than two drives (the physical CMOS may only describe up to two drives).

              *      you have a BIOS that allows swapping drives A: and B: for DOS.

       Right now, this CMOS parameter is not used by the kernel, except for feeding it back to other applications (for instance superformat, floppymeter or MAKEFLOPPIES).  It is also possible to supply
       a virtual CMOS type with the cmos boot option (see section  Boottime configuration).  If possible, I recommend you use the boot option, rather than floppycontrol, because the  boot  option  also
       sets any parameters derived from the CMOS type, such as the autodetection list and the native format, whereas floppycontrol does not.

       -A  autodetect-seq
       --autodetect  autodetect-seq
              Set  the  autodetection  sequence (see section  Autodetection) The autodetection sequence is a comma-separated list of at most eight format descriptors. Each format descriptor is a format
              number optionally followed by the letter t.  For drive 0, the format number is the minor device number divided by 4.  The autodetection sequence is used by the driver to find out the for‐
              mat  of  a  newly inserted disk. The formats are tried one after the other, and the first matching format is retained. To test the format, the driver tries to read the first sector on the
              first track on the first head when t is not given, or the whole first track when t is given. Thus, autodetection cannot detect the number of tracks. However, this information is contained
              in the boot sector, which is now accessible. The boot sector can then be used by mtools to configure the correct number of tracks.

              Example:

                 7,4,24t,25

              means  to  try  out  the formats whose minor device numbers are 28 (1.44M), 16 (720KB), 96 (1.76MB), and 100 (1.92MB), in this order. For the 1.76MB format, try to read the whole track at
              once.

              Reading the whole track at once allows you to distinguish between two formats which differ only in the number of sectors. (The format with the most sectors must be tried first.)   If  you
              use mtools, you do not need this feature, as mtools can figure out the number of sectors without any help from the floppy driver, by looking at the boot sector.

              Reading  the  whole  track at once may also speed up the first read by 200 milliseconds. However, if, on the other hand, you try to read a disk which has less sectors than the format, you
              lose some time.

              I suggest that you put the most often used format in the first place (barring other constraints), as each format that is tried out takes 400 milliseconds.

       -n native-format
       --native_format  native-format
              Set the native format of this drive. The native format of a drive is the highest standard format available for this drive. (Example: For a 5 1/4 HD drive it is the  usual  1200K  format.)
              This  is format is used to make up the format name for the generic device (which is the name of the native format). This drive name is read back from the kernel by the MAKEFLOPPIES script
              which uses it to decide which device nodes to create.

Configuration of the disk change line
       --broken_dcl
              Assumes that the disk change line of the drive is broken.  If this is set, disk changes are assumed to happen whenever the device node is first opened. The physical disk  change  line  is
              ignored.

              This  option  should be used if disk changes are either not detected at all, or if disk changes are detected when the disk was actually not changed.  If this option fixes the problem, I'd
              recommend that you try to trace the root cause of the problem.  Indeed, this options results in reduced performance due to spurious cache flushes.

              The following hardware problems may lead to a bad disk change line:

              *      If the floppy cable is not inserted straight, or if it is kinked, the disk change line is likely to suffer, as it is on the edge of the cable.  Gently press on both  connectors  of
                     the cable (drive and controller) to insure that all wires make contact.  Visually inspect the cable, and if it shows obvious traces of damage, get a new one.

              *      On some drives, the locations disk change line may be chosen by jumper. Make sure that your floppy controller and your drive agree on which line is the disk change line.

              *      Some older drives (mostly double density 5 1/4 drives) don't have a disk change line.  In this case, you have no choice other than to leave the broken_dcl option on.

       --working_dcl
              Assumes that the disk change line works all right. Switching from broken to working may lead to unexpected results after the first disk change.

       --inverted_dcl
              Assumes that this disk drive uses an inverted disk change line. Apparently this is the case for IBM thinkpads.

       --no_inverted_dcl
              Assumes that this drive follows the standard convention for the disk change line.

       --noisy_dcl_clear
              Switches off silent disk change line clearing for this drive.

Timing Parameters
       This section describes how to configure drive timings.  To set these parameters, you need superuser privileges. All times are in "jiffy" units (10 milliseconds), unless otherwise specified.

       --hlt  hlt
              Set  the  head load time (in microseconds) for this floppy drive.  The head load time describes how long the floppy controller waits after seeking or changing heads before allowing access
              to a track.

       --hut  hut
              Set the head unload time (in microseconds) for this floppy drive.  The head unload time describes how long the floppy controller waits after an access before directing  its  attention  to
              the other head, or before seeking.

       --srt  srt
              Set the step rate (in microseconds) for this floppy drive.  The step rate describes how long the drive head stays on one cylinder when seeking.  Setting this value to low (too fast seeks)
              may make seeks fail, because the motor doesn't follow fast enough.

       -u spinup-time
       --spinup  spinup-time
              Set the spinup time of the floppy drive. In order to do read or write to the floppy disk, it must spin. It takes a certain time for the motor to reach enough speed to read or write.  This
              parameter  describes  this  time. The floppy driver doesn't try to access the drive before the spinup time has elapsed. With modern controllers, you may set this time to zero, as the con‐
              troller itself enforces the right delay.

       -o spindown-time
       --spindown  spindown-time
              Set the spindown time of this floppy drive. The motor is not stopped immediately after the operation completes, because there might be more operations following. The spindown time is  the
              time the driver waits before switching off the motor.

       -O spindown-offset
       --spindown_offset  spindown-offset
              Set  the spindown offset of this floppy drive. This parameter is used to set the position in which the disk stops. This is useful to minimize the next access time. (If the first sector is
              just near the head at the very moment at which the disk has reached enough speed, you win 200 milliseconds against the most unfavorable situation).

              This is done by clocking the time where the first I/O request completes, and using this time to calculate the current position of the disk.

       -s select-delay
       --select_delay  select-delay
              Set the select delay of this floppy drive. This is the delay that the driver waits after selecting the drive and issuing the first command to it. For modern  controllers/drives,  you  may
              set this to zero.

       -C check-interval
       --checkfreq  check-interval
              Set the maximal disk change check interval.  The disk change line is checked whenever a read or write to the device is issued, and it has not been checked for more than interval jiffies.

Debugging messages
       This subsection describes how to switch the available debugging messages on and off.

       --debug
              Switch  debugging output on. The debugging information includes timing information. This option might be useful to fine-tune the timing options for your local setups. (But for most normal
              purposes, the default values are good enough.)

       --nodebug
              Switch debugging output off.

       --messages
              Print informational messages after autodetection, geometry parameter clearing and dma over/underruns.

       --nomessages
              Don't print informational messages after these events.

Error Handling Options
       The following options configure the behavior of the floppy driver in case of read/write errors. They may be used by any user who has write privileges for the drive. Whenever  the  floppy  driver
       encounters  an error, a retry counter is incremented. If the value of this counter gets bigger than the thresholds described below, the corresponding actions are performed at the next retry. The
       counter is reset when the read or write finally terminates, whether successfully or not.

       -a operation-abort-threshold
       --abort  operation-abort-threshold
              Tell the floppy driver to stop trying to read/write a sector after operation-abort-threshold retries, and signal the I/O error to the user.

       -t read-track-threshold
       --readtrack  read-track-threshold
              Tell the floppy driver to switch from track-reading mode to sector-at-a-time-mode after read-track-threshold retries.

       -r recalibrate-threshold
       --recalibrate  recalibrate-threshold
              Tell the floppy driver to recalibrate the drive after recalibrate-threshold retries.

       -R reset-threshold
       --reset  reset-threshold
              Tell the floppy driver to reset the controller after reset-threshold retries. After a controller reset, the floppy driver also recalibrates all drives connected to that controller.

       -e error-report-threshold
       --reporting  error-report-threshold
              Tell the floppy driver to start printing error messages to the console after error-report-threshold retries.

Write error reporting
       Due to the buffer cache, write errors cannot always be reported to the writing user program as soon as the write system call returns.  Indeed, the actual writing may take place much later. If  a
       write  error is encountered, the floppy driver stores information about it in its per drive write error structure.  This write error structure stays until explicitly cleared.  It can for example
       be queried by a backup program which wants to make sure that the data has been written successfully.

       --clrwerror
              Clears the write error structure.

       --printwerror
              Prints the contents of the write error structure:

              write_errors
                     is a count of how many write errors have occurred since the structure was last cleared.

              badness
                     is the maximal number of retries that were needed to complete an operation (reads, writes and formats).

              first_error_sector
                     is where the first (chronologically) write error occurred.

              first_error_generation
                     is the disk change generation in which did the first write error occurred.  The disk change generation is a number which is incremented at each disk change.

              last_error_sector
                     and

              last_error_generation
                     are similar.

Other drive configuration options
       This subsection lists per drive configuration options, which don't fit in any other category.  They are available only to the superuser:

       --tracks  max-tracks
              Set the maximal numbers of physical tracks that this drive may handle. If you have a drive which is only able to handle 80 tracks (making strange noises when you try to format or  read  a
              disk with more than 80 tracks), use this option to prevent unprivileged users of damaging your drive by repeatedly reading disks with more than 80 tracks.

              If you trust your users and your disks, you don't need this. With most drives you don't need to worry anyways. See section More cylinders, for details.

       -i sector-interleave
       --interleave sector-interleave
              Set  the  number  of  sectors beyond which sector interleaving will be used.  This option will only be used by the FDFMTTRK ioctl.  The fdformat command, which is now considered obsolete,
              uses FDFMTTRK ioctl, but superformat does not.

See Also
       Fdutils' texinfo doc

fdutils-5.5                                                                                      03Mar05                                                                                 floppycontrol(1)
