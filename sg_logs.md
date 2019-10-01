SG_LOGS(8)                                                                                        SG3_UTILS                                                                                        SG_LOGS(8)



NAME
       sg_logs - access log pages with SCSI LOG SENSE command

SYNOPSIS
       sg_logs  [--all]  [--brief]  [--control=PC]  [--help]  [--hex]  [--list]  [--maxlen=LEN]  [--name] [--page=PG[,SPG]] [--paramp=PP] [--pcb] [--ppc] [--raw] [--reset] [--select] [--sp] [--temperature]
       [--transport] [--verbose] [--version] DEVICE

       sg_logs [-a] [-A] [-b] [-c=PC] [-h] [-H] [-l] [-L] [-m=LEN] [-n] [-p=PG[,SPG]] [-paramp=PP] [-pcb] [-ppc] [-r] [-select] [-sp] [-t] [-T] [-v] [-V] [-?]  DEVICE

DESCRIPTION
       This utility sends a SCSI LOG SENSE command to the DEVICE and then outputs the response. The LOG SENSE command is used to fetch log pages. Known log pages are decoded by default.  When  the  --reset
       and/or --select option is given then a SCSI LOG SELECT command is issued to reset parameters (e.g. counters).

       In  SPC-4  revision  5 a subpage code was introduced to both the LOG SENSE and LOG SELECT command. At the same time a page code field was introduced to the to the LOG SELECT command. The log subpage
       code can range from 0 to 255 (0xff) inclusive. The subpage code value 255 can be thought of as a wildcard.

       This utility supports two command line syntaxes, the preferred one is shown first in the synopsis and explained in this section. A later section on the old command line syntax  outlines  the  second
       group of options.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -a, --all
              outputs all the log pages supported by the device. This requires a two stage process: first the "supported log pages" log page is fetched, then for each entry in the response, the correspond‐
              ing log page is fetched and displayed.  When used twice (e.g. '-aa') all log pages and subpages are fetched.

       -b, --brief
              shorten the amount of output for some log pages. For example the Tape Alert log page only outputs parameters whose flags are set when --brief is given.

       -c, --control=PC
              accepts 0, 1, 2 or 3 for the PC argument:
                0 : current threshold values
                1 : current cumulative values
                2 : default threshold values
                3 : default cumulative values
              The default value is 1 (i.e. current cumulative values).

       -h, --help
              print out the usage message then exit.

       -H, --hex
              The default action is to decode known mode page numbers (and subpage numbers) into text. When this option is used once, the response is output in hexadecimal.

       -l, --list
              lists the names of all logs sense pages supported by this device. This is done by reading the "supported log pages" log page. When used twice (e.g. '-ll') lists the names of  all  logs  sense
              pages and subpages supported by this device. There is a list of common log page codes below.

       -m, --maxlen=LEN
              sets the "allocation length" field in the LOG SENSE cdb. The is the maximum length in bytes that the response will be. Without this option (or LEN equal to 0) this utility first fetches the 4
              byte response then does a second access with the length indicated in the first (4 byte) response. Negative values and 1 for LEN are not accepted. LEN cannot exceed 65535 (0xffff).   Responses
              can be quite large (e.g. the background scan results log page) and this option can be used to limit the amount of information returned.

       -n, --name
              decode  some  log  pages  into  'name=value' entries, one per line. The name contains no space and may be abbreviated and the value is decimal unless prefixed by '0x'. Nesting is indicated by
              leading spaces. This form is meant to be relatively easy to parse.

       -O, --old
              Switch to older style options. Please use as first option.

       -p, --page=PG[,SPG]
              log page code to access. PG is expected to be a decimal number between 0 and 63 inclusive. A hexadecimal number can be specified by a leading "0x" or a trailing "h". Common log page codes are
              listed below. Optionally SPG, a subpage code, can be given. SPG is expected to be a decimal number between 0 and 255 inclusive.

       -P, --paramp=PP
              PP  is  the  parameter pointer value to place in a field of that name in the LOG SENSE cdb. A decimal number in the range 0 to 65535 (0xffff) is expected. When a value greater than 0 is given
              the --ppc option should be selected. The default value is 0.

       -q, --pcb
              show Parameter Control Byte settings (only relevant when log parameters being output in ASCII).

       -Q, --ppc
              sets the Parameter Pointer Control (PPC) bit in the LOG SENSE cdb. Default is 0 (i.e. cleared).

       -r, --raw
              output the response in binary to stdout. Error messages and warnings are output to stderr.

       -R, --reset
              use SCSI LOG SELECT command (PCR bit set) to reset the all log pages (or the given page). [SPC-4 (rev 6) doesn't say that a given log (sub)page can  be  reset  yet.]  Exactly  what  is  reset
              depends  on  the accompanying SP bit (i.e. --sp option which defaults to 0) and the PC ("page control") value (which defaults to 1). Supplying this option implies the --select option as well.
              This option seems to clear error counter log pages but leaves pages like self-test results, start-stop cycle counter and temperature log pages unaffected. This option may be required to clear
              log pages if a counter reaches its maximum value since the log page in which the counter is found will remain "stuck" until something is done.

       -S, --select
              use  a  LOG SELECT command. The default action (i.e. when neither this option nor --reset is given) is to do a LOG SENSE command. When this option is given, the SP bit (i.e. --sp option which
              defaults to 0), the PC ("page control") value (which defaults to 1) and the PCR bit (i.e.  --reset option which defaults to 0) are placed in the LOG SELECT cdb. At some stage the log page and
              subpage options may also be active [but SPC-4 (rev 6) doesn't say that].

       -s, --sp
              sets  the Saving Parameters (SP) bit. Default is 0 (i.e. cleared). When set this instructs the device to store the current log page parameters (as indicated by the DS and TSD parameter codes)
              in some non-volatile location.  Hence the log parameters will be preserved across power cycles. This option is typically not needed, especially if the GLTSD flag is clear in the control  mode
              page as this instructs the device to periodically save all saveable log parameters to non-volatile locations.

       -t, --temperature
              outputs  the  temperature.  First looks in the temperature log page and if that is not available tries the Informational Exceptions log page which may also have the current temperature (espe‐
              cially on older disks).

       -T, --transport
              outputs the transport ('Protocol specific port') log page. Equivalent to setting '--page=18h'.

       -v, --verbose
              increase level of verbosity.

       -V, --version
              print out version string then exit.

NOTES
       This utility will usually do a double fetch of log pages with the SCSI LOG SENSE command. The first fetch requests a 4 byte response (i.e. place 4 in the "allocation length" field in the cdb).  From
       that response it can calculate the actual length of the response which is what it asks for on the second fetch. This is typical practice in SCSI and guaranteed to work in the standards. However some
       older devices don't comply. For those devices using the --maxlen=LEN option will do a single fetch.  A value of 252 should be a safe starting point.

       Various log pages hold information error rates, device temperature, start stop cycles since device produced and the results of the last 20 self tests. Self tests can be  initiated  by  the  sg_send‐
       diag(8) utility.  The smartmontools package provides much of the information found with sg_logs in a form suitable for monitoring the health of SCSI disks and tape drives.

       Here is a list of log pages that are decoded by this utility. [The code values can be given to '--page=' as is, with a trailing "h" instead of the leading "0x", or as their decimal equivalents.]:

       0x0       Supported log pages
       0x0,0xff  Supported log pages and subpages
       0x1       Buffer overrun/underrun
       0x2       Write error counter
       0x3       Read error counter
       0x4       Read reverse error counter
       0x5       Verify error counter
       0x6       Non-medium error
       0x7       Last n error events
       0x8       Format status (sbc-2)
       0xb       Last n deferred errors or asynchronous events
       0xc       Logical block provisioning (sbc-3) or Sequential access device (ssc-2)
       0xd       Temperature
       0xe       Start-stop cycle counter
       0x10      Self-test results
       0x11      Solid state media
       0x15      Background scan results (sbc-3)
       0x16      ATA pass-through results (sat-3)
       0x17      Non-volatile cache (sbc-3)
       0x18      Protocol specific port (SAS transport)
       0x19      General statistics and performance
       0x1a      Power condition transitions
       0x2f      Informational exceptions
       0x37      Seagate cache (vendor, disk)
       0x3e      Seagate factory (vendor, disk)

       In  the  2.4  series  of  Linux kernels the DEVICE must be a SCSI generic (sg) device. In the 2.6 series block devices (e.g. SCSI disks and DVD drives) can also be specified. For example "sg_logs -a
       /dev/sda" will work in the 2.6 series kernels.

EXIT STATUS
       The exit status of sg_logs is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

OLDER COMMAND LINE OPTIONS
       The options in this section were the only ones available prior to sg3_utils version 1.23 . In sg3_utils  version  1.23  and  later  these  older  options  can  be  selected  by  either  setting  the
       SG3_UTILS_OLD_OPTS environment variable or using '--old' (or '-O) as the first option.

       Options with arguments or with two or more letters can have an extra '-' prepended. For example: both '-pcb' and '--pcb' are acceptable.

       -a     outputs all the log pages supported by the device.  Equivalent to --all in the main description.

       -A     outputs all the log pages and subpages supported by the device.  Equivalent to '--all --all' in the main description.

       -c=PC  Equivalent to --control=PC in the main description.

       -h     suppresses decoding of known log sense pages and prints out the response in hex instead.

       -H     same action as '-h' in this section and equivalent to --hex in the main description.

       -l     lists the names of all logs sense pages supported by this device.  Equivalent to --list in the main description.

       -L     lists the names of all logs sense pages and subpages supported by this device. Equivalent to '--list --list' in the main description.

       -m=LEN request  only  LEN bytes of response data. Default is 0 which is interpreted as all that is available. LEN is decimal unless it has a leading '0x' or trailing 'h'.  Equivalent to --maxlen=LEN
              in the main description.

       -n     Equivalent to --name in the main description.

       -N, --new
              Switch to the newer style options. Enabeld by default.

       -p=PG[,SPG]
              PG is the log page code to access. Should be a hexadecimal number between 0 and 3f inclusive. If given SPG is the log subpage code.  SPG should be a hexadecimal number between 0 and ff inclu‐
              sive. The subpage code of 'ff' can be thought of as a wildcard.

       -paramp=PP
              PP is the parameter pointer value (in hex) to place in command.  Should be a number between 0 and ffff inclusive.

       -pcb   show Parameter Control Byte settings (only relevant when log parameters being output in ASCII).

       -ppc   sets the Parameter Pointer Control (PPC) bit. Default is 0 (i.e. cleared).

       -r     use SCSI LOG SELECT command (PCR bit set) to reset the all log pages (or the given page). Equivalent to --reset in the main description.

       -select
              use a LOG SELECT command. Equivalent to --select in the main description.

       -sp    sets the Saving Parameters (SP) bit. Default is 0 (i.e. cleared).  Equivalent to --sp in the main description.

       -t     outputs the temperature. Equivalent to --temperature in the main description.

       -T     outputs the transport ('Protocol specific port') log page. Equivalent to --transport in the main description.

       -v     increase level of verbosity.

       -V     print out version string then exit.

       -?     output usage message then exit.

AUTHOR
       Written by Douglas Gilbert

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2002-2013 Douglas Gilbert
       This software is distributed under the GPL version 2. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       smartctl(smartmontools), sg_senddiag(8)



sg3_utils-1.37                                                                                    July 2013                                                                                        SG_LOGS(8)
