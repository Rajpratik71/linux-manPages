SG_TEST_RWBUF(8)                                                                                  SG3_UTILS                                                                                  SG_TEST_RWBUF(8)



NAME
       sg_test_rwbuf - test a SCSI host adapter by issuing dummy writes and reads

SYNOPSIS
       sg_test_rwbuf [--addrd=AR] [--addwr=AW] [--help] [--quick] --size=SZ [--times=NUM] [--verbose] [--version] DEVICE

       or an older deprecated format sg_test_rwbuf DEVICE SZ [AW] [AR]

DESCRIPTION
       sg_test_rwbuf  writes and reads back SZ bytes to the internal buffer of DEVICE (e.g. /dev/sda or /dev/sg0). A pseudo random pattern is written to the data buffer on the device then read back. If the
       same pattern is found 'Success' is reported. If they do not match (checksums unequal) then this is reported and up to 24 bytes from the first point of mismatch are reported;  the  first  line  shows
       what was written and the second line shows what was received. For testing purposes, you can ask it to write AW or read AR additional bytes.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -r, --addrd=AR
              Read an additional AR bytes (than indicated by SZ) from the data buffer. Checksum is performed over the first SZ bytes.

       -w, --addwr=AW
              Write an additional AW bytes (than indicated by SZ) of zeros into the data buffer. Checksum is generated over the first SZ bytes.

       -h, --help
              Print out a usage message the exit.

       -q, --quick
              Perform a READ BUFFER descriptor command to find out the available data buffer length and offset, print them out then exit (without testing with write/read sequences).

       -s, --size=SZ
              where  SZ  is  the  size  of buffer in bytes to be written then read and checked. This number needs to be less than or equal to the size of the device's data buffer which can be seen from the
              --quick option.  Either this option or the --quick option should be given.

       -t, --times=NUM
              where NUM is the number of times to repeat the write/read to buffer test. Default value is 1 .

       -v, --verbose
              increase verbosity of output.

       -V, --version
              print version number (and data of last change) then exit.

NOTES
       The microcode in a SCSI device is _not_ modified by doing a WRITE BUFFER command with its mode set to "data" (0x2) as done by this utility. Therefore this utility is safe in that respect. [Mode val-
       ues 0x4, 0x5, 0x6 and 0x7 are the dangerous ones :-)]

       WARNING:  If  you  access the device at the same time (e.g. because it's a hard disk with a mounted file system on it) the device's buffer may be used by the device itself for other data at the same
       time, and overwriting it may or may not cause data corruption! HOWEVER the SPC-3 draft standard does state in its WRITE BUFFER command: "This command shall not alter any medium of the  logical  unit
       when  data  mode  ... is specified". This implies that it _is_ safe to use this utility with devices that have mounted file systems on them.  Following this theme further, a disk with active mounted
       file systems may cause the data read back to be different (due to caching activity) to what was written and hence a checksum error.

EXIT STATUS
       The exit status of sg_test_rwbuf is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

AUTHORS
       Written by D. Gilbert and K. Garloff

COPYRIGHT
       Copyright © 2000-2012 Douglas Gilbert, Kurt Garloff
       This software is distributed under the GPL version 2. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.



sg3_utils-1.35                                                                                  November 2012                                                                                SG_TEST_RWBUF(8)
