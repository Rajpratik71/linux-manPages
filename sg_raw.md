SG_RAW(8)                                                                                         SG3_UTILS                                                                                         SG_RAW(8)



NAME
       sg_raw - send arbitrary SCSI command to a device

SYNOPSIS
       sg_raw  [--binary] [--enumerate] [--help] [--infile=IFILE] [--nosense] [--outfile=OFILE] [--readonly] [--request=RLEN] [--send=SLEN] [--skip=KLEN] [--timeout=SEC] [--verbose] [--version] DEVICE CDB0
       CDB1 ...

DESCRIPTION
       This utility sends an arbitrary SCSI command (between 6 and 256 bytes) to the DEVICE. There may be no associated data transfer; or data may be read from a file and sent to the DEVICE; or data may be
       received  from  the  DEVICE  and  then  displayed  or  written to a file. If supported by the pass through, bidirectional commands may be sent (i.e. containing both data to be sent to the DEVICE and
       received from the DEVICE).

       The SCSI command may be between 6 and 256 bytes long. Each command byte is specified in plain hex format (00..FF) without a prefix or suffix. See EXAMPLES section below.

       The commands pass through a generic SCSI interface which is implemented for several operating systems including Linux, FreeBSD and Windows.

OPTIONS
       Arguments to long options are mandatory for short options as well.  The options are arranged in alphabetical order based on the long option name.

       -b, --binary
              Dump data in binary form, even when writing to stdout.

       -h, --help
              Display usage information and exit.

       -i, --infile=IFILE
              Read data from IFILE instead of stdin. This option is ignored if --send is not specified.

       -n, --nosense
              Don't display SCSI Sense information.

       -o, --outfile=OFILE
              Write data received from the DEVICE to OFILE. The data is written in binary. By default, data is dumped in hex format to stdout.  If OFILE is '-' then data is  dumped  in  binary  to  stdout.
              This option is ignored if --request is not specified.

       -R, --readonly
              Open DEVICE read-only. The default (without this option) is to open it read-write.

       -r, --request=RLEN
              Expect  to  receive  up to RLEN bytes of data from the DEVICE.  RLEN may be suffixed with 'k' to use kilobytes (1024 bytes) instead of bytes. RLEN is decimal unless it has a leading '0x' or a
              trailing 'h'.
              If RLEN is too small (i.e. either smaller than indicated by the cdb (typically the "allocation length" field) and/or smaller than the DEVICE tries to send back) then the HBA driver  may  com-
              plain.  Making RLEN larger than required should cause no problems. Most SCSI "data-in" commands return a data block that contains (in its early bytes) a length that the DEVICE would "like" to
              send back if the "allocation length" field in the cdb is large enough. In practice, the DEVICE will return no more bytes than indicated in the "allocation length" field of the cdb.

       -s, --send=SLEN
              Read SLEN bytes of data, either from stdin or from a file, and send them to the DEVICE. In the SCSI transport, SLEN becomes the length (in bytes) of the "data-out"  buffer.  SLEN  is  decimal
              unless it has a leading '0x' or a trailing 'h'.
              It  is the responsibility of the user to make sure that the "data-out" length implied or stated in the cdb matches SLEN. Note that some common SCSI commands such as WRITE(10) have a "transfer
              length" field whose units are logical blocks (which are often 512 bytes long).

       -k, --skip=KLEN
              Skip the first KLEN bytes of the input file or stream. This option is ignored if --send is not specified. If --send is given and this option is not given, then zero bytes are skipped.

       -t, --timeout=SEC
              Wait up to SEC seconds for command completion (default: 20).  Note that if a command times out the operating system may start by aborting the command  and  if  that  is  unsuccessful  it  may
              attempt to reset the device.

       -v, --verbose
              Increase level of verbosity. Can be used multiple times.

       -V, --version
              Display version and license information and exit.

NOTES
       The  sg_inq utility can be used to send an INQUIRY command to a device to determine its peripheral device type (e.g. '1' for a streaming device (tape drive)) which determines which SCSI command sets
       a device should support (e.g. SPC and SSC). The sg_vpd utility reads and decodes a device's Vital Product Pages which may contain useful information.

       The ability to send more than a 16 byte CDB (in some cases 12 byte CDB) may be restricted by the pass-through interface, the low level driver or the transport. In the Linux series 3 kernels, the bsg
       driver can handle longer CDBs, block devices (e.g. /dev/sdc) accessed via the SG_IO ioctl cannot handle CDBs longer than 16 bytes, and the sg driver can handle longer CDBs from lk 3.17 .

       The  CDB command name defined by T10 for the given CDB is shown if the '-vv' option is given. The command line syntax still needs to be correct, so /dev/null may be used for the DEVICE since the CDB
       command name decoding is done before the DEVICE is checked.

EXAMPLES
       These examples, apart from the last one, use Linux device names. For suitable device names in other supported Operating Systems see the sg3_utils(8) man page.

       sg_raw /dev/scd0 1b 00 00 00 02 00
              Eject the medium in CD drive /dev/scd0.

       sg_raw -r 1k /dev/sg0 12 00 00 00 60 00
              Perform an INQUIRY on /dev/sg0 and dump the response data (up to 1024 bytes) to stdout.

       sg_raw -s 512 -i i512.bin /dev/sda 3b 02 00 00 00 00 00 02 00 00
              Showing an example of writing 512 bytes to a sector on a disk is a little dangerous. Instead this example will read i512.bin (assumed to be 512 bytes long) and use the SCSI WRITE BUFFER  com-
              mand to send it to the "data" buffer (that is mode 2). This is a safe operation.

       sg_raw -r 512 -o o512.bin /dev/sda 3c 02 00 00 00 00 00 02 00 00
              This  will  use the SCSI READ BUFFER command to read 512 bytes from the "data" buffer (i.e. mode 2) then write it to the o512.bin file.  When used in conjunction with the previous example, if
              both commands work then 'cmp i512.bin o512.bin' should show a match.

       sg_raw --infile=urandom.bin --send=512 --request=512 --outfile=out.bin "/dev/bsg/7:0:0:0" 53 00 00 00 00 00 00 00 01 00
              This is a bidirectional XDWRITEREAD(10) command being sent via a Linux bsg device. Note that data is being read from "urandom.bin" and sent to  the  device  (data-out)  while  resulting  data
              (data-in) is placed in the "out.bin" file. Also note the length of both is 512 bytes which corresponds to the transfer length of 1 (block) in the cdb (i.e.  the second last byte).

       sg_raw.exe PhysicalDrive1 a1 0c 0e 00 00 00 00 00 00 e0 00 00
              This example is from Windows and shows a ATA STANDBY IMMEDIATE command being sent to PhysicalDrive1. That ATA command is contained within the SCSI ATA PASS-THROUGH(12) command (see the SAT or
              SAT-2 standard at http://www.t10.org). Notice that the STANDBY IMMEDIATE command does not send or receive any additional data, however if it fails sense data should be returned and displayed.

EXIT STATUS
       The exit status of sg_raw is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

AUTHOR
       Written by Ingo van Lil

REPORTING BUGS
       Report bugs to <inguin at gmx dot de>.

COPYRIGHT
       Copyright © 2001-2016 Ingo van Lil
       This software is distributed under the GPL version 2. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_inq, sg_vpd, sg3_utils (sg3_utils), plscsi



sg3_utils-1.43                                                                                    March 2016                                                                                        SG_RAW(8)
