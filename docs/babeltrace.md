BABELTRACE(1)                                                                                                                        BABELTRACE(1)

NAME
       babeltrace — Babeltrace Trace Viewer and Converter

SYNOPSIS
       babeltrace [OPTIONS] FILE...

DESCRIPTION
       Babeltrace  is  a  trace viewer and converter reading and writing the Common Trace Format (CTF). Its main use is to pretty-print CTF traces
       into a human-readable text output ordered by time.

       This program follow the usual GNU command line syntax with long options starting with two dashes. Below  is  a  summary  of  the  available
       options.

       FILE   Input trace FILE(s) or directory(ies)

       -w, --output OUTPUT
              Output trace path (default: stdout)

       -i, --input-format FORMAT
              Input trace format (default: ctf). CTF is currently the only supported input format.

       -o, --output-format FORMAT
              Output trace format (default: text)

       -h, --help
              This help message

       -l, --list
              List available formats

       -v, --verbose
              Verbose mode (or set BABELTRACE_VERBOSE environment variable)

       -d, --debug
              Debug mode (or set BABELTRACE_DEBUG environment variable)

       --no-delta
              Do not print time delta between consecutive events

       -n, --names name1<,name2,...>
              Print field names: (payload OR args OR arg), none, all, scope, header, (context OR ctx), (default: payload,context).

       -f, --fields name1<,name2,...>
              Print additional fields: all, trace, trace:hostname, trace:domain, trace:procname, trace:vpid, loglevel.

       --clock-cycles
              Disregard internal clock offset (use raw value)

       --clock-offset seconds
              Clock offset in seconds

       --clock-seconds
              Print the timestamps as [sec.ns] (default is: [hh:mm:ss.ns])

       --clock-date
              Print clock date

       --clock-gmt
              Print clock in GMT time zone (default: local time zone)

       --stream-intersection
              Only print events when all streams are active

       --debug-info-dir
              Directory in which to look for debugging information files (default: /usr/lib/debug/)

       --debug-info-target-prefix
              Directory to use as a prefix for executable lookup

       --debug-info-full-path
              Show full debug info source and binary paths (if available)

       Formats available: ctf, dummy, text.

ENVIRONMENT VARIABLES
       Note that all command line options will override environmenal variables.

       BABELTRACE_VERBOSE
              Activate verbose Babeltrace output.

       BABELTRACE_DEBUG
              Activate debug Babeltrace output.

SEE ALSO
       babeltrace-log(1), lttng(1), lttng-ust(3), lttng-sessiond(8)

BUGS
       The lttng-live plugin does not honor the the "--output" command line option.

       If  you  encounter  any  issues or usability problem, please report it on our mailing list <lttng-dev@lists.lttng.org> to help improve this
       project.

CREDITS
       Babeltrace and the babeltrace library are distributed under the MIT license. See the files LICENSE and mit-license.txt for details.

       A Web site is available at http://www.efficios.com/babeltrace for  more  information  on  Babeltrace  and  the  Common  Trace  Format.  See
       http://lttng.org for more information on the LTTng project.

       Mailing list for support and development: <lttng-dev@lists.lttng.org>.

       You can find us on IRC server irc.oftc.net (OFTC) in #lttng.

THANKS
       Thanks  to the Linux Foundation and Ericsson for funding part of this work. Thanks to the Multicore Association Tool Infrastructure Working
       Group for their active role in the creation of the Common Trace Format.

AUTHORS
       Babeltrace was originally written by Mathieu Desnoyers, with additional contributions from various other people. It is currently maintained
       by Mathieu Desnoyers <mathieu.desnoyers@efficios.com>.

                                                                 February 6, 2012                                                    BABELTRACE(1)
