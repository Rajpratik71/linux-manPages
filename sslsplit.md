SSLSPLIT(1)                                                   General Commands Manual                                                  SSLSPLIT(1)

NAME
       sslsplit -- transparent and scalable SSL/TLS interception

SYNOPSIS
       sslsplit [-kCKOPZdDgGsrReumjplLSFi] -c pem proxyspecs [...]
       sslsplit [-kCKOPZdDgGsrReumjplLSFi] -c pem -t dir proxyspecs [...]
       sslsplit [-OPZdDgGsrReumjplLSFi] -t dir proxyspecs [...]
       sslsplit -E
       sslsplit -V
       sslsplit -h

DESCRIPTION
       SSLsplit  is a tool for man-in-the-middle attacks against SSL/TLS encrypted network connections.  Connections are transparently intercepted
       through a network address translation engine and redirected to SSLsplit.  SSLsplit terminates SSL/TLS and initiates a new  SSL/TLS  connec‐
       tion  to the original destination address, while logging all data transmitted.  SSLsplit is intended to be useful for network forensics and
       penetration testing.

       SSLsplit supports plain TCP, plain SSL, HTTP and HTTPS connections over both IPv4 and IPv6.  For SSL and HTTPS connections, SSLsplit gener‐
       ates  and  signs  forged  X509v3 certificates on-the-fly, based on the original server certificate subject DN and subjectAltName extension.
       SSLsplit fully supports Server Name Indication (SNI) and is able to work with RSA, DSA and ECDSA keys and  DHE  and  ECDHE  cipher  suites.
       Depending on the version of OpenSSL, SSLsplit supports SSL 3.0, TLS 1.0, TLS 1.1 and TLS 1.2, and optionally SSL 2.0 as well.  SSLsplit can
       also use existing certificates of which the private key is available, instead of generating forged ones.  SSLsplit supports NULL-prefix  CN
       certificates  and  can  deny OCSP requests in a generic way.  For HTTP and HTTPS connections, SSLsplit removes response headers for HPKP in
       order to prevent public key pinning, for HSTS to allow the user to accept  untrusted  certificates,  and  Alternate  Protocols  to  prevent
       switching to QUIC/SPDY.

       SSLsplit  supports  a number of NAT engines, static forwarding and SNI DNS lookups to determine the original destination of redirected con‐
       nections (see NAT ENGINES and PROXY SPECIFICATIONS below).

       To actually implement an attack, you also need to redirect the traffic to the  system  running  sslsplit.   Your  options  include  running
       sslsplit  on a legitimate router, ARP spoofing, ND spoofing, DNS poisoning, deploying a rogue access point (e.g. using hostap mode), physi‐
       cal recabling, malicious VLAN reconfiguration or route injection, /etc/hosts modification and so  on.   SSLsplit  does  not  implement  the
       actual traffic redirection.

