HAPROXY(1)                                                                                 General Commands Manual                                                                                 HAPROXY(1)



NAME
       HAProxy - fast and reliable http reverse proxy and load balancer


SYNOPSIS
       haproxy  -f  <configuration file>  [-L <name>]  [-n maxconn]  [-N maxconn]  [-C <dir>]  [-v|-vv]  [-d]  [-D]  [-q]  [-V]  [-c]  [-p <pidfile>] [-dk] [-ds] [-de] [-dp] [-db] [-dM[<byte>]] [-m <megs>]
       [{-sf|-st} pidlist...]


DESCRIPTION
       HAProxy is a TCP/HTTP reverse proxy which is particularly suited for high availability environments. Indeed, it can:
        - route HTTP requests depending on statically assigned cookies ;
        - spread the load among several servers while assuring server
          persistence through the use of HTTP cookies ;
        - switch to backup servers in the event a main one fails ;
        - accept connections to special ports dedicated to service
          monitoring ;
        - stop accepting connections without breaking existing ones ;
        - add/modify/delete HTTP headers both ways ;
        - block requests matching a particular pattern ;
        - hold clients to the right application server depending on
          application cookies
        - report detailed status as HTML pages to authenticated users from an
          URI intercepted from the application.

       It needs very little resource. Its event-driven architecture allows it to easily handle thousands of simultaneous connections on hundreds of instances without risking the system's stability.


OPTIONS
       -f <configuration file>
              Specify configuration file path.


       -L <name>
              Set the local instance's peer name. Peers are defined in the peers configuration section and used for syncing stick tables between different instances. If this option is  not  specified,  the
              local hostname is used as peer name.


       -n <maxconn>
              Set the high limit for the total number of simultaneous connections.


       -N <maxconn>
              Set the high limit for the per-listener number of simultaneous connections.


       -C <dir>
              Change directory to <dir> before loading any files.


       -v     Display HAProxy's version.


       -vv    Display HAProxy's version and all build options.


       -d     Start  in  foreground  with debugging mode enabled.  When the proxy runs in this mode, it dumps every connections, disconnections, timestamps, and HTTP headers to stdout. This should NEVER be
              used in an init script since it will prevent the system from starting up.


       -D     Start in daemon mode.


       -Ds    Start in systemd daemon mode, keeping a process in foreground.


       -q     Disable messages on output.


       -V     Displays messages on output even when -q or 'quiet' are specified. Some information about pollers and config file are displayed during startup.


       -c     Only checks config file and exits with code 0 if no error was found, or exits with code 1 if a syntax error was found.


       -p <pidfile>
              Ask the process to write down each of its children's pids to this file in daemon mode.


       -dk    Disable use of kqueue(2). kqueue(2) is available only on BSD systems.


       -ds    Disable use of speculative epoll(7). epoll(7) is available only on Linux 2.6 and some custom Linux 2.4 systems.


       -de    Disable use of epoll(7). epoll(7) is available only on Linux 2.6 and some custom Linux 2.4 systems.


       -dp    Disables use of poll(2). select(2) might be used instead.


       -dS    Disables use of splice(2), which is broken on older kernels.


       -db    Disables background mode (stays in foreground, useful for debugging).  For debugging, the '-db' option is very useful as it temporarily disables daemon mode and multi-process mode.  The  ser‐
              vice can then be stopped by simply pressing Ctrl-C, without having to edit the config nor run full debug.


       -dM[<byte>]
              Initializes all allocated memory areas with the given <byte>. This makes it easier to detect bugs resulting from uninitialized memory accesses, at the expense of touching all allocated memory
              once. If <byte> is not specified, it defaults to 0x50 (ASCII 'P').


       -m <megs>
              Enforce a memory usage limit to a maximum of <megs> megabytes.


       -sf <pidlist>
              Send FINISH signal to the pids in pidlist after startup. The processes which receive this signal will wait for all sessions to finish before exiting. This option must be specified last,  fol‐
              lowed by any number of PIDs. Technically speaking, SIGTTOU and SIGUSR1 are sent.


       -st <pidlist>
              Send TERMINATE signal to the pids in pidlist after startup. The processes which receive this signal will wait immediately terminate, closing all active sessions. This option must be specified
              last, followed by any number of PIDs. Technically speaking, SIGTTOU and SIGTERM are sent.


LOGGING
       Since HAProxy can run inside a chroot, it cannot reliably access /dev/log.  For this reason, it uses the UDP protocol to send its logs to the server, even if it is the local server. People who expe‐
       rience  trouble  receiving  logs should ensure that their syslog daemon listens to the UDP socket.  Several Linux distributions which ship with syslogd from the sysklogd package have UDP disabled by
       default. The -r option must be passed to the daemon in order to enable UDP.


SIGNALS
       Some signals have a special meaning for the haproxy daemon. Generally, they are used between daemons and need not be used by the administrator.

       - SIGUSR1
              Tells the daemon to stop all proxies and exit once all sessions are closed. It is often referred to as the "soft-stop" signal.

       - SIGTTOU
              Tells the daemon to stop listening to all sockets. Used internally by -sf and -st.

       - SIGTTIN
              Tells the daemon to restart listening to all sockets after a SIGTTOU. Used internally when there was a problem during hot reconfiguration.

       - SIGINT and SIGTERM
              Both signals can be used to quickly stop the daemon.

       - SIGHUP
              Dumps the status of all proxies and servers into the logs. Mostly used for trouble-shooting purposes.

       - SIGQUIT
              Dumps information about memory pools on stderr. Mostly used for debugging purposes.

       - SIGPIPE
              This signal is intercepted and ignored on systems without MSG_NOSIGNAL.


SEE ALSO
       A much better documentation can be found in configuration.txt. On Debian systems, you can find this file in /usr/share/doc/haproxy/configuration.txt.gz.


AUTHOR
       HAProxy was written by Willy Tarreau. This man page was written by Arnaud Cornet and Willy Tarreau.




                                                                                                17 August 2007                                                                                     HAPROXY(1)
