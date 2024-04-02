stunnel(8)                                                       stunnel TLS Proxy                                                      stunnel(8)

NAME
       stunnel - TLS offloading and load-balancing proxy

SYNOPSIS
       Unix:
           stunnel [FILE] | -fd N | -help | -version | -sockets | -options

       WIN32:
           stunnel [ [ -install | -uninstall | -start | -stop |
               -reload | -reopen | -exit ] [-quiet] [FILE] ] |
               -help | -version | -sockets | -options

DESCRIPTION
       The stunnel program is designed to work as SSL encryption wrapper between remote clients and local (inetd-startable) or remote servers. The
       concept is that having non-SSL aware daemons running on your system you can easily set them up to communicate with clients over secure SSL
       channels.

       stunnel can be used to add SSL functionality to commonly used Inetd daemons like POP-2, POP-3, and IMAP servers, to standalone daemons like
       NNTP, SMTP and HTTP, and in tunneling PPP over network sockets without changes to the source code.

       This product includes cryptographic software written by Eric Young (eay@cryptsoft.com)

OPTIONS
       FILE
           Use specified configuration file

       -fd N (Unix only)
           Read the config file from specified file descriptor

       -help
           Print stunnel help menu

       -version
           Print stunnel version and compile time defaults

       -sockets
           Print default socket options

       -options
           Print supported SSL options

       -install (Windows NT and later only)
           Install NT Service

       -uninstall (Windows NT and later only)
           Uninstall NT Service

       -start (Windows NT and later only)
           Start NT Service

       -stop (Windows NT and later only)
           Stop NT Service

       -reload (Windows NT and later only)
           Reload the configuration file of the running NT Service

       -reopen (Windows NT and later only)
           Reopen the log file of the running NT Service

       -exit (Win32 only)
           Exit an already started stunnel

       -quiet (Win32 only)
           Don't display any message boxes

