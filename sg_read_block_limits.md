SG_READ_BLOCK_LIMITS(8)                                                                           SG3_UTILS                                                                           SG_READ_BLOCK_LIMITS(8)



NAME
       sg_read_block_limits - send SCSI READ BLOCK LIMITS command

SYNOPSIS
       sg_read_block_limits [--help] [--hex] [--raw] [--verbose] [--version] DEVICE

DESCRIPTION
       Send a SCSI READ BLOCK LIMITS command to DEVICE and outputs the response. This command is defined for tape (drives) and its description is found in the SSC documents at http://www.t10.org .

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -h, --help
              output the usage message then exit.

       -H, --hex
              output response in hex (rather than decode it).

       -r, --raw
              output response in binary to stdout.

       -v, --verbose
              increase the level of verbosity, (i.e. debug output).

       -V, --version
              print the version string and then exit.

EXIT STATUS
       The exit status of sg_read_block_limits is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

EXAMPLES
       It is usually okay to use no options. Here is an invocation (on the first line following the "#" command prompt) followed by some typical output:

          # sg_read_block_limits /dev/st0
       Read Block Limits results:
               Minimum block size: 1 byte(s)
               Maximum block size: 16777215 byte(s), 16383 KB, 15 MB

AUTHORS
       Written by Douglas Gilbert.

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2009-2012 Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg3_utils(sg3_utils)



sg3_utils-1.35                                                                                  November 2012                                                                         SG_READ_BLOCK_LIMITS(8)
