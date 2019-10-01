SG_COPY_RESULTS(8)                                                                                SG3_UTILS                                                                                SG_COPY_RESULTS(8)



NAME
       sg_copy_results - send SCSI RECEIVE COPY RESULTS command (XCOPY related)

SYNOPSIS
       sg_copy_results [--failed|--params|--receive|--status] [--help] [--hex] [--list_id=ID] [--verbose] [--version] [--xfer_len=BTL] DEVICE

DESCRIPTION
       This  utility  is  designed  to query the status of the SCSI Extended Copy (XCOPY) facility (see SPC-3 revision 23 sections 6.3 and 6.17), present in some modern storage arrays. This utility sends a
       SCSI RECEIVE COPY RESULTS command to the given DEVICE and displays the response.

       During the draft stages of SPC-4 the T10 committee has expanded the XCOPY command so that it now has two variants: "LID1" (for a List Identifier length of 1 byte) and "LID4" (for a  List  Identifier
       length  of  4  bytes).   This  utility  supports  the older, LID1 variant which is also found in SPC-3 and earlier. While the LID1 variant in SPC-4 is command level (binary) compatible with XCOPY as
       defined in SPC-3, some of the command naming has changed. This utility uses the older, SPC-3 XCOPY names.

       The command has four distinct modes of operation, distinguished by the service action field:

       COPY STATUS
              Displays the current status of the EXTENDED COPY command identified by the list id field.

       RECEIVE DATA
              Return the held data read by the EXTENDED COPY command identified by the list id field. This option is only meaningful if the respective segment descriptor are supported.

       OPERATING PARAMETERS
              Return copy manager operating parameters. This option is also useful to determine if the SCSI Extended Copy facility is supported.

       FAILED SEGMENT DETAILS
              Return copy target device sense data and other information about any failed segments.


OPTIONS
       Arguments to long options are mandatory for short options as well.

       -f, --failed
              sets the service action field to FAILED SEGMENT DETAILS [4].

       -h, --help
              output the usage message then exit.

       -H, --hex
              prints out the response buffer in hex.

       -l, --list_id=ID
              sets the list identifier field to ID (default: 0).

       -p, --params
              sets the service action field to OPERATING PARAMETERS [3].  This is the default.

       -r, --receive
              sets the service action field to RECEIVE DATA [1].

       -s, --status
              sets the service action field to COPY STATUS [0].

       -v, --verbose
              increase the level of verbosity, (i.e. debug output).

       -V, --version
              print the version string and then exit.

       -x, --xfer_len=BTL
              sets the allocation length field to BTL. It is the byte transfer length and is the maximum (byte) size of the response. BTL must be less than 10000 and defaults to 520.

NOTES
       Decoding of RECEIVE DATA service action is not implemented.

EXAMPLES
       Query the operating parameters for a device:

       # sg_copy_results -p /dev/sdo
       Receive copy results (report operating parameters):
           Supports no list identifier: no
           Maximum target descriptor count: 2
           Maximum segment descriptor count: 1
           Maximum descriptor list length: 92 bytes
           Maximum segment length: 33553920 bytes
           Inline data not supported
           Held data limit: 0 bytes
           Maximum stream device transfer size: 0 bytes
           Total concurrent copies: 0
           Maximum concurrent copies: 255
           Data segment granularity: 512 bytes
           Inline data granularity: 1 bytes
           Held data granularity: 1 bytes
           Implemented descriptor list:
               Segment descriptor 0x02: Copy from block device to block device
               Target descriptor 0xe4: Identification descriptor


EXIT STATUS
       The exit status of sg_copy_results is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

AUTHORS
       Written by Douglas Gilbert.

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2012-2013 Hannes Reinecke and Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_xcopy(sg3_utils)



sg3_utils-1.37                                                                                    June 2012                                                                                SG_COPY_RESULTS(8)