OPTIONS
       -c pemfile
              Use CA certificate from pemfile to sign certificates forged on-the-fly.  If pemfile also contains the matching CA private key, it is
              also loaded, otherwise it must be provided with -k.  If pemfile also contains Diffie-Hellman group parameters, they are also loaded,
              otherwise  they  can  be provided with -g.  If -t is also given, SSLsplit will only forge a certificate if there is no matching cer‐
              tificate in the provided certificate directory.

       -C pemfile
              Use CA certificates from pemfile as extra certificates in the certificate chain.  This is needed if the CA given with -k and -c is a
              sub-CA, in which case any intermediate CA certificates and the root CA certificate must be included in the certificate chain.

       -d     Detach from TTY and run as a daemon, logging error messages to syslog instead of standard error.

       -D     Run  in  debug  mode, log lots of debugging information to standard error.  This also forces foreground mode and cannot be used with
              -d.

       -e engine
              Use engine as the default NAT engine for proxyspecs without explicit NAT engine, static destination address or SNI mode.  engine can
              be any of the NAT engines supported by the system, as returned by -E.

       -E     List  all  supported NAT engines available on the system and exit.  See NAT ENGINES for a list of NAT engines currently supported by
              SSLsplit.

       -F logspec
              Log connection content to separate log files with the given path specification (see LOG SPECIFICATIONS below).  For each connection,
              a  log  file  will  be written, which will contain both directions of data as transmitted.  Information about the connection will be
              contained in the filename only.  If -F is used with -j, logspec is relative to jaildir.  If -F is used  with  -u,  logspec  must  be
              writable by user.

       -g pemfile
              Use  Diffie-Hellman  group  parameters  from  pemfile  for  Ephemereal  Diffie-Hellman (EDH/DHE) cipher suites.  If -g is not given,
              SSLsplit first tries to load DH parameters from the PEM files given by -K, -k or -c.  If no DH  parameters  are  found  in  the  key
              files, built-in 512 or 1024 bit group parameters are automatically used iff a non-RSA private key is given with -K.  This is because
              DSA/DSS private keys can by themselves only be used for signing and thus require DH to exchange an SSL/TLS session key.   If  -g  is
              given,  the parameters from the given pemfile will always be used, even with RSA private keys (within the cipher suites available in
              OpenSSL).  The -g option is only available if SSLsplit was built against a version of OpenSSL which supports  Diffie-Hellman  cipher
              suites.

       -G curve
              Use  the  named  curve  for  Ephemereal  Elliptic  Curve  Diffie-Hellman (EECDH) cipher suites.  If -G is not given, a default curve
              (secp160r2) is used automatically iff a non-RSA private key is given with -K.  This is because ECDSA/ECDSS private keys can by them‐
              selves  only  be  used  for  signing and thus require ECDH to exchange an SSL/TLS session key.  If -G is given, the named curve will
              always be used, even with RSA private keys (within the cipher suites available in OpenSSL).  The -G  option  is  only  available  if
              SSLsplit was built against a version of OpenSSL which supports Elliptic Curve Diffie-Hellman cipher suites.

       -h     Display help on usage and exit.

       -i     For each connection, find the local process owning the connection.  This makes process information such as pid, owner:group and exe‐
              cutable path for connections originating on the same system as SSLsplit available to the connect log and enables the  respective  -F
              path specification directives.  -i is available on Mac OS X and FreeBSD; support for other platforms has not been implemented yet.

       -j jaildir
              Change  the  root directory to jaildir using chroot(2) after opening files.  Note that this has implications for -F, -S, and for sni
              proxyspecs.  The path given with -S or -F will be relative to jaildir since the log files cannot be opened before calling chroot(2).
              Depending  on your operating system, you will need to copy files such as /etc/resolv.conf to jaildir in order for name resolution to
              work.  Using sni proxyspecs depends on name resolution.  Some operating systems require special device nodes such as /dev/null to be
              present within the jail.  Check your system's documentation for details.

       -k pemfile
              Use CA private key from pemfile to sign certificates forged on-the-fly.  If pemfile also contains the matching CA certificate, it is
              also loaded, otherwise it must be provided with -c.  If pemfile also contains Diffie-Hellman group parameters, they are also loaded,
              otherwise  they  can  be provided with -g.  If -t is also given, SSLsplit will only forge a certificate if there is no matching cer‐
              tificate in the provided certificate directory.

       -K pemfile
              Use private key from pemfile for certificates forged on-the-fly.  If -K is not given, SSLsplit will generate a random  1024-bit  RSA
              key.

       -l logfile
              Log  connections to logfile in a single line per connection format, including addresses and ports and some HTTP and SSL information,
              if available.

       -L logfile
              Log connection content to logfile.  The content log will contain a parsable log format with transmitted data, prepended with headers
              identifying the connection and the data length of each logged segment.

       -m     When dropping privileges using -u, override the target primary group to be set to group.

       -O     Deny all Online Certificate Status Protocol (OCSP) requests on all proxyspecs and for all OCSP servers with an OCSP response of try‐
              Later, causing OCSP clients to temporarily accept even revoked certificates.  HTTP requests are being treated as  OCSP  requests  if
              the  method  is  GET and the URI contains a syntactically valid OCSPRequest ASN.1 structure parsable by OpenSSL, or if the method is
              POST and the Content-Type is application/ocsp-request.  For this to be effective, SSLsplit must be handling traffic destined to  the
              port  used  by  the OCSP server.  In particular, SSLsplit must be configured to receive traffic to all ports used by OCSP servers of
              targetted certificates within the certdir specified by -t.

       -p pidfile
              Write the process ID to pidfile and refuse to run if the pidfile is already in use by another process.

       -P     Passthrough SSL/TLS connections which cannot be split instead of dropping them.  Connections cannot be split if -c and  -k  are  not
              given and the site does not match any certificate loaded using -t, or if the connection to the original server gives SSL/TLS errors.
              Specifically, this happens if the site requests a client certificate.  Passthrough with -P results in uninterrupted service for  the
              clients, while dropping is the more secure alternative if unmonitored connections must be prevented.

       -r proto
              Force  SSL/TLS  protocol  version  on  both  client  and server side to proto by selecting the respective OpenSSL method constructor
              instead of the default SSLv23_method() which supports all protocol versions.  This is useful when analyzing traffic to a server that
              only  supports a specific version of SSL/TLS and does not implement proper protocol negotiation.  Depending on build options and the
              version of OpenSSL that is used, the following values for proto are accepted: ssl2, ssl3, tls10, tls11 and tls12.  Note that SSL 2.0
              support is not built in by default because some servers don't handle SSL 2.0 Client Hello messages gracefully.

       -R proto
              Disable the SSL/TLS protocol version proto on both client and server side by disabling the respective protocols in OpenSSL.  To dis‐
              able multiple protocol versions, -R can be given multiple times.  If -r is also given, there will be no effect  in  disabling  other
              protocol versions.  Disabling protocol versions is useful when analyzing traffic to a server that does not handle some protocol ver‐
              sions well, or to test behaviour with different protocol versions.  Depending on build options and the version of  OpenSSL  that  is
              used, the following values for proto are accepted: ssl2, ssl3, tls10, tls11 and tls12.  Note that SSL 2.0 support is not built in by
              default because some servers don't handle SSL 2.0 Client Hello messages gracefully.

       -s ciphers
              Use OpenSSL ciphers specification for both server and client SSL/TLS connections.  If -s is not given, a cipher list  of  ALL:-aNULL
              is  used.  Normally, SSL/TLS implementations choose the most secure cipher suites, not the fastest ones.  By specifying an appropri‐
              ate OpenSSL cipher list, the set of cipher suites can be limited to fast algorithms, or eNULL cipher suites can be added.  Note that
              for connections to be successful, the SSLsplit cipher suites must include at least one cipher suite supported by both the client and
              the server of each connection.  See ciphers(1) for details on how to construct OpenSSL cipher lists.

       -S logdir
              Log connection content to separate log files under logdir.  For each connection, a log file will be written, which will contain both
              directions of data as transmitted.  Information about the connection will be contained in the filename only.  If -S is used with -j,
              logdir is relative to jaildir.  If -S is used with -u, logdir must be writable by user.

       -t certdir
              Use private key, certificate and certificate chain from PEM files in certdir for sites matching the respective common names, instead
              of  using  certificates forged on-the-fly.  A single PEM file must contain a single private key, a single certificate and optionally
              intermediate and root CA certificates to use as certificate chain.  If -c and -k are also given, certificates will be forged on-the-
              fly  for  sites  matching  none  of  the  certificates  loaded from certdir.  Otherwise, connections matching no certificate will be
              dropped, or if -P is given, passed through without splitting SSL/TLS.

       -u     Drop privileges after opening sockets and files by setting the real, effective and stored user IDs to user and loading the appropri‐
              ate  primary  and  ancillary groups.  If -u is not given, SSLsplit will drop privileges to the stored UID if EUID != UID (setuid bit
              scenario), or to nobody if running with full root privileges (EUID == UID == 0) and -S is not used.  Due to an Apple bug, -u  cannot
              be used with pf proxyspecs on Mac OS X.

       -V     Display version and compiled features information and exit.

       -Z     Disable  SSL/TLS  compression  on  all  connections.   This is useful if your limiting factor is CPU, not network bandwidth.  The -Z
              option is only available if SSLsplit was built against a version of OpenSSL which supports disabling compression.

