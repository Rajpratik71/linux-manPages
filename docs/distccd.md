distccd(1)                             General Commands Manual                             distccd(1)

NAME
       distccd - distributed C/C++ compiler server

SYNOPSIS
       distccd --daemon [OPTIONS]

DESCRIPTION
       distccd is the server for the distcc(1) distributed compiler.  It accepts and runs compilation
       jobs for network clients.

       distcc can run over either TCP or a connection command such as ssh(1).   TCP  connections  are
       fast but relatively insecure.  SSH connections are secure but slower.

       For SSH connections, distccd must be installed on the volunteer but should not run as a daemon
       -- it will be started over SSH as needed.  SSH connections have  several  advantages:  neither
       the  client  nor  server listens on any new ports; compilations run with the privileges of the
       user that requested them; unauthorized users cannot access the server; and source  and  output
       is protected in transit.

       For  TCP  connections,  distccd can run either from an inetd-style program, or as a standalone
       server.  Standalone mode is recommended because it  is  slightly  more  efficient  and  allows
       distccd to regulate the number of incoming jobs.  The --listen and --allow options can be used
       for simple IP-based access control.

       distcc may be started either by root or any other user.  If run by root, it gives away  privi‐
       leges  and changes to the user specified by the --user option, or the user called "distcc", or
       the user called "nobody".

       distccd does not have a configuration file; it's behaviour is controlled only by  command-line
       options and requests from clients.

STANDALONE SERVER
       The recommended method for running distccd is as a standalone server.  distccd will listen for
       network connections and fork several child processes to serve them.

       If you installed distcc using a packaged version you may be able to start the server using the
       standard mechanism for your operating system, such as

              # service distcc start

       To  start  distccd as a standalone service, run a command like this either as root or an ordi‐
       nary user:

              # distccd --daemon

RUNNING FROM INIT
       distccd may be run as a standalone daemon under the control of another program like init(8) or
       daemontools.  The super-server starts distccd when the system boots, and whenever it exits.

       distccd  should be started just as for a standalone server, except that the --no-detach option
       should be used so that the super-server can monitor it.

       For example, to add distccd as a process to Linux sysvinit, add this line to /etc/inittab

              dscc:2345:respawn:/usr/local/bin/distccd --verbose --no-detach --daemon

RUNNING FROM INETD
       distccd may be started from a network super-server such as inetd  or  xinetd.   In  this  case
       inetd listens for network connections and invokes distccd when one arrives.

       This is slightly less efficient than running a standalone distccd daemon.  distccd is not able
       to regulate the number of concurrent jobs accepted, but there may be an option in  your  inetd
       configuration to do so.

       For traditional Unix inetd, a line like this can be added to /etc/inetd.conf:

              distcc stream tcp nowait.6000 root /usr/local/bin/distccd distccd --inetd

       inetd imposes a limit on the rate of connections to a service to protect against accidental or
       intentional overuse.  The default in Linux NetKit inetd is 40 per minute, which  is  far   too
       low for distccd.  The .6000 option raises the limit to 6000 per minute.

TERMINATING DISTCCD
       To shut down a standalone server, send a SIGTERM signal to the parent process.  The most reli‐
       able way to do this from a script is to use the --pid-file option to record  its  process  ID.
       Shutting down the server in this way should allow any jobs currently in progress to complete.

