SG_SAT_SET_FEATURES(8)                                                                            SG3_UTILS                                                                            SG_SAT_SET_FEATURES(8)



NAME
       sg_sat_set_features - use ATA SET FEATURES command via a SCSI to ATA Translation (SAT) layer

SYNOPSIS
       sg_sat_set_features [--count=CO] [--ck_cond] [--feature=FEA] [--help] [--lba=LBA] [--len={16|12}] [--verbose] [--version] DEVICE

DESCRIPTION
       This  utility  sends  an ATA SET FEATURES command to the DEVICE.  This command is used to change settings of ATA non-packet (i.e. disks) and packet devices (e.g. cd/dvd drives). Rather than send the
       SET FEATURES command directly to the device it is sent via a SCSI transport which is assumed to contain a SCSI to ATA Translation (SAT) Layer (SATL). The SATL may be in an operating  system  driver,
       in host bus adapter firmware or in some external enclosure.

       The  SAT  standard  (SAT ANSI INCITS 431-2007, prior draft: sat-r09.pdf at www.t10.org) defines two SCSI "ATA PASS-THROUGH" commands: one using a 16 byte "cdb" and the other with a 12 byte cdb. This
       utility defaults to using the 16 byte cdb variant. SAT-2 is also a standard: SAT-2 ANSI INCITS 465-2010 and the draft prior to that is sat2r09.pdf . The SAT-3 project has started and the most recent
       draft is sat3r01.pdf .

       The features can be read using the sg_sat_identify utility which uses either the ATA IDENTIFY DEVICE (for non-packet devices) or the IDENTIFY PACKET DEVICE (for packet devices) command.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -c, --count=CO
              the  number  CO  is  placed in the "count" field in the ATA SET FEATURES command. Only some subcommands (a term used for the value placed in the "feature" field) require the count field to be
              set.  The default value placed in the "count" field is 0.

       -C, --ck_cond
              sets the CK_COND bit in the ATA PASS-THROUGH SCSI cdb. The default setting is clear (i.e. 0). When set the SATL should yield a sense buffer containing a ATA Result descriptor irrespective  of
              whether the ATA command succeeded or failed. When clear the SATL should only yield a sense buffer containing a ATA Result descriptor if the ATA command failed.

       -f, --feature=FEA
              the  value  FEA  is placed in the "feature" field in the ATA SET FEATURES command. The term "subcommand" is sometimes used for this value. The default value placed in the "feature" field is 0
              which is reserved and hence should not change anything. Two common examples are 2h to enable the write cache and 82h to disable it.

       -h, --help
              outputs the usage message summarizing command line options then exits. Ignores DEVICE if given.

       -L, --lba=LBA
              the number LBA is placed in the "lba" field of the ATA SET FEATURES command. Only some sub-commands (a term used for the value placed in the "feature" field) require the lba field to be  set.
              This  value  is  typically  not  a  "logical  block address" as the acronym might imply.  The default value placed in the "lba" field is 0. The maximum value allowed for LBA is 0xfffffffe (or
              0xffffff if --len=12).

       -l, --len={16|12}
              this is the length of the SCSI cdb used for the ATA PASS-THROUGH commands.  The argument can either be 16 or 12. The default is 16. Some SCSI transports cannot  convey  SCSI  commands  longer
              than 12 bytes.

       -v, --verbose
              increases the level or verbosity.

       -V, --version
              print out version string

NOTES
       In  the  2.4  series  of  Linux  kernels  the  DEVICE must be a SCSI generic (sg) device. In the 2.6 and 3 series block devices (e.g. disks and ATAPI DVDs) can also be specified. For example "sg_inq
       /dev/sda" will work in the 2.6 series kernels. From lk 2.6.6 other SCSI "char" device names may be used as well (e.g. "/dev/st0m"). Prior to lk 2.6.29 USB mass storage limited sense data to 18 bytes
       which made the --ck_cond option yield strange (truncated) results.

EXIT STATUS
       The exit status of sg_sat_set_features is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

AUTHOR
       Written by Douglas Gilbert

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2007-2013 Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_sat_identify(sg3_utils), sg_inq(sg3_utils), sdparm(sdparm), hdparm(hdparm)



sg3_utils-1.37                                                                                    June 2013                                                                            SG_SAT_SET_FEATURES(8)
