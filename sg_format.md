SG_FORMAT(8)                                                                                      SG3_UTILS                                                                                      SG_FORMAT(8)



NAME
       sg_format - format or resize a SCSI disk (perhaps change its block size)

SYNOPSIS
       sg_format  [--cmplst={0|1}] [--count=COUNT] [--dcrt] [--early] [--fmtpinfo=FPI] [--format] [--help] [--long] [--pfu=PFU] [--pie=PIE] [--pinfo] [--poll=PT] [--resize] [--rto_req] [--security] [--six]
       [--size=SIZE] [--verbose] [--version] [--wait] DEVICE

DESCRIPTION
       Not all SCSI direct access devices need to be formatted and some have vendor specific formatting procedures. SCSI disks with rotating media are probably the largest group that do  support  a  'stan‐
       dard'  format operation. They are typically factory formatted to a block size of 512 bytes with the largest number of blocks that the manufacturer recommends. The manufacturer's recommendation typi‐
       cally leaves aside a certain number of tracks, spread across the media, for reassignment of blocks to logical block addresses during the life of the disk.

       This utility can format modern SCSI disks and potentially change their block size (if permitted) and the block count (i.e. number of accessible blocks on the media also known as "resizing").  Resiz‐
       ing  a  disk  to  less  than  the  manufacturer's recommended block count is sometimes called "short stroking" (see NOTES section). Resizing the block count while not changing the block size may not
       require a format operation. The SBC-2 standard (see www.t10.org) has obsoleted the "format device" mode page. Many of the low level details found in that mode page are now left up to the  discretion
       of the manufacturer.

       When  this  utility  is  used  without options (i.e. it is only given a DEVICE argument) it prints out the existing block size and block count derived from two sources. These two sources are a block
       descriptor in the response to a MODE SENSE command and the response to a READ CAPACITY command. The reason for this double check is to detect a "format corrupt" state (see NOTES section). This usage
       will not modify the disk.

       When this utility is used with the "--format" (or "-F") option it will attempt to format the given DEVICE. There is a 10 second pause during which time the user is invited twice (5 seconds apart) to
       abort sg_format. This occurs just prior the SCSI FORMAT UNIT command being issued. See the NOTES section for more information.

       Protection information is optional and is made up of 8 additional bytes associated with each logical block. Four protection types are defined with protection type 0 being  no  additional  protection
       bytes. See the PROTECTION TYPES section below for more information.

