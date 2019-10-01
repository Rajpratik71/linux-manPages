SG_VERIFY(8)                                                                                      SG3_UTILS                                                                                      SG_VERIFY(8)



NAME
       sg_verify - invoke SCSI VERIFY command(s) on a block device

SYNOPSIS
       sg_verify [--16] [--bpc=BPC] [--count=COUNT] [--dpo] [--ebytchk=BCH] [--group=GN] [--help] [--in=IF] [--lba=LBA] [--nbo=NBO] [--quiet] [--readonly] [--verbose] [--version] [--vrprotect=VRP] DEVICE

DESCRIPTION
       Sends one or more SCSI VERIFY (10 or 16) commands to DEVICE. These SCSI commands are defined in the SBC-2 (draft) standard at http://www.t10.org and SBC-3 drafts.

       When  --nbo=NBO  is  not given then the verify starts at the logical block address given by the --lba=LBA option and continues for --count=COUNT blocks. No more than --bpc=BPC blocks are verified by
       each VERIFY command so if necessary multiple VERIFY commands are sent. Medium verification operations are performed by the DEVICE (e.g.  assuming each block  has  additional  EEC  data,  check  this
       against the logical block contents). No news is good news (i.e. if there are no verify errors detected then no messages are sent to stderr and the Unix exit status is 0).

       When  --nbo=NBO  is given then the --bpc=BPC option is ignored. A single VERIFY command is issued and a comparison starts at the logical block address given by the --lba=LBA option and continues for
       --count=COUNT blocks. The VERIFY command has an associated data-out buffer that is NBO bytes long. The contents of the data-out buffer are obtained from the FN file (if --in=FN  is  given)  or  from
       stdin.   A  comparison  takes  place between data-out buffer and the logical blocks on the DEVICE. If the comparison is good then no messages are sent to stderr and the Unix exit status is 0. If the
       comparison fails then a sense buffer with a sense key of MISCOMPARE is returned; in this case the Unix exit status will be 14. Messages will be sent to stderr associated with MISCOMPARE sense buffer
       unless the --quiet option is given.

       In  SBC-3  revision  34  the  BYTCHK  field  in all SCSI VERIFY commands was expanded from one to two bits. That required some changes in the options of this utility, see the section below on OPTION
       CHANGES.

OPTIONS
       Arguments to long options are mandatory for short options as well.  The options are arranged in alphabetical order based on the long option name.

       -S, --16
              uses a VERIFY(16) command (default VERIFY(10)). Even without this option, using an --lba=LBA which is too large, will cause the utility to issue a VERIFY(16) command.

       -b, --bpc=BPC
              this option is ignored if --nbo=NBO is given. Otherwise BPC specifies the maximum number of blocks that will be verified by a single SCSI VERIFY command. The default value is 128 blocks which
              equates  to  64  KB  for  a disk with 512 byte blocks. If BPC is less than COUNT then multiple SCSI VERIFY commands are sent to the DEVICE. For the default VERIFY(10) BPC cannot exceed 0xffff
              (65,535) while for VERIFY(16) BPC cannot exceed 0x7fffffff (2,147,483,647). For recent block devices (disks) this value may be constrained by the maximum transfer length field  in  the  block
              limits VPD page.

       -c, --count=COUNT
              where  COUNT  specifies  the number of blocks to verify. The default value is 1 . If COUNT is greater than BPC (or its default value of 128) and NBO is not given, 0 or less then multiple SCSI
              VERIFY commands are sent to the device. Otherwise COUNT becomes the contents of the verification length field of the SCSI VERIFY command issued. The sg_readcap utility can be used to find the
              maximum number of blocks that a block device (e.g. a disk) has.

       -d, --dpo
              disable  page  out changes the cache retention priority of blocks read on the device's cache to the lowest priority. This means that blocks read by other commands are more likely to remain in
              the device's cache.

       -E, --ebytchk=BCH
              sets the BYTCHK field to BCH overriding the value (1) set by the --nbo=NBO option. Values of 1, 2 or 3 are accepted for BCH however sbc3r34 reserves the value 2. If this option is given  then
              --nbo=NBO  must  also  be  given. If BCH is 3 then COUNT must be 1 and NBO should be the size of one logical block (plus the size of some or all of the protection infomation if VRP is greater
              than 0).

       -g, --group=GN
              where GN becomes the contents of the group number field in the SCSI VERIFY(16) command. The default value for GN is 0. Note that this option is ignored for the SCSI VERIFY(10) command.

       -h, --help
              output the usage message then exit.

       -i, --in=IF
              where IF is the name of a file from which NBO bytes will be read and placed in the data-out buffer. This is only done when the --nbo=NBO option is given. If this  option  is  not  given  then
              stdin is read. If IF is "-" then stdin is also used.

       -l, --lba=LBA
              where LBA specifies the logical block address of the first block to start the verify operation. LBA is assumed to be decimal unless prefixed by '0x' or a trailing 'h' (see below). The default
              value is 0 (i.e. the start of the device).

       -n, --nbo=NBO
              NBO is the number of bytes to obtain from the FN file (if --in=FN is given) or from stdin. Those bytes are placed in the data-out buffer associated with the SCSI VERIFY  command  and  NBO  is
              placed in the verification length field in the cdb. The default value for NBO is 0 and the maximum value is dependant on the OS. If the --ebytchk=BCH option is not given then the BYTCHK field
              in the cdb is set to 1.

       -q, --quiet
              suppress the sense buffer messages associated with a MISCOMPARE sense key that would otherwise be sent to stderr. Still set the exit status to 14 which is the sense  key  value  indicating  a
              MISCOMPARE .

       -r, --readonly
              opens  the DEVICE read-only rather than read-write which is the default. The Linux sg driver needs read-write access for the SCSI VERIFY command but other access methods may require read-only
              access.

       -v, --verbose
              increase the level of verbosity, (i.e. debug output).

       -V, --version
              print the version string and then exit.

       -P, --vrprotect=VRP
              where VRP is the value in the vrprotect field in the VERIFY command cdb. It must be a value between 0 and 7 inclusive. The default value is zero.

