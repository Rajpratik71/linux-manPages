BABELTRACE-LOG(1)                                                                                                                BABELTRACE-LOG(1)

NAME
       babeltrace-log — Babeltrace Log Converter

SYNOPSIS
       babeltrace-log [OPTIONS] OUTPUT

DESCRIPTION
       Convert from a text log (read from standard input) to CTF.

       This  program  follows  the  usual  GNU command line syntax with long options starting with two dashes. Below is a summary of the available
       options.

       OUTPUT Output trace path

       -t     With timestamps (format: [sec.usec] string\n)

       SEE ALSO

       babeltrace(1), lttng(1), lttng-ust(3), lttng-sessiond(8)

BUGS
       No knows bugs at this point.

       If you encounter any issues or usability problem, please report it on our mailing list <lttng-dev@lists.lttng.org>  to  help  improve  this
       project.

CREDITS
       Babeltrace and the babeltrace library are distributed under the MIT license. See the files LICENSE and mit-license.txt for details.

       A  Web  site  is  available  at  http://www.efficios.com/babeltrace  for  more  information  on Babeltrace and the Common Trace Format. See
       http://lttng.org for more information on the LTTng project.

       Mailing list for support and development: <lttng-dev@lists.lttng.org>.

       You can find us on IRC server irc.oftc.net (OFTC) in #lttng.

THANKS
       Thanks to the Linux Foundation and Ericsson for funding part of this work. Thanks to the Multicore Association Tool Infrastructure  Working
       Group for their active role in the creation of the Common Trace Format.

AUTHORS
       Babeltrace was originally written by Mathieu Desnoyers, with additional contributions from various other people. It is currently maintained
       by Mathieu Desnoyers <mathieu.desnoyers@efficios.com>.

                                                                 February 16, 2012                                               BABELTRACE-LOG(1)