OPTIONS
       Arguments to long options are mandatory for short options as well.  The options are arranged in alphabetical order based on the long option name.

       -C, --cmplst={0|1}
              sets  the CMPLST ("complete list") bit in the FORMAT UNIT cdb to 0 or 1.  The default is 1 in which case the existing GLIST (grown list) is ignored.  If the value is 0 then the existing GLIST
              is taken into account. See the LISTS section below. In most cases this bit should be left set; some MO disk drives need this bit cleared.

       -c, --count=COUNT
              where COUNT is the number of blocks to be formatted or media to be resized to. Can be used with either --format or --resize.  With --format this option need not be given in which case  it  is
              assumed to be zero. With --format the interpretation of COUNT is:
                (COUNT > 0) : only format the first COUNT blocks and READ
                              CAPACITY will report COUNT blocks after format
                (COUNT = 0) and block size unchanged : use existing block count
                (COUNT = 0) and block size changed : recommended maximum block
                                                     count for new block size
                (COUNT = -1) : use recommended maximum block count
                (COUNT < -1) : illegal
              With --resize this option must be given and COUNT has this interpretation:
                (COUNT > 0) : after resize READ CAPACITY will report COUNT
                              blocks
                (COUNT = 0) : after resize READ CAPACITY will report 0 blocks
                (COUNT = -1) : after resize READ CAPACITY will report its
                               maximum number of blocks
                (COUNT < -1) : illegal
              In both cases if the given COUNT exceeds the maximum number of blocks (for the block size) then the disk reports an error.  See NOTES section below.

       -D, --dcrt
              this  option  sets  the  DCRT bit in the FORMAT UNIT command's parameter list header. It will "disable certification". Certification verifies that blocks are usable during the format process.
              Using this option may speed the format.  The default action of this utility (i.e. when this option is not given) is to clear the DCRT bit thereby requesting "media  certification".  When  the
              DCRT bit is set, the FOV bit must also be set hence sg_format does that.

       -e, --early
              during  a format operation, The default action of this utility is to poll the disk every 60 seconds to determine the progress of the format operation until it is finished. When this option is
              given this utility will exit "early", that is as soon as the format operation has commenced. Then the user can monitor the progress of the ongoing format operation with other utilities  (e.g.
              sg_turs(8) or sg_requests(8)). This option and --wait are mutually exclusive.

       -f, --fmtpinfo=FPI
              sets  the  FMTPINFO field in the FORMAT UNIT cdb to a value between 0 and 3.  The default value is 0. The FMTPINFO field from SBC-3 revision 16 is a 2 bit field (bits 7 and 6 of byte 1 in the
              cdb). Prior to that it was a single bit field (bit 7 of byte 1 in the cdb) and there was an accompanying bit called RTO_REQ (bit 6 of byte 1 in the cdb). The deprecated options "--pinfo"  and
              "--rto-req" represent the older usage. This option should be used in their place. See the PROTECTION TYPES section below for more information.

       -F, --format
              issue  a  SCSI FORMAT UNIT command.  This will destroy all the data held on the media.  This option is required to change the block size of a disk. The user is given a 10 second count down to
              ponder the wisdom of doing this, during which time control-C (amongst other Unix commands) can be used to kill this process before it does any damage. See  NOTES  section  for  implementation
              details and EXAMPLES section for typical use.

       -h, --help
              print out the usage information then exit.

       -l, --long
              the  default  action  of  this  utility  is to assume 32 bit logical block addresses. With 512 byte block size this permits more than 2 terabytes (almost 2 ** 41 bytes) on a single disk. This
              option selects commands and parameters that allow for 64 bit logical block addresses.  Specifically this option sets the "longlba" flag in the MODE SENSE (10) command and uses  READ  CAPACITY
              (16)  rather  than  READ CAPACITY (10). If this option is not given and READ CAPACITY (10) or MODE SELECT detects a disk the needs more than 32 bits to represent its logical blocks then it is
              set internally. This option does not set the LONGLIST bit in the FORMAT UNIT command. The LONGLIST bit is set as required depending other parameters (e.g. when  '--pie=PIE'  is  greater  than
              zero).

       -P, --pfu=PFU
              sets  the "Protection Field Usage" field in the parameter block associated with a FORMAT UNIT command to PFU. The default value is 0, the only other defined value currently is 1. See the PRO‐
              TECTION TYPES section below for more information.

       -q, --pie=PIE
              sets the "Protection Interval Exponent" field in the parameter block associated with a FORMAT UNIT command to PIE. The default value is 0.  This field first appeared in SBC-3 revision 18.

       -p, --pinfo
              this option is deprecated, use the --fmtpinfo=FPI option instead.  If used, then it sets bit 7 of byte 1 in the FORMAT UNIT cdb and that is equivalent to setting --fmtpinfo=2. [So if  --pinfo
              is used (plus --fmtpinfo=FPI and --pfu=PFU are not given or their arguments are 0) then protection type 1 is selected.]

       -x, --poll=PT
              where  PT  is  the type of poll used. If PT is 0 then a TEST UNIT READY command is used, otherwise a REQUEST SENSE command is used. The default is currently 0 but this will change to 1 in the
              near future. See the NOTES sections below.

       -r, --resize
              rather than format the disk, it can be resized. This means changing the number of blocks on the device  reported  by  the  READ  CAPACITY  command.   This  option  should  be  used  with  the
              --count=COUNT  option.   The contents of all logical blocks on the media remain unchanged when this option is used. This means that any resize operation can be reversed. This option cannot be
              used together with either --format or a --size=SIZE whose argument is different to the existing block size.

       -R, --rto_req
              The option is deprecated, use the --fmtpinfo=FPI option instead.  If used, then it sets bit 6 of byte 1 in the FORMAT UNIT cdb.

       -S, --security
              sets the "Security Initialization" (SI) bit in the FORMAT UNIT command's initialization pattern descriptor within the parameter list. According to SBC-3  the  default  initialization  pattern
              "shall be written using a security erasure write technique". See the NOTES section on the SCSI SANITIZE command.

       -6, --six
              Use 6 byte variants of MODE SENSE and MODE SELECT. The default action is to use the 10 byte variants. Some MO drives need this option set when doing a format.

       -s, --size=SIZE
              where SIZE is the block size (i.e. number of bytes in each block) to format the device to. The default value is whatever is currently reported by the block descriptor in a MODE SENSE command.
              If the block size given by this option is different from the current value then a MODE SELECT command is used to change it prior to the FORMAT UNIT command being started  (as  recommended  in
              the  draft  standard).  Many  SCSI disks have 512 byte sectors by default and allow up to 16 bytes extra in a sector (i.e. 528 byte sectors).  If the given size in unacceptable with the disk,
              most likely an "Invalid field in parameter list" message will appear in sense data (requires the use of '-v' to decode sense data).

       -v, --verbose
              increase the level of verbosity, (i.e. debug output). "-vvv" gives a lot more debug output.

       -V, --version
              print the version string and then exit.

       -w, --wait
              the default format action is to set the "IMMED" bit in the FORMAT UNIT command's (short) parameter header. If this option (i.e. --wait) is given then the "IMMED" bit is not set. If --wait  is
              given  the  FORMAT  UNIT command waits until the format operation completes before returning its response. This can be many hours on large disks. This utility sets a 15 hour timeout on such a
              FORMAT UNIT command!

