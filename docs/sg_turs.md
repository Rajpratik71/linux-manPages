SG_TURS(8)                                                                                        SG3_UTILS                                                                                        SG_TURS(8)



NAME
       sg_turs - send one or more SCSI TEST UNIT READY commands

SYNOPSIS
       sg_turs [--help] [--number=NUM] [--num=NUM] [--progress] [--time] [--verbose] [--version] DEVICE

       sg_turs [-n=NUM] [-p]  [-t] [-v] [-V] DEVICE

DESCRIPTION
       This  utility  sends one or more SCSI TEST UNIT READY commands to the DEVICE. This may be useful for timing the per command overhead.  Note that TEST UNIT READY has no associated data, just a 6 byte
       command and a returned SCSI status value.

       This utility supports two command line syntaxes, the preferred one is shown first in the synopsis and explained in this section. A later section on the old command line syntax  outlines  the  second
       group of options.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -h, --help
              print out the usage message then exit.

       -n, --number=NUM
              performs  TEST  UNIT  READY  NUM  times.  If  not  given  defaults  to  1.  These suffix multipliers are permitted: c C *1; w W *2; b B *512; k K KiB *1,024; KB *1,000; m M MiB *1,048,576; MB
              *1,000,000; g G GiB *1,073,741,824; and GB *1,000,000,000 . Also a suffix of the form "x<n>" multiplies the leading number by <n>. Alternatively a hex number may be given, prefixed by  either
              '0x' or has a trailing 'h'.

       --num=NUM
              same as --number=NUM. Added for compatibility with sg_requests which has taken over the role of polling the progress indication.

       -O, --old
              switch to older style options.

       -p, --progress
              show progress indication (a percentage) if available. If --number=NUM is given, NUM is greater than 1 and an initial progress indication was detected then this utility waits 30 seconds before
              subsequent checks.  Exits when NUM is reached or there are no more progress indications.  Ignores --time option. See NOTES section below.

       -t, --time
              after completing the requested number of TEST UNIT READY commands, outputs the total duration and the average number of commands executed per second.

       -v, --verbose
              increase level or verbosity.

       -V, --version
              print version string then exit.

NOTES
       The progress indication is optionally part of the sense data. When a prior command that takes a long time to complete (and typically precludes other media access commands)  is  still  underway,  the
       progress indication can be used to determine how long before the device returns to its normal state. Around SPC-3 T10 changed the preferred command for polling the progress indication from TEST UNIT
       READY to REQUEST SENSE (see the sg_requests utilty).

       The SCSI FORMAT command for disks used with the IMMED bit set is an example of an operation that takes a significant amount of time and precludes other media access during that time. The  IMMED  bit
       set  instructs  the FORMAT command to return control to the application client once the format has commenced (see SBC-3). Several long duration SCSI commands associated with tape drives also use the
       progress indication (see SSC-3).

       The DEVICE is opened with a read-only flag (e.g. in Unix with the O_RDONLY flag).

       Early standards suggested that the SCSI TEST UNIT READY command be used for polling the progress indication. More recent standards seem to suggest the SCSI  REQUEST  SENSE  command  should  be  used
       instead.

EXIT STATUS
       The  exit  status  of  sg_turs is 0 when it is successful (e.g. in the case of a mechanical disk, it is spun up and ready to accept commands). For this utility the other exit status of interest is 2
       corresponding to the "not ready" sense key. For other exit status values see the sg3_utils(8) man page.

OLDER COMMAND LINE OPTIONS
       The options in this section were the only ones available prior to sg3_utils version 1.23 . In sg3_utils  version  1.23  and  later  these  older  options  can  be  selected  by  either  setting  the
       SG3_UTILS_OLD_OPTS environment variable or using '--old' (or '-O) as the first option.

       -n=NUM performs TEST UNIT READY NUM times. If not given defaults to 1.  Equivalent to --number=NUM in the main description.

       -N     switch to the newer style options.

       -p     show progress indication (a percentage) if available.  Equivalent to --progress in the main description.

       -t     after  completing  the  requested  number  of  TEST  UNIT  READY commands, outputs the total duration and the average number of commands executed per second.  Equivalent to --time in the main
              description.

       -v     increase level of verbosity.

       -V     print out version string then exit.

AUTHORS
       Written by D. Gilbert

COPYRIGHT
       Copyright © 2000-2016 Douglas Gilbert
       This software is distributed under the GPL version 2. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_inq, sg_requests (sg3_utils)



sg3_utils-1.43                                                                                  Fenruary 2016                                                                                      SG_TURS(8)
