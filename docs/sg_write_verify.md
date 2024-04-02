WRITE AND VERIFY(8)                                                                               SG3_UTILS                                                                               WRITE AND VERIFY(8)



NAME
       sg_write_and_verify - send the SCSI WRITE AND VERIFY command

SYNOPSIS
       sg_write_verify [--16] [--bytchk=BC] [--dpo] [--group=GN] [--help] [--ilen=ILEN] [--in=IF] --lba=LBA [--num=NUM] [--repeat] [--timeout=TO] [--verbose] [--version] [--wrprotect=WP] DEVICE

DESCRIPTION
       Send  a SCSI WRITE AND VERIFY (10) or (16) command to DEVICE. The data to be written is read from the IF file or, in its absence, a buffer full of 0xff bytes is used. The length of the data-out buf-
       fer sent with the command is ILEN bytes or, if that is not given, then it is the length of the IF file.

       The write operation is to the DEVICE's medium (optionally to its cache) starting at logical block address LBA for NUM logical blocks.  After the write to medium is performed a verify operation takes
       place  which  may viewed as a medium read (with appropriate checks) but without the data being returned. Additionally, if BS is set to one, the data read back from the medium in the verify operation
       is compared to the original data-out buffer.

       The relationship between the number of logical blocks to be written (i.e.  NUM) and the length (in bytes) of the data-out buffer (i.e.  ILEN) may be simply found by multiplying  the  former  by  the
       logical  block  size. However if the DEVICE has protection information (PI) then it becomes a bit more complicated. Hence the calculation is left to the user with the default ILEN, in the absence of
       the IF file, being set to NUM * 512.

       For sending large amounts of data to contiguous logical blocks, a single WRITE AND VERIFY command may not be appropriate (e.g. due to operating system limitations). In such cases see the REPEAT sec-
       tion below.

OPTIONS
       Arguments to long options are mandatory for short options as well.  The options are arranged in alphabetical order based on the long option name.

       -S, --16
              Send a WRITE AND VERIFY(16) command. The default is to send a WRITE AND VERIFY(10) command unless LBA or NUM are too large for the 10 byte variant.

       -b, --bytchk=BC
              where BC is the value to place in the command's BYTCHK field. Values between 0 and 3 (inclusive) are accepted. The default is value is 0 which implies only a write to the medium then a verify
              operation are performed. The only other value T10 defines currently is 1 which does performs an additional comparison between the data-out buffer that was used by the write operation and  the
              contents of the logical blocks read back from the medium.

       -d, --dpo
              Set the DPO (disable page out) bit in the command. The default is to leave it clear.

       -g, --group=GN
              where GN is the value to place in the command's GROUP NUMBER field.  Values between 0 and 31 (inclusive) are accepted. The default is value is 0.

       -h, --help
              output the usage message then exit.

       -I, --ilen=ILEN
              where  ILEN  is  the  number of bytes that will be placed in the data-out buffer. If the IF file is given then no more than ILEN bytes are read from that file. If the IF file does not contain
              ILEN bytes then an error is reported. If the  IF file is not given then a data-out buffer with ILEN bytes of 0xff is sent.

       -i, --in=IF
              read data (binary) from file named IF. If IF is "-" then stdin is used. This data will become the data-out buffer and will be written to the DEVICE's medium. If BC is  1  then  that  data-out
              buffer will be held until after the verify operation and compared to the data read back from the medium.

       -l, --lba=LBA
              where LBA is the logical block address to start the write to medium.  Assumed to be in decimal unless prefixed with '0x' or has a trailing 'h'.  Must be provided.

       -n, --num=NUM
              where NUM is the number of blocks, starting at LBA, to write to the medium. The default value for NUM is 1.

       -R, --repeat
              this option will continue to do WRITE AND VERIFY commands until the IF file is exhausted. This option requires both the --ilen=ILEN and --in=IF options to be given. Each command starts at the
              next logical block address and is for no more than NUM blocks. The last command may be shorter with the number of blocks scaled as required. If there are residue bytes a warning  is  sent  to
              stderr. See the REPEAT section.

       -t, --timeout=TO
              where TO is the command timeout value in seconds. The default value is 60 seconds. If NUM is large then command may require considerably more time than 60 seconds to complete.

       -v, --verbose
              increase the degree of verbosity (debug messages).

       -V, --version
              output version string then exit.

       -w, --wrprotect=WP
              set the WRPROTECT field in the cdb to WP. The default value is 0 which implies no protection information is sent (along with the user data) in the data-out buffer.

