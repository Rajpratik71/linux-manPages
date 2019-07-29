READOM(1)                                                     Schily´s USER COMMANDS                                                     READOM(1)

NAME
       readom - read or write data Compact Discs

SYNOPSIS
       readom dev=device [ options ]

DESCRIPTION
       Readom is used to read or write Compact Discs.

       The device refers to a device location similar to the one used in the wodim command. Refer to its manpage for details.

       Also  note  that  this version of readom uses a modified libusal library which has a different behaviour compared to the one distributed by
       its original author.

OPTIONS
       If no options except the dev= option have been specified, readom goes into interactive mode.  Select a primary function and then follow the
       instructions.

       -version
              Print version information and exit.

       dev=target
              Sets  the  SCSI  target for the drive, see notes above.  A typical device specification is dev=6,0 .  If a filename must be provided
              together with the numerical target specification, the filename is implementation specific.  The correct filename in this case can be
              found  in  the system specific manuals of the target operating system.  On a FreeBSD system without CAM support, you need to use the
              control device (e.g.  /dev/rcd0.ctl).  A correct device specification in this case may be dev=/dev/rcd0.ctl:@ .

              On Linux, drives connected to a parallel port adapter are mapped to a virtual SCSI bus. Different adapters are mapped  to  different
              targets on this virtual SCSI bus.

              If no dev option is present, readom will try to get the device from the CDR_DEVICE environment.

              If the argument to the dev= option does not contain the characters ',', '/', '@' or ':', it is interpreted as an label name that may
              be found in the file /etc/wodim.conf (see FILES section).

       timeout=#
              Set the default SCSI command timeout value to # seconds.  The default SCSI command timeout is the minimum timeout used  for  sending
              SCSI  commands.   If  a SCSI command fails due to a timeout, you may try to raise the default SCSI command timeout above the timeout
              value of the failed command.  If the command runs correctly with a raised command timeout, please report the  better  timeout  value
              and  the  corresponding  command  to the author of the program.  If no timeout option is present, a default timeout of 40 seconds is
              used.

       debug=#, -d
              Set the misc debug value to # (with debug=#) or increment the misc debug level by one (with -d). If you specify -dd, this equals  to
              debug=2.   This may help to find problems while opening a driver for libusal.  as well as with sector sizes and sector types.  Using
              -debug slows down the process and may be the reason for a buffer underrun.

       kdebug=#, kd=#
              Tell the usal-driver to modify the kernel debug value while SCSI commands are running.

       -silent, -s
              Do not print out a status report for failed SCSI commands.

       -v     Increment the level of general verbosity by one.  This is used e.g. to display the progress of the process.

       -V     Increment the verbose level with respect of SCSI command transport by one.  This helps to debug problems during  the  process,  that
              occur  in  the  CD-Recorder.   If you get incomprehensible error messages you should use this flag to get more detailed output.  -VV
              will show data buffer content in addition.  Using -V or -VV slows down the process.

       f=file Specify the filename where the output should be written or the input should be taken from. Using '-' as filename will  cause  readom
              to use stdout resp. stdin.

       -w     Switch to write mode. If this option is not present, readom reads from the specified device.

       -c2scan
              Scans  the whole CD or the range specified by the sectors=range for C2 errors. C2 errors are errors that are uncorrectable after the
              second stage of the 24/28 + 28/32 Reed Solomon correction system at audio level (2352 bytes sector size). If  an  audio  CD  has  C2
              errors,  interpolation  is  needed  to  hide the errors. If a data CD has C2 errors, these errors are in most cases corrected by the
              ECC/EDC code that makes 2352 bytes out of 2048 data bytes. The ECC/EDC code should be able to correct about 100 C2 error  bytes  per
              sector.

              If  you find C2 errors you may want to reduce the speed using the speed= option as C2 errors may be a result of dynamic unbalance on
              the medium.

       -scanbus
              Scan all SCSI devices on all SCSI busses and print the inquiry strings. This option may be used to find SCSI address of the  devices
              on a system.  The numbers printed out as labels are computed by: bus * 100 + target

       sectors=range
              Specify  a sector range that should be read.  The range is specified by the starting sector number, a minus sign and the ending sec‐
              tor number.  The end sector is not included in the list, so sectors=0-0 will not read anything and may be used to check for a CD  in
              the drive.

       speed=#
              Set the speed factor of the read or write process to #.  # is an integer, representing a multiple of the audio speed.  This is about
              150 KB/s for CD-ROM and about 172 KB/s for CD-Audio.  If no speed option is present, readom will use maximum speed.  Only  MMC  com‐
              pliant drives will benefit from this option.  The speed of non MMC drives is not changed.

              Using a lower speed may increase the readability of a CD or DVD.

       ts=#   Set  the  maximum  transfer size for a single SCSI command to #.  The syntax for the ts= option is the same as for wodim fs=# or sdd
              bs=#.

              If no ts= option has been specified, readom defaults to a transfer size of 256 kB. If libusal gets lower values from  the  operating
              system,  the  value  is  reduced to the maximum value that is possible with the current operating system.  Sometimes, it may help to
              further reduce the transfer size or to enhance it, but note that it may take a long time to find a  better  value  by  experimenting
              with the ts= option.

       -notrunc
              Do not truncate the output file when opening it.

       -fulltoc
              Retrieve a full TOC from the current disk and print it in hex.

       -clone Do  a clone read. Read the CD with all sub-channel data and a full TOC.  The full TOC data will be put into a file with similar name
              as with the f= option but the suffix .toc added.

       -noerror
              Do not abort if the high level error checking in readom found an uncorrectable error in the data stream.

       -nocorr
              Switch the drive into a mode where it ignores read errors in data sectors that are a result of uncorrectable ECC/EDC  errors  before
              reading.  If readom completes, the error recovery mode of the drive is switched back to the remembered old mode.

       retries=#
              Set  the  retry  count for high level retries in readom to #.  The default is to do 128 retries which may be too much if you like to
              read a CD with many unreadable sectors.

       -overhead
              Meter the SCSI command overhead time.  This is done by executing several commands 1000 times and printing the total  time  used.  If
              you divide the displayed times by 1000, you get the average overhead time for a single command.

       meshpoints=#
              Print  read-speed  at  # locations.  The purpose of this option is to create a list of read speed values suitable for e.g.  gnuplot.
              The speed values are calculated assuming that 1000 bytes are one kilobyte as documented in the SCSI standard.  The output data  cre‐
              ated for this purpose is written to stdout.

       -factor
              Output  the  speed values for meshpoints=# as factor based on single speed of the current medium.  This only works if readom is able
              to determine the current medium type.

