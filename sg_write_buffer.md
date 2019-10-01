SG_WRITE_BUFFER(8)                                                                                SG3_UTILS                                                                                SG_WRITE_BUFFER(8)



NAME
       sg_write_buffer - send SCSI WRITE BUFFER command

SYNOPSIS
       sg_write_buffer [--help] [--id=ID] [--in=FILE] [--length=LEN] [--mode=MO] [--offset=OFF] [--raw] [--skip=SKIP] [--specific=MS] [--verbose] [--version] DEVICE

DESCRIPTION
       Sends a SCSI WRITE BUFFER command to DEVICE, along with data provided by the user. In some cases no data is required, or data can be read from the file given in the --in=FILE option, or data is read
       from stdin when either --raw or --in=- is given.

       Some WRITE BUFFER command variants do not have associated data to send to the device, for example "activate_mc" ("activate deferred microcode").

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -h, --help
              output the usage message then exit. If used multiple times also prints the mode names and their acronyms.

       -i, --id=ID
              this option sets the buffer id field in the cdb. ID is a value between 0 (default) and 255 inclusive.

       -I, --in=FILE
              read data from file FILE that will be sent with the WRITE BUFFER command.  If FILE is '-' then stdin is read until an EOF is detected (this is the same action as --raw).

       -l, --length=LEN
              where LEN is the length, in bytes, of data to be written to the device.  If not given (and length cannot be deduced from --in=FILE or --raw) then defaults to zero. If the option is given  and
              the length deduced from --in=FILE or --raw is less (or no data is provided), then bytes of 0xff are used as fill bytes.

       -m, --mode=MO
              this  option  sets the mode field in the cdb. MO is a value between 0 (default) and 31 inclusive. Alternatively an abbreviation can be given.  To list the available mode abbreviations give an
              invalid one (e.g. '--mode=xxx') or use the '-hh' option.

       -o, --offset=OFF
              this option sets the buffer offset field in the cdb. OFF is a value between 0 (default) and 2**24-1 . It is a byte offset.

       -r, --raw
              read data from stdin until an EOF is detected. This data is sent with the WRITE BUFFER command to DEVICE. The action of this option is the same as using '--in=-'.

       -s, --skip=SKIP
              this option is only active when --in=FILE is given and FILE is a regular file, rather than stdin. Data is read starting at byte offset SKIP to  the  end  of  file  (or  the  amount  given  by
              --length=LEN). If not given the byte offset defaults to 0 (i.e. the start of the file).

       -S, --specific=MS
              MS  is the mode specific field in the cdb. This is a 3-bit field so the values 0 to 7 are accepted. This field was introduced in SPC-4 revision 32 and can be used to specify additional events
              that activate deferred microcode (when MO is 0xD).

       -v, --verbose
              increase the level of verbosity, (i.e. debug output).

       -V, --version
              print the version string and then exit.

NOTES
       If no --length=LEN is given this utility reads up to 8 MiB of data from the given file FILE (or stdin). If a larger amount of data is required then the --length=LEN option should be given. The  user
       should  be  aware  that most operating systems have limits on the amount of data that can be sent with one SCSI command. In Linux this depends on the pass through mechanism used (e.g. block SG_IO or
       the sg driver) and various setting in sysfs in the Linux lk 2.6 series (e.g. /sys/block/sda/queue/max_sectors_kb).

       Downloading incorrect microcode into a device has the ability to render that device inoperable. One would hope that the device vendor verifies the data before activating it. If the SCSI WRITE BUFFER
       command is given values in its cdb (e.g. LEN) that are inappropriate (e.g. too large) then the device should respond with a sense key of ILLEGAL REQUEST and an additional sense code of INVALID FIELD
       in CDB. If a WRITE BUFFER command (or a sequence of them) fails due to device vendor verification checks then it should respond with a sense key of ILLEGAL REQUEST and an additional  sense  code  of
       COMMAND SEQUENCE ERROR.

       All numbers given with options are assumed to be decimal.  Alternatively numerical values can be given in hexadecimal preceded by either "0x" or "0X" (or has a trailing "h" or "H").

EXIT STATUS
       The exit status of sg_write_buffer is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

AUTHORS
       Written by Luben Tuikov and Douglas Gilbert.

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2006-2012 Luben Tuikov and Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_read_buffer(sg3_utils)



sg3_utils-1.35                                                                                  December 2012                                                                              SG_WRITE_BUFFER(8)
