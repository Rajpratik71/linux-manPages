MT(1L)                                                                                                                                                                                                 MT(1L)



NAME
       mt - control magnetic tape drive operation

SYNOPSIS
       mt [-V] [-f device] [--file=device] [--rsh-command=command] [--version] operation [count]

DESCRIPTION
       This manual page documents the GNU version of mt.  mt performs the given operation, which must be one of the tape operations listed below, on a tape drive.

       The  default tape device to operate on is taken from the file /usr/include/sys/mtio.h when mt is compiled.  It can be overridden by giving a device file name in the environment variable TAPE or by a
       command line option (see below), which also overrides the environment variable.

       The device must be either a character special file or a remote tape drive.  To use a tape drive on another machine as the archive, use a filename that starts with `HOSTNAME:'.  The hostname  can  be
       preceded by a username and an `@' to access the remote tape drive as that user, if you have permission to do so (typically an entry in that user's `~/.rhosts' file).

       The available operations are listed below.  Unique abbreviations are accepted.  Not all operations are available on all systems, or work on all types of tape drives.  Some operations optionally take
       a repeat count, which can be given after the operation name and defaults to 1.

       eof, weof
              Write count EOF marks at current position.

       fsf    Forward space count files.  The tape is positioned on the first block of the next file.

       bsf    Backward space count files.  The tape is positioned on the first block of the next file.

       fsr    Forward space count records.

       bsr    Backward space count records.

       bsfm   Backward space count file marks.  The tape is positioned on the beginning-of-the-tape side of the file mark.

       fsfm   Forward space count file marks.  The tape is positioned on the beginning-of-the-tape side of the file mark.

       asf    Absolute space to file number count.  Equivalent to rewind followed by fsf count.

       eom    Space to the end of the recorded media on the tape (for appending files onto tapes).

       rewind Rewind the tape.

       offline, rewoffl
              Rewind the tape and, if applicable, unload the tape.

       status Print status information about the tape unit.

       retension
              Rewind the tape, then wind it to the end of the reel, then rewind it again.

       erase  Erase the tape.

       fss    (SCSI tapes) Forward space count setmarks.

       bss    (SCSI tapes) Backward space count setmarks.

       wset   (SCSI tapes) Write count setmarks at current position (only SCSI tape).

       eod, seod
              Space to end of valid data.  Used on streamer tape drives to append data to the logical and of tape.

       setblk (SCSI tapes) Set the block size of the drive to count bytes per record.

       setdensity
              (SCSI tapes) Set the tape density code to count.  The proper codes to use with each drive should be looked up from the drive documentation.

       drvbuffer
              (SCSI tapes) Set the tape drive buffer code to number.  The proper value for unbuffered operation is zero and "normal" buffered operation one. The meanings of other values can be found in the
              drive documentation or, in case of a SCSI-2 drive, from the SCSI-2 standard.

       stoptions
              (SCSI tapes) Set the driver options bits to count for the device.  The bits can be set by oring the following values: 1 to enable write buffering, 2 to enable asynchronous writes, 4 to enable
              read ahead, 8 to enable debugging output (if it has been compiled to the driver).

       stwrthreshold
              (SCSI tapes) The write threshold for the tape device is set to count kilobytes. The value must be smaller than or equal to the driver buffer size.

       seek   (SCSI tapes) Seek to the count block on the tape.  This operation is available on some Tandberg and Wangtek streamers and some SCSI-2 tape drives.

       tell   (SCSI tapes) Tell the current block on tape.  This operation is available on some Tandberg and Wangtek streamers and some SCSI-2 tape drives.

       densities
              (SCSI tapes) Write explanation of some common density codes to standard output.

       datcompression
              (some SCSI-2 DAT tapes) Inquire or set the compression status (on/off). If the count is one the compression status is printed. If the count is zero, compression is disabled.  Otherwise,  com-
              pression is enabled. The command uses the SCSI ioctl to read and write the Data Compression Characteristics mode page (15). ONLY ROOT CAN USE THIS COMMAND.

       mt exits with a status of 0 if the operation succeeded, 1 if the operation or device name given was invalid, or 2 if the operation failed.

   OPTIONS
       -f, --file=device
              Use  device as the file name of the tape drive to operate on.  To use a tape drive on another machine, use a filename that starts with `HOSTNAME:'.  The hostname can be preceded by a username
              and an `@' to access the remote tape drive as that user, if you have permission to do so (typically an entry in that user's `~/.rhosts' file).

       --rsh-command=command
              Notifies mt that it should use command to communicate with remote devices instead of /usr/bin/ssh or /usr/bin/rsh.

       -V, --version
              Print the version number of mt.



                                                                                                                                                                                                       MT(1L)
