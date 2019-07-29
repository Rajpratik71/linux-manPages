pulseaudio(1)              General Commands Manual              pulseaudio(1)

NAME
       pulseaudio - The PulseAudio Sound System

SYNOPSIS
       pulseaudio [options]

       pulseaudio --help

       pulseaudio --version

       pulseaudio --dump-conf

       pulseaudio --dump-modules

       pulseaudio --dump-resample-methods

       pulseaudio --cleanup-shm

       pulseaudio --start

       pulseaudio --kill

       pulseaudio --check

DESCRIPTION
       PulseAudio  is  a  networked low-latency sound server for Linux, POSIX
       and Windows systems.

OPTIONS
       -h | --help
              Show help.

       --version
              Show version information.

       --dump-conf
              Load the daemon configuration  file  daemon.conf  (see  below),
              parse  remaining  configuration options on the command line and
              dump the resulting daemon configuration, in a  format  that  is
              compatible with daemon.conf.

       --dump-modules
              List  available  loadable  modules.  Combine with -v for a more
              elaborate listing.

       --dump-resample-methods
              List available audio resamplers.

       --cleanup-shm
              Identify stale  PulseAudio  POSIX  shared  memory  segments  in
              /dev/shm  and  remove them if possible. This is done implicitly
              whenever a new daemon starts up or a client tries to connect to
              a  daemon.  It  should  normally not be necessary to issue this
              command by hand. Only available on systems  with  POSIX  shared
              memory  segments  implemented via a virtual file system mounted
              to /dev/shm (e.g. Linux).

       --start
              Start PulseAudio if it is not running yet.  This  is  different
              from starting PulseAudio without --start which would fail if PA
              is already running. PulseAudio is guaranteed to be  fully  ini‐
              tialized when this call returns. Implies --daemonize.

       -k | --kill
              Kill  an  already running PulseAudio daemon of the calling user
              (Equivalent to sending a SIGTERM).

       --check
              Return 0 as return code when the PulseAudio daemon  is  already
              running  for  the calling user, or non-zero otherwise. Produces
              no output on the console except for errors to stderr.

       --system[=BOOL]
              Run as system-wide instance instead of  per-user.  Please  note
              that this disables certain features of PulseAudio and is gener‐
              ally not recommended unless the system  knows  no  local  users
              (e.g.  is a thin client). This feature needs special configura‐
              tion and a dedicated UNIX user set up. It is highly recommended
              to combine this with --disallow-module-loading (see below).

       -D | --daemonize[=BOOL]
              Daemonize  after  startup,  i.e. detach from the terminal. Note
              that when running as a systemd service you should use  --daemo‐
              nize=no for systemd notification to work.

       --fail[=BOOL]
              Fail  startup when any of the commands specified in the startup
              script default.pa (see below) fails.

       --high-priority[=BOOL]
              Try to acquire a high Unix nice level. This will  only  succeed
              if  the  calling user has a non-zero RLIMIT_NICE resource limit
              set (on systems that support this), or we're called  SUID  root
              (see  below),  or  we  are configure to be run as system daemon
              (see --system above). It is recommended to enable  this,  since
              it is only a negligible security risk (see below).

       --realtime[=BOOL]
              Try  to  acquire  a  real-time  scheduling for PulseAudio's I/O
              threads. This will only succeed if the calling user has a  non-
              zero  RLIMIT_RTPRIO resource limit set (on systems that support
              this), or we're called SUID root (see below), or we are config‐
              ure to be run as system daemon (see --system above). It is rec‐
              ommended to enable this only for trusted users, since it  is  a
              major security risk (see below).

       --disallow-module-loading[=BOOL]
              Disallow  module loading after startup. This is a security fea‐
              ture since it disallows additional module loading  during  run‐
              time  and on user request. It is highly recommended when --sys‐
              tem is used (see above). Note however, that this breaks certain
              features like automatic module loading on hot plug.

       --disallow-exit[=BOOL]
              Disallow user requested exit

       --exit-idle-time=SECS
              Terminate the daemon when idle and the specified number of sec‐
              onds passed.

       --scache-idle-time=SECS
              Unload autoloaded samples from the cache when they haven't been
              used for the specified number of seconds.

       --log-level[=LEVEL]
              If  an  argument  is passed, set the log level to the specified
              value, otherwise increase the  configured  verbosity  level  by
              one. The log levels are numerical from 0 to 4, corresponding to
              error, warn, notice, info, debug. Default log level is  notice,
              i.e. all log messages with lower log levels are printed: error,
              warn, notice.

       -v | --verbose
              Increase the configured verbosity level by one (see --log-level
              above).  Specify  multiple times to increase log level multiple
              times.

       --log-target={auto,syslog,journal,stderr,file:PATH,newfile:PATH}
              Specify the log target. If set to auto (which is the  default),
              then  logging is directed to syslog when --daemonize is passed,
              otherwise to STDERR. If set to journal logging is  directed  to
              the  systemd  journal. If set to file:PATH, logging is directed
              to the file indicated by PATH. newfile:PATH  is  otherwise  the
              same as file:PATH, but existing files are never overwritten. If
              the specified file already exists, a suffix  is  added  to  the
              file name to avoid overwriting.

       --log-meta[=BOOL]
              Show source code location in log messages.

       --log-time[=BOOL]
              Show timestamps in log messages.

       --log-backtrace=FRAMES
              When  FRAMES  is  greater  than 0, log for each message a stack
              trace up to the number of specified stack frames.

       -p | --dl-search-path=PATH
              Set the search path for dynamic shared objects (plugins).

       --resample-method=METHOD
              Use the specified resampler by  default  (See  --dump-resample-
              methods above for possible values).

       --use-pid-file[=BOOL]
              Create  a  PID file. If this options is disabled it is possible
              to run multiple sound servers per user.

       --no-cpu-limit[=BOOL]
              Do not install CPU load limiter on platforms that  support  it.
              By  default,  PulseAudio  will terminate itself when it notices
              that it takes up too much CPU time. This is useful as a protec‐
              tion  against  system lockups when real-time scheduling is used
              (see below). Disabling this mechanism is useful when  debugging
              PulseAudio  with  tools like valgrind(1) which slow down execu‐
              tion.

       --disable-shm[=BOOL]
              PulseAudio clients and the server can exchange audio  data  via
              POSIX  or memfd shared memory segments (on systems that support
              this). If disabled PulseAudio will communicate exclusively over
              sockets.  Please note that data transfer via shared memory seg‐
              ments is always disabled when PulseAudio is running with --sys‐
              tem enabled (see above).

       --enable-memfd[=BOOL]
              PulseAudio  clients  and the server can exchange audio data via
              memfds - the anonymous Linux Kernel shared memory mechanism (on
              kernels  that support this). If disabled PulseAudio will commu‐
              nicate via POSIX shared memory.

       -L | --load="MODULE ARGUMENTS"
              Load the specified plugin module with the specified arguments.

       -F | --file=FILENAME
              Run the specified script on startup. May be specified  multiple
              times  to  specify multiple scripts to be run in order. Combine
              with -n to disable loading of  the  default  script  default.pa
              (see below).

       -C     Open  a command interpreter on STDIN/STDOUT after startup. This
              may be used to configure PulseAudio dynamically during runtime.
              Equivalent to --load=module-cli.

       -n     Don't  load  default  script  file  default.pa  (see  below) on
              startup. Useful in conjunction with -C or --file.