LISTS
       The SBC-3 draft (revision 29) defines PLIST, CLIST, DLIST and GLIST in section 4.13 on "Medium defects". Briefly, the PLIST is the "primary" list of manufacturer detected defects, the CLIST ("certi‐
       fication"  list) contains those detected during the format operation, the DLIST is a list of defects that can be given to the format operation. The GLIST is the grown list which starts in the format
       process as CLIST+DLIST and can "grow" later due to automatic reallocation (see the ARRE and AWRE bits in the read-write error recovery mode page (see sdparm(8))) and use of the SCSI REASSIGN  BLOCKS
       command (see sg_reassign(8)).

       The  CMPLST  bit (controlled by the --cmplst=0|1 option) determines whether the existing GLIST, when the format operation is invoked, is taken into account. The sg_format utility sets the FOV bit to
       zero which causes DPRY=0, so the PLIST is taken into account, and DCRT=0, so the CLIST is generated and used during the format process.

       The sg_format utility does not permit a user to provide a defect list (i.e. DLIST).

PROTECTION TYPES
       SBC-3 drafts have added several "protection types" to the "protection information" introduced in the SBC-2 standard. See the "protection information" section (section 4.21 in draft SBC-3 rev 29).  8
       bytes  of protection information are added to each logical block (a 2 byte "logical block guard" (CRC), a 2 byte "logical block application guard", and a 4 byte "logical block reference tag"). SBC-3
       defines 4 protection types (types 0 to 3) with protection type 0 meaning no protection information is maintained.

       A device that supports protection information (i.e. supports one or more protection types of 1 or higher) sets the "PROTECT" bit in its standard INQUIRY response. It also sets the SPT field  in  the
       EXTENDED  INQUIRY  VPD page response to indicate which protection types it supports. The current protection type of a disk can be found in the "P_TYPE" and "PROT_EN" fields in the response of a READ
       CAPACITY (16) command (e.g. with the 'sg_readcap --long' utility).

       Given that a device supports a particular protection type, a user can then choose to format that disk with that protection type by setting the "FMTPINFO" and "Protection Field Usage" fields  in  the
       FORMAT  UNIT  command. Those fields correspond to the --fmtpinfo=FPI and the --pfu=PFU options in this utility. The list below shows the four protection types followed by the options of this utility
       needed to select them:
         0 : --fmtpinfo=0 --pfu=0
         1 : --fmtpinfo=2 --pfu=0
         2 : --fmtpinfo=3 --pfu=0
         3 : --fmtpinfo=3 --pfu=1
       The default value of FPI (in --fmtpinfo=FPI) is 0 and the default value of PFU (in --pfu=PFU) is 0. So if neither --fmtpinfo=FPI nor --pfu=PFU are given then protection type 0  (i.e.  no  protection
       information) is chosen.

NOTES
       The SBC-2 standard states that the REQUEST SENSE command should be used for obtaining progress indication when the format command is underway.  However, tests on a selection of disks shows that TEST
       UNIT READY commands yield progress indications (but not REQUEST SENSE commands). So the current version of this utility defaults to using TEST UNIT READY commands to poll the disk to  find  out  the
       progress of the format. The --poll=PT option has been added to control this.

       When the --format option is given without the --wait option then the SCSI FORMAT UNIT command is issued with the IMMED bit set which causes the SCSI command to return after it has started the format
       operation.  The --early option will cause sg_format to exit at that point.  Otherwise the DEVICE is polled every 60 seconds with TEST UNIT READY or REQUEST SENSE commands until it  reports  an  "all
       clear"  (i.e. the format operation has completed). Normally these polling commands will result in a progress indicator (expressed as a percentage) being output to the screen.  If the user gets bored
       watching the progress report then sg_format process can be terminated (e.g. with control-C) without affecting the format operation which continues. However a target  or  device  reset  (or  a  power
       cycle) will probably cause the device to become "format corrupt".

       When  the --format and --wait options are both given then this utility may take a long time to return. In this case care should be taken not to send any other SCSI commands to the disk as it may not
       respond leaving those commands queued behind the active format command. This may cause a timeout in the OS driver (in a lot shorter period than 15 hours applicable to some format  operations).  This
       may result in the OS resetting the disk leaving the format operation incomplete. This may leave the disk in a "format corrupt" state requiring another format to remedy the situation.

       When  the  block  size  (i.e. the number of bytes in each block) is changed on a disk two SCSI commands must be sent: a MODE SELECT to change the block size followed by a FORMAT command. If the MODE
       SELECT command succeeds and the FORMAT fails then the disk may be in a state that the draft standard calls "format corrupt". A block descriptor in a subsequent MODE SENSE will report  the  requested
       new  block  size  while a READ CAPACITY command will report the existing (i.e. different) block size. Alternatively the READ CAPACITY command may fail, reporting the device is not ready, potentially
       requiring a format. The solution to this situation is to do a format again (and this time the new block size does not have to be given) or change the block size back to the original size.

       The SBC-2 standard states that the block count can be set back to the manufacturer's maximum recommended value in a format or resize operation.  This can be done by placing an address of  0xffffffff
       (or  the  64  bit  equivalent) in the appropriate block descriptor field to a MODE SELECT command. In signed (two's complement) arithmetic that value corresponds to the manufacturer's maximum recom‐
       mended value. To see exactly which SCSI commands are being executed and parameters passed add the "-vvv" option to the sg_format command line.

       Short stroking is a technique to trade off capacity for performance. Rotating disk performance is usually highest on the outer tracks (i.e. lower logical block addresses) so by resizing or reformat‐
       ting a disk to a smaller capacity, average performance will usually be increased.

       Other  utilities  may  be  useful  in  finding  information associated with formatting. These include sg_inq(8) to fetch standard INQUIRY information (e.g. the PROTECT bit) and to fetch the EXTENDED
       INQUIRY VPD page (e.g. RTO and GRD_CHK bits). The sdparm(8) utility can be used to access and potentially change the now obsolete format mode page.

       scsiformat is another utility available for formatting SCSI disks with Linux. It dates from 1997 (most recent update) and may be useful for disks whose firmware is of that vintage.

       The COUNT numeric argument may include a multiplicative suffix or be given in hexadecimal. See the "NUMERIC ARGUMENTS" section in the sg3_utils(8) man page.

       The SCSI SANITIZE command was introduced in SBC-3 revision 27. It is closely related to the ATA sanitize disk feature set and can be used to remove all existing data from a disk.  Sanitize  is  more
       likely to be implemented on modern disks (including SSDs) than FORMAT UNIT's security initialization feature (see the --security option) and in some cases much faster.

EXAMPLES
       These examples use Linux device names. For suitable device names in other supported Operating Systems see the sg3_utils(8) man page.

       In  the  first example below simply find out the existing block count and size derived from two sources: a block descriptor in a MODE SELECT command response and from the response of a READ CAPACITY
       commands. No changes are made:

          # sg_format /dev/sdm

       Now a simple format, leaving the block count and size as they were previously.  The FORMAT UNIT command is executed in IMMED mode and the device is polled every 60 seconds to print  out  a  progress
       indication:

          # sg_format --format /dev/sdm

       Now the same format, but waiting (passively) until the format operation is complete:

          # sg_format --format --wait /dev/sdm

       Next  is a format in which the block size is changed to 520 bytes and the block count is set to the manufacturer's maximum value (for that block size). Note, not all disks support changing the block
       size:

          # sg_format --format --size=520 /dev/sdm

       Now a resize operation so that only the first 0x10000 (65536) blocks on a disk are accessible. The remaining blocks remain unaltered.

          # sg_format --resize --count=0x10000 /dev/sdm

       Now resize the disk back to its normal (maximum) block count:

          # sg_format --resize --count=-1 /dev/sdm

       One reason to format a SCSI disk is to add protection information. First check which protection types are supported by a disk (by checking the SPT field in the Extended  inquiry  VPD  page  together
       with the Protect bit in the standard inquiry response):

          # sg_vpd -p ei -l /dev/sdb
          extended INQUIRY data VPD page:
            ACTIVATE_MICROCODE=0
            SPT=1 [protection types 1 and 2 supported]
            ....

       Format with type 1 protection:

          # sg_format --format --fmtpinfo=2 /dev/sdm

       After a successful format with type 1 protection, READ CAPACITY(16) should show something like this:

          # sg_readcap -l /dev/sdm
          Read Capacity results:
             Protection: prot_en=1, p_type=0, p_i_exponent=0 [type 1 protection]
             Logical block provisioning: lbpme=0, lbprz=0
             ....

       To format with type 3 protection:

          # sg_format --format --fmtpinfo=3 --pfu=1 /dev/sdm

       For the disk shown above this will probably fail because the Extended inquiry VPD page showed only types 1 and 2 protection are supported.

EXIT STATUS
       The  exit  status of sg_format is 0 when it is successful. Otherwise see the sg3_utils(8) man page. Unless the --wait option is given, the exit status may not reflect the success of otherwise of the
       format.  Using sg_turs(8) and sg_readcap(8) after the format operation may be wise.

AUTHORS
       Written by Grant Grundler, James Bottomley and Douglas Gilbert.

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2005-2013 Grant Grundler, James Bottomley and Douglas Gilbert
       This software is distributed under the GPL version 2. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_turs(8), sg_requests(8), sg_inq(8), sg_modes(8), sg_vpd(8), sg_reassign(8), sg_readcap(8), sg3_utils(8), sg_sanitize(8) [all in sg3_utils], sdparm(8), scsiformat (old), hdparm(8)



sg3_utils-1.37                                                                                    June 2013                                                                                      SG_FORMAT(8)