PROXY SPECIFICATIONS
       Proxy specifications (proxyspecs) consist of the connection type, listen address and static forward address or address resolution mechanism
       (NAT engine, SNI DNS lookup):

       https listenaddr port [nat-engine|fwdaddr port|sni port]
       ssl   listenaddr port [nat-engine|fwdaddr port|sni port]
       http  listenaddr port [nat-engine|fwdaddr port]
       tcp   listenaddr port [nat-engine|fwdaddr port]

       https  SSL/TLS interception with HTTP protocol decoding, including the removal of HPKP, HSTS and Alternate Protocol response headers.

       ssl    SSL/TLS  interception  without  any lower level protocol decoding; decrypted connection content is treated as opaque stream of bytes
              and not modified.

       http   Plain TCP connection without SSL/TLS, with HTTP protocol decoding, including the  removal  of  HPKP,  HSTS  and  Alternate  Protocol
              response headers.

       tcp    Plain  TCP  connection  without  SSL/TLS  and  without any lower level protocol decoding; decrypted connection content is treated as
              opaque stream of bytes and not modified.

       listenaddr port
              IPv4 or IPv6 address and port or service name to listen on.  This is the address and port where the NAT engine should redirect  con‐
              nections to.

       nat-engine
              NAT engine to query for determining the original destination address and port of transparently redirected connections.  If no engine
              is given, the default engine is used, unless overridden with -e.  When using a NAT engine, sslsplit needs to run on the same  system
              as the NAT rules redirecting the traffic to sslsplit.  See NAT ENGINES for a list of supported NAT engines.

       fwdaddr port
              Static  destination  address,  IPv4  or  IPv6, with port or service name.  When this is used, connections are forwarded to the given
              server address and port.  If fwdaddr is a hostname, it will be resolved to an IP address.

       sni port
              Use the Server Name Indication (SNI) hostname sent by the client in the ClientHello SSL/TLS message to determine the IP  address  of
              the  server  to  connect to.  This only works for ssl and https proxyspecs and needs a port or service name as an argument.  Because
              this requires DNS lookups, it is preferrable to use NAT engine lookups (see above), except when that is not possible, such  as  when
              there  is  no  supported NAT engine or when running sslsplit on a different system than the NAT rules redirecting the actual connec‐
              tions.  Note that when using -j with sni, you may need to prepare jaildir to make name resolution work from within the chroot direc‐
              tory.

