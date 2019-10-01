SG_REFERRALS(8)                                                                                   SG3_UTILS                                                                                   SG_REFERRALS(8)



NAME
       sg_referrals - send SCSI REPORT REFERRALS command

SYNOPSIS
       sg_referrals [--help] [--hex] [--lba=LBA] [--maxlen=LEN] [--one-segment] [--raw] [--verbose] [--version] DEVICE

DESCRIPTION
       Send  the  SCSI  REPORT REFERRALS command to the DEVICE and outputs the response. This command was introduced in (draft) SBC-3 revision 24 and devices that support referrals should support this com‐
       mand.

       The default action is to decode the response for all user data segment referral descriptors. The amount of output can be reduced by the --lba and --one-segment options.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -h, --help
              output the usage message then exit.

       -H, --hex
              output response to this command in ASCII hex.

       -l, --lba=LBA
              where LBA is the Logical Block Address (LBA) in the first user data segment the DEVICE should report the referrals parameter data for.

       -m, --maxlen=LEN
              where LEN is the (maximum) response length in bytes. It is placed in the cdb's "allocation length" field. If not given then 256 is used. 256 is enough space for the response header  and  user
              data segment descriptors.

       -s, --one-segment
              report the user data segment of the segment spefified by the LBA parameter only.

       -r, --raw
              output response in binary (to stdout).

       -v, --verbose
              increase the level of verbosity, (i.e. debug output). Additional output caused by this option is sent to stderr.

       -V, --version
              print the version string and then exit.

NOTES
       For a discussion of referrals see section 4.25 of sbc3r25.pdf at http://www.t10.org (or the corresponding section of a later draft).

EXIT STATUS
       The exit status of sg_referrals is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

AUTHORS
       Written by Douglas Gilbert and Hannes Reinecke.

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2009-2012 Douglas Gilbert and Hannes Reinecke
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_vpd(8)



sg3_utils-1.35                                                                                  November 2012                                                                                 SG_REFERRALS(8)
