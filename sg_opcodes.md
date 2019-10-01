SG_OPCODES(8)                                                                                     SG3_UTILS                                                                                     SG_OPCODES(8)



NAME
       sg_opcodes - report supported SCSI commands or task management functions

SYNOPSIS
       sg_opcodes [--alpha] [--help] [--hex] [--no-inquiry] [--opcode=OP] [--raw] [--rctd] [--repd] [--sa=SA] [--tmf] [--unsorted] [--verbose] [--version] DEVICE

       sg_opcodes [-a] [-n] [-o=OP] [-q] [-R] [-s=SA] [-t] [-u] [-v] [-V] [-?] DEVICE

DESCRIPTION
       This  utility  sends a SCSI REPORT SUPPORTED OPERATION CODES or a REPORT SUPPORTED TASK MANAGEMENT FUNCTIONS command to the DEVICE and then outputs the response. The default action is to report sup‐
       ported operation codes. In this mode it will either list all supported commands or give detailed information on a specific command identified by  the  --opcode=OP  option  (perhaps  with  additional
       information from the --sa=SA option).

       The  name of a SCSI command depends on its peripheral device type (e.g. a disk). The REPORT SUPPORTED OPERATION CODES and REPORT SUPPORTED TASK MANAGEMENT FUNCTIONS commands are not supported in the
       MMC command set for CD and DVD devices. This utility does an INQUIRY to obtain the peripheral device type and prints out the vendor, product and revision strings.

       A similar facility to query supported operation codes previously was available via the CmdDt bit in the SCSI INQUIRY command (see sg_inq(8)). However that facility was made obsolete and replaced  by
       the REPORT SUPPORTED OPERATION CODES command in SPC-3 (revision 4) during February 2002.

       This  utility  supports  two command line syntaxes, the preferred one is shown first in the synopsis and explained in this section. A later section on the old command line syntax outlines the second
       group of options.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -a, --alpha
              when all supported commands are being listed there is no requirement for the device server (i.e. the DEVICE) to sort the list of commands. When this option is given the list of supported com‐
              mands  is  sorted  by name (alphabetically). When this option and the --unsorted option are both _not_ given then the list of supported commands is sorted numerically (first by operation code
              and then by service action).

       -h, --help
              outputs the usage message summarizing command line options then exits. Ignores DEVICE if given.

       -H, --hex
              outputs the response in ASCII hexadecimal to stdout.

       -n, --no-inquiry
              Prior to calling a SCSI REPORT SUPPORTED OPERATION CODES or a REPORT SUPPORTED TASK MANAGEMENT FUNCTIONS command, a SCSI INQUIRY command is performed. The reason is to determine  the  periph‐
              eral device type (pdt) of the DEVICE as this is helpful in translating operation codes to the command names. By default this utility prints a summary of INQUIRY command response on stdout. If
              this option (or the --raw option) is given then that summary is not printed on stdout.

       -O, --old
              Switch to older style options. Please use as first option.

       -o, --opcode=OP
              the DEVICE will be queried for the given operation code ( i.e. the OP value) which is the first byte of a SCSI command. OP is decimal unless prefixed by "0x" or it  has  a  trailing  "h".  OP
              should be in the range 0 to 255 (0xff) inclusive. When this option is not given then all available SCSI commands supported by the DEVICE are listed.

       -r, --raw
              output the response in binary to stdout. Error messages and warnings, if any, are sent to stderr.

       -R, --rctd
              set  report command timeout descriptor (RCTD) bit in the cdb. The response may or may not contain command timeout descriptors. If available they are output. If supported there are two values:
              a nominal command timeout and a recommended command timeout. Both have units of seconds. A value of zero means that no timeout is indicated and this is shown in the corresponding decoded out‐
              put as "-".

       -q, --repd
              set  read  extended parameter data (REPD) bit in the report task management functions cdb. 16 bytes rather than the default 4 bytes expected in the response. This was added in SPC-4 (revision
              26).

       -s, --sa=SA
              the DEVICE will be queried for a command with the given service action (i.e. the SA value). Used in conjunction with the --opcode=OP option. If this option is not given, --opcode=OP is  given
              and the command in question does have a service action then a value of 0 will be assumed. SA is decimal and expected to be in the range 0 to 65535 (0xffff) inclusive.

       -t, --tmf
              list  supported task management functions. This is done with the SCSI REPORT SUPPORTED TASK MANAGEMENT FUNCTIONS command.  When this option is chosen the --alpha, --opcode=OP, --rctd, --sa=SA
              and --unsorted options are ignored.

       -u, --unsorted
              when all supported commands are being listed there is no requirement for the device server (i.e. the DEVICE) to sort the list of commands. When this option is given the list of supported com‐
              mands is in the order given by the DEVICE. When this option is not given the supported commands are sorted numerically (first by operation code and then by service action).

       -v, --verbose
              increase level of verbosity. Can be used multiple times.

       -V, --version
              print out version string then exit.

