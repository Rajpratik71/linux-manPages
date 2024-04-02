SG_READ_LONG(8)                                                                                   SG3_UTILS                                                                                   SG_READ_LONG(8)



NAME
       sg_read_long - send a SCSI READ LONG command

SYNOPSIS
       sg_read_long [--16] [--correct] [--help] [--lba=LBA] [--out=OF] [--pblock] [--readonly] [--verbose] [--version] [--xfer_len=BTL] DEVICE

DESCRIPTION
       Send  SCSI READ LONG command to DEVICE. The read buffer is output in hex and ASCII to stdout or placed in a file. Note that the data returned includes the logical block data (typically 512 bytes for
       a disk) plus ECC information (whose format is proprietary) plus optionally other proprietary data. Note that the logical block data may be encoded or encrypted.

       In SBC-4 revision 7 the SCSI READ LONG (10 and 16 byte) commands were made obsolete. In the same revision all uses of SCSI WRITE LONG (10 and 16 byte) commands were made obsolete apart from the case
       in which the WR_UNCOR bit is set.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -S, --16
              uses a SCSI READ LONG(16) command. The default action is to use a SCSI READ LONG(10) command. The READ LONG(10) command has a 32 bit field for the lba while READ LONG(16) has a 64 bit field.

       -c, --correct
              sets the 'CORRCT' bit in the SCSI READ LONG command. When set the data is corrected by the ECC before being transferred back to this utility. The default is to leave the 'CORRCT' bit clear in
              which case the data is not corrected.

       -h, --help
              output the usage message then exit.

       -l, --lba=LBA
              where LBA is the logical block address of the sector to read. Assumed to be in decimal unless prefixed with '0x' (or has a trailing 'h'). Defaults to lba 0. If the lba is larger than can  fit
              in 32 bits then the --16 option should be used.

       -o, --out=OF
              instead of outputting ASCII hex to stdout, send it in binary to the file called OF. If '-' is given for OF then the (binary) output is sent to stdout. Note that all informative and error out-
              put is sent to stderr.

       -p, --pblock
              sets the 'PBLOCK' bit in the SCSI READ LONG command. When set the physical block (plus ECC data) containing the requested logical block address is read. The default is to leave  the  'PBLOCK'
              bit clear in which case the logical block (plus any ECC data) is read.

       -r, --readonly
              opens  the  DEVICE  read-only  rather  than  read-write  which  is the default. The Linux sg driver needs read-write access for the SCSI READ LONG command but other access methods may require
              read-only access.

       -v, --verbose
              increase the level of verbosity, (i.e. debug output).

       -V, --version
              print the version string and then exit.

       -x, --xfer_len=BTL
              where BTL is the byte transfer length (default to 520). If the given value (or the default) does not match the "long" block size of the device, the appropriate BTL is deduced from  the  error
              response and printed (to stderr). The idea is that the user will retry this utility with the correct transfer length.

NOTES
       If  a  defective block is found and its contents, if any, has been retrieved then "sg_reassign" could be used to map out the defective block. Associated with such an action the number of elements in
       the "grown" defect list could be monitored (with "sg_reassign --grown") as the disk could be nearing the end of its useful lifetime.

       Various numeric arguments (e.g. LBA) may include multiplicative suffixes or be given in hexadecimal. See the "NUMERIC ARGUMENTS" section in the sg3_utils(8) man page.

       As a data point, Fujitsu uses a 54 byte ECC (per block) which is capable of correcting up to a single burst error or 216 bits "on the fly". [Information obtained from MAV20xxrc product manual.]

EXIT STATUS
       The exit status of sg_read_long is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

AUTHORS
       Written by Douglas Gilbert.

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2004-2016 Douglas Gilbert
       This software is distributed under the GPL version 2. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_reassign, sg_write_long, sg_dd



sg3_utils-1.42                                                                                  November 2015                                                                                 SG_READ_LONG(8)