REPEAT
       For  data sizes around a megabyte and larger, it may be appropriate to send multiple SCSI WRITE AND VERIFY commands due to operating system limitations (e.g. pass-through SCSI interfaces often limit
       the amount of data that can be passed with a SCSI command). With this utility the mechanism for doing that is the --repeat option.

       In this mode the --ilen=ILEN and --in=IF options must be given. The ILEN and NUM values are treated as a per SCSI command parameters. Up to ILEN bytes will be read from the IF file continually until
       it is exhausted. If the IF file is stdin, reading continues until an EOF is detected. The data read from each iteration becomes the data-out buffer for a new WRITE AND VERIFY command.

       The  last  read from the file (or stdin) may read less than ILEN bytes in which case the number of logical blocks sent to the last WRITE AND VERIFY is scaled back accordingly. If there is a residual
       number of bytes left after that scaling then that is reported to stderr.

       If an error occurs then that is reported to stderr and via the exit status and the utility stops at that point.

NOTES
       Other SCSI WRITE commands have a Force Unit Access (FUA) bit but that is set (implicitly) by WRITE AND VERIFY commands hence there is no option to set it. The data-out buffer may still  additionally
       be placed in the DEVICE's cache and setting the DPO bit is a hint not to do that.

       Normal  SCSI  WRITEs  can  be  done  with  the  ddpt and the sg_dd utilities. The SCSI WRITE SAME command can be done with the sg_write_same utility while the SCSI COMPARE AND WRITE command (sg_com-
       pare_and_write utility) offers a "test and set" facility.

       Various numeric arguments (e.g. LBA) may include multiplicative suffixes or be given in hexadecimal. See the "NUMERIC ARGUMENTS" section in the sg3_utils(8) man page.

EXIT STATUS
       The exit status of sg_write_verify is 0 when it is successful. If the verify operation fails that is typically indicated with a medium error which leads to an exit status of 3.

       If BC is set to 1 and the comparison it causes fails this utility will indicate the miscompare with an exit status of 14. For other exit status values see the EXIT STATUS section in the sg3_utils(8)
       man page.

EXAMPLES
       To start with, a simple example: write 1 block of data held in file t.bin that is 512 bytes long then write that block to LBA 0x1234 on /dev/sg4 .

         # sg_write_verify --lba=0x1234 --in=t.bin /dev/sg4

       Since '--num=' is not given then it defaults to 1. Further the ILEN value is obtained from the file size of t.bin . To additionally do a data-out comparison to the read back data:

         # sg_write_verify -l 0x1234 -i t.bin --bytchk=1 /dev/sg4

       The  ddpt  command  can  do  copies between SCSI devices using READ and WRITE commands. However, currently it has no facility to promote those WRITES to WRITE AND VERIFY commands. Using a pipe, that
       could be done like this:

         # ddpt if=/dev/sg2 bs=512 bpt=8 count=11 of=- |
       sg_write_verify --in=- -l 0x567 -n 8 --ilen=4096 --repeat /dev/sg4

       Both ddpt and sg_write_verify are configured for segments of 8 512 byte logical blocks. Since 11 logical blocks are read then first 8 logical blocks are copied followed by a copy of the remaining  3
       blocks.  Since  it  is  assumed that there is no protection information then the data-in and data-out buffers will be 4096 bytes each. For sg_write_verify this needs to be stated explicitly with the
       --ilen=4096 option.

AUTHORS
       Bruno Goncalves and Douglas Gilbert.

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2014 Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       ddpt(in a package of that name), sg_compare_and_write(8), sg_dd(8), sg_write_same(8)



sg3_utils-1.40                                                                                    July 2014                                                                               WRITE AND VERIFY(8)
