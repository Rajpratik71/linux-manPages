SG_REASSIGN(8)                                                                                    SG3_UTILS                                                                                    SG_REASSIGN(8)



NAME
       sg_reassign - send SCSI REASSIGN BLOCKS command

SYNOPSIS
       sg_reassign [--address=A,A...] [--dummy] [--eight=0|1] [--grown] [--help] [--longlist=0|1] [--hex] [--primary] [--verbose] [--version] DEVICE

DESCRIPTION
       Send  a  SCSI REASSIGN BLOCKS command to DEVICE. Alternatively this utility can find the number of element in a "grown" or "primary" defect list with a SCSI READ DEFECT DATA (10) command. These SCSI
       commands are defined in SBC-2 for direct access devices (e.g. a disk). Reassign blocks is designed to change the physical location of a logical block that is known or suspected to  be  defective  to
       another area on the media. Disks are typically formatted with blocks held in reserve for this situation.

       If  neither  the --grown nor --primary option is supplied then one or more addresses need to be given. If the address (or all of the addresses) fit into 4 bytes and '--eight=1' is not given then the
       parameter block passed to DEVICE is made up of 4 byte logical block addresses. If any of the addresses need more than 4 bytes to represent (i.e. >= 2**32) or '--eight=1' is given then the  parameter
       block passed to DEVICE is made up of 8 byte logical block addresses.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -a, --address=A,A...
              where  A,A...  is  a  string  of  comma  separated  numbers. Each number is interpreted as decimal unless prefixed by '0x' or '0X' (or it has a trailing 'h' or 'H'). If multiple logical block
              addresses are given they must be separated by a comma or a (single) space. A string that contains any space separators needs to be quoted. At least one address must be given.

       -a, --address=-
              reads one or more logical block addresses from stdin. These may be comma, space, tab or linefeed (newline) separated. If a line contains "#" then the remaining characters  on  that  line  are
              ignored. Otherwise each non separator sequence of characters should resolve to a decimal number unless prefixed by '0x' or '0X' (or has a trailing 'h'). At least one address must be given.

       -d, --dummy
              prepare for but do not execute the SCSI REASSIGN BLOCKS command. Since the REASSIGN BLOCKS command is essentially irreversible, paranoid users may wish to check the invocation of this utility
              before reassigning defective blocks on a disk. Useful with '-vv' for those who wish to view the parameter block that will accompany the command.

       -e, --eight=0 | 1
              when value is 1 then it sets the 'LONGLBA' flag in the command indicating that the addresses in the associated parameter block are 8 byte quantities.  When value  is  0  then  it  clears  the
              'LONGLBA' flag in the command indicating that the addresses in the associated parameter block are 4 byte quantities.  If this option is not given then 4 byte quantities are assumed unless one
              of the address is too large.

       -g, --grown
              use the SCSI READ DEFECT DATA (10) command to determine the number of elements in the "grown defect list". When this option is given there is no reassignment of blocks (i.e. this  utility  is
              passive). When this option is given then the --address= option is not permitted. See the discussion below concerning the relationship between reassigned blocks and the grown defect list. This
              list is sometimes referred to as the GLIST.

       -h, --help
              output the usage message then exit.

       -l, --longlist=0 | 1
              sets the REASSIGN BLOCKS cdb field of the same name to the given value.  Only 1000 addresses are permitted so there should be no need to specify a value of 1. The short list variant restricts
              the parameter block length to 2 ** 16 bytes (i.e. about 16000 4 byte addresses or 8000 8 byte addresses). Added for completeness.

       -p, --primary
              use  the  SCSI  READ DEFECT DATA (10) command to determine the number of elements in the "primary defect list" which is established during the manufacturing process. When this option is given
              there is no reassignment of blocks (i.e. this utility is passive). When this option is given then the --address= option is not permitted. This list is sometimes referred to as the PLIST.

       -H, --hex
              print response in hex (for -g, --grown or -p, --primary)

       -v, --verbose
              increase the level of verbosity, (i.e. debug output).

       -V, --version
              print the version string and then exit.

NOTES
       Note that if the ARRE field (for reads) and/or the AWRE field (for writes) are set in the "Read Write Error Recovery" mode page then recoverable read and/or write errors cause automatic reassignment
       of  the defective block. The PER bit in the same mode page controls whether a RECOVERED ERROR sense key is reported on not (PER=1 implies do report). Irrespective of the ARRE, AWRE or PER field set‐
       tings, the error counter log pages reflect any errors (recovered or otherwise). Whenever a block is reassigned, a new entry is added in the "grown" defect  list.  Apart  from  doing  selftests  (see
       sg_senddiag  or  smartmontools) regularly, monitoring the grown defect list of a disk is a reasonable metric of its health. If the grown list starts growing quickly that is an ominous sign. The best
       grown defect lists are empty ones. The number of elements in the grown defect list can be viewed with the --grown option. The contents of the grown defect list can be viewed  with  the  'sginfo  -G'
       utility.

       If  an  unrecoverable  error  is  detected  at  a logical block address then REASSIGN BLOCKS is needed to reassign the block. Also if the ARRE and/or AWRE fields are clear and a recoverable error is
       detected then the logical block in question may be reassigned with this utility (otherwise the error counter log pages will continually be incremented for each recovered access).

       The number of blocks held in reserve for the purposes of REASSIGN BLOCKS is vendor specific and may well be limited to the zone within the media where the original (defective) block lay.  When  this
       number  is  exhausted  subsequent  invocations  of this utility may result in a sense key of hardware error and an additional sense of 'No defect spare location available'. The next step would be to
       reformat the disk (or get a replacement).

       The SBC-2 draft standard (revision 16) notes that when multiple addresses are given to the SCSI REASSIGN BLOCKS command and there is some failure at one of the later  addresses  then  all  addresses
       prior to that have already be reassigned. Care should be taken in such a case. Re-executing the command with the same addresses will cause the earlier addresses to be reassigned again. At some stage
       the disk will run out of reserved locations.  So unless a large number of addresses are involved it may be safer to reassign them one address at a time.

EXIT STATUS
       The exit status of sg_reassign is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

AUTHORS
       Written by Douglas Gilbert.

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2005-2012 Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_format,sginfo,sg_senddiag(all in sg3_utils), sdparm(sdparm), smartmontools(internet, sourceforge)



sg3_utils-1.35                                                                                  November 2012                                                                                  SG_REASSIGN(8)