FILES
       ~/.config/pulse/daemon.conf,   /etc/pulse/daemon.conf:   configuration
       settings  for the PulseAudio daemon. If the version in the user's home
       directory does not exist the global configuration file is loaded.  See
       pulse-daemon.conf(5) for more information.

       ~/.config/pulse/default.pa, /etc/pulse/default.pa: the default config‐
       uration script to execute when the PulseAudio daemon  is  started.  If
       the  version  in  the  user's home directory does not exist the global
       configuration script is loaded. See default.pa(5)  for  more  informa‐
       tion.

       ~/.config/pulse/client.conf,   /etc/pulse/client.conf:   configuration
       settings for PulseAudio client applications. If  the  version  in  the
       user's  home directory does not exist the global configuration file is
       loaded. See pulse-client.conf(5) for more information.

SIGNALS
       SIGINT, SIGTERM:  the  PulseAudio  daemon  will  shut  down  (Same  as
       --kill).

       SIGHUP:  dump  a  long status report to STDOUT or syslog, depending on
       the configuration.

       SIGUSR1:  load  module-cli,  allowing  runtime   reconfiguration   via
       STDIN/STDOUT.

       SIGUSR2:  load module-cli-protocol-unix, allowing runtime reconfigura‐
       tion via a AF_UNIX socket. See pacmd(1) for more information.

UNIX GROUPS AND USERS
       Group pulse-rt: if the PulseAudio binary is  marked  SUID  root,  then
       membership of the calling user in this group decides whether real-time
       and/or high-priority scheduling is enabled. Please note that  enabling
       real-time scheduling is a security risk (see below).

       Group  pulse-access:  if PulseAudio is running as a system daemon (see
       --system above) access is granted to members of this group  when  they
       connect via AF_UNIX sockets. If PulseAudio is running as a user daemon
       this group has no meaning.

       User pulse, group pulse: if PulseAudio is running as a  system  daemon
       (see --system above) and is started as root the daemon will drop priv‐
       ileges and become a normal user process using this user and group.  If
       PulseAudio  is  running  as  a  user daemon this user and group has no
       meaning.

