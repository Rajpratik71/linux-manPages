DOSCAN(1)                                                                                                                                DOSCAN(1)

NAME
       doscan - Denial Of Service Capable Auditing of Networks

SYNOPSIS
       doscan options prefix...

DESCRIPTION
       doscan is a tool to discover TCP services ony our network.  It is designed for scanning a single ports on a large network.  (There are bet‐
       ter tools for scanning many ports on a small set of hosts, for example nmap(8).)

       The prefix parameter instructs doscan to scan all addresses in this prefix.  Prefix notation is, as usual, A.B.C.D/L, where A.B.C.D  is  an
       IP address in dotted-quad notation, and L is a prefix length from 1 to 32.  If the /L part is omitted, /32 is assumed (and a single host is
       scanned).

       doscan uses a random scatter technology to distribute the load across the network.  Within a given prefix, hosts are  not  scanned  sequen‐
       tially,  but  in  a random-looking, but reproducible order.  As a result, doscan will not stress-test the network edge (just the next hop).
       (The prefixes themselves are scanned in order.)

OPTIONS
       The --port option is mandatory, all other options are optional.

       -a timeout, --add-timeout timeout
       -A count, --add-burst count
              These options specify the timeout (in milliseconds) before new connections are added, and the number of new connections or hosts  to
              add  in  one  burst.   Each  timeout  millisecond, count new hosts are contacted.  (The per-host timeout controlled by the --timeout
              option is independent.  It specifies the timeout once the first packet has been sent.)

       -b count, --banner count
              doscan reads at most count bytes from the remote host.  The exact effect of this option varies among protocol modules, see the  PRO‐
              TOCOL MODULES section for details.

       -c count, --connections count
              At  most count connections are established in parallel. See CAVEATS below for problems resulting from system file descriptor limits,
              and instructions for choosing this parameter.  By default, at most 50 parallel connections are established.

       -E, --no-epoll
              Do not use the epoll kernel interface even if it's available (useful for debugging).

       -f, --file name
              doscan reads prefixes from the file name, in addition to the command line.  The file shall contain one prefix  per  line.   See  the
              DESCRIPTION section above for the prefix format.  To better distribute scanning of long prefix lists, all prefixies are reorded ran‐
              domly if the --file option is used.

       -i, --indicator
              Display a progress indicator.  If doscan is invoked with this option, the number of connections which have been established so  far,
              the  total number of addresses to be scanned, the number of currently active connections, and the number of hosts for which a report
              entry has been generated are displayed periodically.

       -n, --net-errors
              Instructs doscan to report network errors even if they prevent a connection.  Normally, such errors are suppressed.

       -o format, --output format
              This option changes the format which doscan uses to report its findings.  See the OUTPUT FORMAT section below for details.

       -p port, --port port
              The --port option controls to which TCP port doscan connects when scanning a host.

       --protocol Istring, -P Istring
              Chooses the protocol module string.  See the PROTOCOL MODULES section for information on available protocol modules.

       --send string, -s string
       --receive regexp, -r regexp
              The effects of these options depend on the protocol module.  See the PROTOCOL MODULES section for details.

       --style style, -S style
              This option controls the output style.  See the OUTPUT FORMAT section for details.

       -t timeout, --timeout timeout
              This option sets the connect timeout to timeout milliseconds.  If this time passes without a  successfully  established  connection,
              doscan skips the hosts.

       -v, --verbose
              Turn on additional reporting to standard error.

       -h, --help
              Display help message and exit.

       -V, --version
              Output version information and exit.

