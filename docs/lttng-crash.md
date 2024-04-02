LTTNG-CRASH(1)                                                                                                                      LTTNG-CRASH(1)

NAME
       lttng-crash - LTTng Crash Trace Viewer

SYNOPSIS
       lttng-crash [OPTIONS] FILE

DESCRIPTION
       The  LTTng  project  aims  at providing highly efficient tracing tools for Linux.  Its tracers help track down performance issues and debug
       problems involving multiple concurrent processes and threads. Tracing across multiple systems is also possible.

       The lttng-crash command line tool, part of the lttng-tools package, is used to view or recover trace buffers in the event of a crash.

OPTIONS
       This program follows the usual GNU command line syntax with long options starting with two dashes. Below is  a  summary  of  the  available
       options.

       -h, --help
              Show summary of possible options and commands.

       -V, --version
              Show version.

       -v, --verbose
              Increase verbosity.  Three levels of verbosity are available which are triggered by putting additional v to the option (-vv or -vvv)

       -e, --viewer NAME
              Specify viewer and/or options to use. This will completely override the default viewers therefore make sure to specify the full com‐
              mand. The trace directory paths are appended at the end to the arguments. (defaults: babeltrace)

       -x, --extract PATH
              Extract trace(s) to the specified path. Don't display the trace.

SEE ALSO
       babeltrace(1), lttng(1), lttng-ust(3), lttng-sessiond(8), lttng-relayd(8),

BUGS
       If you encounter any issues or usability problem, please report it on our mailing list <lttng-dev@lists.lttng.org>  to  help  improve  this
       project or at https://bugs.lttng.org which is a bug tracker.

CREDITS
       lttng is distributed under the GNU General Public License version 2. See the file COPYING for details.

       A Web site is available at http://lttng.org for more information on the LTTng project.

       You can also find our git tree at http://git.lttng.org.

       Mailing lists for support and development: <lttng-dev@lists.lttng.org>.

       You can find us on IRC server irc.oftc.net (OFTC) in #lttng.

AUTHORS
       lttng-crash was originally written by Mathieu Desnoyers. It is currently maintained by Jérémie Galarneau <jeremie.galarneau@efficios.com>.

                                                                 March 26th, 2015                                                   LTTNG-CRASH(1)
