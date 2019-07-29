LTTNG-RELAYD(8)                                                                                                                    LTTNG-RELAYD(8)

NAME
       lttng-relayd - LTTng remote trace collection daemon

SYNOPSIS
       lttng-relayd [OPTIONS]

DESCRIPTION
       The  LTTng  project  aims  at  providing  highly efficient tracing tools for Linux.  It's tracers help tracking down performance issues and
       debugging problems involving multiple concurrent processes and threads. Tracing across multiple systems is also possible.

       The relay daemon listens by default on all network interfaces to gather trace data, but only on localhost for viewer connections. This dae‐
       mon does not require any particular permissions as long as it can write in the output folder and listen on the ports. If a user is within a
       secured network and/or has proper firewall settings, lttng-relayd can listen to viewer connections from all network interfaces by  specify‐
       ing '-L tcp://0.0.0.0:5344'.

       Traces  can be either viewed "live" (as they are produced) by attaching to the live viewer port using LTTng live protocol, or after tracing
       has been stopped. Once a trace has been streamed completely, the trace can be processed by any tool that can  process  a  local  LTTng  CTF
       trace.

       By default, the relayd outputs the traces in : ~/lttng-traces/hostname/session-name/domain-name

       The  prefix (~/lttng-traces) can be configured on the relayd side (see below for the option), the other folders can be configured when cre‐
       ating the trace on the sessiond side.

OPTIONS
       This program follows the usual GNU command line syntax with long options starting with two dashes. Below is  a  summary  of  the  available
       options.

       -h, --help
              Show summary of possible options and commands

       -V, --version
              Show version.

       -v, --verbose
              Increase verbosity

              There is three debugging level which will print on stderr. Maximum verbosity is -vvv.

       -d, --daemonize
              Start as a daemon

       -b, --background
              Start as a daemon, keeping console open

       -g, --group NAME
              Specify the tracing group name. (default: tracing)

       -C, --control-port
              Control port URL (tcp://0.0.0.0:5342 is the default)

       -D, --data-port
              Data port URL (tcp://0.0.0.0:5343 is the default)

       -L, --live-port URL
              Live view port URL (tcp://localhost:5344 is the default).

       -o, --output
              Output base directory. Must use an absolute path (~/lttng-traces is the default)

       -V, --version
              Show version number

ENVIRONMENT VARIABLES
       LTTNG_NETWORK_SOCKET_TIMEOUT
              Control timeout of socket connection, receive and send. Takes an integer parameter: the timeout value, in milliseconds. A value of 0
              or -1 uses the timeout of the operating system (this is the default).

       LTTNG_RELAYD_HEALTH
              File path used for relay daemon health check communication.

SEE ALSO
       babeltrace(1), lttng-sessiond(8), lttng-ust(3), lttng(1)

LIMITATIONS
       For now only TCP is supported on both control and data port.  Control will always remain TCP-only since it is low-volume  and  needs  abso‐
       lutely to be reliable, but eventually the data connection could support UDP.

       For  unprivileged  user running lttng-relayd, the maximum number of file descriptors per process is usually 1024. This limits the number of
       connections and tracefiles opened. This limit can be configured see ulimit(3).

BUGS
       No show stopper bugs are known yet in this version.

       If you encounter any issues or usability problem, please report it on our mailing list <lttng-dev@lists.lttng.org>  to  help  improve  this
       project.

CREDITS
       lttng-relayd is distributed under the GNU General Public License version 2. See the file COPYING for details.

       A Web site is available at http://lttng.org for more information on the LTTng project.

       You can also find our git tree at http://git.lttng.org.

       Mailing lists for support and development: <lttng-dev@lists.lttng.org>.

       You can find us on IRC server irc.oftc.net (OFTC) in #lttng.

AUTHORS
       lttng-relay  was  originally  written by Julien Desfossez and David Goulet. More people have since contributed to it. It is currently main‐
       tained by Julien Desfossez <jdesfossez@efficios.com>.

                                                                   July 15, 2012                                                   LTTNG-RELAYD(8)
