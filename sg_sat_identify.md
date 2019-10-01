SG_SAT_IDENTIFY(8)                                                                                SG3_UTILS                                                                                SG_SAT_IDENTIFY(8)



NAME
       sg_sat_identify - send ATA IDENTIFY DEVICE command via SCSI to ATA Translation (SAT) layer

SYNOPSIS
       sg_sat_identify [--ck_cond] [--extend] [--help] [--hex] [--ident] [--len={16|12}] [--packet] [--raw] [--verbose] [--version] DEVICE

DESCRIPTION
       This  utility  sends  either  an ATA IDENTIFY DEVICE command or an ATA IDENTIFY PACKET DEVICE command to DEVICE and outputs the response. The devices that respond to these commands are ATA disks and
       ATAPI devices respectively.  Rather than send these commands directly to the device they are sent via a SCSI transport which is assumed to contain a SCSI to ATA Translation (SAT) Layer  (SATL).  The
       SATL may be in an operating system driver, in host bus adapter firmware or in some external enclosure.

       The  SAT  standard  (SAT ANSI INCITS 431-2007, prior draft: sat-r09.pdf at www.t10.org) defines two SCSI "ATA PASS-THROUGH" commands: one using a 16 byte "cdb" and the other with a 12 byte cdb. This
       utility defaults to using the 16 byte cdb variant. SAT-2 is also a standard: SAT-2 ANSI INCITS 465-2010 and the draft prior to that is sat2r09.pdf . The SAT/-3  project  has  started  and  the  most
       recent draft is sat3r01.pdf .

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -c, --ck_cond
              sets  the CK_COND bit in the ATA PASS-THROUGH SCSI cdb. The default setting is clear (i.e. 0). When set the SATL should yield a sense buffer containing a ATA Result descriptor irrespective of
              whether the command succeeded or failed. When clear the SATL should only yield a sense buffer containing a ATA Result descriptor if the command failed.

       -e, --extend
              sets the EXTEND bit in the ATA PASS-THROUGH SCSI cdb. The default setting is clear (i.e. 0). When set a 48 bit LBA command is sent to the device. This option has no effect when --len=12.

       -h, --help
              outputs the usage message summarizing command line options then exits. Ignores DEVICE if given.

       -H, --hex
              outputs the ATA IDENTIFY (PACKET) DEVICE response in hex. The default action (i.e. without any '-H' options) is to output the response in hex, grouped in 16 bit words (i.e. the ATA standard's
              preference).   When  given  once, the response is output in ASCII hex bytes (i.e. the SCSI standard's preference). When given twice (i.e. '-HH') the output is in hex, grouped in 16 bit words,
              the same as the default but without a header. When given thrice (i.e. '-HHH') the output is in hex, grouped in 16 bit words, in a format that is acceptable for 'hdparm --Istdin' to process.

       -i, --ident
              outputs the World Wide Name (WWN) of the device. This should be a NAA-5 64 bit number. It is output in hex prefixed with "0x". If not available then "0x0000000000000000" is output. The equiv‐
              alent for a SCSI disk (i.e. its logical unit name) can be found with "sg_vpd -ii".

       -l, --len={16|12}
              this  is the length of the SCSI cdb used for the ATA PASS-THROUGH commands.  The argument can either be 16 or 12. The default is 16. The larger cdb size is needed for 48 bit LBA addressing of
              ATA devices. On the other hand some SCSI transports cannot convey SCSI commands longer than 12 bytes.

       -p, --packet
              send an ATA IDENTIFY PACKET DEVICE command (via the SATL). The default action is to send an ATA IDENTIFY DEVICE command.

       -r, --raw
              output the ATA IDENTIFY (PACKET) DEVICE response in binary. The output should be piped to a file or another utility when this option is used.  The binary is sent to  stdout,  and  errors  are
              sent to stderr.

       -v, --verbose
              increases the level or verbosity.

       -V, --version
              print out version string

NOTES
       Since the response to the IDENTIFY (PACKET) DEVICE command is very important for the correct use of an ATA(PI) device (and is typically the first command sent), a SATL should provide an ATA Informa‐
       tion VPD page which contains the similar information.

       The SCSI ATA PASS-THROUGH (12) command's opcode is 0xa1 and it clashes with the MMC set's BLANK command used by cd/dvd writers. So a SATL in front of an ATAPI device that uses MMC (i.e. has  periph‐
       eral device type 5) probably should treat opcode 0xa1 as a BLANK command and send it through to the cd/dvd drive. The ATA PASS-THROUGH (16) command's opcode (0x85) does not clash with anything so it
       is a better choice.

       In the 2.4 series of Linux kernels the DEVICE must be a SCSI generic (sg) device. In the 2.6 series block devices (e.g. disks and ATAPI DVDs) can also be specified.  For  example  "sg_inq  /dev/sda"
       will  work  in  the  2.6 series kernels. From lk 2.6.6 other SCSI "char" device names may be used as well (e.g. "/dev/st0m"). Prior to lk 2.6.29 USB mass storage limited sense data to 18 bytes which
       made the --ck_cond option yield strange (truncated) results.

EXIT STATUS
       The exit status of sg_sat_identify is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

AUTHOR
       Written by Douglas Gilbert

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2006-2013 Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_vpd(sg3_utils), sg_inq(sg3_utils), sdparm(sdparm), hdparm(hdparm)



sg3_utils-1.37                                                                                    June 2013                                                                                SG_SAT_IDENTIFY(8)
