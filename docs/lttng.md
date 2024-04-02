LTTNG(1)                                                                                                                                  LTTNG(1)

NAME
       lttng - LTTng 2.x tracer control command line tool

SYNOPSIS
       lttng [OPTIONS] <COMMAND>

DESCRIPTION
       The  LTTng  project  aims  at providing highly efficient tracing tools for Linux.  Its tracers help track down performance issues and debug
       problems involving multiple concurrent processes and threads. Tracing across multiple systems is also possible.

       The lttng command line tool from the lttng-tools package is used to control both kernel and user-space tracing. Every interaction with  the
       tracer should be done by this tool or by the liblttng-ctl library provided by the lttng-tools package.

       LTTng  uses  a session daemon (lttng-sessiond(8)), acting as a tracing registry, which allows you to interact with multiple tracers (kernel
       and user-space) inside the same container, a tracing session. Traces can be gathered  from  the  kernel  and/or  instrumented  applications
       (lttng-ust(3)). Aggregating and reading those traces is done using the babeltrace(1) text viewer.

       We introduce the notion of tracing domains which is essentially a type of tracer (kernel, user space, JUL, LOG4J or Python for now). In the
       future, we could see more tracer like for instance an hypervisor. For some commands, you'll need to specify on  which  domain  the  command
       operates (-u, -k, -l, -j or -p). For instance, the kernel domain must be specified when enabling a kernel event.

       In  order  to  trace the kernel, the session daemon needs to be running as root.  LTTng provides the use of a tracing group (default: trac‐
       ing). Whomever is in that group can interact with the root session daemon and thus trace the kernel. Session daemons can co-exist,  meaning
       that  you can have a session daemon running as Alice that can be used to trace her applications along side with a root daemon or even a Bob
       daemon. We highly recommend starting the session daemon at boot time for stable and long term tracing.

       Each user-space application instrumented with lttng-ust(3) will automatically register with the root session daemon and  its  user  session
       daemon. This allows each daemon to list the available traceable applications and tracepoints at any given moment (See the list command).

OPTIONS
       This  program  follows  the  usual  GNU command line syntax with long options starting with two dashes. Below is a summary of the available
       options.

       -h, --help
              Show summary of possible options and commands.

       -V, --version
              Show version.

       -v, --verbose
              Increase verbosity.  Three levels of verbosity are available which are triggered by putting additional v to the option (-vv or -vvv)

       -q, --quiet
              Suppress all messages (even errors).

       -g, --group NAME
              Set unix tracing group name. (default: tracing)

       -n, --no-sessiond
              Don't automatically spawn a session daemon.

       --sessiond-path PATH
              Set session daemon full binary path.

       --list-options
              Simple listing of lttng options.

       --list-commands
              Simple listing of lttng commands.

       -m, --mi TYPE
              Machine interface

              TYPE supported: XML

              Machine interface (MI) mode converts the traditional pretty printing to a machine output syntax. MI mode provides a  format  change-
              resistant way to access information generated via the lttng command line.

              When using MI mode, the data is printed on stdout. Error and warning are printed on stderr with the pretty print default format.

              If  any  errors  occur during the execution of a command, the return value of the command will be different than zero. In this case,
              lttng does NOT guarantee the syntax and data validity of the generated MI output.

              For XML output type, a schema definition (XSD) file used for validation can be found under src/common/mi_lttng.xsd