EXAMPLES
       For all examples below, it will be assumed that the drive is connected to the primary SCSI bus of the machine. The SCSI target id is set to
       2.

       To read the complete media from a CD-ROM writing the data to the file cdimage.raw:

           readom dev=2,0 f=cdimage.raw

       To read sectors from range 150 ... 10000 from a CD-ROM writing the data to the file cdimage.raw:

           readom dev=2,0 sectors=150-10000 f=cdimage.raw

       To write the data from the file cdimage.raw (e.g. a filesystem image from genisoimage) to a DVD-RAM, call:

           readom dev=2,0 -w f=cdimage.raw

ENVIRONMENT
       RSH    If  the  RSH  environment is present, the remote connection will not be created via rcmd(3) but by calling the program pointed to by
              RSH.  Use e.g.  RSH=/usr/bin/ssh to create a secure shell connection.

              Note that this forces wodim to create a pipe to the rsh(1) program and disallows wodim to directly access the network socket to  the
              remote server.  This makes it impossible to set up performance parameters and slows down the connection compared to a root initiated
              rcmd(3) connection.

       RSCSI  If the RSCSI environment is present, the remote SCSI server will not be the program /opt/schily/sbin/rscsi but the  program  pointed
              to  by  RSCSI.   Note  that the remote SCSI server program name will be ignored if you log in using an account that has been created
              with a remote SCSI server program as login shell.