PROTOCOL MODULES
       doscan supports several protocol modules.  By default, the generic tcp module is used, but you can choose another module using the --proto‐
       col option.  The effect of the --banner, --send and --receive options depends on the protocol module.  Available modules include:

       http   This module causes doscan to connect to HTTP servers, send a request, and collect the server identification from the response.

              The --banner option specifies the maximum receive buffer size.  It defaults to 4000 bytes.

              The --send option specifies the request that is send to the server.  The string can include C escape sequences to send control char‐
              acters.   By default, the request GET / HTTP/1.0\r\n\r\n (that is, GET / HTTP/1.0 followed by the four characters CR, LF, CR, LF) is
              sent.

              The --receive option is not supported by this protocol module.

       http_proxy
              This protocol module probes hosts for open HTTP proxies.  The --port  option  controls  the  port  that  is  probed.   The  required
              --receive option must be an integer in the range from 1 to 65534, the number specifies the port on which doscan listens for the con‐
              nections from open proxies.  The required --send option specifies the HTTP request method, either "GET" or "CONNECT".

              The --banner option is not supported by this protocol module.

              Warning: In the worst case, the amount of file descriptors is slightly more than twice the number of parallel connections  given  by
              the  --connections  options.   The additional file descriptors are used by doscan's HTTP server component to process the connections
              from open proxies.

              See the EXAMPLES section for some convenient combinations of those otions.

       ident_check
              This protocol module reports hosts which have TCP service listening on the specified port which is not a proper  IDENT/AUTH  daemon.
              It is most useful with a --port 113 command line argument.  None of the --banner, --receive and --send options are supported.

       tcp    This module is intended for generic TCP service probing and fingerprinting.

              The  --banner option controls the maximum length of banner strings which are collected.  If its argument is zero or if the option is
              not specified, no banner strings are collected.  In this case, doscan closes connections immediately after  they  have  been  estab‐
              lished (which results in an increased scanning rate).

              After establishing a connection, doscans sends the string specified by the --send option to the remote host.  The string can contain
              the usual C escape sequences (including \000), to send non-printable characters.

              The --receive option specifies a Perl-compatible regular expression (PCRE), and doscan uses it to analyze the  data  returned  by  a
              remote  host.   The  regular expression may contain at least one capturing subpattern, it is always anchored at the beginning of the
              received data. The character .  (period) matches all characters (including newline).  $ (dollar sign) matches the very  end  of  the
              received data (which may, however, still be incomplete).  See pcrepattern(3) for details about the syntax of Perl-compatible regular
              expression.

              The --receive regular expression is used by doscan for several purposes.  If data is received from a remote host, and if the regular
              expression  ends with $, doscan immediately closes the connection if all the data received so far from this host matches the regular
              expression.  (doscan assumes that the reply is complete; increased scanning speed is the result.)  When a connection  is  terminated
              for any reason, doscan checks if the regular expression matches the collected data.  If it doesn't, a no match error is recorded (if
              no other error occured).  If it does, and the regular expression contains a capturing subpattern, that subpattern is recorded.  Oth‐
              erwise, the whole data is recorded.

              In order to use the --receive option, you have to specify the --banner option as well.

       udp    This module is a generic UDP scanner, as far such a thing is possible.  It sends up to five UDP packets (whose payload is controlled
              by the mandatory --send option) to the specified port.  Replies are collected.  The --banner option is implicit and set to the maxi‐
              mum payload size. Retransmission is stopped when the first reply is received.

              In  verbose  mode  (with  both --verbose and --net-errors options), a warning like "stray UDP packet from 192.0.2.4:7" is printed to
              standard error when an unexpected UDP packets is received.  Packets to sent to network or broadcast adresses trigger  such  packets,
              and poorly implemented UDP services on multi-homed machines answer with a different source IP address.

