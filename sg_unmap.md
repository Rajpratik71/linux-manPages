SG_UNMAP(8)                                                                                       SG3_UTILS                                                                                       SG_UNMAP(8)



NAME
       sg_unmap - send SCSI UNMAP command (known as 'trim' in ATA specs)

SYNOPSIS
       sg_unmap [--anchor] [--grpnum=GN] [--help] [--in=FILE] [--lba=LBA,LBA...] [--num=NUM,NUM...] [--timeout=TO] [--verbose] [--version] DEVICE

DESCRIPTION
       Send  a SCSI UNMAP command to DEVICE to unmap one or more logical blocks. This command was introduced in SBC-3 revision 18 under the broad heading of "logical block provisioning". Logical blocks may
       also be unmapped by the SCSI WRITE SAME command; see the sg_write_same utility. The unmap capability is closely related to the ATA DATA SET MANAGEMENT command with the "Trim" bit set.

       Logical blocks to be unmapped can be specified in one of two ways to this utility. One way is by supplying the start LBAs to the '--lba=' option and the  corresponding  number(s)  to  unmap  to  the
       '--num=' option. The other way is by putting start LBA and number to unmap pairs in a file whose name is given to the '--in=' option. All values are assumed to be decimal unless prefixed by "0x" (or
       "0X") or have a trailing "h" (or "H") in which case they are interpreted as hexadecimal.

       When the '--lba=' option is given then the '--num=' option must also be given. If one has a comma separated list as its argument then the other must have the same number of elements in its list. The
       arguments can use a single space as a separator but need to be in quotes or escaped to not be misinterpreted by the shell.

       With  the '--in=FILE' option an even number of values must be found and are interpreted as pairs: the first value in each pair is a starting LBA and the second value is the number to unmap from that
       LBA. Everything from and including a "#" on a line is ignored as are blank lines. Values may be comma, space and tab separated or appear on separate lines.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -a, --anchor
              sets the 'Anchor' bit in the command (introduced in sbc3r22).

       -g, --grpnum=GN
              sets the 'Group number' field to GN. Defaults to a value of zero.  GN should be a value between 0 and 31.

       -h, --help
              output the usage message then exit.

       -I, --in=FILE
              where FILE is a file name containing pairs of values. The first member of each pair is a starting LBA and the second member of the pair is the number of  logical  blocks  to  unmap  from  and
              including that starting LBA. Values are interpreted as decimal unless indicated otherwise. This option cannot be present with the '--lba=' option.

       -l, --lba=LBA,LBA...
              where  LBA,LBA...  is  a string of comma (or space) separated values that are interpreted as starting logical block addresses. Each number is interpreted as decimal unless prefixed by '0x' or
              '0X' (or it has a trailing 'h' or 'H'). An argument that contains any space separators needs to be quoted (or otherwise escaped). When this option is given then the '--num=' option must  also
              be given and they must contain the same number of elements in their arguments.

       -n, --num=NUM,NUM...
              where NUM,NUM... is a string of comma (or space) separated values that are interpreted as a number of logical blocks to unmap. Each number is interpreted as decimal unless prefixed by '0x' or
              '0X' (or it has a trailing 'h' or 'H'). Note that 0 blocks is acceptable. An argument that contains any space separators needs to be quoted (or otherwise escaped).  When this option is  given
              then the '--lba=' option must also be given and they must contain the same number of elements in their arguments.

       -t, --timeout=TO
              where TO is a timeout value (in seconds) for the UNMAP command.  The default value is 60 seconds.

       -v, --verbose
              increase the level of verbosity, (i.e. debug output).

       -V, --version
              print the version string and then exit.

NOTES
       Some  limits: an LBA can be up to 64 bits, a NUM up to 32 bits (imposed by structure of UNMAP SCSI command parameter data). The NUM is further constrained by the MAXIMUM UNMAP LBA COUNT field in the
       BLOCK LIMITS VPD page (0xb0). The maximum number of LBA,NUM pairs is limited to 128 by this utility and may be further constrained by the MAXIMUM UNMAP BLOCK DESCRIPTOR COUNT field in the BLOCK LIM‐
       ITS VPD page.

       Since  it  is  unclear  how long the UNMAP command will take to execute a '--timeout=" option has been provided. The default timeout period is 60 seconds. If all the logical blocks on a logical unit
       (e.g.  a disk drive) are to be unmapped then the FORMAT UNIT SCSI command (see the sg_format utility) may be considered as an alternative.

       Support for logical block provisioning is indicated by the LBPME bit in the response to the SCSI READ CAPACITY (16) command (see the sg_readcap utility).

       In SBC-3 revision 25 the LBPU and ANC_SUP bits where added to the Logical Block Provisioning VPD page. When LBPU is set it indicates that the device supports the UNMAP command. When the ANC_SUP  bit
       is set it indicates the device supports anchored LBAs.

EXAMPLES
       In the examples directory of the sg3_utils package there is a sg_unmap_example.txt file that shows the format that the '--in=' option accepts.

EXIT STATUS
       The exit status of sg_unmap is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

AUTHORS
       Written by Douglas Gilbert.

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2009-2011 Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_format,sg_get_lba_status,sg_readcap,sg_vpd,sg_write_same(sg3_utils)



sg3_utils-1.35                                                                                  November 2012                                                                                     SG_UNMAP(8)
