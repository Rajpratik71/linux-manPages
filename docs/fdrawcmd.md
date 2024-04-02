fdrawcmd(1)                                                                              General Commands Manual                                                                              fdrawcmd(1)

Name
       fdrawcmd - send raw commands to the floppy disk controller

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
          fdrawcmd [drive=drive] [rate=rate]
          [length=length] [repeat=repeat]
          [cylinder=physical-cyl] command [parameters ...] [mode]

       fdrawcmd is used to send raw commands to the floppy disk controller, after having selected a given drive. You must have write permission to the selected drive.

       When writing to a disk, data is read from stdin; when reading, data is printed to stdout.  Diagnostic messages, return values from the controller, and the value of the disk change line after the
       command are printed to stderr.

Options
       All numbers may be given in octal (0211), decimal (137), or hexadecimal (0x89).

       drive=drive
              Selects the drive.  The default is drive 0 (`/dev/fd0').

       rate=rate
              Selects the data transfer rate. Use 0 for high density disks, 1 for double density 5 1/4 disks (or 2 Mbps tapes, if the appropriate rate table is selected), and 2 for double density 3 1/2
              disks.

       length=length
              Describes the length of the transferred data for commands reading from and writing to the disk.  The default is to continue until end of file.

       repeat=count
              Repeat the command count times.  This only works correctly for commands which don't do any data transfer.

       cylinder=count
              Seek to the given cylinder before executing the command

       command
              The name of the command to send.  command may be a spelled out name (like read or write), or a number representing the commands floppy disk controller opcode.  A named command has already
              a mode associated with it, whereas for a number the mode parameter should be described using the mode option.

       parameters
              The parameters for the command (optional, not all commands need parameters).

       mode   Various flags or'ed together describing the properties of the command.

Commands
       The description of the various floppy commands given in this manpage is very sketchy. For more details get the 82078 spec sheet which can be found at:

          http://www-techdoc.intel.com/docs/periph/fd_contr/datasheets/

       Look for the chapter COMMAND SET/DESCRIPTIONS.  Older FDCs only support a subset of the commands described therein, but the syntax for the commands that do exist is the same.

   Commands available on all FDCs
       read drvsel cyl head sect szcod spt rw-gap szcod2
              Reads length bytes of data from the disk.  drvsel is the drive selector. Bit 0 and 1 describe the drive, and bit 2 describes the head.  The remaining parameters give  the  cylinder,  head
              (yes,  again),  sector,  size  of the sector (128 * 2 ^ szcod), sectors per track (spt, this is used to switch to the second head when the first side has been read), and size of the read-
              write gap. szcod2 should be 0xff.  read returns ST0 ST1 ST2 and cyl head sect szcod of the next sector to be read; see `/usr/include/linux/fdreg.h' .

              N.B. Certain newer floppy disk controllers are buggy, and do not correctly recognize the end of transfer when operating in virtual DMA mode.  For these, you need to set spt to the  id  of
              the last sector to be read (for example, if you intend to read sectors 2, 3, 4, set spt to 4, even if the disk has more sectors), and set the no-mt flag.

       write drvsel cyl head sect szcod spt rw-gap szcod2
              Analogous to read.

       sense drvsel
              Returns the third status byte (ST3)

       recalibrate drvsel
              Recalibrates the drive and returns ST0 ST1.

       seek drvsel cyl
              Moves the head to cyl and returns ST0 ST1.

       specify drvsel spec1 spec2
              Specify various parameters to the drive.

       format drvsel szcod sect-per-track fmt-gap fmt-fill
              Formats  the cylinder. The new sectors are filled with fmt-fill.  The header information comes from the input, which is made up of cyl head sect szcod quadruples. The szcod parameter from
              the command line is used to describe the actual size of the sectors, and the szcod from the input is used to write into the header. However, the first write to these sectors will use  the
              header information, and might overwrite the following sectors if the szcod parameter from the command line was too small.

       readid drvsel
              reads the first sector header that comes and returns ST0 ST1 ST2 and cyl head sect szcod of the encountered header.

   Commands available on 82072 and later
       dumpregs
              Prints the contents of the FDCs registers, if supported.

   Commands available on 82072A and later
       configure conf1 conf2 conf3
              Configures FIFO operation.

   Commands available on 82077 and later
       version
              Echoes 0x90 if the FDC is more recent than 82072A, and 0x80 otherwise

       perpendicular rate
              Sets the perpendicular mode.  Use 0 for normal, 2 for 500kb/s perpendicular, and 3 for 1 Mb/s perpendicular.

       seek_out drvsel n
              does a relative seek of n cylinders towards cylinder 0.

       seek_in  drvsel n
              does a relative seek of n cylinders away from cylinder 0.

   Commands available on 82077AA and later
       lock   Locks the FIFO configuration, so that it survives a FDC software reset.

       unlock
              Unlock the FIFO configuration

   Commands available on 82078
       partid
              echoes a byte describing the type of the FDC in the 3 high bits, and the stepping in the three low bits.

       powerdown powerconf
              configures automatic power down of the FDC. The old configuration is echoed

       option iso
              enables/disables ISO formats. Odd values of iso enable these formats, whereas even values disable them. ISO formats don't have index headers, and thus allow to fit slightly more data on a
              disk.

       save   prints out 16 internal registers of the FDC.

       restore r1 r2 r3 ... r16
              restores the 16 internal registers of the FDC.

       format_n_write drvsel szcod sect-per-track fmt-gap fmt-fill
              formats the cylinder and writes initial data to it. The input data is made up of a sequence of headers (4 bytes) and data: header1 data1 header2 data2 ... headern datan

       drivespec dspec1 dspec2 ... specn terminator
              chooses rate tables for various drives. Each dspec byte describes one drive. Bits 0 and 1 say which drive is described. Bits 2 and 3 describe the rate table.  Only  tables  0  and  2  are
              interesting.  Both  tables  only  differ  in the meaning of rate 1. For table 0 (the default) rate 0 is 300 kb/s (used for 5 1/4 DD disks), whereas for table 1 it is 2 Mbps (used for fast
              floppy tape drives). Bit 4 is the precompensation table select bit. It should be set to 0. Bit 5-7 should be zero as well. The terminator byte ends the drivespec  command.  It  is  either
              0xc0 or 0x80. If it is 0xc0, no result phase follows; if it is 0x80, the current data rate table configuration for the four drives is echoed.

Modes
       The  mode  option is only needed when you describe the command as a numerical value. Some mode names are also valid command names. They are considered as command name if the command name has not
       yet been given, and as mode name otherwise.

        If you give a command name followed by explicit modes, both the implicit flags of the command name, and the explicit modes are or'ed together.

        If on the other hand you give a command name preceded by explicit modes, only the explicit modes are or'ed together.

       read   Read data from disk using DMA.

       write  Write data to the disk.

       intr   Wait for an interrupt.

       spin   wait for the disk to spin up

       disk   Aborts the operation if no disk is in the drive. This only works if you also chose a physical cylinder to seek to.

       no-motor
              Don't switch on the drive motor while issuing the command

       no-motor-after
              Switch off the motor immediately after the command returns.

       fm     Uses the FM version of the read, readid, write and format commands.

       no-mt  Do not use MT (multitrack) mode for the read, readid and write commands. This is needed on certain broken FDC's which don't recognize end of transfer when running in nodma mode. In  order
              to use these safely, set no-mt, and chose the id of the last sector to be read as sect-per-track.

       fdrawcmd opens the device node with the NDELAY flag. This means that the driver should not try to autodetect the disk type (it might not be formatted), and that it should not reset the FDC. If a
       reset was needed, the command simply fails. If that happens, execute floppycontrol --resetnow 0 , and try again.

See Also
       Fdutils' texinfo doc

fdutils-5.5                                                                                      03Mar05                                                                                      fdrawcmd(1)