OUTPUT FORMAT
       doscan  prints  all  gathered data about scanned prefixes to standard output, just before the program terminates.  The output format can be
       changed with the --output option.  The format argument of this option is a string which includes % substitions, similar to printf(3).   The
       following substitions are supported

       %%     A literal percent character.

       %a     The address of the remote host.

       %b     The banner return by the host.

       %e     The error code as a string, empty if no error occurred while scanning the host.

              This  is either a system error constant (such as ECONNREFUSED), or the string unknown (unknown error code).  If the --receive option
              is active and the received data does not match the specified regular expresion, and no other error has occured, the column  contains
              no match.

       %E     The  numeric error code corresponding to the %e error message, or zero if no error occurred.  Negativ error numbers are returned for
              internal errors (such as a failed match against the --receive regular expression).

       %n     The host name corresponding to the scanned IP address (based on a DNS lookup).  Note that this slows down reporting a lot,  in  gen‐
              eral.  For this reason, it is not recommended to use %n together with --style unsorted.

       %N     A verbatim ASCII LF (newline) character.

       %r     The time when the information was gathered, measured in seconds since the scanning started.

       %t     The time when the information was gathered, in local time.

       %T     Same as %t, but in UTC (also known as GMT).

       %%     A verbatim percent sign (%).

       The default value for the --output option is %T\t%a\t%e\t%b, where \t denotes an ASCII HTAB character.

       The --style or -S option supports the following arguments:

       sort-by-host
              The output is sorted by the IP address of the scanned host. (This is the default.)

       unsorted
              The output is not sorted and appears in the order the hosts responded.

              Caution:  Do  not  use  this  style  together with an --output argument which includes %n, and do not pipe the output of doscan to a
              process which cannot read its standard input quickly.  Output is performed synchronously, and if it is delayed,  this  might  impact
              the scanning activity.

       In all cases except unsorted, output is delayed just before the termination of the program.

EXAMPLES
              doscan --banner 100 --port 13 192.0.2.1

       Prints the time on the host 192.0.2.1 (if it runs a daytime server).

              doscan --banner 100 --receive '(.*)\n$' --port 22 192.0.2.0/24

       Scan for SSH servers and record the banners (usually containing version information about the SSH server).

              doscan --banner 200 --receive '(.*?)\r?\n$' --port 25 192.0.2.0/24

       Scan for SMTP servers and record their greeting messages.  Works for FTP as well, with --port 21 instead of --port 25.

              doscan --banner 2000 --send 'GET / HTTP/1.0\r\n\r\n' \
                 --receive '.*?\nServer: *([^\r\n]*) *\r?\n.*$' \
                 --port 80 192.0.2.0/24

       Scan for HTTP servers and record their version strings.

              doscan --protocol http_proxy --port 3128 \
                 --send GET --receive 80 192.0.2.0/24

       Scan for open proxies on TCP port 3128, using the GET HTTP request method.  Try to connect back to port 80 on the scanning host.

       It  is  recommended  that  you use port 80 for the listening port if you scan using GET requests.  For CONNECT requests, port 443 should be
       used (see below).  Some administrators might restrict CONNECT to TCP port 443 (or filter it for the GET request method), so  these  choices
       give best results.

              doscan --protocol http_proxy --port 8080 \
                 --send CONNECT --receive 443 192.0.2.0/24

       Scan for open proxies on TCP port 8080, using the CONNECT HTTP request method.  Try to connect back to port 443 on the scanning host.

CAVEATS
       The most important option for tuning is --connections.  Increasing this option can greatly increase scanning performance.  However, there a
       two caveats: Many connections require many sockets, and your system might not support so many of them.  Furthermore, a large number of par‐
       allel connections generates significant numbers of packets, and a high CPU load, which can both lead to spurious connection failures (false
       negatives).

       To increase the number of connections your system can process, you usually have to raise the corresponding  ulimit  value  in  your  shell,
       which requires root privileges.  For example, in bash(1), you can invoke

              ulimit -n 10030

       to  raise  the  descriptor limit to 10030.  You can then pass --connections 10000 to doscan.  (Some file descriptors are not used for scan‐
       ning, but have to be open nonetheless, and count towards the ulimit -n limit.)

       On Linux-based systems, you might have to adjust some sysctl values which control system-wide descriptor limits.  Refer to  sysctl.conf(5),
       the Documentation directory in the Linux source tree, or the source code itself for details.

       Note,  however, that if you increase the number of parallel connections beyond a certain value, you will lose some hosts, that is they will
       not be reported even though they are running a service on the scanned port.  Therefore, you should watch both network and  CPU  utilization
       to  detect  bottlenecks.   Although the random scatter technique employed by doscan tries to split the load across your whole network, this
       obviously fails if the next hop cannot bear the traffic.

AUTHOR
       doscan was written by Florian Weimer.

SEE ALSO
       nmap(8), pcrepattern(3), sysctl.conf(5) (on GNU/Linux systems), shell documentation for the ulimit interface

                                                                    2003-07-27                                                           DOSCAN(1)
