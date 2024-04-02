XINETD(8)                                                                                  System Manager's Manual                                                                                  XINETD(8)



NAME
       xinetd - the extended Internet services daemon

SYNOPSIS
       xinetd [options]

DESCRIPTION
       xinetd  performs  the same function as inetd: it starts programs that provide Internet services.  Instead of having such servers started at system initialization time, and be dormant until a connec-
       tion request arrives, xinetd is the only daemon process started and it listens on all service ports for the services listed in its configuration file. When a request  comes  in,  xinetd  starts  the
       appropriate server.  Because of the way it operates, xinetd (as well as inetd) is also referred to as a super-server.

       The  services  listed in xinetd's configuration file can be separated into two groups.  Services in the first group are called multi-threaded and they require the forking of a new server process for
       each new connection request.  The new server then handles that connection.  For such services, xinetd keeps listening for new requests so that it can spawn new servers.  On the other hand, the  sec-
       ond group includes services for which the service daemon is responsible for handling all new connection requests.  Such services are called single-threaded and xinetd will stop handling new requests
       for them until the server dies.  Services in this group are usually datagram-based.

       So far, the only reason for the existence of a super-server was to conserve system resources by avoiding to fork a lot of processes which might be dormant for most of their lifetime.  While fulfill-
       ing  this  function,  xinetd takes advantage of the idea of a super-server to provide features such as access control and logging.  Furthermore, xinetd is not limited to services listed in /etc/ser-
       vices.  Therefore, anybody can use xinetd to start special-purpose servers.

OPTIONS
       -d     Enables debug mode. This produces a lot of debugging output, and it makes it possible to use a debugger on xinetd.

       -syslog syslog_facility
              This option enables syslog logging of xinetd-produced messages using the specified syslog facility.  The following facility names are supported: daemon, auth,  user,  local[0-7]  (check  sys-
              log.conf(5) for their meanings).  This option is ineffective in debug mode since all relevant messages are sent to the terminal.

       -filelog logfile
              xinetd-produced messages will be placed in the specified file.  Messages are always appended to the file.  If the file does not exist, it will be created.  This option is ineffective in debug
              mode since all relevant messages are sent to the terminal.

       -f config_file
              Determines the file that xinetd uses for configuration. The default is /etc/xinetd.conf.

       -pidfile pid_file
              The process ID is written to the file. This option is ineffective in debug mode.

       -dontfork
              Tells xinetd to stay in the foreground rather than detaching itself, to support being run from init or daemontools. This option automatically sets -stayalive (see below).

       -stayalive
              Tells xinetd to stay running even if no services are specified.

       -limit proc_limit
              This option places a limit on the number of concurrently running processes that can be started by xinetd.  Its purpose is to prevent process table overflows.

       -logprocs limit
              This option places a limit on the number of concurrently running servers for remote userid acquisition.

       -version
              This option causes xinetd to print out its version information.

       -inetd_compat
              This option causes xinetd to read /etc/inetd.conf in addition to the standard xinetd config files.  /etc/inetd.conf is read after the standard xinetd config files.

       -cc interval
              This option instructs xinetd to perform periodic consistency checks on its internal state every interval seconds.

       The syslog and filelog options are mutually exclusive.  If none is specified, the default is syslog using the daemon facility.  You should not confuse xinetd messages with messages related  to  ser-
       vice logging. The latter are logged only if this is specified via the configuration file.

CONTROLLING XINETD
       xinetd performs certain actions when it receives certain signals.  The actions associated with the specific signals can be redefined by editing config.h and recompiling.

       SIGHUP         causes  a  hard  reconfiguration,  which means that xinetd re-reads the configuration file and terminates the servers for services that are no longer available. Access control is per-
                      formed again on running servers by checking the remote location, access times and server instances. If the number of server instances is lowered, some arbitrarily picked servers  will
                      be  killed to satisfy the limit; this will happen after any servers are terminated because of failing the remote location or access time checks.  Also, if the INTERCEPT flag was clear
                      and is set, any running servers for that service will be terminated; the purpose of this is to ensure that after a hard reconfiguration there will  be  no  running  servers  that  can
                      accept packets from addresses that do not meet the access control criteria.

       SIGQUIT        causes program termination.

       SIGTERM        terminates all running servers before terminating xinetd.

       SIGUSR1        causes an internal state dump (the default dump file is /var/run/xinetd.dump; to change the filename, edit config.h and recompile).

       SIGIOT         causes  an  internal consistency check to verify that the data structures used by the program have not been corrupted.  When the check is completed xinetd will generate a message that
                      says if the check was successful or not.

       On reconfiguration the log files are closed and reopened. This allows removal of old log files.

FILES
       /etc/xinetd.conf    default configuration file
       /var/run/xinetd.dump
                           default dump file

SEE ALSO
       inetd(8),

       xinetd.conf(5),

       xinetd.log(5)

       http://cr.yp.to/daemontools.html

AUTHOR
       Panos Tsirigotis, CS Dept, University of Colorado, Boulder Rob Braun

PRONUNCIATION
       zy-net-d




                                                                                                 14 June 2001                                                                                       XINETD(8)
