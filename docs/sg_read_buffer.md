SG_READ_BUFFER(8)                                                                                 SG3_UTILS                                                                                 SG_READ_BUFFER(8)



NAME
       sg_read_buffer - send SCSI READ BUFFER command

SYNOPSIS
       sg_read_buffer [--help] [--hex] [--id=ID] [--length=LEN] [--mode=MO] [--offset=OFF] [--raw] [--readonly] [--verbose] [--version] DEVICE

DESCRIPTION
       Sends  a  SCSI READ BUFFER command to the DEVICE, and if there is a response either decodes it, prints it in hexadecimal or sends it in binary to stdout. If a response is received for a "descriptor"
       mode then, in the absence of --hex and --raw, it is decoded. Response for non-descriptor modes are output in hexadecimal unless the --raw option is given.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -h, --help
              output the usage message then exit. If used multiple times also prints the mode names and their acronyms.

       -H, --hex
              output the response in hexadecimal. When given twice the response is output in hex with the corresponding representation in ASCII to the right of each line.

       -i, --id=ID
              this option sets the buffer id field in the cdb. ID is a value between 0 (default) and 255 inclusive.

       -l, --length=LEN
              where LEN is the length, in bytes, that is placed in the "allocation length" field in the cdb. The default value is 4 (bytes). The device may respond with less bytes.

       -m, --mode=MO
              this option sets the mode field in the cdb. MO is a value between 0 (default) and 31 inclusive. Alternatively an abbreviation can be given.  See the MODES section below. To list the available
              mode abbreviations use an invalid one (e.g. '--mode=xxx'). As an example, to fetch the read buffer descriptor give '--mode=desc' .

       -o, --offset=OFF
              this option sets the buffer offset field in the cdb. OFF is a value between 0 (default) and 2**24-1 . It is a byte offset.

       -r, --raw
              if a response is received then it is sent in binary to stdout.

       -R, --readonly
              open the DEVICE read-only (e.g. in Unix with the O_RDONLY flag).  The default is to open it read-write.

       -v, --verbose
              increase the level of verbosity, (i.e. debug output).

       -V, --version
              print the version string and then exit.

MODES
       Following  is  a  list  of READ BUFFER command settings for the MODE field.  First is an acronym accepted by the MO argument of this utility.  Following the acronym in square brackets are the corre-
       sponding decimal and hex values that may also be given for MO. The following are listed in numerical order.

       hd  [0, 0x0]
              Combined header and data (obsolete in SPC-4).

       vendor  [1, 0x1]
              Vendor specific.

       data  [2, 0x2]
              Data.

       desc  [3, 0x3]
              Descriptor: yields 4 bytes that contain an offset boundary field (1 byte) and buffer capacity (3 bytes).

       echo  [10, 0xa]
              Read data from echo buffer (was called "Echo buffer" in SPC-3).

       echo_desc  [11, 0xb]
              Echo buffer descriptor: yields 4 bytes of which the last (lowest) 13 bits represent the echo buffer capacity. The maximum echo buffer size is 4096 bytes.

       en_ex  [26, 0x1a]
              Enable expander communications protocol and Echo buffer. Made obsolete in SPC-4.

       err_hist  [28, 0x1c]
              Error history. Introduced in SPC-4.

NOTES
       All numbers given with options are assumed to be decimal.  Alternatively numerical values can be given in hexadecimal preceded by either "0x" or "0X" (or has a trailing "h" or "H").

EXIT STATUS
       The exit status of sg_read_buffer is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

AUTHORS
       Written by Luben Tuikov and Douglas Gilbert.

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2006-2014 Luben Tuikov and Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_write_buffer(sg3_utils)



sg3_utils-1.39                                                                                     May 2014                                                                                 SG_READ_BUFFER(8)