CONFIGURATION FILE
       Each line of the configuration file can be either:

       ·   An empty line (ignored).

       ·   A comment starting with ';' (ignored).

       ·   An 'option_name = option_value' pair.

       ·   '[service_name]' indicating a start of a service definition.

       An address parameter of an option may be either:

       ·   A port number.

       ·   A colon-separated pair of IP address (either IPv4, IPv6, or domain name) and port number.

       ·   A Unix socket path (Unix only).

   GLOBAL OPTIONS
       chroot = DIRECTORY (Unix only)
           directory to chroot stunnel process

           chroot keeps stunnel in a chrooted jail.  CApath, CRLpath, pid and exec are located inside the jail and the patches have to be relative
           to the directory specified with chroot.

           Several functions of the operating system also need their files to be located within the chroot jail, e.g.:

           ·   Delayed resolver typically needs /etc/nsswitch.conf and /etc/resolv.conf.

           ·   Local time in log files needs /etc/timezone.

           ·   Some other functions may need devices, e.g. /dev/zero or /dev/null.

       compression = deflate | zlib
           select data compression algorithm

           default: no compression

           deflate is the standard compression method as described in RFC 1951.

           zlib compression of OpenSSL 0.9.8 or above is not backward compatible with OpenSSL 0.9.7.

       debug = [FACILITY.]LEVEL
           debugging level

           Level is one of the syslog level names or numbers emerg (0), alert (1), crit (2), err (3), warning (4), notice (5), info (6), or debug
           (7).  All logs for the specified level and all levels numerically less than it will be shown.  Use debug = debug or debug = 7 for
           greatest debugging output.  The default is notice (5).

           The syslog facility 'daemon' will be used unless a facility name is supplied.  (Facilities are not supported on Win32.)

           Case is ignored for both facilities and levels.

       EGD = EGD_PATH (Unix only)
           path to Entropy Gathering Daemon socket

           Entropy Gathering Daemon socket to use to feed the OpenSSL random number generator.  (Available only if compiled with OpenSSL 0.9.5a or
           higher)

       engine = auto | ENGINE_ID
           select hardware engine

           default: software-only cryptography

           An example of advanced engine configuration to use the certificate and the corresponding private key from an OpenSC PKCS#11 engine:

               engine = dynamic
               engineCtrl = SO_PATH:/usr/local/lib/engines/libpkcs11.so
               engineCtrl = LOAD
               engineCtrl = MODULE_PATH:opensc-pkcs11.so
               engineCtrl = PIN:123456

               [service]
               engineId = pkcs11
               cert = id_45

       engineCtrl = COMMAND[:PARAMETER]
           control hardware engine

           A special command "LOAD" can be used to load engine cryptographic module.

       engineDefault = TASK_LIST
           set OpenSSL tasks delegated to the current engine

           The parameter specifies a comma-separated list of task to be delegated to the current engine.

           The following tasks may be available, if supported by the engine: ALL, RSA, DSA, ECDH, ECDSA, DH, RAND, CIPHERS, DIGESTS, PKEY,
           PKEY_CRYPTO, PKEY_ASN1.

       fips = yes | no
           Enable or disable FIPS 140-2 mode.

           This option allows you to disable entering FIPS mode if stunnel was compiled with FIPS 140-2 support.

           default: no (since version 5.00)

       foreground = yes | quiet | no (Unix only)
           foreground mode

           Stay in foreground (don't fork).

           With the yes parameter it also logs to stderr in addition to the destinations specified with syslog and output.

           default: background in daemon mode

       iconActive = ICON_FILE (GUI only)
           GUI icon to be displayed when there are established connections

           On Windows platform the parameter should be an .ico file containing a 16x16 pixel image.

       iconError = ICON_FILE (GUI only)
           GUI icon to be displayed when no valid configuration is loaded

           On Windows platform the parameter should be an .ico file containing a 16x16 pixel image.

       iconIdle = ICON_FILE (GUI only)
           GUI icon to be displayed when there are no established connections

           On Windows platform the parameter should be an .ico file containing a 16x16 pixel image.

       log = append | overwrite
           log file handling

           This option allows you to choose whether the log file (specified with the output option) is appended or overwritten when opened or re-
           opened.

           default: append

       output = FILE
           append log messages to a file

           /dev/stdout device can be used to send log messages to the standard output (for example to log them with daemontools splogger).

       pid = FILE (Unix only)
           pid file location

           If the argument is empty, then no pid file will be created.

           pid path is relative to the chroot directory if specified.

       RNDbytes = BYTES
           bytes to read from random seed files

           Number of bytes of data read from random seed files.  With SSL versions less than 0.9.5a, also determines how many bytes of data are
           considered sufficient to seed the PRNG.  More recent OpenSSL versions have a builtin function to determine when sufficient randomness
           is available.

       RNDfile = FILE
           path to file with random seed data

           The SSL library will use data from this file first to seed the random number generator.

       RNDoverwrite = yes | no
           overwrite the random seed files with new random data

           default: yes

       service = SERVICE (Unix only)
           stunnel service name

           The specified service name is used for syslog and as the inetd mode service name for TCP Wrappers.  While this option can technically
           be specified in the service sections, it is only useful in global options.

           default: stunnel

       socket = a|l|r:OPTION=VALUE[:VALUE]
           Set an option on the accept/local/remote socket

           The values for the linger option are l_onof:l_linger.  The values for the time are tv_sec:tv_usec.

           Examples:

               socket = l:SO_LINGER=1:60
                   set one minute timeout for closing local socket
               socket = r:SO_OOBINLINE=yes
                   place out-of-band data directly into the
                   receive data stream for remote sockets
               socket = a:SO_REUSEADDR=no
                   disable address reuse (enabled by default)
               socket = a:SO_BINDTODEVICE=lo
                   only accept connections on loopback interface

       syslog = yes | no (Unix only)
           enable logging via syslog

           default: yes

       taskbar = yes | no (WIN32 only)
           enable the taskbar icon

           default: yes

   SERVICE-LEVEL OPTIONS
       Each configuration section begins with a service name in square brackets.  The service name is used for libwrap (TCP Wrappers) access
       control and lets you distinguish stunnel services in your log files.

       Note that if you wish to run stunnel in inetd mode (where it is provided a network socket by a server such as inetd, xinetd, or tcpserver)
       then you should read the section entitled INETD MODE below.

       accept = [HOST:]PORT
           accept connections on specified address

           If no host specified, defaults to all IPv4 addresses for the local host.

           To listen on all IPv6 addresses use:

               accept = :::PORT

       CApath = DIRECTORY
           Certificate Authority directory

           This is the directory in which stunnel will look for certificates when using the verify option.  Note that the certificates in this
           directory should be named XXXXXXXX.0 where XXXXXXXX is the hash value of the DER encoded subject of the cert.

           The hash algorithm has been changed in OpenSSL 1.0.0.  It is required to c_rehash the directory on upgrade from OpenSSL 0.x.x to
           OpenSSL 1.x.x.

           CApath path is relative to the chroot directory if specified.

       CAfile = CERT_FILE
           Certificate Authority file

           This file contains multiple CA certificates, used with the verify option.

       cert = PEM_FILE
           certificate chain PEM file name

           The certificates must be in PEM format, and must be from the actual server/client certificate to the self-signed root CA certificate.

           A certificate is required in server mode, and optional in client mode.

           This parameter is also used as the certificate identifier when a hardware engine is enabled.

       checkEmail = EMAIL
           email address of the peer certificate subject

           Multiple checkEmail options are allowed in a single service section.  Certificates are accepted if no checkEmail option was specified,
           or the email address of the peer certificate matches any of the email addresses specified with checkEmail.

           This option requires OpenSSL 1.0.2 or later.

       checkHost = HOST
           host of the peer certificate subject

           Multiple checkHost options are allowed in a single service section.  Certificates are accepted if no checkHost option was specified, or
           the host name of the peer certificate matches any of the hosts specified with checkHost.

           This option requires OpenSSL 1.0.2 or later.

       checkIP = IP
           IP address of the peer certificate subject

           Multiple checkIP options are allowed in a single service section.  Certificates are accepted if no checkIP option was specified, or the
           IP address of the peer certificate matches any of the IP addresses specified with checkIP.

           This option requires OpenSSL 1.0.2 or later.

       ciphers = CIPHER_LIST
           Select permitted SSL ciphers

           A colon-delimited list of the ciphers to allow in the SSL connection, for example DES-CBC3-SHA:IDEA-CBC-MD5.

       client = yes | no
           client mode (remote service uses SSL)

           default: no (server mode)

       config = COMMAND[:PARAMETER]
           OpenSSL configuration command

           The OpenSSL configuration command is executed with the specified parameter.  This allows any configuration commands to be invoked from
           the stunnel configuration file.  Supported commands are described on the SSL_CONF_cmd(3ssl) manual page.

           Several config lines can be used to specify multiple configuration commands.

           This option requires OpenSSL 1.0.2 or later.

       connect = [HOST:]PORT
           connect to a remote address

           If no host is specified, the host defaults to localhost.

           Multiple connect options are allowed in a single service section.

           If host resolves to multiple addresses and/or if multiple connect options are specified, then the remote address is chosen using a
           round-robin algorithm.

       CRLpath = DIRECTORY
           Certificate Revocation Lists directory

           This is the directory in which stunnel will look for CRLs when using the verify option. Note that the CRLs in this directory should be
           named XXXXXXXX.r0 where XXXXXXXX is the hash value of the CRL.

           The hash algorithm has been changed in OpenSSL 1.0.0.  It is required to c_rehash the directory on upgrade from OpenSSL 0.x.x to
           OpenSSL 1.x.x.

           CRLpath path is relative to the chroot directory if specified.

       CRLfile = CERT_FILE
           Certificate Revocation Lists file

           This file contains multiple CRLs, used with the verify option.

       curve = NID
           specify ECDH curve name

           To get a list of supported curves use:

               openssl ecparam -list_curves

           default: prime256v1

       logId = TYPE
           connection identifier type

           This identifier allows you to distinguish log entries generated for each of the connections.

           Currently supported types:

           sequential
               The numeric sequential identifier is only unique within a single instance of stunnel, but very compact.  It is most useful for
               manual log analysis.

           unique
               This alphanumeric identifier is globally unique, but longer than the sequential number.  It is most useful for automated log
               analysis.

           thread
               The operating system thread identifier is neither unique (even within a single instance of stunnel) nor short.  It is most useful
               for debugging software or configuration issues.

           default: sequential

       debug = LEVEL
           debugging level

           Level is a one of the syslog level names or numbers emerg (0), alert (1), crit (2), err (3), warning (4), notice (5), info (6), or
           debug (7).  All logs for the specified level and all levels numerically less than it will be shown.  Use debug = debug or debug = 7 for
           greatest debugging output.  The default is notice (5).

       delay = yes | no
           delay DNS lookup for the connect option

           This option is useful for dynamic DNS, or when DNS is not available during stunnel startup (road warrior VPN, dial-up configurations).

           Delayed resolver mode is automatically engaged when stunnel fails to resolve on startup any of the connect targets for a service.

           Delayed resolver inflicts failover = prio.

           default: no

       engineId = ENGINE_ID
           select engine ID for the service

       engineNum = ENGINE_NUMBER
           select engine number for the service

           The engines are numbered starting from 1.

       exec = EXECUTABLE_PATH
           execute a local inetd-type program

           exec path is relative to the chroot directory if specified.

           The following environmental variables are set on Unix platforms: REMOTE_HOST, REMOTE_PORT, SSL_CLIENT_DN, SSL_CLIENT_I_DN.

       execArgs = $0 $1 $2 ...
           arguments for exec including the program name ($0)

           Quoting is currently not supported.  Arguments are separated with an arbitrary amount of whitespace.

       failover = rr | prio
           Failover strategy for multiple "connect" targets.

               rr (round robin) - fair load distribution
               prio (priority) - use the order specified in config file

           default: rr

       ident = USERNAME
           use IDENT (RFC 1413) username checking

       include = DIRECTORY
           include all configuration file parts located in DIRECTORY

           The files are included in the ascending alphabetical order of their names.

       key = KEY_FILE
           private key for the certificate specified with cert option

           A private key is needed to authenticate the certificate owner.  Since this file should be kept secret it should only be readable by its
           owner.  On Unix systems you can use the following command:

               chmod 600 keyfile

           This parameter is also used as the private key identifier when a hardware engine is enabled.

           default: the value of the cert option

       libwrap = yes | no
           Enable or disable the use of /etc/hosts.allow and /etc/hosts.deny.

           default: no (since version 5.00)

       local = HOST
           By default, the IP address of the outgoing interface is used as the source for remote connections.  Use this option to bind a static
           local IP address instead.

       sni = SERVICE:SERVER_PATTERN (server mode)
           Use the service as a slave service (a name-based virtual server) for Server Name Indication TLS extension (RFC 3546).

           service_name specifies the master service that accepts client connections with the accept option.  server_name_pattern specifies the
           host name to be redirected.  The pattern may start with the '*' character, e.g. '*.example.com'.  Multiple slave services are normally
           specified for a single master service.  The sni option can also be specified more than once within a single slave service.

           This service, as well as the master service, may not be configured in client mode.

           The connect option of the slave service is ignored when the protocol option is specified, as protocol connects to the remote host
           before TLS handshake.

           Libwrap checks (Unix only) are performed twice: with the master service name after TCP connection is accepted, and with the slave
           service name during the TLS handshake.

           The sni option is only available when compiled with OpenSSL 1.0.0 and later.

       sni = SERVER (client mode)
           Use the parameter as the value of TLS Server Name Indication (RFC 3546) extension.

           The sni option is only available when compiled with OpenSSL 1.0.0 and later.

       OCSP = URL
           select OCSP responder for certificate verification

       OCSPaia = yes | no
           validate certificates with their AIA OCSP responders

           This option enables stunnel to validate certificates with the list of OCSP responder URLs retrieved from their AIA (Authority
           Information Access) extension.

       OCSPflag = OCSP_FLAG
           specify OCSP responder flag

           Several OCSPflag can be used to specify multiple flags.

           currently supported flags: NOCERTS, NOINTERN NOSIGS, NOCHAIN, NOVERIFY, NOEXPLICIT, NOCASIGN, NODELEGATED, NOCHECKS, TRUSTOTHER,
           RESPID_KEY, NOTIME

       OCSPnonce = yes | no
           send and verify the OCSP nonce extension

           This option protects the OCSP protocol against replay attacks.  Due to its computational overhead, the nonce extension is usually only
           supported on internal (e.g. corporate) responders, and not on public OCSP responders.

       options = SSL_OPTIONS
           OpenSSL library options

           The parameter is the OpenSSL option name as described in the SSL_CTX_set_options(3ssl) manual, but without SSL_OP_ prefix.  stunnel
           -options lists the options found to be allowed in the current combination of stunnel and the OpenSSL library used to build it.

           Several option lines can be used to specify multiple options.  An option name can be prepended with a dash ("-") to disable the option.

           For example, for compatibility with the erroneous Eudora SSL implementation, the following option can be used:

               options = DONT_INSERT_EMPTY_FRAGMENTS

           default:

               options = NO_SSLv2
               options = NO_SSLv3

       protocol = PROTO
           application protocol to negotiate SSL

           This option enables initial, protocol-specific negotiation of the SSL/TLS encryption.  The protocol option should not be used with SSL
           encryption on a separate port.

           Currently supported protocols:

           cifs
               Proprietary (undocummented) extension of CIFS protocol implemented in Samba.  Support for this extension was dropped in Samba
               3.0.0.

           connect
               Based on RFC 2817 - Upgrading to TLS Within HTTP/1.1, section 5.2 - Requesting a Tunnel with CONNECT

               This protocol is only supported in client mode.

           imap
               Based on RFC 2595 - Using TLS with IMAP, POP3 and ACAP

           nntp
               Based on RFC 4642 - Using Transport Layer Security (TLS) with Network News Transfer Protocol (NNTP)

               This protocol is only supported in client mode.

           pgsql
               Based on http://www.postgresql.org/docs/8.3/static/protocol-flow.html#AEN73982

           pop3
               Based on RFC 2449 - POP3 Extension Mechanism

           proxy
               Haproxy client IP address http://haproxy.1wt.eu/download/1.5/doc/proxy-protocol.txt

           smtp
               Based on RFC 2487 - SMTP Service Extension for Secure SMTP over TLS

           socks
               SOCKS versions 4, 4a, and 5 are supported.  The SOCKS protocol itself is encapsulated within SSL/TLS encryption layer to protect
               the final destination address.

               http://www.openssh.com/txt/socks4.protocol

               http://www.openssh.com/txt/socks4a.protocol

               The BIND command of the SOCKS protocol is not supported.  The USERID parameter is ignored.

               See Examples section for sample configuration files for VPN based on SOCKS encryption.

       protocolAuthentication = AUTHENTICATION
           authentication type for the protocol negotiations

           Currently, this option is only supported in the client-side 'connect' and 'smtp' protocols.

           Supported authentication types for the 'connect' protocol are 'basic' or 'ntlm'.  The default 'connect' authentication type is 'basic'.

           Supported authentication types for the 'smtp' protocol are 'plain' or 'login'.  The default 'smtp' authentication type is 'plain'.

       protocolDomain = DOMAIN
           domain for the protocol negotiations

           Currently, this option is only supported in the client-side 'connect' protocol.

       protocolHost = HOST:PORT
           destination address for the protocol negotiations

           protocolHost specifies the final SSL server to be connected to by the proxy, and not the proxy server directly connected by stunnel.
           The proxy server should be specified with the 'connect' option.

           Currently the protocol destination address only applies to the 'connect' protocol.

       protocolPassword = PASSWORD
           password for the protocol negotiations

           Currently, this option is only supported in the client-side 'connect' and 'smtp' protocols.

       protocolUsername = USERNAME
           username for the protocol negotiations

           Currently, this option is only supported in the client-side 'connect' and 'smtp' protocols.

       PSKidentity = IDENTITY
           PSK identity for the PSK client

           PSKidentity can be used on stunnel clients to select the PSK identity used for authentication.  This option is ignored in server
           sections.

           default: the first identity specified in the PSKsecrets file.

       PSKsecrets = FILE
           file with PSK identities and corresponding keys

           Each line of the file in the following format:

               IDENTITY:KEY

           The key is required to be at least 20 characters long.  The file should not be world-readable nor world-writable.

       pty = yes | no (Unix only)
           allocate a pseudoterminal for 'exec' option

       redirect = [HOST:]PORT
           redirect SSL client connections on certificate-based authentication failures

           This option only works in server mode.  Some protocol negotiations are also incompatible with the redirect option.

       renegotiation = yes | no
           support SSL renegotiation

           Applications of the SSL renegotiation include some authentication scenarios, or re-keying long lasting connections.

           On the other hand this feature can facilitate a trivial CPU-exhaustion DoS attack:

           http://vincent.bernat.im/en/blog/2011-ssl-dos-mitigation.html

           Please note that disabling SSL renegotiation does not fully mitigate this issue.

           default: yes (if supported by OpenSSL)

       reset = yes | no
           attempt to use the TCP RST flag to indicate an error

           This option is not supported on some platforms.

           default: yes

       retry = yes | no
           reconnect a connect+exec section after it was disconnected

           default: no

       setgid = GROUP (Unix only)
           Unix group id

           As a global option: setgid() to the specified group in daemon mode and clear all other groups.

           As a service-level option: set the group of the Unix socket specified with "accept".

       setuid = USER (Unix only)
           Unix user id

           As a global option: setuid() to the specified user in daemon mode.

           As a service-level option: set the owner of the Unix socket specified with "accept".

       sessionCacheSize = NUM_ENTRIES
           session cache size

           sessionCacheSize specifies the maximum number of the internal session cache entries.

           The value of 0 can be used for unlimited size.  It is not recommended for production use due to the risk of a memory exhaustion DoS
           attack.

       sessionCacheTimeout = TIMEOUT
           session cache timeout

           This is the number of seconds to keep cached SSL sessions.

       sessiond = HOST:PORT
           address of sessiond SSL cache server

       sslVersion = SSL_VERSION
           select the SSL protocol version

           Supported values: all, SSLv2, SSLv3, TLSv1, TLSv1.1, TLSv1.2

           Availability of specific protocols depends on the linked OpenSSL library.  Older versions of OpenSSL do not support TLSv1.1 and
           TLSv1.2.  Newer versions of OpenSSL do not support SSLv2.

           Obsolete SSLv2 and SSLv3 are currently disabled by default.  See the options option documentation for details.

       stack = BYTES (except for FORK model)
           thread stack size

       TIMEOUTbusy = SECONDS
           time to wait for expected data

       TIMEOUTclose = SECONDS
           time to wait for close_notify (set to 0 for buggy MSIE)

       TIMEOUTconnect = SECONDS
           time to wait to connect to a remote host

       TIMEOUTidle = SECONDS
           time to keep an idle connection

       transparent = none | source | destination | both (Unix only)
           enable transparent proxy support on selected platforms

           Supported values:

           none
               Disable transparent proxy support.  This is the default.

           source
               Re-write the address to appear as if a wrapped daemon is connecting from the SSL client machine instead of the machine running
               stunnel.

               This option is currently available in:

               Remote mode (connect option) on Linux >=2.6.28
                   This configuration requires stunnel to be executed as root and without the setuid option.

                   This configuration requires the following setup for iptables and routing (possibly in /etc/rc.local or equivalent file):

                       iptables -t mangle -N DIVERT
                       iptables -t mangle -A PREROUTING -p tcp -m socket -j DIVERT
                       iptables -t mangle -A DIVERT -j MARK --set-mark 1
                       iptables -t mangle -A DIVERT -j ACCEPT
                       ip rule add fwmark 1 lookup 100
                       ip route add local 0.0.0.0/0 dev lo table 100
                       echo 0 >/proc/sys/net/ipv4/conf/lo/rp_filter

                   stunnel must also to be executed as root and without the setuid option.

               Remote mode (connect option) on Linux 2.2.x
                   This configuration requires the kernel to be compiled with the transparent proxy option.  Connected service must be installed
                   on a separate host.  Routing towards the clients has to go through the stunnel box.

                   stunnel must also to be executed as root and without the setuid option.

               Remote mode (connect option) on FreeBSD >=8.0
                   This configuration requires additional firewall and routing setup.  stunnel must also to be executed as root and without the
                   setuid option.

               Local mode (exec option)
                   This configuration works by pre-loading the libstunnel.so shared library.  _RLD_LIST environment variable is used on Tru64, and
                   LD_PRELOAD variable on other platforms.

           destination
               The original destination is used instead of the connect option.

               A service section for transparent destination may look like this:

                   [transparent]
                   client = yes
                   accept = <stunnel_port>
                   transparent = destination

               This configuration requires iptables setup to work, possibly in /etc/rc.local or equivalent file.

               For a connect target installed on the same host:

                   /sbin/iptables -t nat -I OUTPUT -p tcp --dport <redirected_port> \
                       -m ! --uid-owner <stunnel_user_id> \
                       -j DNAT --to-destination <local_ip>:<stunnel_port>

               For a connect target installed on a remote host:

                   /sbin/iptables -I INPUT -i eth0 -p tcp --dport <stunnel_port> -j ACCEPT
                   /sbin/iptables -t nat -I PREROUTING -p tcp --dport <redirected_port> \
                       -i eth0 -j DNAT --to-destination <local_ip>:<stunnel_port>

               The transparent destination option is currently only supported on Linux.

           both
               Use both source and destination transparent proxy.

           Two legacy options are also supported for backward compatibility:

           yes This option has been renamed to source.

           no  This option has been renamed to none.

       verify = LEVEL
           verify the peer certificate

           level 0
               Request and ignore the peer certificate.

           level 1
               Verify the peer certificate if present.

           level 2
               Verify the peer certificate.

           level 3
               Verify the peer with locally installed certificate.

           level 4
               Ignore the CA chain and only verify the peer certificate.

           default
               No verify.

           It is important to understand that this option was solely designed for access control and not for authorization.  Specifically for
           level 2 every non-revoked certificate is accepted regardless of its Common Name.  For this reason a dedicated CA should be used with
           level 2, and not a generic CA commonly used for webservers.  Level 3 is preferred for point-to-point connections.

RETURN VALUE
       stunnel returns zero on success, non-zero on error.

SIGNALS
       The following signals can be used to control stunnel in Unix environment:

       SIGHUP
           Force a reload of the configuration file.

           Some global options will not be reloaded:

           ·   chroot

           ·   foreground

           ·   pid

           ·   setgid

           ·   setuid

           The use of the 'setuid' option will also prevent stunnel from binding to privileged (<1024) ports during configuration reloading.

           When the 'chroot' option is used, stunnel will look for all its files (including the configuration file, certificates, the log file and
           the pid file) within the chroot jail.

       SIGUSR1
           Close and reopen the stunnel log file.  This function can be used for log rotation.

       SIGTERM, SIGQUIT, SIGINT
           Shut stunnel down.

       The result of sending any other signals to the server is undefined.

EXAMPLES
       In order to provide SSL encapsulation to your local imapd service, use:

           [imapd]
           accept = 993
           exec = /usr/sbin/imapd
           execArgs = imapd

       or in remote mode:

           [imapd]
           accept = 993
           connect = 143

       In order to let your local e-mail client connect to an SSL-enabled imapd service on another server, configure the e-mail client to connect
       to localhost on port 119 and use:

           [imap]
           client = yes
           accept = 143
           connect = servername:993

       If you want to provide tunneling to your pppd daemon on port 2020, use something like:

           [vpn]
           accept = 2020
           exec = /usr/sbin/pppd
           execArgs = pppd local
           pty = yes

       If you want to use stunnel in inetd mode to launch your imapd process, you'd use this stunnel.conf.  Note there must be no [service_name]
       section.

           exec = /usr/sbin/imapd
           execArgs = imapd

       To setup SOCKS VPN configure the following client service:

           [socks_client]
           client = yes
           accept = 127.0.0.1:1080
           connect = vpn_server:9080
           verify = 4
           CAfile = stunnel.pem

       The corresponding configuration on the vpn_server host:

           [socks_server]
           protocol = socks
           accept = 9080
           cert = stunnel.pem
           key = stunnel.key

       Now test your configuration on the client machine with:

           curl --socks4a localhost http://www.example.com/

NOTES
   RESTRICTIONS
       stunnel cannot be used for the FTP daemon because of the nature of the FTP protocol which utilizes multiple ports for data transfers.
       There are available SSL-enabled versions of FTP and telnet daemons, however.

   INETD MODE
       The most common use of stunnel is to listen on a network port and establish communication with either a new port via the connect option, or
       a new program via the exec option.  However there is a special case when you wish to have some other program accept incoming connections
       and launch stunnel, for example with inetd, xinetd, or tcpserver.

       For example, if you have the following line in inetd.conf:

           imaps stream tcp nowait root /usr/bin/stunnel stunnel /etc/stunnel/imaps.conf

       In these cases, the inetd-style program is responsible for binding a network socket (imaps above) and handing it to stunnel when a
       connection is received.  Thus you do not want stunnel to have any accept option.  All the Service Level Options should be placed in the
       global options section, and no [service_name] section will be present.  See the EXAMPLES section for example configurations.

   CERTIFICATES
       Each SSL-enabled daemon needs to present a valid X.509 certificate to the peer. It also needs a private key to decrypt the incoming data.
       The easiest way to obtain a certificate and a key is to generate them with the free OpenSSL package. You can find more information on
       certificates generation on pages listed below.

       The order of contents of the .pem file is important.  It should contain the unencrypted private key first, then a signed certificate (not
       certificate request).  There should also be empty lines after the certificate and the private key.  Any plaintext certificate information
       appended on the top of generated certificate should be discarded. So the file should look like this:

           -----BEGIN RSA PRIVATE KEY-----
           [encoded key]
           -----END RSA PRIVATE KEY-----
           [empty line]
           -----BEGIN CERTIFICATE-----
           [encoded certificate]
           -----END CERTIFICATE-----
           [empty line]

   RANDOMNESS
       stunnel needs to seed the PRNG (pseudo-random number generator) in order for SSL to use good randomness.  The following sources are loaded
       in order until sufficient random data has been gathered:

       ·   The file specified with the RNDfile flag.

       ·   The file specified by the RANDFILE environment variable, if set.

       ·   The file .rnd in your home directory, if RANDFILE not set.

       ·   The file specified with '--with-random' at compile time.

       ·   The contents of the screen if running on Windows.

       ·   The egd socket specified with the EGD flag.

       ·   The egd socket specified with '--with-egd-sock' at compile time.

       ·   The /dev/urandom device.

       With recent (OpenSSL 0.9.5a or later) version of SSL it will stop loading random data automatically when sufficient entropy has been
       gathered.  With previous versions it will continue to gather from all the above sources since no SSL function exists to tell when enough
       data is available.

       Note that on Windows machines that do not have console user interaction (mouse movements, creating windows, etc.) the screen contents are
       not variable enough to be sufficient, and you should provide a random file for use with the RNDfile flag.

       Note that the file specified with the RNDfile flag should contain random data -- that means it should contain different information each
       time stunnel is run.  This is handled automatically unless the RNDoverwrite flag is used.  If you wish to update this file manually, the
       openssl rand command in recent versions of OpenSSL, would be useful.

       Important note: If /dev/urandom is available, OpenSSL often seeds the PRNG with it while checking the random state.  On systems with
       /dev/urandom OpenSSL is likely to use it even though it is listed at the very bottom of the list above.  This is the behaviour of OpenSSL
       and not stunnel.

   DH PARAMETERS
       stunnel 4.40 and later contains hardcoded 2048-bit DH parameters.  Starting with stunnel 5.18, these hardcoded DH parameters are replaced
       every 24 hours with autogenerated temporary DH parameters.  DH parameter generation may take several minutes.

       Alternatively, it is possible to specify static DH parameters in the certificate file, which disables generating temporary DH parameters:

           openssl dhparam 2048 >> stunnel.pem

FILES
       @sysconfdir@/stunnel/stunnel.conf
           stunnel configuration file

BUGS
       The execArgs option and the Win32 command line do not support quoting.

SEE ALSO
       tcpd(8)
           access control facility for internet services

       inetd(8)
           internet 'super-server'

       http://www.stunnel.org/
           stunnel homepage

       http://www.openssl.org/
           OpenSSL project website

AUTHOR
       Michał Trojnara
           <Michal.Trojnara@mirt.net>

5.28                                                                2015.12.05                                                          stunnel(8)