LOG SPECIFICATIONS
       Log  specifications  are  composed  of  zero or more printf-style directives; ordinary characters are included directly in the output path.
       SSLsplit current supports the following directives:

       %T     The initial connection time as an ISO 8601 UTC timestamp.

       %d     The destination address and port.

       %s     The source address and port.

       %x     The name of the local process.  Requires -i to be used.  If process information is unavailable, this directive will be omitted  from
              the output path.

       %X     The  full path of the local process.  Requires -i to be used.  If process information is unavailable, this directive will be omitted
              from the output path.

       %u     The username or numeric uid of the local process.  Requires -i to be used.  If process information is  unavailable,  this  directive
              will be omitted from the output path.

       %g     The  group name or numeric gid of the local process.  Requires -i to be used.  If process information is unavailable, this directive
              will be omitted from the output path.

       %%     A literal '%' character.

NAT ENGINES
       SSLsplit currently supports the following NAT engines:

       pf     OpenBSD packet filter (pf) rdr/rdr-to NAT redirects, also available on FreeBSD, NetBSD and Mac OS  X.   Fully  supported,  including
              IPv6.  Assuming inbound interface em0, first in old (FreeBSD, Mac OS X), then in new (OpenBSD 4.7+) syntax:

              rdr pass on em0 proto tcp from 2001:db8::/64 to any port  80 \
                       ->       ::1 port 10080
              rdr pass on em0 proto tcp from 2001:db8::/64 to any port 443 \
                       ->       ::1 port 10443
              rdr pass on em0 proto tcp from  192.0.2.0/24 to any port  80 \
                       -> 127.0.0.1 port 10080
              rdr pass on em0 proto tcp from  192.0.2.0/24 to any port 443 \
                       -> 127.0.0.1 port 10443

              pass in quick on em0 proto tcp from 2001:db8::/64 to any \
                       port  80 rdr-to       ::1 port 10080
              pass in quick on em0 proto tcp from 2001:db8::/64 to any \
                       port 443 rdr-to       ::1 port 10443
              pass in quick on em0 proto tcp from  192.0.2.0/24 to any \
                       port  80 rdr-to 127.0.0.1 port 10080
              pass in quick on em0 proto tcp from  192.0.2.0/24 to any \
                       port 443 rdr-to 127.0.0.1 port 10443

       ipfw   FreeBSD  IP firewall (IPFW) divert sockets, also available on Mac OS X.  Available on FreeBSD and OpenBSD using pf divert-to.  Fully
              supported on FreeBSD and OpenBSD, including IPv6.  Only supports IPv4 on Mac OS X due to  the  ancient  version  of  IPFW  included.
              First in IPFW, then in pf divert-to syntax:

              ipfw add fwd       ::1,10080 tcp from 2001:db8::/64 to any  80
              ipfw add fwd       ::1,10443 tcp from 2001:db8::/64 to any 443
              ipfw add fwd 127.0.0.1,10080 tcp from 192.0.2.0/24  to any  80
              ipfw add fwd 127.0.0.1,10443 tcp from 192.0.2.0/24  to any 443

              pass in quick on em0 proto tcp from 2001:db8::/64 to any \
                       port  80 divert-to       ::1 port 10080
              pass in quick on em0 proto tcp from 2001:db8::/64 to any \
                       port 443 divert-to       ::1 port 10443
              pass in quick on em0 proto tcp from  192.0.2.0/24 to any \
                       port  80 divert-to 127.0.0.1 port 10080
              pass in quick on em0 proto tcp from  192.0.2.0/24 to any \
                       port 443 divert-to 127.0.0.1 port 10443

       ipfilter
              IPFilter  (ipfilter, ipf), available on many systems, including FreeBSD, NetBSD, Linux and Solaris.  Only supports IPv4 due to limi‐
              tations in the SIOCGNATL ioctl(2) interface.  Assuming inbound interface bge0:

              rdr bge0 0.0.0.0/0 port  80 -> 127.0.0.1 port 10080
              rdr bge0 0.0.0.0/0 port 443 -> 127.0.0.1 port 10443

       netfilter
              Linux netfilter using the iptables REDIRECT target.  Only supports IPv4 due to  limitations  in  the  SO_ORIGINAL_DST  getsockopt(2)
              interface.

              iptables -t nat -A PREROUTING -s 192.0.2.0/24 \
                       -p tcp --dport  80 \
                       -j REDIRECT --to-ports 10080
              iptables -t nat -A PREROUTING -s 192.0.2.0/24 \
                       -p tcp --dport 443 \
                       -j REDIRECT --to-ports 10443

       tproxy Linux  netfilter using the iptables TPROXY target together with routing table magic to allow non-local traffic to originate on local
              sockets.  Fully supported, including IPv6.

              ip -f inet6 rule add fwmark 1 lookup 100
              ip -f inet6 route add local default dev lo table 100
              ip6tables -t mangle -N DIVERT
              ip6tables -t mangle -A DIVERT -j MARK --set-mark 1
              ip6tables -t mangle -A DIVERT -j ACCEPT
              ip6tables -t mangle -A PREROUTING -p tcp -m socket -j DIVERT
              ip6tables -t mangle -A PREROUTING -s 2001:db8::/64 \
                        -p tcp --dport 80 \
                        -j TPROXY --tproxy-mark 0x1/0x1 --on-port 10080
              ip6tables -t mangle -A PREROUTING -s 2001:db8::/64 \
                        -p tcp --dport 443 \
                        -j TPROXY --tproxy-mark 0x1/0x1 --on-port 10443
              ip -f inet rule add fwmark 1 lookup 100
              ip -f inet route add local default dev lo table 100
              iptables -t mangle -N DIVERT
              iptables -t mangle -A DIVERT -j MARK --set-mark 1
              iptables -t mangle -A DIVERT -j ACCEPT
              iptables -t mangle -A PREROUTING -p tcp -m socket -j DIVERT
              iptables -t mangle -A PREROUTING -s 192.0.2.0/24 \
                       -p tcp --dport 80 \
                       -j TPROXY --tproxy-mark 0x1/0x1 --on-port 10080
              iptables -t mangle -A PREROUTING -s 192.0.2.0/24 \
                       -p tcp --dport 443 \
                       -j TPROXY --tproxy-mark 0x1/0x1 --on-port 10443

              Note that return path filtering (rp_filter) also needs to be disabled on interfaces which handle TPROXY redirected traffic.

