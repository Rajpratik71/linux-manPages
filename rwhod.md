
RWHOD(8)                                                    BSD System Manager's Manual                                                   RWHOD(8)

NAME
     rwhod — system status server

SYNOPSIS
     rwhod [-bpaf] [-i <if>...] [-u user]

DESCRIPTION
     Rwhod is the server which maintains the database used by the rwho(1) and ruptime(1) programs.  Its operation is predicated on the ability to
     broadcast messages on a network.

     Rwhod operates as both a producer and consumer of status information.  As a producer of information it periodically queries the state of the
     system and constructs status messages which are broadcast on a network.  As a consumer of information, it listens for other rwhod servers'
     status messages, validating them, then recording them in a collection of files located in the directory /var/spool/rwho.

     The server transmits and receives messages at the port indicated in the ``rwho'' service specification; see services(5).

     The messages sent and received, are of the form:

           struct  outmp {
                   char    out_line[8];            /* tty name */
                   char    out_name[8];            /* user id */
                   long    out_time;               /* time on */
           };

           struct  whod {
                   char    wd_vers;
                   char    wd_type;
                   char    wd_fill[2];
                   int     wd_sendtime;
                   int     wd_recvtime;
                   char    wd_hostname[32];
                   int     wd_loadav[3];
                   int     wd_boottime;
                   struct  whoent {
                           struct  outmp we_utmp;
                           int     we_idle;
                   } wd_we[1024 / sizeof (struct whoent)];
           };

     All fields are converted to network byte order prior to transmission.  The load averages are as calculated by the w(1) program, and represent
     load averages over the 5, 10, and 15 minute intervals prior to a server's transmission; they are multiplied by 100 for representation in an
     integer.  The host name included is that returned by the gethostname(2) system call, with any trailing domain name omitted.  The array at the
     end of the message contains information about the users logged in to the sending machine.  This information includes the contents of the
     utmp(5) entry for each non-idle terminal line and a value indicating the time in seconds since a character was last received on the terminal
     line.

     Messages received by the rwho server are discarded unless they originated at an rwho server's port.  In addition, if the host's name, as
     specified in the message, contains any unprintable ASCII characters, the message is discarded.  Valid messages received by rwhod are placed
     in files named whod.hostname in the directory /var/spool/rwho.  These files contain only the most recent message, in the format described
     above.

     Status messages are generated approximately once every 3 minutes.  Rwhod recomputes the system boot time every 30 minutes because on some
     (non-Linux) systems it is not a totally reliable process.

FLAGS
     If the -b flag is supplied, only broadcast interfaces, such as ethernets, will be used.  If the -p flag is supplied, only point-to-point
     interfaces will be used. If the -a flag is supplied, or no flags are supplied, all interfaces will be used.

     Alternately, you may specify interfaces by name by providing one or more -i options followed by the interface name.

     If the -u flag is supplied, rwhod will run as the specified user instead of as rwhod. The initial user until the daemon drops privileges is
     root.

     Rwhod can also forward packets between interfaces if started with -f. Please read the CAVEATS section before enabling rwhod forwarding.

CAVEATS
     While rwhod listens on any interface present on the host, it will only send (or forward) to the interfaces determined by the -a -b -p -i
     flags.

     When operating in forwarding mode (with -f ), rwhod forwards all correct rwhod packets received on an interface to all the other interfaces.
     You can create a broadcast storm if there is a loop in your network and all the routers in the loop run in forwarding mode. To prevent this
     from happenning, rwhod will shut down forwarding (and log the event to the syslog) if more than one rwhod packet is forwarded per second on
     average over the last three minutes. If this happens, you must break the loop of forwarding routers.

SEE ALSO
     rwho(1), ruptime(1)

BUGS
     Some kind of proxying feature might be useful if your router doesn't run rwhod.

     People often interpret the server dying or network communication failures as a machine going down.

     Rwhod doesn't refresh its interface list, which might be useful when using -a -b -p.

HISTORY
     The rwhod command appeared in 4.2BSD.

     Philippe Troin <phil@fifi.org> implemented forwarding and interface selection flags.

Linux NetKit (0.17)                                               March 10, 1999                                               Linux NetKit (0.17)
