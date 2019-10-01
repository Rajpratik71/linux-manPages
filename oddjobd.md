oddjobd(8)                                                                                 System Manager's Manual                                                                                 oddjobd(8)



NAME
       oddjobd - privileged operations for unprivileged processes


SYNOPSIS
       oddjobd [-n] [-d] [-p pidfile] [-c configfile] [-S] [-t timeout]


DESCRIPTION
       The oddjobd daemon provides the com.redhat.oddjob service on the system-wide message bus.  Each facility which oddjobd provides is provided as a separate D-Bus method.

       Any method can be invoked by name by any user, subject to access controls enforced by both D-Bus and oddjobd.

       Most methods are implemented as helper programs.


OPTIONS
       -n     Do not fork and become a daemon process.

       -d     Print debugging messages to stderr.  Implies -n.

       -p pidfile
              Store the daemon's process ID in the named file.

       -c /etc/oddjobd.conf
              Read the daemon's configuration from the named file.

       -S     Connect to the session bus instead of the system bus.  Used for testing only.

       -t timeout
              Specifies  the amount of time which will pass between attempts to reconnect to the bus if oddjobd is disconnected for any reason.  If the specified timeout is above 5, then oddjobd will first
              attempt to connect up to 10 times at intervals of 5 seconds.  The default reconnect timeout is 30 seconds.


SIGNALS
       SIGHUP Reload the configuration.  Client requests which are in the process of being served will run to completion even if the newly-loaded configuration does not include the service, object,  inter‐
              face, or method.


SEE ALSO
       oddjob_request(1) oddjob.conf(5) oddjobd.conf(5)



oddjob Manual                                                                                    5 April 2006                                                                                      oddjobd(8)