COMMANDS
       add-context [OPTIONS]
              Add context to event(s) and/or channel(s).

              A context is basically extra information appended to a channel. For instance, you could ask the tracer to add  the  PID  information
              for all events in a channel. You can also add performance monitoring unit counters (perf PMU) using the perf kernel API.

              For  example,  this  command will add the context information 'prio' and two per-CPU perf counters (hardware branch misses and cache
              misses), to all events in the trace data output:

              # lttng add-context -k -t prio -t perf:cpu:branch-misses \
                        -t perf:cpu:cache-misses

              Please take a look at the help (-h/--help) for a detailed list of available contexts.

              Perf counters are available as per-CPU ("perf:cpu:...") and per-thread ("perf:thread:...") counters. Currently, per-CPU counters can
              only be used with the kernel tracing domain, and per-thread counters can only be used with the UST tracing domain.

              If  no  channel  is  given  (-c),  the  context is added to all channels that were already enabled. If the session has no channel, a
              default channel is created.  Otherwise the context will be added only to the given channel (-c).

              If -s, --session is omitted, the session name is taken from the .lttngrc file.

              OPTIONS:

              -h, --help
                     Show summary of possible options and commands.

              -s, --session NAME
                     Apply on session name.

              -c, --channel NAME
                     Apply on channel name.

              -k, --kernel
                     Apply for the kernel tracer

              -u, --userspace
                     Apply for the user-space tracer

              -t, --type TYPE
                     Context type. You can repeat this option on the command line. Please use "lttng add-context -h" to list all available types.

       calibrate [OPTIONS]
              Quantify LTTng overhead

              The LTTng calibrate command can be used to find out the combined average overhead of the LTTng tracer and the instrumentation mecha‐
              nisms used. This overhead can be calibrated in terms of time or using any of the PMU performance counter available on the system.

              For now, the only calibration implemented is that of the kernel function instrumentation (kretprobes).

              * Calibrate kernel function instrumentation

              Let's  use  an  example  to  show this calibration. We use an i7 processor with 4 general-purpose PMU registers. This information is
              available by issuing dmesg, looking for "generic registers".

              This sequence of commands will gather a trace executing a kretprobe hooked on an empty function, gathering PMU  counters  LLC  (Last
              Level Cache) misses information (see lttng add-context --help to see the list of available PMU counters).

              # lttng create calibrate-function
              # lttng enable-event calibrate --kernel \
                   --function lttng_calibrate_kretprobe
              # lttng add-context --kernel -t perf:cpu:LLC-load-misses \
                   -t perf:cpu:LLC-store-misses \
                   -t perf:cpu:LLC-prefetch-misses
              # lttng start
              # for a in $(seq 1 10); do \
                      lttng calibrate --kernel --function;
                done
              # lttng destroy
              # babeltrace $(ls -1drt ~/lttng-traces/calibrate-function-* \
                   | tail -n 1)

              The  output  from  babeltrace  can be saved to a text file and opened in a spreadsheet (e.g. oocalc) to focus on the per-PMU counter
              delta between consecutive "calibrate_entry" and "calibrate_return" events. Note that  these  counters  are  per-CPU,  so  scheduling
              events  would  need  to be present to account for migration between CPU. Therefore, for calibration purposes, only events staying on
              the same CPU must be considered.

              The average result, for the i7, on 10 samples:

                                        Average     Std.Dev.
              perf_LLC_load_misses:       5.0       0.577
              perf_LLC_store_misses:      1.6       0.516
              perf_LLC_prefetch_misses:   9.0      14.742

              As we can notice, the load and store misses are relatively stable across runs (their standard deviation is relatively low)  compared
              to  the prefetch misses.  We can conclude from this information that LLC load and store misses can be accounted for quite precisely,
              but prefetches within a function seems to behave too erratically (not much causality link between the  code  executed  and  the  CPU
              prefetch activity) to be accounted for.

              OPTIONS:

              -h, --help
                     Show summary of possible options and commands.

              -k, --kernel
                     Apply for the kernel tracer

              -u, --userspace
                     Apply for the user-space tracer

              --function
                     Dynamic function entry/return probe (default)

       create [NAME] [OPTIONS]
              Create tracing session.

              A  tracing  session  contains  channel(s)  which  contains  event(s). It is domain agnostic, meaning that channels and events can be
              enabled for the user-space tracer and/or the kernel tracer. It acts like a container aggregating multiple tracing sources.

              On creation, a .lttngrc file is created in your $HOME directory containing the current session name. If NAME is omitted,  a  session
              name is automatically created having this form: 'auto-yyyymmdd-hhmmss'.

              If no -o, --output is specified, the traces will be written in $HOME/lttng-traces.

              The  $HOME environment variable can be overridden by defining the environment variable LTTNG_HOME. This is useful when the user run‐
              ning the commands has a non-writeable home directory.

              The session name MUST NOT contain the character '/'.

              OPTIONS:

              -h, --help
                     Show summary of possible options and commands.

              --list-options
                     Simple listing of options

              -o, --output PATH
                     Specify output path for traces

              --no-output
                     Traces will not be output

              --snapshot
                     Set the session in snapshot mode. Created in no-output mode and uses the URL, if one is specified, as  the  default  snapshot
                     output.  Every channel will be set in overwrite mode and with mmap output (splice not supported).

              --live [USEC]
                     Set  the  session  exclusively  in  live  mode.  The  parameter  is the delay in micro seconds before the data is flushed and
                     streamed. The live mode allows you to stream the trace and view it while it's being recorded by any  tracer.  For  that,  you
                     need  a lttng-relayd and this session requires a network URL (-U or -C/-D). If no USEC nor URL is provided, the default is to
                     use a timer value set to 1000000 and the network URL set to net://127.0.0.1.

                     To read a live session, you can use babeltrace(1) or the live streaming protocol in doc/live-reading-protocol.txt. Here is an
                     example:

                     $ lttng-relayd -o /tmp/lttng
                     $ lttng create --live 200000 -U net://localhost
                     $ lttng enable-event -a --userspace
                     $ lttng start

                     After the start, you'll be able to read the events while they are being recorded in /tmp/lttng.

              --shm-path PATH

                     Path  where shared memory holding buffers should be created. Useful when used with PRAMFS or other persistent memory filesys‐
                     tems to extract trace data in the event of a crash requiring a reboot.

                     See the lttng-crash(1) utility for more information on crash recovery.

              -U, --set-url=URL
                     Set URL for the consumer output destination. It is persistent for the session lifetime. Redo the command to change  it.  This
                     will set both data and control URL for network.

              -C, --ctrl-url=URL
                     Set control path URL. (Must use -D also)

              -D, --data-url=URL
                     Set data path URL. (Must use -C also)

              Using  these  options,  each  API  call can be controlled individually. For instance, -C does not enable the consumer automatically.
              You'll need the -e option for that.

              URL FORMAT:

              proto://[HOST|IP][:PORT1[:PORT2]][/TRACE_PATH]

              Supported protocols are (proto):

              file://...
                     Local filesystem full path.

              net://...
                     This will use the default network transport layer which is TCP for both control (PORT1) and data port  (PORT2).  The  default
                     ports are respectively 5342 and 5343. Note that net[6]:// is not yet supported.

              tcp[6]://...
                     Can only be used with -C and -D together

                     NOTE: IPv6 address MUST be enclosed in brackets '[]' (rfc2732)

                     EXAMPLES:

                     # lttng create -U net://192.168.1.42
                     Uses TCP and default ports for the given destination.

                     # lttng create -U net6://[fe80::f66d:4ff:fe53:d220]
                     Uses TCP, default ports and IPv6.

                     # lttng create s1 -U net://myhost.com:3229
                     Create session s1 and set its consumer to myhost.com on port 3229 for control.

       destroy [NAME] [OPTIONS]
              Teardown tracing session

              Free memory on the session daemon and tracer side. It's gone!

              If NAME is omitted, the session name is taken from the .lttngrc file.

              OPTIONS:

              -h, --help
                     Show summary of possible options and commands.

              -a, --all
                     Destroy all sessions

              --list-options
                     Simple listing of options

       enable-channel NAME[,NAME2,...] (-k | -u) [OPTIONS]
              Enable tracing channel

              To enable an event, you must enable both the event and the channel that contains it.

              If -s, --session is omitted, the session name is taken from the .lttngrc file.

              Exactly one of -k or -u must be specified.

              It  is  important to note that if a certain type of buffers is used, the session will be set with that type and all other subsequent
              channel needs to have the same type.

              Note that once the session has been started and enabled on the tracer side, it's not possible anymore to enable a  new  channel  for
              that session.

              OPTIONS:

              -h, --help
                     Show this help

              --list-options
                     Simple listing of options

              -s, --session NAME
                     Apply on session name

              -k, --kernel
                     Apply to the kernel tracer

              -u, --userspace
                     Apply to the user-space tracer

              --discard
                     Discard event when subbuffers are full (default)

              --overwrite
                     Flight recorder mode: overwrites events when subbuffers are full. The number of subbuffer must be 2 or more.

              --subbuf-size SIZE
                     Subbuffer  size  in bytes {+k,+M,+G}.  (default UST uid: 131072, UST pid: 4096, kernel: 262144, metadata: 4096) Rounded up to
                     the next power of 2.

                     The minimum subbuffer size, for each tracer, is the max value between the default above and the system  page  size.  You  can
                     issue this command to get the current page size on your system: $ getconf PAGE_SIZE

              --num-subbuf NUM
                     Number of subbuffers. (default UST uid: 4, UST pid: 4, kernel: 4, metadata: 2) Rounded up to the next power of 2.

              --switch-timer USEC
                     Switch subbuffer timer interval in µsec.  (default UST uid: 0, UST pid: 0, kernel: 0, metadata: 0)

              --read-timer USEC
                     Read timer interval in µsec.  (default UST uid: 0, UST pid: 0, kernel: 200000, metadata: 0)

              --output TYPE
                     Channel output type. Possible values: mmap, splice (default UST uid: mmap, UST pid: mmap, kernel: splice, metadata: mmap)

              --buffers-uid
                     Use per UID buffer (-u only). Buffers are shared between applications that have the same UID.

              --buffers-pid
                     Use per PID buffer (-u only). Each application has its own buffers.

              --buffers-global
                     Use shared buffer for the whole system (-k only)

              -C, --tracefile-size SIZE
                     Maximum  size of each tracefile within a stream (in bytes).  0 means unlimited. (default: 0) Note: traces generated with this
                     option may inaccurately report discarded events as of CTF 1.8.

              -W, --tracefile-count COUNT
                     Used in conjunction with -C option, this will limit the number of files created to the specified count.  0  means  unlimited.
                     (default: 0)

                     EXAMPLES:

                     $ lttng enable-channel -k -C 4096 -W 32 chan1
                     For  each  stream,  the maximum size of each trace file will be 4096 bytes and there will be a maximum of 32 different files.
                     The file count is appended after the stream number as seen in the following example. The last trace file is smaller than 4096
                     since it was not completely filled.

                             ~/lttng-traces/[...]/chan1_0_0 (4096)
                             ~/lttng-traces/[...]/chan1_0_1 (4096)
                             ~/lttng-traces/[...]/chan1_0_2 (3245)
                             ~/lttng-traces/[...]/chan1_1_0 (4096)
                             ...

                     $ lttng enable-channel -k -C 4096
                     This will create trace files of 4096 bytes and will create new ones as long as there is data available.

       enable-event NAME[,NAME2,...] (-k | -u | -j | -l | -p) [OPTIONS]
              Enable tracing event

              A  tracing event is always assigned to a channel. If -c, --channel is omitted, a default channel named 'channel0' is created and the
              event is added to it. If -c, --channel is omitted, but a non-default  channel  already  exists  within  the  session,  an  error  is
              returned. For the user-space tracer, using -a, --all is the same as using the wildcard "*".

              If -s, --session is omitted, the session name is taken from the .lttngrc file.

              OPTIONS:

              -h, --help
                     Show summary of possible options and commands.

              --list-options
                     Simple listing of options

              -s, --session NAME
                     Apply on session name

              -c, --channel NAME
                     Apply on channel name

              -a, --all
                     Enable all tracepoints and syscalls. This actually enables a single wildcard event "*".

              -k, --kernel
                     Apply for the kernel tracer

              -u, --userspace
                     Apply for the user-space tracer

              -j, --jul
                     Apply for Java application using Java Util Logging interface (JUL)

              -l, --log4j
                     Apply for Java application using LOG4J

              -p, --python
                     Apply for Python application using the logging module.

              --tracepoint
                     Tracepoint event (default). Userspace tracer supports wildcards at the end of string. Don't forget to quote to deal with bash
                     expansion.  e.g.:
                             "*"
                             "app_component:na*"

              --loglevel NAME
                     Tracepoint loglevel range from 0 to loglevel. Listed in the help (-h).  For the JUL domain, the loglevel ranges are  detailed
                     with  the --help option thus starting from SEVERE to FINEST.  For the LOG4J domain, loglevels range from FATAL to TRACE which
                     are also detailed in the help.  For the Python domain, loglevels range from CRITICAL to DEBUG which are detailed in the  help
                     as well.

              --loglevel-only NAME
                     Tracepoint loglevel (only this loglevel).  The loglevel or loglevel-only options should be combined with a tracepoint name or
                     tracepoint wildcard.

              --probe (addr | symbol | symbol+offset)
                     Dynamic probe. Addr and offset can be octal (0NNN...), decimal (NNN...)  or hexadecimal (0xNNN...)

              --function (addr | symbol | symbol+offset)
                     Dynamic function entry/return probe. Addr and offset can be octal (0NNN...), decimal (NNN...) or hexadecimal (0xNNN...)

              --syscall
                     System call event.

              --filter 'expression'
                     Set a filter on a newly enabled event. Filter expression on event fields and context. The event will be recorded if the  fil‐
                     ter's  expression evaluates to TRUE. Only specify on first activation of a given event within a session.  Specifying a filter
                     is only allowed when enabling events within a session before tracing is started. If the filter fails to link with  the  event
                     within the traced domain, the event will be discarded.

                     Expression examples:

                       'intfield > 500 && intfield < 503'
                       '(strfield == "test" || intfield != 10) && intfield > 33'
                       'doublefield > 1.1 && intfield < 5.3'

                     Wildcards are allowed at the end of strings:
                       'seqfield1  ==  "te*"'  In string literals, the escape character is a '\'. Use '\*' for the '*' character, and '\\' for the
                     '\' character sequence. Wildcard matches any sequence of characters, including an empty sub-string (matches 0 or more charac‐
                     ters).

                     Context information can be used for filtering. The examples below shows usage of context filtering on the process name (using
                     a wildcard), process ID range, and unique thread ID. The process and thread IDs of running applications can  be  found  under
                     columns "PID" and "LWP" of the "ps -eLf" command.

                       '$ctx.procname == "demo*"'
                       '$ctx.vpid >= 4433 && $ctx.vpid < 4455'
                       '$ctx.vtid == 1234'

                     Context information is available to all filters whether or not the add-context command has been used to add it to the event's
                     channel, as long as the context field exists for that domain. For example, the filter examples given above will never fail to
                     link: no add-context is required for the event's channel.

              -x, --exclude LIST
                     Add  exclusions  to  UST tracepoints: Events that match any of the items in the comma-separated LIST are not enabled, even if
                     they match a wildcard definition of the event.

                     This option is also applicable with the -a, --all option, in which case all UST tracepoints are enabled except the ones whose
                     names match any of the items in LIST.

       disable-channel NAME[,NAME2,...] (-k | -u) [OPTIONS]
              Disable tracing channel

              Disabling a channel disables the tracing of all of the channel's events. A channel can be re-enabled by calling lttng enable-channel
              NAME again.

              If -s, --session is omitted, the session name is taken from the .lttngrc file.

              OPTIONS:

              -h, --help
                     Show summary of possible options and commands.

              --list-options
                     Simple listing of options

              -s, --session NAME
                     Apply on session name

              -k, --kernel
                     Apply for the kernel tracer

              -u, --userspace
                     Apply for the user-space tracer

       disable-event NAME[,NAME2,...] (-k | -u | -j | -l | -p) [TYPE] [OPTIONS]
              Disable tracing event

              The event, once disabled, can be re-enabled by calling lttng enable-event NAME again.

              If -s, --session is omitted, the session name is taken from the .lttngrc file.

              If -c, --channel is omitted, the default channel name is used.  If -c, --channel is  omitted,  but  a  non-default  channel  already
              exists within the session, an error is returned.

              OPTIONS:

              -h, --help
                     Show summary of possible options and commands.

              --list-options
                     Simple listing of options

              -s, --session NAME
                     Apply on session name

              -c, --channel NAME
                     Apply on channel name

              -a, --all-events
                     Disable all events. This does NOT ONLY disable "*" but rather every known events of the session

              -k, --kernel
                     Apply for the kernel tracer

              -u, --userspace
                     Apply for the user-space tracer

              -j, --jul
                     Apply for Java application using Java Util Logging interface (JUL)

              -l, --log4j
                     Apply for Java application using LOG4J

              -p, --python
                     Apply for Python application using the logging module

              TYPE (kernel domain only):

              --all  Disable event of all type

              --tracepoint
                     Disable event of type tracepoint

              --syscall
                     Disable event of type syscall

              --probe
                     Disable event of type probe

              --function
                     Disable event of type function

       list [OPTIONS] [SESSION [SESSION OPTIONS]]
              List tracing session information.

              With no arguments, it will list available tracing session(s).

              With  the  session name, it will display the details of the session including the trace file path, the associated channels and their
              state (activated and deactivated), the activated events and more.

              With -k alone, it will list all available kernel events (except the system calls events).  With -j alone, the  available  JUL  event
              from  registered application will be list. The event corresponds to the Logger name in the Java JUL application.  With -l alone, the
              available LOG4J event from registered application will be list. The event corresponds to the Logger name in the Java LOG4J  applica‐
              tion.   With -p alone, the available Python event from registered application will be list. The event corresponds to the Logger name
              in the Python application.  With -u alone, it will list all available user-space events from registered  applications.  Here  is  an
              example of 'lttng list -u':

              PID: 7448 - Name: /tmp/lttng-ust/tests/hello/.libs/lt-hello
                    ust_tests_hello:tptest_sighandler (type: tracepoint)
                    ust_tests_hello:tptest (type: tracepoint)

              You can now enable any event listed by using the name : ust_tests_hello:tptest.

              OPTIONS:

              -h, --help
                     Show summary of possible options and commands.

              --list-options
                     Simple listing of options

              -k, --kernel
                     Select kernel domain

              -u, --userspace
                     Select user-space domain.

              -j, --jul
                     Apply for Java application using JUL

              -l, --log4j
                     Apply for Java application using LOG4J

              -p, --python
                     Apply for Python application using the logging module.

              -f, --fields
                     List event fields

              SESSION OPTIONS:

              -c, --channel NAME
                     List details of a channel

              -d, --domain
                     List available domain(s)

       load [OPTIONS] [NAME]
              Load tracing session configuration

              If  NAME  is  omitted,  all  session configurations found in both the user's session configuration directory (default: ~/.lttng/ses‐
              sions/) and the system session configuration directory (default: /etc/lttng/sessions/) will be loaded. Note that the sessions in the
              user directory are loaded first and then the system wide directory are loaded.

              OPTIONS:

              -h, --help
                     Show summary of possible options and commands.

              -a, --all
                     Load all session configurations (default).

              -i, --input-path PATH
                     Specify the input path for session configurations. This overrides the default session configuration directory.

              -f, --force
                     Overwrite current session configuration(s) if a session of the same name already exists.

       save [OPTIONS] [SESSION]
              Save tracing session configuration

              If  SESSION  is  omitted, all session configurations will be saved to individual .lttng files under the user's session configuration
              directory (default: ~/.lttng/sessions/). The default session configuration file naming scheme is SESSION.lttng.

              For instance, a user in the tracing group saving a session from a root session daemon will save it in her/his user directory.

              OPTIONS:

              -h, --help
                     Show summary of possible options and commands.

              -a, --all
                     Save all session configurations (default).

              -o, --output-path PATH
                     Specify the output path for saved sessions. This overrides the default session configuration directory.

              -f, --force
                     Overwrite session configuration file if session name clashes.

       set-session NAME [OPTIONS]
              Set current session name

              Will change the session name in the .lttngrc file.

              OPTIONS:

              -h, --help
                     Show summary of possible options and commands.

              --list-options
                     Simple listing of options

       snapshot [OPTIONS] ACTION
              Snapshot command for LTTng session.

              OPTIONS:

              -h, --help
                     Show summary of possible options and commands.

              --list-options
                     Simple listing of options

              ACTION:

              add-output [-m <SIZE>] [-s <NAME>] [-n <NAME>] <URL> | -C <URL> -D <URL>

                     Setup and add a snapshot output for a session. Output is the destination where the snapshot will be sent. Only one output  is
                     permitted. To change it, you'll need to delete it and add back the new one.

              del-output ID | NAME [-s <NAME>]

                     Delete  an output for a session using the output's ID. You can either specify the output by name or use its ID as returned by
                     the list-output command.

              list-output [-s <NAME>]

                     List the output of a session. Attributes of the output are printed.

              record [-m <SIZE>] [-s <NAME>] [-n <NAME>] [<URL> | -C <URL> -D <URL>]

                     Snapshot a session's buffer(s) for all domains. If an URL is specified, it is used instead  of  a  previously  added  output.
                     Specifying  only  a  name  or/and a max size will override the current output values. For instance, you can record a snapshot
                     with a custom maximum size or with a different name.

                     $ lttng snapshot add-output -n mysnapshot file:///data/snapshot
                     [...]
                     $ lttng snapshot record -n new_name_snapshot

                     The above will create a snapshot in /data/snapshot/new_name_snapshot* directory rather then in mysnapshot*/

              DETAILED ACTION OPTIONS

              -s, --session NAME
                     Apply to session name.

              -n, --name NAME
                     Name of the snapshot's output.

              -m, --max-size SIZE
                     Maximum size in bytes of the snapshot. The maximum size does  not  include  the  metadata  file.  Human  readable  format  is
                     accepted: {+k,+M,+G}. For instance, --max-size 5M

              -C, --ctrl-url URL
                     Set control path URL. (Must use -D also)

              -D, --data-url URL
                     Set data path URL. (Must use -C also)

       start [NAME] [OPTIONS]
              Start tracing

              It  will  start  tracing  for  all  tracers  for a specific tracing session.  If NAME is omitted, the session name is taken from the
              .lttngrc file.

              OPTIONS:

              -h, --help
                     Show summary of possible options and commands.

              --list-options
                     Simple listing of options

       stop [NAME] [OPTIONS]
              Stop tracing

              It will stop tracing for all tracers for a specific tracing session. Before returning, the  command  checks  for  data  availability
              meaning that it will wait until the trace is readable for the session. Use --no-wait to avoid this behavior.

              If NAME is omitted, the session name is taken from the .lttngrc file.

              OPTIONS:

              -h, --help
                     Show summary of possible options and commands.

              --list-options
                     Simple listing of options

              --no-wait
                     Don't wait for data availability.

       track (-k | -u) --pid [PID1[,PID2[,...]]] [OPTIONS]
              Adds one or more entries to a tracker

              The  track  command  adds  one or more entries to a tracker. A tracker is a whitelist of resources. Tracked resources are allowed to
              emit events, provided those events are enabled (see the enable-event command).

              Tracker entries can be removed from the whitelist with the untrack command.

              As of this version, the only available tracker is the PID tracker. The process ID (PID) tracker follows one  or  more  process  IDs;
              only  the  processes  with  a  tracked  PID are allowed to emit events. By default, all possible PIDs on the system are tracked: any
              process may emit enabled events (equivalent of lttng track --pid --all for all domains).

              With the PID tracker, it is possible, for example, to record all system calls called by a given process:

                  $ lttng enable-event --kernel --all --syscall
                  $ lttng track --kernel --pid 2345
                  $ lttng start

              If all the PIDs are tracked (i.e. lttng track --pid --all, which is the default state of all domains when creating  a  tracing  ses‐
              sion), then using the track command with one or more specific PIDs has the effect of first removing all the PIDs from the whitelist,
              then adding the specified PIDs.

              Assume the maximum PID is 7 for the following examples:

                  Initial whitelist: [0] [1] [2] [3] [4] [5] [6] [7]

                  $ lttng track --userspace --pid 3,6,7

                          Whitelist: [ ] [ ] [ ] [3] [ ] [ ] [6] [7]

                  $ lttng untrack --userspace --pid 7

                          Whitelist: [ ] [ ] [ ] [3] [ ] [ ] [6] [ ]

                  $ lttng track --userspace --pid 1,5

                          Whitelist: [ ] [1] [ ] [3] [ ] [5] [6] [ ]

              It should be noted that the PID tracker tracks the numeric process IDs.  Should a process with a given ID exit and  another  process
              be given this ID, then the latter would also be allowed to emit events.

              See the untrack command's documentation for more details about removing entries.

              OPTIONS:

              -s, --session NAME
                     Apply to session name.

              -k, --kernel
                     Apply to the kernel tracer.

              -u, --userspace
                     Apply to the user space tracer.

              -p, --pid [PIDS]
                     Track process IDs PIDS (add to whitelist).

                     PIDS is a comma-separated list of PIDs to add to the PID tracker.

                     The PIDS argument must be omitted when also using the --all option.

              -a, --all
                     Used in conjunction with an empty --pid option: track all process IDs (add all entries to whitelist).

              -h, --help
                     Show summary of possible options and commands.

              --list-options
                     Simple listing of options

       untrack (-k | -u) --pid [PID1[,PID2[,...]]] [OPTIONS]
              Removes one or more entries from a tracker

              See the track command's documentation to learn more about LTTng trackers.

              The untrack command removes specific resources from a tracker. The resources to remove must have been precedently added by the track
              command. It is also possible to remove all the resources from the whitelist using the --all option.

              As of this version, the only available tracker is the PID tracker.

              One common operation is to create a tracing session, remove all the entries from the PID tracker whitelist, start tracing, and  then
              manually track PIDs while tracing is active.

              Assume the maximum PID is 7 for the following examples:

                  $ lttng create

                  Initial whitelist: [0] [1] [2] [3] [4] [5] [6] [7]

                  $ lttng untrack --userspace --pid --all

                          Whitelist: [ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ]

                  $ lttng enable-event --userspace ...
                  $ lttng start
                  ...
                  $ lttng track --userspace --pid 3,5

                          Whitelist: [ ] [ ] [ ] [3] [ ] [5] [ ] [ ]

                  $ lttng track --userspace --pid 2

                          Whitelist: [ ] [ ] [2] [3] [ ] [5] [ ] [ ]

              See the track command's documentation for more details about adding entries.

              OPTIONS:

              -s, --session NAME
                     Apply to session name.

              -k, --kernel
                     Apply to the kernel tracer.

              -u, --userspace
                     Apply to the user space tracer.

              -p, --pid [PIDS]
                     Stop tracking process IDs PIDS (remove from whitelist).

                     PIDS is a comma-separated list of PIDs to remove from the PID tracker.

                     The PIDS argument must be omitted when also using the --all option.

              -a, --all
                     Used in conjunction with an empty --pid option: stop tracking all process IDs (remove all entries from whitelist).

              -h, --help
                     Show summary of possible options and commands.

              --list-options
                     Simple listing of options

       version
              Show version information

              OPTIONS:

              -h, --help
                     Show summary of possible options and commands.

              --list-options
                     Simple listing of options

       view [SESSION_NAME] [OPTIONS]
              View traces of a tracing session.  By default, the babeltrace viewer will be used for text viewing.  If SESSION_NAME is omitted, the
              session name is taken from the .lttngrc file.

              OPTIONS:

              -h, --help
                     Show this help

              --list-options
                     Simple listing of options

              -t, --trace-path PATH
                     Trace directory path for the viewer

              -e, --viewer CMD
                     Specify viewer and/or options to use This will completely override the default viewers so please make  sure  to  specify  the
                     full command. The trace directory path of the session will be appended at the end to the arguments