EXAMPLES
       Matching the above NAT engine configuration samples, intercept HTTP and HTTPS over IPv4 and IPv6 using forged certificates with CA  private
       key ca.key and certificate ca.crt, logging connections to connect.log and connection data into separate files under /tmp (add -e nat-engine
       to select the appropriate engine if multiple engines are available on your system):

       sslsplit -k ca.key -c ca.crt -l connect.log -L /tmp \
                https ::1 10443  https 127.0.0.1 10443 \
                http  ::1 10080  http  127.0.0.1 10080

       Intercepting IMAP/IMAPS using the same settings:

       sslsplit -k ca.key -c ca.crt -l connect.log -L /tmp \
                ssl ::1 10993  ssl 127.0.0.1 10993 \
                tcp ::1 10143  tcp 127.0.0.1 10143

       A more targetted setup, HTTPS only, using certificate/chain/key files from /path/to/cert.d and statically  redirecting  to  www.example.org
       instead of querying a NAT engine:

       sslsplit -t /path/to/cert.d -l connect.log -L /tmp \
                https ::1       10443 www.example.org 443 \
                https 127.0.0.1 10443 www.example.org 443

       The original example, but using SSL options optimized for speed by disabling compression and selecting only fast block cipher cipher suites
       and using a precomputed private key leaf.key for the forged certificates (most significant speed increase is gained by choosing fast  algo‐
       rithms and small keysizes for the CA and leaf private keys; check openssl speed for algorithm performance on your system):

       sslsplit -Z -s NULL:RC4:AES128 -K leaf.key \
                -k ca.key -c ca.crt -l connect.log -L /tmp \
                https ::1 10443  https 127.0.0.1 10443 \
                http  ::1 10080  http  127.0.0.1 10080

       The original example, but running as a daemon under user sslsplit and writing a PID file:

       sslsplit -d -p /var/run/sslsplit.pid -u sslsplit \
                -k ca.key -c ca.crt -l connect.log -L /tmp \
                https ::1 10443  https 127.0.0.1 10443 \
                http  ::1 10080  http  127.0.0.1 10080

       To generate a CA private key ca.key  and certificate ca.crt using OpenSSL:

       cat >x509v3ca.cnf <<'EOF'
       [ req ]
       distinguished_name = reqdn

       [ reqdn ]

       [ v3_ca ]
       basicConstraints        = CA:TRUE
       subjectKeyIdentifier    = hash
       authorityKeyIdentifier  = keyid:always,issuer:always
       EOF

       openssl genrsa -out ca.key 1024
       openssl req -new -nodes -x509 -sha1 -out ca.crt -key ca.key \
               -config x509v3ca.cnf -extensions v3_ca \
               -subj '/O=SSLsplit Root CA/CN=SSLsplit Root CA/' \
               -set_serial 0 -days 3650