SEE ALSO
       wodim(1), genisoimage(1), rcmd(3), ssh(1).

NOTES
       Unless you want to risk getting problems, readom should be run as root. If you don't want to allow users to become  root  on  your  system,
       readom  may  safely  be  installed  suid  root.   For  more  information  see  the  additional notes of your system/program distribution or
       README.suidroot which is part of the Cdrkit source.

       Documentation of the wodim program contains more technical details which could also apply to readom.

DIAGNOSTICS
       A typical error message for a SCSI command looks like:

              readom: I/O error. test unit ready: scsi sendcmd: no error
              CDB:  00 20 00 00 00 00
              status: 0x2 (CHECK CONDITION)
              Sense Bytes: 70 00 05 00 00 00 00 0A 00 00 00 00 25 00 00 00 00 00
              Sense Key: 0x5 Illegal Request, Segment 0
              Sense Code: 0x25 Qual 0x00 (logical unit not supported) Fru 0x0
              Sense flags: Blk 0 (not valid)
              cmd finished after 0.002s timeout 40s

       The first line gives information about the transport of the command.  The text after the first colon gives the error text  for  the  system
       call from the view of the kernel. It usually is: I/O error unless other problems happen. The next words contain a short description for the
       SCSI command that fails. The rest of the line tells you if there were any problems for the transport of the  command  over  the  SCSI  bus.
       fatal error means that it was not possible to transport the command (i.e. no device present at the requested SCSI address).

       The second line prints the SCSI command descriptor block for the failed command.

       The  third line gives information on the SCSI status code returned by the command, if the transport of the command succeeds.  This is error
       information from the SCSI device.

       The fourth line is a hex dump of the auto request sense information for the command.

       The fifth line is the error text for the sense key if available, followed by the segment number that is only valid if  the  command  was  a
       copy command. If the error message is not directly related to the current command, the text deferred error is appended.

       The  sixth  line  is the error text for the sense code and the sense qualifier if available.  If the type of the device is known, the sense
       data is decoded from tables in scsierrs.c .  The text is followed by the error value for a field replaceable unit.

       The seventh line prints the block number that is related to the failed command and text for several error flags. The block number  may  not
       be valid.

       The eight line reports the timeout set up for this command and the time that the command really needed to complete.

BUGS
       The  readom program described here is the Cdrkit spinoff from the original readcd application (see AUTHOR section for details). It may con‐
       tain bugs not present in the original implementation.

       It is definitely less portable than the original implementation.

       For platform specific bugs, see the corresponding README.platform file in the Cdrkit documentation (eg. README.linux).

MAILING LISTS
       If you want to actively take part on the development of readom, you may join the developer mailing list via this URL:

       http://alioth.debian.org/mail/?group_id=31006

       The mail address of the list is: debburn-devel@lists.alioth.debian.org

AUTHOR
       Joerg Schilling
       Seestr. 110
       D-13353 Berlin
       Germany

       This is application is a spinoff from the original implementation of readcd  delivered  in  the  cdrtools  package  [1]  created  by  Joerg
       Schilling, who deserves the most credits for its success. However, he is not involved into the development of this spinoff and therefore he
       shall not be made responsible for any problem caused by it. Do not try to get support from the original author!

       Additional information can be found on:
       https://alioth.debian.org/projects/debburn/

       If you have support questions, send them to

       debburn-devel@lists.alioth.debian.org

       If you have definitely found a bug, send a mail to this list or to

       submit@bugs.debian.org

       writing at least a short description into the Subject and "Package: cdrkit" into the first line of the mail body.

SOURCES
       [1] Cdrtools 2.01.01a08 from May 2006, http://cdrecord.berlios.de

Joerg Schilling                                                     Version 2.0                                                          READOM(1)