JUL/LOG4J DOMAIN
       This  section  explains  the  JUL  and  LOG4J  domain  where  JUL  stands  for  Java Util Logging. You can use these by using the liblttng-
       ust-<domain>-jni.so from the lttng-ust(3) project.

       The LTTng Java Agent uses JNI to link the UST tracer to the Java application that uses the agent. Thus, it behaves  similarly  to  the  UST
       domain  (-u).  When  enabling  events,  you  enable  a  Logger  name  that  will  then  be  mapped  to  a  default  UST  tracepoint  called
       lttng_jul:<domain>_event in the lttng_<domain>_channel. Using the lttng-ctl API, any JUL/LOG4J events must use the  tracepoint  event  type
       (same as --tracepoint).

       Because  of  the  default  immutable  channel, the enable-channel command CAN NOT be used with the JUL and LOG4J domain thus not having any
       options.

       Also, loglevels are supported. Use lttng enable-event -h to list them.  Wildcards are NOT supported except the "*" meaning all events (same
       as -a).

       Exactly  like  the UST domain, if the Java application has the same UID as you, you can trace it. Same goes for the tracing group accessing
       root applications.

       Finally, you can list every Logger name that are available from registered applications to the session daemon by using lttng list -j or -l.

       Here is an example on how to use the JUL domain.

       $ lttng list -j
       [...]
       $ lttng create aSession
       $ lttng enable-event -s aSession -j MyCustomLoggerName
       $ lttng start

       More information can be found in the lttng-ust documentation, see java-util-logging.txt

EXIT VALUES
       On success 0 is returned and a positive value on error. Value of 1 means a command error, 2 an undefined command, 3 a fatal error and  4  a
       command warning meaning that something went wrong during the command.

       Any  other value above 10, please refer to <lttng/lttng-error.h> for a detailed list or use lttng_strerror() to get a human readable string
       of the error code.

ENVIRONMENT VARIABLES
       Note that all command line options override environment variables.

       LTTNG_SESSIOND_PATH
              Allows one to specify the full session daemon binary path to lttng command line tool. You can also use --sessiond-path option having
              the same effect.

       LTTNG_SESSION_CONFIG_XSD_PATH
              Set the path in which the session.xsd session configuration schema may be found.

SEE ALSO
       babeltrace(1), lttng-ust(3), lttng-sessiond(8), lttng-relayd(8), lttng-crash(1),

BUGS
       If  you  encounter  any  issues or usability problem, please report it on our mailing list <lttng-dev@lists.lttng.org> to help improve this
       project or at https://bugs.lttng.org which is a bug tracker.

CREDITS
       lttng is distributed under the GNU General Public License version 2. See the file COPYING for details.

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

                                                                  May 13th, 2014                                                          LTTNG(1)