REAL-TIME AND HIGH-PRIORITY SCHEDULING
       To minimize the risk of drop-outs during playback it is recommended to
       run  PulseAudio  with  real-time scheduling if the underlying platform
       supports it. This decouples the scheduling latency of  the  PulseAudio
       daemon from the system load and is thus the best way to make sure that
       PulseAudio always gets CPU time when it needs it to refill  the  hard‐
       ware  playback  buffers. Unfortunately this is a security risk on most
       systems, since PulseAudio runs as user process,  and  giving  realtime
       scheduling  privileges  to  a  user process always comes with the risk
       that the user misuses it to lock up the system --  which  is  possible
       since making a process real-time effectively disables preemption.

       To  minimize  the risk PulseAudio by default does not enable real-time
       scheduling. It is however recommended to enable it on trusted systems.
       To do that start PulseAudio with --realtime (see above) or enabled the
       appropriate option in daemon.conf. Since acquiring realtime scheduling
       is a privileged operation on most systems, some special changes to the
       system configuration need to be made to  allow  them  to  the  calling
       user. Two options are available:

       On  newer  Linux  systems the system resource limit RLIMIT_RTPRIO (see
       setrlimit(2) for more information) can be used to allow specific users
       to  acquire real-time scheduling. This can be configured in /etc/secu‐
       rity/limits.conf, a resource limit of 9 is recommended.

       Alternatively, the SUID root bit can be set for the PulseAudio binary.
       Then,  the  daemon  will  drop root privileges immediately on startup,
       however retain the CAP_NICE capability (on systems that  support  it),
       but  only  if  the calling user is a member of the pulse-rt group (see
       above). For all other users all capabilities are dropped  immediately.
       The  advantage  of  this solution is that the real-time privileges are
       only granted to the PulseAudio daemon -- not to all  the  user's  pro‐
       cesses.

       Alternatively, if the risk of locking up the machine is considered too
       big to enable real-time scheduling, high-priority  scheduling  can  be
       enabled  instead  (i.e.  negative  nice level). This can be enabled by
       passing --high-priority (see above) when starting PulseAudio  and  may
       also  be  enabled with the appropriate option in daemon.conf. Negative
       nice levels can only be enabled when the  appropriate  resource  limit
       RLIMIT_NICE  is  set (see setrlimit(2) for more information), possibly
       configured in /etc/security/limits.conf. A resource limit of 31  (cor‐
       responding with nice level -11) is recommended.

ENVIRONMENT VARIABLES
       The PulseAudio client libraries check for the existence of the follow‐
       ing environment variables and change their local configuration accord‐
       ingly:

       $PULSE_SERVER:  the  server string specifying the server to connect to
       when a client asks for a sound server connection and  doesn't  explic‐
       itly  ask for a specific server. The server string is a list of server
       addresses separated by whitespace which are tried in  turn.  A  server
       address  consists  of an optional address type specifier (unix:, tcp:,
       tcp4:, tcp6:), followed by a path or host address. A host address  may
       include an optional port number. A server address may be prefixed by a
       string enclosed in {}. In this case the following  server  address  is
       ignored  unless  the  prefix  string  equals the local hostname or the
       machine id (/etc/machine-id).

       $PULSE_SINK: the symbolic name of the sink to connect to when a client
       creates  a  playback  stream and doesn't explicitly ask for a specific
       sink.

       $PULSE_SOURCE: the symbolic name of the source to connect  to  when  a
       client  creates  a record stream and doesn't explicitly ask for a spe‐
       cific source.

       $PULSE_BINARY: path of PulseAudio executable to run when server  auto-
       spawning is used.

       $PULSE_CLIENTCONFIG:  path  of  file  that  shall  be  read instead of
       client.conf (see above) for client configuration.

       $PULSE_COOKIE: path of file that contains the  PulseAudio  authentica‐
       tion cookie. Defaults to ~/.config/pulse/cookie.

       These  environment settings take precedence -- if set -- over the con‐
       figuration settings from client.conf (see above).

AUTHORS
       The  PulseAudio  Developers  <pulseaudio-discuss  (at)   lists   (dot)
       freedesktop  (dot)  org>; PulseAudio is available from http://pulseau‐
       dio.org/

SEE ALSO
       pulse-daemon.conf(5), default.pa(5), pulse-client.conf(5), pacmd(1)

Manuals                              User                       pulseaudio(1)
