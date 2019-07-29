SSLH(8)                                                                                                                                    SSLH(8)

NAME
        sslh - protocol demultiplexer

SYNOPSIS
       sslh [-F config file] [ -t num ] [--transparent] [-p listening address [-p listening address ...] [--ssl target address for SSL] [--ssh
       target address for SSH] [--openvpn target address for OpenVPN] [--http target address for HTTP] [--anyprot default target address]
       [--on-timeout protocol name] [-u username] [-P pidfile] [-v] [-i] [-V] [-f] [-n]

DESCRIPTION
       sslh accepts connections on specified ports, and forwards them further based on tests performed on the first data packet sent by the remote
       client.

       Probes for HTTP, SSL, SSH, OpenVPN, tinc, XMPP are implemented, and any other protocol that can be tested using a regular expression, can
       be recognised. A typical use case is to allow serving several services on port 443 (e.g. to connect to ssh from inside a corporate
       firewall, which almost never block port 443) while still serving HTTPS on that port.

       Hence sslh acts as a protocol demultiplexer, or a switchboard. Its name comes from its original function to serve SSH and HTTPS on the same
       port.

   Libwrap support
       One drawback of sslh is that the servers do not see the original IP address of the client anymore, as the connection is forwarded through
       sslh.

       For this reason, sslh can be compiled with libwrap to check accesses defined in /etc/hosts.allow and /etc/hosts.deny.  Libwrap services can
       be defined using the configuration file.

   Configuration file
       A configuration file can be supplied to sslh. Command line arguments override file settings. sslh uses libconfig to parse the configuration
       file, so the general file format is indicated in <http://www.hyperrealm.com/libconfig/libconfig_manual.html>.  Please refer to the example
       configuration file provided with sslh for the specific format (Options have the same names as on the command line, except for the list of
       listen ports and the list of protocols).

       The configuration file makes it possible to specify protocols using regular expressions: a list of regular expressions is given as the
       regex_patterns parameter, and if the first packet received from the client matches any of these expressions, sslh connects to that
       protocol.

   Probing protocols
       When receiving an incoming connection, sslh will read the first bytes sent be the connecting client. It will then probe for the protocol in
       the order specified on the command line (or the configuration file). Therefore --anyprot should alway be used last, as it always succeeds
       and further protocols will never be tried.

       If no data is sent by the client, sslh will eventually time out and connect to the protocol specified with --on-timeout, or ssh if none is
       specified.

   Logging
       As a security/authorization program, sslh logs to the LOG_AUTH facility, with priority LOG_INFO for normal connections and LOG_ERR for
       failures.

OPTIONS
       -F filename, --config filename
           Uses filename has configuration file. If other command-line options are specified, they will override the configuration file's
           settings.

       -t num, --timeout num
           Timeout before forwarding the connection to the timeout protocol (which should usually be SSH). Default is 2s.

       --on-timeout protocol name
           Name of the protocol to connect to after the timeout period is over. Default is 'ssh'.

       --transparent
           Makes sslh behave as a transparent proxy, i.e. the receiving service sees the original client's IP address.  This works on Linux only
           and involves iptables settings.  Refer to the README for more information.

       -p listening address, --listen listening address
           Interface and port on which to listen, e.g. foobar:443, where foobar is the name of an interface (typically the IP address on which the
           Internet connection ends up).

           This can be specified several times to bind sslh to several addresses.

       --ssl target address
       --tls target address
           Interface and port on which to forward SSL connection, typically localhost:443.

           Note that you can set sslh to listen on ext_ip:443 and httpd to listen on localhost:443: this allows clients inside your network to
           just connect directly to httpd.

           Also, sslh probes for SSLv3 (or TLSv1) handshake and will reject connections from clients requesting SSLv2. This is compliant to
           RFC6176 which prohibits the usage of SSLv2. If you wish to accept SSLv2, use --default instead.

       --ssh target address
           Interface and port on which to forward SSH connections, typically localhost:22.

       --openvpn target address
           Interface and port on which to forward OpenVPN connections, typically localhost:1194.

       --xmpp target address
           Interface and port on which to forward XMPP connections, typically localhost:5222.

       --http target address
           Interface and port on which to forward HTTP connections, typically localhost:80.

       --tinc target address
           Interface and port on which to forward tinc connections, typically localhost:655.

           This is experimental. If you use this feature, please report the results (even if it works!)

       --anyprot target address
           Interface and port on which to forward if no other protocol has been found. Because sslh tries protocols in the order specified on the
           command line, this should be specified last. If no default is specified, sslh will forward unknown protocols to the first protocol
           specified.

       -v, --verbose
           Increase verboseness.

       -n, --numeric
           Do not attempt to resolve hostnames: logs will contain IP addresses. This is mostly useful if the system's DNS is slow and running the
           sslh-select variant, as DNS requests will hang all connections.

       -V  Prints sslh version.

       -u username, --user username
           Requires to run under the specified username.

       -P pidfile, --pidfile pidfile
           Specifies a file in which to write the PID of the main server.

       -i, --inetd
           Runs as an inetd server. Options -P (PID file), -p (listen address), -u (user) are ignored.

       -f, --foreground
           Runs in foreground. The server will not fork and will remain connected to the terminal. Messages normally sent to syslog will also be
           sent to stderr.

       --background
           Runs in background. This overrides foreground if set in the configuration file (or on the command line, but there is no point setting
           both on the command line unless you have a personality disorder).

FILES
       /etc/init.d/sslh
           Start-up script. The standard actions start, stop and restart are supported.

       /etc/default/sslh
           Server configuration. These are environment variables loaded by the start-up script and passed to sslh as command-line arguments. Refer
           to the OPTIONS section for a detailed explanation of the variables used by sslh.

SEE ALSO
       Last version available from <http://www.rutschle.net/tech/sslh>, and can be tracked from <http://freecode.com/projects/sslh>.

AUTHOR
       Written by Yves Rutschle

2.29-2                                                              2016-08-09                                                             SSLH(8)
