REDIR(1)                               System Manager's Manual                               REDIR(1)

NAME
     redir — redirect TCP connections

SYNOPSIS
     redir [-hinpsv] [-b IP] [-f TYPE] [-I NAME] [-l LEVEL] [-m BPS] [-o <1,2,3>] [-t SEC] [-w MSEC]
           [-x HOST:PORT] [-z BYTES] [SRC]:PORT [DST]:PORT

DESCRIPTION
     redir redirects TCP connections coming in on a local port, [SRC]:PORT, to a specified
     address/port combination, [DST]:PORT.  Both the SRC and DST arguments can be left out, redir
     will then use 0.0.0.0.

     redir can be run either from inetd or as a standalone daemon.  In --inetd mode the listening
     SRC:PORT combo is handled by another process, usually inetd, and a connected socket is handed
     over to redir via stdin.  Hence only [DST]:PORT is required in --inetd mode.  In standalone mode
     redir can run either in the foreground, -n, or in the background, detached like a proper UNIX
     daemon.  This is the default.  When running in the foreground log messages are also printed to
     stderr, unless the -s flag is given.

     Depending on how redir was compiled, not all options may be available.

OPTIONS
     Mandatory arguments to long options are mandatory for short options too.

     -b, --bind=IP
             Forces redir to pick a specific address/interface to bind to when it listens for incom‐
             ing connections.

     -h, --help
             Show built-in help text.

     -f, --ftp=TYPE
             When using redir for an FTP server, this will cause redir to also redirect FTP connec‐
             tions.  Type should be specified as either "port", "pasv", or "both", to specify what
             type of FTP connection to handle.  Note that --transproxy often makes one or the other
             (generally port) undesirable.

     -i, --inetd
             Run as a process started from inetd(1), with the connection passed as stdin and stdout
             on startup.

     -I, --ident=NAME
             Specify program identity (name) to be used for TCP wrapper checks and syslog messages.

     -l, --loglevel=LEVEL
             Set log level: none, err, notice, info, debug.  Default is notice.

     -n, --foreground
             Run in foreground, do not detach from controlling terminal.

     -p, --transproxy
             On a Linux system with transparent proxying enabled, causes redir to make connections
             appear as if they had come from their true origin.  See the file transproxy.txt in the
             distribution, and the Linux Documentation/networking/tproxy.txt for details.  Untested
             on modern Linux kernels.

     -s, --syslog
             Log messages to syslog.  Default, except when -n is enabled.

     -t, --timeout=SEC
             Timeout and close the connection after SEC seconds of inactivity.

     -v      Show program version.

     -x, --connect
             Redirects connections through an HTTP proxy which supports the CONNECT command.  Specify
             the address and port of the proxy using [DST]:PORT.  --connect requires the hostname and
             port which the HTTP proxy will be asked to connect to.

TRAFFIC SHAPING
     The following options control traffic shaping, if redir is built with shaping enabled.

     -m, --max-bandwidth=BPS
             Reduce the bandwidth to be no more than BPS bits/sec.  The algorithm is basic, the goal
             is to simulate a slow connection, so there is no peak acceptance.

     -o, --wait-in-out=<1,2,3>
             Apply --max-bandwidth and --random-wait for input(1), output(2), or both(3).

     -w, --random-wait=MSEC
             Wait between 0 and 2 x n milliseconds before each "packet".  A "packet" is a block of
             data read in one time by redir.  A "packet" size is always less than the bufsize (see
             also --bufsize)

     -z, --bufsize=BYTES
             Set the bufsize (defaut 4096) in bytes.  Can be used combined with --max-bandwidth or
             --random-wait to simulate a slow connection.

BUGS
     Command line syntax changed in v3.0.  Compatibility with v2.x can be enabled using the
     --enable-compat configure option.  This enables the following options: --laddr=ADDR --lport=PORT
     --caddr=ADDR --cport=PORT which in v3.0 were been replaced with [SRC]:PORT and [DST]:PORT.

     For full compatibility, using any of these options will implicitly also enable -n.  There is
     currently no way to tell redir to background itself in this mode of operation.

SEE ALSO
     inetd(1) uredir(1)

AUTHORS
     redir is written by Nigel Metheringham and Sam Creasey, with contributions from many others.  It
     is currently being maintained at GitHub by Joachim Nilsson.

BSD                                          01 May, 2016                                         BSD
