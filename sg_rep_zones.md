SG_REP_ZONES(8)                                                                                   SG3_UTILS                                                                                   SG_REP_ZONES(8)



NAME
       sg_rep_zones - send SCSI REPORT ZONES command

SYNOPSIS
       sg_rep_zones [--help] [--hex] [--maxlen=LEN] [--raw] [--readonly] [--report=OPT] [--start=LBA] [--verbose] [--version] DEVICE

DESCRIPTION
       Sends a SCSI REPORT ZONES command to DEVICE and outputs the data returned. This command is found in the ZBC draft standard, revision 4c (zbc-r04c.pdf).

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -h, --help
              output the usage message then exit.

       -H, --hex
              output  the  response in hexadecimal to stdout. When used once the whole response is output in ASCII hexadecimal with a leading address (starting at 0) on each line. When used twice each zone
              descriptor in the response is output separately in hexadecimal. When used thrice the whole response is output in hexadecimal with no leading address (on each line).

       -m, --maxlen=LEN
              where LEN is the (maximum) response length in bytes. It is placed in the cdb's "allocation length" field. If not given (or LEN is zero) then 8192 is used. The maximum allowed value of LEN  is
              1048576.

       -p, --partial
              set the PARTIAL bit in the cdb.

       -r, --raw
              output the SCSI response (i.e. the data-out buffer) in binary (to stdout).

       -R, --readonly
              open the DEVICE read-only (e.g. in Unix with the O_RDONLY flag).  The default is to open it read-write.

       -o, --report=OPT
              where OPT will become the contents of the REPORTING OPTION field in the cdb. The default value is 0 which means report a list of all zones.  Some other values are 1 for list zones with a zone
              condition of empty; 2 for list zones with a zone condition of implicitly opened; 3 for list zones with a zone condition of explicitly opened; 4 for list zones with a zone condition of closed;
              5  for  list  zones with a zone condition of full; 6 for list zones with a zone condition of read only; 7 for list zones with a zone condition of offline. Other values are 0x10 for list zones
              with RWP recommended set to true; 0x11 for list zones with non-sequential write resource active set to true and 0x3f for list zones with a zone condition of not write pointer.

       -s, --start=LBA
              where LBA is at the start or within the first zone to be reported. The default value is 0. If LBA is not a zone start LBA then the preceding zone start LBA is used for reporting.  Assumed  to
              be in decimal unless prefixed with '0x' or has a trailing 'h' which indicate hexadecimal.

       -v, --verbose
              increase the level of verbosity, (i.e. debug output).

       -V, --version
              print the version string and then exit.

EXIT STATUS
       The exit status of sg_rep_zones is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

AUTHORS
       Written by Douglas Gilbert.

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2014-2016 Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_reset_wp,sg_zone(sg3_utils)



sg3_utils-1.42                                                                                  February 2016                                                                                 SG_REP_ZONES(8)