OPTIONS
       --help Display summary usage information.

       --version
              Shows the daemon version and exits.

       -j, --jobs JOBS
              Sets  a  limit on the number of jobs that can be accepted at any time.  By default this
              is set to two greater than the number of CPUs on the machine, to allow  for  some  pro‐
              cesses being blocked on network IO.  (Daemon mode only.)

       -N, --nice NICENESS
              Makes  the  daemon  more  nice  about  giving up the CPU to other tasks on the machine.
              NICENESS is an increment to the current priority of the process.  The range of  priori‐
              ties depends on the operating system but is typically 0 to 20.  By default the niceness
              is increased by 5.

       -p, --port PORT
              Set the TCP port to listen on, rather than the default of 3632.  (Daemon mode only.)

       --listen ADDRESS
              Instructs the distccd daemon to listen on the IP address ADDRESS.  This can  be  useful
              for access control on dual-homed hosts.  (Daemon mode only.)

       -P, --pid-file FILE
              Save daemon process id to file FILE.  (Daemon mode only.)

       --user USER
              If distccd gets executed as root, change to user USER.

       -a, --allow IPADDR[/MASK]
              Instructs distccd to accept connections from the IP address IPADDR.  A CIDR mask length
              can be supplied optionally after a trailing slash, e.g. 192.168.0.0/24, in  which  case
              addresses  that match in the most significant MASK bits will be allowed.  If no --allow
              options are specified, distccd will exit  immediately!   Unauthorized  connections  are
              rejected  by closing the TCP connection immediately.  A warning is logged on the server
              but nothing is sent to the client.

       --job-lifetime SECONDS
              Kills a distccd job if it runs for more than SECONDS seconds. This prevents  denial  of
              service  from  clients that don't properly disconnect and compilers that fail to termi‐
              nate. By default this is turned off.

       --no-detach
              Do not detach from the shell that started the daemon.

       --no-fork
              Don't fork children for each connection, to allow attaching gdb.  Don't use this if you
              don't understand it!

       --log-file FILE
              Send  messages  to file FILE instead of syslog.  Logging directly to a file is signifi‐
              cantly faster than going via syslog and is recommended.

       --log-level LEVEL
              Set the minimum severity of error that will be included in the log file.  Useful if you
              only want to see error messages rather than an entry for each connection.  LEVEL can be
              any of the standard syslog levels, and in particular critical, error, warning,  notice,
              info, or debug.

       --log-stderr
              Send  log messages to stderr, rather than to a file or syslog.  This is mainly intended
              for use in debugging.  Do not use in inetd mode.

       --verbose
              Include debug messages in log.  Equivalent to --log-level=debug

       --wizard
              Turn on all options appropriate for starting distccd under gdb: run as  a  daemon,  log
              verbosely to stderr, and do not detach or fork.  For wizards only.

       --stats
              Turn on the statistics HTTP server. By default it is off.  (Daemon mode only.)

       --stats-port PORT
              Set  the  TCP  port  to  listen  on for HTTP requests, rather than the default of 3633.
              (Daemon mode only.)

       --inetd
              Serve a client connected to stdin/stdout.  As the name suggests, this option should  be
              used  when distccd is run from within a super-server like inetd.  distccd assumes inetd
              mode when stdin is a socket.

       --daemon
              Bind and listen on a socket, rather than running from inetd.  This is used  for  stand‐
              alone  mode.   distccd  assumes  daemon  mode at startup if stdin is a tty, so --daemon
              should be explicitly specified when starting distccd from a script or in a non-interac‐
              tive ssh connection.

       --zeroconf
              Register  the availability of this distccd server using Avahi Zeroconf DNS Service Dis‐
              covery (DNS-SD).  This allows distcc clients  on  the  local  network  to  access  this
              distccd  server  without explicitly listing its host name or IP address in their distcc
              host list: the distcc clients can just use "+zeroconf"  in  their  distcc  host  lists.
              This option is only available if distccd was compiled with Avahi support enabled.

SEARCH PATHS
       distcc  can pass either a relative or an absolute name for the compiler to distccd.  If distcc
       is given an explicit absolute compiler filename, that name is used verbatim on both the client
       and  server.   If  the compiler name is not an absolute path, or if the client is used in mas‐
       querade mode, then the server's PATH is searched.

       distccd inherits its search path from its parent process.  By default distccd tries to  remove
       directories that seem to contain distccd masquerade links, to guard against inadvertent recur‐
       sion.  The DISTCCD_PATH environment variable may be used to set the path.

       The search path is logged when --verbose is given.  In case of confusion, check the logs.

       When distccd is run over ssh, the $HOME/.ssh/environment file may be  useful  in  setting  the
       path.  See ssh(1).

DIAGNOSTICS
       distccd  logs  messages  to  syslog's  daemon  facility  by  default, which normally writes to
       /var/log/daemon or /var/log/messages.  Log messages can be sent to a different file using  the
       --log-file option.

ENVIRONMENT VARIABLES
       DISTCC_CMDLIST
              If  the  environment  variable DISTCC_CMDLIST is set, load a list of supported commands
              from the file named by DISTCC_CMDLIST, and refuse  to  serve  any  command  whose  last
              DISTCC_CMDLIST_MATCHWORDS last words do not match those of a command in that list.  See
              the comments in src/serve.c.

       DISTCC_CMDLIST_NUMWORDS
              The number of words, from the end of the command, to match. The default is 1.

       DISTCCD_PATH
              When starting distccd, if this value is set it will be used unaltered for the  command-
              execution PATH.  The code that normally tries to remove masquerade directories from the
              path is skipped.

       DISTCC_SAVE_TEMPS
              If set to 1, temporary files are not deleted after use.

       Note that DISTCC_LOG does not affect the log destination for the server.

       DISTCC_TCP_DEFER_ACCEPT
              On Linux, turn on the TCP_DEFER_ACCEPT socket option.  Defaults to on.

       TMPDIR Directory for temporary files such as preprocessor output.  By default /tmp/ is used.

SEE ALSO
       distcc(1),   distcc-pump(1),    include_server(1),    gcc(1),    make(1),    and     ccache(1)
       http://code.google.com/p/distcc/

BUGS
       IP-based  access  control  is  not secure against attackers able to spoof TCP connections, and
       cannot discriminate different users on a client.

       TCP connections are not secure against attackers able to observe or modify network traffic.

       Because ccache does not cache compilation from .i files, it is not  useful  to  call  it  from
       distccd.

LICENCE
       You  are  free  to use distcc.  distcc (including this manual) may be copied, modified or dis‐
       tributed only under the terms of the GNU General Public Licence version 2  or  later.   distcc
       comes with absolutely no warrany.  A copy of the GPL is included in the file COPYING.

AUTHOR
       distcc was written by Martin Pool <mbp@sourcefrog.net>, with the co-operation of many scholars
       including Wayne Davison, Frerich Raabe, Dimitri Papadopoulos and  others  noted  in  the  NEWS
       file.    See   distcc-pump(1)   for   the  authors  of  pump  mode.   Please  report  bugs  to
       <distcc@lists.samba.org>.

                                             9 June 2008                                   distccd(1)
