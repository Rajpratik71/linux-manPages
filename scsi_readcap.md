SCSI_READCAP(8)                                                                                   SG3_UTILS                                                                                   SCSI_READCAP(8)



NAME
       scsi_readcap - do SCSI READ CAPACITY command on disks

SYNOPSIS
       scsi_readcap [--brief] [--help] [--long] [--verbose] DEVICE [DEVICE]*

DESCRIPTION
       This bash shell script calls the sg_readcap utility on each given DEVICE. This will send a SCSI READ CAPACITY command to each DEVICE.

       The  default  action of this script is to send the 10 byte cdb READ CAPACITY(10) command to each DEVICE. If a response indicates the number of blocks is greater than or equal to '2**32 - 1' then the
       READ CAPACITY(16) is sent and its response is output.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -b, --brief
              shortens the output to two hexadecimal numbers, both prefixed by '0x'.  The first number is the number of blocks available and the second is the size of each blocks in bytes (e.g. '0x12a19eb0
              0x200'). If an error is detected '0x0 0x0' is output and the script continues if there are more DEVICEs.

       -h, --help
              print out the usage message then exit.

       -l, --long
              the  default  is to send the READ CAPACITY(10) command (i.e. the 10 byte cdb variant). When this option is given the READ CAPACITY(16) command is sent. The latter command yields more informa-
              tion in its response.

       -v, --verbose
              increase level or verbosity.

EXIT STATUS
       The exit status of this script is 0 when it is successful. Otherwise the exit status is that of the last sg_readcap utility called. See the sg3_utils(8) man page.

AUTHORS
       Written by D. Gilbert

COPYRIGHT
       Copyright © 2009-2013 Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_readcap (sg3_utils)



sg3_utils-1.36                                                                                     May 2013                                                                                   SCSI_READCAP(8)
