SG_REQUESTS(8)                                                                                    SG3_UTILS                                                                                    SG_REQUESTS(8)



NAME
       sg_requests - send one or more SCSI REQUEST SENSE commands

SYNOPSIS
       sg_requests [--desc] [--help] [--hex] [--maxlen=LEN] [--num=NUM] [--number=NUM] [--progress] [--raw] [--status] [--time] [--verbose] [--version] DEVICE

DESCRIPTION
       Send SCSI REQUEST SENSE command to DEVICE and output the parameter data response which is expected to be in sense data format. Both fixed and descriptor sense data formats are supported.

       Multiple REQUEST SENSE commands can be sent with the --num=NUM option. This can be used for timing purposes or monitoring the progress indication.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -d, --desc
              sets  the DESC bit in the REQUEST SENSE SCSI cdb. The DEVICE should return sense data in descriptor (rather than fixed) format. This will only occur if the DEVICE recognizes descriptor format
              (SPC-3 and later). If the device is pre SPC-3 then setting a bit in a reserved field may cause a check condition status with an illegal request sense key, but will most likely be ignored.

       -h, --help
              output the usage message then exit.

       -H, --hex
              output response in ASCII hexadecimal.

       -m, --maxlen=LEN
              where LEN is the (maximum) response length in bytes. It is placed in the cdb's "allocation length" field. If not given (or LEN is zero) then 252 is used. The maximum value of LEN is 255  (but
              SPC-4 recommends 252).

       -n, --num=NUM
              perform NUM SCSI REQUEST SENSE commands, stopping when either NUM is reached or an error occurs. The default value for NUM is 1 .

       --number=NUM
              same action as --num=NUM. Added for compatibility with sg_turs.

       -p, --progress
              show progress indication (a percentage) if available. If --number=NUM is given, NUM is greater than 1 and an initial progress indication was detected then this utility waits 30 seconds before
              subsequent checks.  Exits when NUM is reached or there are no more progress indications.  Ignores --hex, --raw and --time options. See NOTES section below.

       -r, --raw
              output response in binary (to stdout).

       -s, --status
              if the REQUEST SENSE command finished without error (as indicated by its SCSI status) then the contents of the parameter data are analysed as sense data and the exit  status  is  set  accord-
              ingly.  The  default  action (i.e. when this option is not given) is to ignore the contents of the parameter data for the purposes of setting the exit status.  Some types of error set a sense
              key of "NO SENSE" with non-zero information in the additional sense code (e.g. the FAILURE PREDICTION THRESHOLD EXCEEDED group of codes); this results in an exit status value of  10.  If  the
              sense key is "NO SENSE" and both asc and ascq are zero then the exit status is set to 0 . See the sg3_utils(8) man page for exit status values.

       -t, --time
              time the SCSI REQUEST SENSE command(s) and calculate the average number of operations per second.

       -v, --verbose
              increase the level of verbosity, (i.e. debug output).  Additionally the response (if received) is output in ASCII-HEX. Use this option multiple times for greater verbosity.

       -V, --version
              print the version string and then exit.

NOTES
       In SCSI 1 and 2 the REQUEST SENSE command was very important for error and warning processing in SCSI. The autosense capability rendered this command almost superfluous.

       However recent SCSI drafts (e.g. SPC-4 rev 14 and SBC-3 rev 14) increase the utility of the REQUEST SENSE command. Idle and standby (low) power conditions can be detected with this command.

       The  REQUEST  SENSE  command  is  not  marked  as  mandatory  in  SPC-3  (i.e.  for all SCSI devices) but is marked as mandatory in SBC-2 (i.e. for disks), SSC-3 (i.e. for tapes) and MMC-4 (i.e. for
       CD/DVD/HD-DVD/BD drives).

       The progress indication is optionally part of the sense data. When a prior command that takes a long time to complete (and typically precludes other media access commands)  is  still  underway,  the
       progress indication can be used to determine how long before the device returns to its normal state.

       The  SCSI  FORMAT command for disks used with the IMMED bit set is an example of an operation that takes a significant amount of time and precludes other media access during that time. The IMMED bit
       set instructs the FORMAT command to return control to the application client once the format has commenced (see SBC-3). Several long duration SCSI commands associated with tape drives also  use  the
       progress indication (see SSC-3).

       Early  standards  suggested that the SCSI TEST UNIT READY command be used for polling the progress indication (see the sg_turs utility). Since SPC-3 the standards suggest that the SCSI REQUEST SENSE
       command should be used instead.

       The DEVICE is opened with a read-only flag (e.g. in Unix with the O_RDONLY flag).

EXIT STATUS
       The exit status of sg_requests is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

AUTHORS
       Written by Douglas Gilbert.

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2004-2016 Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_turs (sg3_utils)



sg3_utils-1.43                                                                                  February 2016                                                                                  SG_REQUESTS(8)
