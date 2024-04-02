SG_SENDDIAG(8)                                                                                    SG3_UTILS                                                                                    SG_SENDDIAG(8)



NAME
       sg_senddiag - performs a SCSI SEND DIAGNOSTIC command

SYNOPSIS
       sg_senddiag [--doff] [--extdur] [--help] [--hex] [--list] [--maxlen=LEN] [--page=PG] [--pf] [--raw=H,H...] [--raw=-] [--selftest=ST] [--test] [--timeout=SEC] [--uoff] [--verbose] [--version] DEVICE

       sg_senddiag [-doff] [-e] [-h] [-H] [-l] [-pf] [-raw=H,H...] [-raw=-] [-s=ST] [-t] [-T=SEC] [-uoff] [-v] [-V] [-?]  DEVICE

DESCRIPTION
       This utility sends a SCSI SEND DIAGNOSTIC command to the DEVICE. It can issue self-tests, find supported diagnostic pages or send arbitrary diagnostic pages.

       When the --list option and a DEVICE are given then the utility sends a SCSI RECEIVE DIAGNOSTIC RESULTS command to fetch the response (i.e.  the page numbers of supported diagnostic pages).

       When the --list option is given without a DEVICE then a list of diagnostic page names and their numbers, known by this utility, are listed.

       This  utility  supports two command line syntax-es, the preferred one is shown first in the synopsis and explained in this section. A later section on the old command line syntax outlines the second
       group of options.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -d, --doff
              set the Device Offline (DevOffL) bit (default is clear). Only significant when --test option is set for the default self-test. When set other operations on any logical units controlled by the
              this device server (target) may be affected (delayed) while a default self-test is underway.

       -e, --extdur
              outputs the expected extended self-test duration. The duration is given in seconds (and minutes in parentheses). This figure is obtained from mode page 0xa (i.e. the control mode page).

       -h, --help
              print usage message then exit.

       -H, --hex
              outputs response from RECEIVE DIAGNOSTIC RESULTS in hex rather than decode it.  Only the Supported Diagnostic Pages diagnostic page (i.e. page_code=0) is decoded; other pages (e.g. those used
              by SES) are output in hex.
              If --hex is used once, the hex output has a relative address at the start of each line. If --hex is used twice, then ASCII is shown to the right of each line of hex. If --hex  is  used  three
              time or more, only the hex is output, in two character pairs (i.e. a byte) space separated and up to 16 bytes per line. This latter form, if placed in a file or piped through to another invo-
              cation, is suitable for the --raw=- option.

       -l, --list
              when a DEVICE is also given lists the names of all diagnostic pages supported by this device. The request is sent via a SEND DIAGNOSTIC command (with the "pF" bit set)  and  the  response  is
              fetched by a RECEIVE DIAGNOSTIC RESULTS command. When used in the absence of a --list argument then a list of diagnostic page names and their numbers, known by this utility, are listed.

       -m, --maxlen=LEN
              where  LEN is the value placed in the parameter list length field of a SEND DIAGNOSTIC command or in the allocation length field of a RECEIVE DIAGNOSTIC RESULTS command. This only occurs when
              the other options imply there will be data sent or received by the command. The default value is 4096 bytes. LEN cannot exceed 65535 or 0xffff in hexadecimal.

       -O, --old
              switch to older style options.

       -P, --page=PG
              where PG is the RECEIVE DIAGNOSTIC RESULTS command page code field.  If this option is given the PCV bit in that command is set. When this option is given then no SEND DIAGNOSTIC  command  is
              sent  (unlike  --list).  If PG is 0 then the response is decoded as if it is the SPC Supported Diagnostic pages diagnostic page. Other PG values (i.e. 1 to 255) have their responses output in
              hex.

       -p, --pf
              set Page Format (PF) bit. By default it is clear (i.e. 0) unless the list --list option is given in which case the Page Format bit is set (as required by SPC-3).

       -r, --raw=H,H...
              string of comma separated hex numbers each of which should resolve to a byte value (i.e. 0 to ff inclusive). A (single) space separated string of hex bytes is also allowed but the list  needs
              to be in quotes. This sequence forms a diagnostic page to be sent with the SCSI SEND DIAGNOSTIC command. Mostly likely the --pf option should also be given.

       -r, --raw=-
              reads  sequence of bytes from stdin. The sequence may be comma, space, tab or linefeed (newline) separated. If a line contains "#" then the remaining characters on that line are ignored. Oth-
              erwise each non separator character should resolve to a byte value (i.e. 0 to ff inclusive). This sequence forms a diagnostic page to be sent with the SCSI  SEND  DIAGNOSTIC  command.  Mostly
              likely the --pf option should also be given.

       -s, --selftest=ST
              where ST is the self-test code. The default value is 0 which is inactive. Some other values:
                1 : background short self-test
                2 : background extended self-test
                4 : aborts a (background) self-test that is in progress
                5 : foreground short self-test
                6 : foreground extended self-test
              This option is mutually exclusive with default self-test (i.e.  can't have (ST > 0) and --test).

       -t, --test
              sets  the _default_ Self Test (SelfTest) bit. By default this is clear (0).  The --selftest=ST option should not be active together with this option. Both the --doff and/or --uoff options can
              be used with this option.

       -T, --timeout=SEC
              where SEC is a timeout value (in seconds) for foreground self-test operations. The default value is 7200 seconds (2 hours) and any values of SEC less than the default are ignored.

       -u, --uoff
              set the Unit Offline (UnitOffL) bit (default is clear). Only significant when --test option is set for the default self-test. When set other operations on this logical unit  may  be  affected
              (delayed) while a default self-test is underway. Some devices (e.g. Fujitsu disks) do more tests when this bit is set.

       -v, --verbose
              increase level of verbosity. Can be used multiple times.

       -V, --version
              print out version string then exit.

NOTES
       All devices should support the default self-test. The 'short' self-test codes should complete in 2 minutes or less. The 'extended' self-test codes' maximum duration is vendor specific (e.g. a little
       over 10 minutes with the author's disks). The foreground self-test codes wait until they are completed while the background self-test codes return immediately. The results  of  both  foreground  and
       background  self-test  codes  are  placed  in  the 'self-test results' log page (see sg_logs(8)). The SCSI command timeout for this utility is set to 60 minutes to allow for slow foreground extended
       self-tests.

       If the DEVICE is a disk then no file systems residing on that disk should be mounted during a foreground self-test. The reason is that other SCSI commands may become  queued  behind  the  foreground
       self-test and timeout.

       When  the  --raw=H,H...  option is given then self-tests should not be selected. However the --pf (i.e. "page format") option should be given. The length of the diagnostic page to be sent is derived
       from the number of bytes given to the --raw=H,H... option. The diagnostic page code (number) should be the first byte of the sequence (i.e. as dictated by SPC-3  diagnostic  page  format).  See  the
       EXAMPLES section below.

       Arbitrary diagnostic pages can be read (in hex) with the sg_ses(8) utility (not only those defined in SES-2).

       If  the  utility  is  used with no options (e.g. "sg_senddiag /dev/sg1") Then a degenerate SCSI SEND DIAGNOSTIC command is sent with zero in all its fields apart from the opcode. Some devices report
       this as an error while others ignore it. It is not entirely clear from SPC-3 if it is invalid to send such a command.

       In the 2.4 series of Linux kernels the DEVICE must be a SCSI generic (sg) device. In the 2.6 series block devices (e.g. SCSI disks and DVD drives) can also be specified.

       To access SCSI enclosures see the sg_ses(8) utility. sg_ses uses the SCSI SEND DIAGNOSTIC and RECEIVE DIAGNOSTIC RESULTS commands as outlined in the SES-2 (draft) standard.

EXIT STATUS
       The exit status of sg_senddiag is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

OLDER COMMAND LINE OPTIONS
       The options in this section were the only ones available prior to sg3_utils version 1.23 . In sg3_utils  version  1.23  and  later  these  older  options  can  be  selected  by  either  setting  the
       SG3_UTILS_OLD_OPTS environment variable or using '--old' (or '-O) as the first option.

       -doff  set the Device Offline (DevOffL) bit (default is clear). Only significant when -t option is set for the default self-test. Equivalent to --doff in the main description.

       -e     outputs the expected extended self-test duration. Equivalent to --extdur in the main description.

       -h     outputs response from RECEIVE DIAGNOSTIC RESULTS in hex rather than decode it.

       -H     outputs response from RECEIVE DIAGNOSTIC RESULTS in hex rather than decode it.

       -l     when  a  DEVICE  is  also given lists the names of all diagnostic pages supported by this device. The request is sent via a SEND DIAGNOSTIC command (with the "pf" bit set) and the response is
              fetched by a RECEIVE DIAGNOSTIC RESULTS command. When used in the absence of a DEVICE argument then a list of diagnostic page names and their numbers, known by this utility, are listed.

       -N     switch to the newer style options.

       -pf    set Page Format (PF) bit. By default it is clear (i.e. 0) unless the -l option is given in which case the Page Format bit is set (as required by SPC-3).

       -raw=H,H...
              string of comma separated hex numbers each of which should resolve to a byte value (i.e. 0 to ff inclusive). This sequence forms a diagnostic page to be sent with  the  SCSI  SEND  DIAGNOSTIC
              command. Mostly likely the -pf option should also be given.

       -raw=- reads  sequence of bytes from stdin. The sequence may be comma, space, tab or linefeed (newline) separated. If a line contains "#" then the remaining characters on that line are ignored. Oth-
              erwise each non separator character should resolve to a byte value (i.e. 0 to ff inclusive). This sequence forms a diagnostic page to be sent with the SCSI  SEND  DIAGNOSTIC  command.  Mostly
              likely the -pf option should also be given.

       -s=ST  where  ST is the self-test code. The default value is 0 which is inactive. A value of 1 selects a background short self-test; 2 selects a background extended self-test; 5 selects a foreground
              short self-test; 6 selects a foreground extended test. A value of 4 will abort a (background) self-test that is in progress. This option is mutually exclusive  with  default  self-test  (i.e.
              -t).

       -t     sets  the  _default_ Self Test (SelfTest) bit. By default this is clear (0).  The -s=ST option should not be active together with this option.  Both the -doff and/or -uoff options can be used
              with this option.

       -T=SEC where SEC is a timeout value (in seconds) for foreground self-test operations. See the --timeout=SEC option above.

       -uoff  set the Unit Offline (UnitOffL) bit (default is clear). Equivalent to --uoff in the main description.

       -v     increase level of verbosity. Can be used multiple times.

       -V     print out version string then exit.

       -?     output usage message. Ignore all other parameters.

EXAMPLES
       The examples sub-directory in the sg3_utils packages contains two example scripts that turn on the CJTPAT (jitter pattern) on some SAS disks (one script for each phy). One  possible  invocation  for
       phy 1 is:

         sg_senddiag --pf --raw=- /dev/sg2 < sdiag_sas_p1_cjtpat.txt

       There is also an example script that turns on the IDLE pattern. Once a test pattern has been started it can be turned off by resetting the phy or with the STOP phy pattern function:

         sg_senddiag --pf --raw=- /dev/sg2 < sdiag_sas_p1_stop.txt

AUTHOR
       Written by Douglas Gilbert

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2003-2016 Douglas Gilbert
       This software is distributed under the GPL version 2. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_ses(8), sg_logs(8), smartmontools(see net)



sg3_utils-1.43                                                                                  February 2016                                                                                  SG_SENDDIAG(8)