NOTES
       As  of SPC-4 revision 7a the recognized task management functions are: abort set, abort task set, clear ACA, clear task set, I_T nexus reset, logical unit reset, query task, target reset and wakeup.
       As of SPC-4 revision 26 target reset and wakeup have been made obsolete while query task set and query asynchronous event notification have been added.

       In the 2.4 series of Linux kernels the DEVICE must be a SCSI generic (sg) device. In the 2.6 series block devices (e.g. SCSI disks and DVD drives) can also  be  specified.  For  example  "sg_opcodes
       /dev/sda" will work in the 2.6 series kernels.

EXIT STATUS
       The exit status of sg_opcodes is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

OLDER COMMAND LINE OPTIONS
       The  options  in  this  section  were  the  only  ones  available  prior  to  sg3_utils  version  1.23 . In sg3_utils version 1.23 and later these older options can be selected by either setting the
       SG3_UTILS_OLD_OPTS environment variable or using '--old' (or '-O) as the first option.

       -a     sort command alphabetically. Equivalent to --alpha in main description.

       -n     don't print a summary of the SCSI INQUIRY response on stdout.

       -N, --new
              Switch to the newer style options.

       -o=OP  the DEVICE will be queried for the given operation code (i.e.  OP) which is the first byte of a SCSI command. OP is hexadecimal and expected to be in the range 0 to ff inclusive.   When  this
              option is not given then all available SCSI commands supported by the DEVICE are listed.

       -q     set the read extended parameter data (REPD) bit in report TMF cdb.  Equivalent to --repd in main description.

       -R     set the report command timeout descriptor (RCTD) bit in cdb. Equivalent to --rctd in main description.

       -s=SA  the  DEVICE  will  be  queried for a command with the given service action (i.e. SA). Used in conjunction with the -o=OP option. If this option is not given, -o=OP is given and the command in
              question does have a service action then a value of 0 will be assumed.  SA is hexadecimal and expected to be in the range 0 to ffff inclusive.

       -t     list supported task management functions. Equivalent to --tmf in the main description.

       -u     output all supported commands in the order given by DEVICE.  Equivalent to --unsorted in main description.

       -v     increase level of verbosity. Can be used multiple times.

       -V     print out version string then exit.

       -?     output usage message. Ignore all other parameters.

EXAMPLES
       The examples in this page use Linux device names. For suitable device names in other supported Operating Systems see the sg3_utils(8) man page.

       To see the information about a specific command give its operation code to the '--op=' option. A command line invocation is shown first followed by a typical response:

          # sg_opcodes --op=93h /dev/sdb

         Opcode=0x93
         Command_name: Write same(16)
         Command supported [conforming to SCSI standard]
         Usage data: 93 e2 00 00 00 00 ff ff ff ff 00 00 ff ff 00 00

       The next example shows the supported task management functions:

          # sg_opcodes --tmf -n /dev/sdb

       Task Management Functions supported by device:
           Abort task
           Abort task set
           Clear ACA
           Clear task set
           Logical unit reset
           Query task

AUTHOR
       Written by Douglas Gilbert

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2004-2012 Douglas Gilbert
       This software is distributed under the GPL version 2. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_inq(sg3_utils)



sg3_utils-1.35                                                                                  December 2012                                                                                   SG_OPCODES(8)
