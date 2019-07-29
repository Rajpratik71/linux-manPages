NTPD(8)                                            The Network Time Protocol (NTP) Distribution                                            NTPD(8)

NAME
       ntpd - Network Time Protocol (NTP) daemon

SYNOPSIS
       ntpd  [  -46aAbgLmnNqx  ] [ -c conffile ] [ -f driftfile ] [ -i jaildir ] [ -k keyfile ] [ -l logfile ] [ -p pidfile ] [ -P priority ] [ -r
       broadcastdelay ] [ -s statsdir ] [ -t key ] [ -u user[:group] ] [ -U interface_update_interval ] [ -v variable ] [ -V variable ]

DESCRIPTION
       The ntpd program is an operating system daemon which sets and maintains the system time of day in synchronism with Internet  standard  time
       servers.   It  is a complete implementation of the Network Time Protocol (NTP) version 4, but also retains compatibility with version 3, as
       defined by RFC-1305, and version 1 and 2, as defined by RFC-1059 and RFC-1119, respectively.  ntpd does most computations in 64-bit  float‐
       ing-point arithmetic and does relatively clumsy 64-bit fixed-point operations only when necessary to preserve the ultimate precision, about
       232 picoseconds.  While the ultimate precision is not achievable with ordinary workstations and networks of today, it may be required  with
       future gigahertz CPU clocks and gigabit LANs.

       The  daemon  can  operate  in  any of several modes, including symmetric active/passive, client/server broadcast/multicast and manycast.  A
       broadcast/multicast or manycast client can discover remote servers, compute server-client propagation delay correction factors and  config‐
       ure  itself  automatically.   This makes it possible to deploy a fleet of workstations without specifying configuration details specific to
       the local environment.

       Ordinarily, ntpd reads the ntp.conf configuration file at startup time in order to determine  the  synchronization  sources  and  operating
       modes.   It  is  also  possible to specify a working, although limited configuration entirely on the command line, obviating the need for a
       configuration file.  This may be particularly appropriate when the local host is to be configured as a broadcast/multicast client or  many‐
       cast client, with all peers being determined by listening to broadcasts at run time.

       Various  internal  ntpd  variables  can  be displayed and configuration options altered while the daemon is running using the ntpq and ntpd
       utility programs.

       When ntpd starts it looks at the value of umask, and if it is zero ntpd will set the umask to 0222.

OPTIONS
       -a     Require cryptographic authentication for broadcast client, multicast  client  and  symmetric  passive  associations.   This  is  the
              default.

       -A     Do  not  require  cryptographic  authentication  for broadcast client, multicast client and symmetric passive associations.  This is
              almost never a good idea.

       -b     Enable the client to synchronize to broadcast servers.

       -c conffile
              Specify the name and path of the configuration file, default /etc/ntp.conf.

       -f driftfile
              Specify the name and path of the frequency file, default /etc/ntp.drift.  This is the same operation as the driftfile driftfile con‐
              figuration command.

       -g     Normally,  ntpd  exits with a message to the system log if the offset exceeds the panic threshold, which is 1000 s by default.  This
              option allows the time to be set to any value without restriction; however, this can happen only once.  If the threshold is exceeded
              after that, ntpd will exit with a message to the system log.  This option can be used with the -q and -x options.

       -i jaildir
              Chroot  the  server  to the directory jaildir.  This option also implies that the server attempts to drop root privileges at startup
              (otherwise, chroot gives very little additional security).  You may need to also specify a -u option.

       -I [address | interface name]
              Open the network address given, or all the addresses associated with the given interface name.   This  option  may  appear  multiple
              times.   This  option  also  implies not opening other addresses, except wildcard and localhost.  This option is deprecated.  Please
              consider using the configuration file interface command, which is more versatile.

       -k keyfile
              Specify the name and path of the symmetric key file, default /etc/ntp.keys.  This is the same operation as the keys keyfile configu‐
              ration command.

       -l logfile
              Specify  the  name and path of the log file.  The default is the system log file.  This is the same operation as the logfile logfile
              configuration command.

       -L     Do not listen to virtual IPs.  The default is to listen.

       -n     Don't fork.

       -N     To the extent permitted by the operating system, run the ntpd at the highest priority.

       -p pidfile
              Specify the name and path of the file used to record the ntpd process ID.  This is the same operation as the pidfile pidfile config‐
              uration command.

       -P priority
              To the extent permitted by the operating system, run the ntpd at the specified priority.

       -q     Exit the ntpd just after the first time the clock is set.  This behavior mimics that of the ntpdate program, which is to be retired.
              The -g and -x options can be used with this option.  Note: The kernel time discipline is disabled with this option.

       -r broadcastdelay
              Specify the default propagation delay from the broadcast/multicast server to this client.  This is necessary only if the delay  can‐
              not be computed automatically by the protocol.

       -s statsdir
              Specify  the  directory path for files created by the statistics facility.  This is the same operation as the statsdir statsdir con‐
              figuration command.

       -t key Add a key number to the trusted key list.  This option can occur more than once.

       -u user[:group]
              Specify a user, and optionally a group, to switch to.

       -U interface_update_interval
              Number of seconds to wait between interface list scans to pick up new and delete network interface.  Set to  0  to  disable  dynamic
              interface list updating.  The default is to scan every 5 minutes.

       -v variable, -V variable
              Add a system variable listed by default.

       -x     Normally,  the  time  is  slewed if the offset is less than the step threshold, which is 128 ms by default, and stepped if above the
              threshold.  This option sets the threshold to 600 s, which is well within the accuracy window to  set  the  clock  manually.   Note:
              Since  the  slew rate of typical Unix kernels is limited to 0.5 ms/s, each second of adjustment requires an amortization interval of
              2000 s.  Thus, an adjustment as much as 600 s will take almost 14 days to complete.  This option can be used  with  the  -g  and  -q
              options.  Note: The kernel time discipline is disabled with this option.

       -4     Force IPv4 DNS name resolution.

       -6     Force IPv6 DNS name resolution.

FILES
       /etc/ntp.conf
              default name of the configuration file

       /etc/ntp.drift
              default name of the drift file

SEE ALSO
       ntp.conf(5), ntpdate(8)

       The complete documentation can be found at /usr/share/doc/ntp-doc/html/ntpd.html in the package ntp-doc.

Debian                                                              2007-12-07                                                             NTPD(8)