NOTES
       SSLsplit  is able to handle a relatively high number of listeners and connections due to a multithreaded, event based architecture based on
       libevent, taking advantage of platform specific select() replacements such as kqueue.  The main  thread  handles  the  listeners  and  sig‐
       nalling,  while  a  number of worker threads equal to twice the number of CPU cores is used for handling the actual connections in separate
       event bases, including the CPU-intensive SSL/TLS handling.

       Care has been taken to choose well-performing data structures for caching certificates and SSL sessions.  Logging is implemented  in  sepa‐
       rate disk writer threads to ensure that socket event handling threads don't have to block on disk I/O.  DNS lookups are performed asynchro‐
       niously.  SSLsplit uses SSL session caching on both ends to minimize the amount of full SSL handshakes, but even then, the limiting  factor
       in handling SSL connections are the actual bignum computations.

SEE ALSO
       openssl(1),  ciphers(1),  speed(1),  pf(4),  ipfw(8), iptables(8), ip6tables(8), ip(8), hostapd(8), arpspoof(8), parasite6(8), yersinia(8),
       https://www.roe.ch/SSLsplit

AUTHORS
       SSLsplit was written by Daniel Roethlisberger <daniel@roe.ch>.

       The following individuals have contributed to the codebase, in chronological order of their first contribution: Steve Wills, Landon  Fuller
       and Wayne Jensen.

BUGS
       Use Github for submission of bug reports or patches:

              https://github.com/droe/sslsplit

                                                                   1 April 2012                                                        SSLSPLIT(1)