BYTCHK
       BYTCHK is the name of a field (two bits wide) in the VERIFY(10) and VERIFY(16) commands. When set to 1 or 3 (sbc3r34 reserves the value 2) it indicates that associated with the SCSI VERIFY  command,
       a  data-out  buffer  will  be sent for the device (disk) to check. Using the --nbo=NBO option sets the BYTCHK field to 1 and NBO is the number of bytes placed in the data-out buffer. Those bytes are
       obtained from stdin or IF (from the --in=FN option). The --ebytchk=BCH option may be used to override the BYTCHK field value of 1 with BCH.

       The calculation of NBO is left up to the user. Its value depends on the logical block size (which can be found with the sg_readcap utility), the COUNT and the VRP values. If the VRP is greater  than
       0 then each logical block will contain an extra 8 bytes (at least) of protection information.

       When  the BYTCHK field is 0 then the verification process done by the device (disk) is vendor specific. It typically involves checking each block on the disk against its error correction codes (ECC)
       which is additional data also held on the disk.

       Many Operating Systems put limits on the maximum size of the data-out (and data-in) buffer. For Linux at one time the limit was less than 1 MB but has been increased somewhat.

OPTION CHANGES
       Earlier versions of this utility had a --bytchk=NBO option which set the BYTCHK bit and set the cdb verification length field to NBO.  The shorter form of that option was -B NBO. For  backward  com‐
       patibility  that  option  is  still  present  but  not  documented. In its place is the --nbo=NBO whose shorter form of -n NBO.  --nbo=NBO sets the BYTCHK field to 1 unless that is overridden by the
       --ebytchk=BCH.

NOTES
       Various numeric arguments (e.g. LBA) may include multiplicative suffixes or be given in hexadecimal. See the "NUMERIC ARGUMENTS" section in the sg3_utils(8) man page.

       The amount of error correction and the number of retries attempted before a block is considered defective are controlled in part by the Verify Error Recovery mode page. A note  in  the  SBC-3  draft
       (rev 29 section 6.4.9 on the Verify Error Recovery mode page) advises that to minimize the number of checks (and hence have the most "sensitive" verify check) do the following in that mode page: set
       the EER bit to 0, the PER bit to 1, the DTE bit to 1, the DCR bit to 1, the verify retry count to 0 and the verify recovery time limit to 0. Mode pages can be modified with the sdparm utility.

       The SCSI VERIFY(6) command defined in the SSC-2 standard and later (i.e.  for tape drive systems) is not supported by this utility.

EXIT STATUS
       The exit status of sg_verify is 0 when it is successful. When BCH is other than 0 then a comparison takes place and if it fails then the exit status is 14 which happens to be the sense key value  of
       MISCOMPARE.  Otherwise see the EXIT STATUS section in the sg3_utils(8) man page.

       Earlier versions of this utility set an exit status of 98 when there was a MISCOMPARE.

AUTHORS
       Written by Douglas Gilbert.

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2004-2013 Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sdparm(sdparm), sg_modes(sg3_utils), sg_readcap(sg3_utils), sg_inq(sg3_utils)



sg3_utils-1.37                                                                                   August 2013                                                                                     SG_VERIFY(8)
