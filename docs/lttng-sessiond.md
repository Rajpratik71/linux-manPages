LTTNG-SESSIOND(8)                                                                                                                LTTNG-SESSIOND(8)

NAME
       lttng-sessiond - LTTng 2.x central tracing registry session daemon.

SYNOPSIS
       lttng-sessiond [OPTIONS]

DESCRIPTION
       The  LTTng  project  aims  at  providing  highly efficient tracing tools for Linux.  It's tracers help tracking down performance issues and
       debugging problems involving multiple concurrent processes and threads. Tracing across multiple systems is also possible.

       The session daemon, acting as a tracing registry, allow you to interact with multiple tracers (kernel and user-space) inside the same  con‐
       tainer,  a tracing session. Trace can be gathered from the kernel and/or instrumented applications (lttng-ust(3)). Aggregating those traces
       is done using a viewer, like the babeltrace(1) text viewer.

       In order to trace the kernel, the session daemon needs to be running as root.  LTTng provides the use of a tracing  group  (default:  trac‐
       ing).  Whomever  is in that group can interact with the root session daemon and thus trace the kernel. Session daemons can co-exist meaning
       that you can have a session daemon running as Alice that can be used to trace her applications along side with a root daemon or even a  Bob
       daemon. We highly recommend to start the session daemon at boot time for stable and long term tracing.

       The session daemon is in charge of managing trace data consumers by spawning them when the time has come. The user don't need to manage the
       lttng-consumerd.

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

           --verbose-consumer
              Verbose mode for consumer. Activate DBG() macro.

       -d, --daemonize
              Start as a daemon

       -b, --background
              Start as a daemon, keeping console open

       -g, --group=NAME
              Specify the tracing group name. (default: tracing)

       -V, --version
              Show version number

       -S, --sig-parent
              Send SIGUSR1 to parent pid to notify readiness.

              This  is  used by lttng(1) to get notified when the session daemon is ready to accept command. When building a third party tool over
              liblttng-ctl, this option can be very handy to synchronize the control tool and the session daemon.

       -q, --quiet
              No output at all.

           --no-kernel
              No kernel tracer support

           --agent-tcp-port
              Agent application registration TCP port (default: 5345)

           --kmod-probes=probe1, probe2, ...
              Specify the kernel modules containing LTTng probes to load by the session daemon.  Only the component name of the probe needs to  be
              specified, e.g. to load the lttng-probe-irq and lttng-probe-sched use: --kmod-probes="irq, sched".

           --extra-kmod-probes=probe1, probe2, ...
              Specify  extra kernel modules containing LTTng probes to be loaded by the session daemon. The list follows the format of the --kmod-
              probes option.  This list is appended to the list provided by --kmod-probes or, if --kmod-probes is missing, to the default list  of
              probes.

       -c, --client-sock=PATH
              Specify path for the client unix socket

       -a, --apps-sock PATH
              Specify path for apps unix socket

           --kconsumerd-err-sock=PATH
              Specify path for the kernel consumer error socket

           --kconsumerd-cmd-sock=PATH
              Specify path for the kernel consumer command socket

           --ustconsumerd32-err-sock=PATH
              Specify path for the 32-bit UST consumer error socket

           --ustconsumerd64-err-sock=PATH
              Specify path for the 64-bit UST consumer error socket

           --ustconsumerd32-cmd-sock=PATH
              Specify path for the 32-bit UST consumer command socket

           --ustconsumerd64-cmd-sock=PATH
              Specify path for the 64-bit UST consumer command socket

           --consumerd32-path=PATH
              Specify path for the 32-bit UST consumer daemon binary

           --consumerd32-libdir=PATH
              Specify path for the 32-bit UST consumer daemon libraries

           --consumerd64-path=PATH
              Specify path for the 64-bit UST consumer daemon binary

           --consumerd64-libdir=PATH
              Specify path for the 64-bit UST consumer daemon libraries

       -l, --load PATH
              Specify path from which to automatically load session configuration(s).

       -f, --config PATH
              Specify path from which to load daemon configuration.

