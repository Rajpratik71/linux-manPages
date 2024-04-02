SG_GET_LBA_STATUS(8)                                                                              SG3_UTILS                                                                              SG_GET_LBA_STATUS(8)



NAME
       sg_get_lba_status - send SCSI GET LBA STATUS command

SYNOPSIS
       sg_get_lba_status [--brief] [--help] [--hex] [--lba=LBA] [--maxlen=LEN] [--raw] [--readonly] [--verbose] [--version] DEVICE

DESCRIPTION
       Send  the SCSI GET LBA STATUS command to the DEVICE and outputs the response. This command was introduced in (draft) SBC-3 revision 20 and devices that support logical block provisioning should sup-
       port this command.

       The default action is to decode the response into one LBA status descriptor per line output to stdout. The descriptor LBA is output in hex (prefixed by '0x') and the number of blocks  is  output  in
       decimal  followed by the provisioning status in decimal. The provisioning status can be in the range 0 to 15 of which only 0 (mapped), 1 (unmapped) and 2 (anchored) are used currently. The amount of
       output can be reduced by the --brief option.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -b, --brief
              when use once then one LBA status descriptor per line is output to stdout.  Each line has this format: "0x<descriptor_LBA>  0x<blocks> <provisioning_status>". So the descriptor's starting LBA
              and number of blocks are output in hex and the provisioning status in decimal. When used twice (e.g. '-bb' or '--brief --brief') then the provisioning status of the given LBA (or LBA 0 if the
              --lba option is not given) is output to stdout. A check is made that the given LBA lies in the range of the first returned LBA status descriptor (as it should according to SBC-3 revision  20)
              and warnings are sent to stderr if it doesn't.

       -h, --help
              output the usage message then exit.

       -H, --hex
              output response to this command in ASCII hex.

       -l, --lba=LBA
              where LBA is the starting Logical Block Address (LBA) to check the provisioning status for. Note that the DEVICE chooses how many following blocks that it will return provisioning status for.

       -m, --maxlen=LEN
              where  LEN is the (maximum) response length in bytes. It is placed in the cdb's "allocation length" field. If not given then 24 is used. 24 is enough space for the response header and one LBA
              status descriptor.  LEN should be 8 plus a multiple of 16 (e.g. 24, 40, and 56 are suitable).

       -r, --raw
              output response in binary (to stdout).

       -R, --readonly
              open the DEVICE read-only (e.g. in Unix with the O_RDONLY flag).  The default is to open it read-write.

       -v, --verbose
              increase the level of verbosity, (i.e. debug output). Additional output caused by this option is sent to stderr.

       -V, --version
              print the version string and then exit.

NOTES
       In SBC-3 revision 25 the calculation associated with the Parameter Data Length field in the response was modified. Prior to that the byte offset was 8 and in revision 25 it was changed to 4.

       For a discussion of logical block provisioning see section 4.7 of sbc3r29.pdf at http://www.t10.org (or the corresponding section of a later draft).

EXIT STATUS
       The exit status of sg_get_lba_status is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

AUTHORS
       Written by Douglas Gilbert.

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2009-2014 Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_write_same(8), sg_unmap(8)



sg3_utils-1.39                                                                                     May 2014                                                                              SG_GET_LBA_STATUS(8)
