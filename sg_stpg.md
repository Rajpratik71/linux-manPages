SG_STPG(8)                                                                                        SG3_UTILS                                                                                        SG_STPG(8)



NAME
       sg_stpg - send SCSI SET TARGET PORT GROUPS command

SYNOPSIS
       sg_stpg [--active] [--help] [--hex] [--offline] [--optimized] [--raw] [--standby] [--state=S,S...] [--tp=P,P...] [--unavailable] [--verbose] [--version] DEVICE

DESCRIPTION
       Send a SCSI SET TARGET PORT GROUPS command to DEVICE. This utility has different modes depending on whether the --tp= option is given.

       If  --tp=  is given then the SET TARGET PORT GROUPS command parameter block is built with a descriptor for each element in the list given to --tp=. The corresponding asymmetric access state value is
       either taken from the --state= list or, if that is not given, from one of the explicit state options (e.g. --unavailable), used repeatedly if required.

       If --tp= is not given then a sequence of SCSI commands are sent to the DEVICE leading up to the SET TARGET PORT GROUPS command. First an INQUIRY is sent to fetch the device identification  VPD  page
       to  find  the (primary) target port group associated with DEVICE. Then a REPORT TARGET PORT GROUPS command is issued to find the current state and whether a transition to the requested state is sup-
       ported. If so the SET TARGET PORT GROUPS command is sent.

       Target port group access is described in SPC-4 found at www.t10.org in sections 5.8 and 5.16 (in rev 36e dated 2012/8/24). The SET TARGET PORT GROUPS command is also described  in  section  6.45  of
       that document.

OPTIONS
       Arguments to long options are mandatory for short options as well.  The options are arranged in alphabetical order based on the long option name.

       -a, --active
              set active/non-optimized state.

       -h, --help
              output the usage message then exit.

       -H, --hex
              output response to the REPORT TARGET PORT GROUPS command in hex then exit.

       -O, -l, --offline
              set  offline  state.  This  is the appropriate state to set a target port to prior to removing the device.  Note that a relative target port identifier should be given with this state (rather
              than a target port group identifier that all other states take).

       -o, --optimized
              set active/optimized state. If no other state options or --tp= option are given then active/optimized is the default state.

       -r, --raw
              output response to the REPORT TARGET PORT GROUPS command in binary to stdout then exit.

       -s, --standby
              set standby state. Port group shall accept those commands listed for "unavailable" state plus LOG SELECT/SENSE, MODE SELECT/SENSE, RECEIVE  DIAGNOSTIC  RESULTS,  SEND  DIAGNOSTIC,  PERSISTENT
              RESERVE IN/OUT commands.

       -S, --state=S,S...
              specifies  a comma separated list (one element of more) of states. Either a number or an abbreviation can be given. A number is assumed to be a decimal number unless it is prefixed by "0x" or
              has a trailing "h" in which case a hexadecimal value is assumed. Only the values 0, 1, 2, 3 or 14 are accepted. The accepted abbreviations are "an", "ao", "o", "s"  or  "u";  which  represent
              active/non-optimized(1), active/optimized(0), offline(14), standby(2) or unavailable(3) respectively.

       -t, --tp=P,P...
              specifies a comma separated list (one element of more). Each elements is either a target port group identifier (when the corresponding state is other than "offline") or a relative target port
              identifier (when the corresponding state is "offline"). Each element is assumed to be a decimal number unless it is prefixed by "0x" or has a trailing "h" in which case a hexadecimal value is
              assumed.

       -u, --unavailable
              set unavailable state. Port group shall only accept INQUIRY, REPORT LUNS, REPORT/SET TARGET PORT GROUPS, REQUEST SENSE and READ/WRITE BUFFER commands.

       -v, --verbose
              increase the level of verbosity, (i.e. debug output).

       -V, --version
              print the version string and then exit.

NOTES
       The SET TARGET PORT GROUPS command should be supported whenever the TPGS value in a standard INQUIRY response is 2 or 3. [View with sg_inq utility.]

       Notice  that  the  offline state is termed as a "secondary target port asymmetric access state" and takes a relative target port identifier (i.e.  acts on a single target port). All the other states
       are termed as "primary target port asymmetric access states" and each takes a target port group identifier (i.e. acts on one or more target ports).

       When --tp= is given then the same number of elements should be given to the --state= option. If more than one list element is given to --tp= and an equal number of elements is  _not_  given  to  the
       --state= option, then if only one state is specified then it is repeated.

EXIT STATUS
       The exit status of sg_stpg is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

AUTHORS
       Written by Douglas Gilbert.

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2007-2014 Hannes Reinecke, Christophe Varoqui and Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_inq, sg_rtpg (sg3_utils)



sg3_utils-1.38                                                                                   January 2014                                                                                      SG_STPG(8)