LOADING SESSIONS
       By  default, the session daemon tries to load session configuration(s) located in the user default directory ~/.lttng/sessions/auto/ and in
       the system wide one in /etc/lttng/sessions/auto/. Note that the directory containing the session's configuration  and  lttng-sessiond  MUST
       have the same UID for them to be automatically loaded.

       Specifying a path with -l, --load PATH overrides the default directory and UID check. The lttng-sessiond will simply check if it's accessi‐
       ble and try to load every session file in it.

ENVIRONMENT VARIABLES
       Note that all command line options will override environment variables.

       LTTNG_CONSUMERD32_BIN
              Specify the 32-bit consumer binary path. --consumerd32-path override this variable.

       LTTNG_CONSUMERD64_BIN
              Specify the 64-bit consumer binary path. --consumerd64-path override this variable.

       LTTNG_CONSUMERD32_LIBDIR
              Specify the 64-bit library path containing libconsumer.so.  --consumerd32-libdir override this variable.

       LTTNG_CONSUMERD64_LIBDIR
              Specify the 32-bit library path containing libconsumer.so.  --consumerd64-libdir override this variable.

       LTTNG_DEBUG_NOCLONE
              Debug-mode disabling use of clone/fork. Insecure, but required to allow debuggers to work with sessiond on some operating systems.

       LTTNG_APP_SOCKET_TIMEOUT
              Control the timeout of application's socket when sending and receiving commands. Takes an integer parameter: the timeout  value,  in
              seconds.   After  this  period  of time, the application is unregistered by the session daemon. A value of 0 or -1 means an infinite
              timeout. Default value is 5 seconds.

       LTTNG_NETWORK_SOCKET_TIMEOUT
              Control timeout of socket connection, receive and send. Takes an integer parameter: the timeout value, in milliseconds. A value of 0
              or -1 uses the timeout of the operating system (this is the default).

       LTTNG_SESSION_CONFIG_XSD_PATH
              Specify the path that contains the XML session configuration schema (xsd).

       LTTNG_KMOD_PROBES
              Specify the kernel modules probes that should be loaded by the session daemon.

       LTTNG_EXTRA_KMOD_PROBES
              Specify extra kernel modules probes that should be loaded by the session daemon.

SEE ALSO
       babeltrace(1), lttng-ust(3), lttng(1)

LIMITATIONS
       For unprivileged user running lttng-sessiond, the maximum number of file descriptors per process is usually 1024. This limits the number of
       traceable applications since for each instrumented application there is two file descriptors per-CPU and one more socket for  bidirectional
       communication.

       For the root user, the limit is bumped to 65535. Future version will deal with this limitation.

BUGS
       No show stopper bugs are known yet in this version.

       If  you  encounter  any  issues or usability problem, please report it on our mailing list <lttng-dev@lists.lttng.org> to help improve this
       project.

CREDITS
       lttng-sessiond is distributed under the GNU General Public License version 2. See the file COPYING for details.

       A Web site is available at http://lttng.org for more information on the LTTng project.

       You can also find our git tree at http://git.lttng.org.

       Mailing lists for support and development: <lttng-dev@lists.lttng.org>.

       You can find us on IRC server irc.oftc.net (OFTC) in #lttng.

THANKS
       Thanks to Yannick Brosseau without whom this project would never have been so lean and mean! Also thanks to the Ericsson teams  working  on
       tracing which helped us greatly with detailed bug reports and unusual test cases.

       Thanks to our beloved packager Alexandre Montplaisir-Goncalves (Ubuntu and PPA maintainer) and Jon Bernard for our Debian packages.

       Special thanks to Michel Dagenais and the DORSAL laboratory at Polytechnique de Montreal for the LTTng journey.

AUTHORS
       lttng-tools was originally written by Mathieu Desnoyers, Julien Desfossez and David Goulet. More people have since contributed to it. It is
       currently maintained by Jérémie Galarneau <jeremie.galarneau@efficios.com>.

                                                                 January 31, 2012                                                LTTNG-SESSIOND(8)
