PAGEKITE(1)                                                      Awesome Commands                                                      PAGEKITE(1)

NAME
       pagekite - Make localhost servers publicly visible

SYNOPSIS
       pagekite [--options] [service] kite-name [+flags]

DESCRIPTION
       PageKite is a system for exposing localhost servers to the public Internet.  It is most commonly used to make local web servers or SSH
       servers publicly visible, although almost any TCP-based protocol can work if the client knows how to use an HTTP proxy.

       PageKite uses a combination of tunnels and reverse proxies to compensate for the fact that localhost usually does not have a public IP
       address and is often subject to adverse network conditions, including aggressive firewalls and multiple layers of NAT.

       This program implements both ends of the tunnel: the local "back-end" and the remote "front-end" reverse-proxy relay.  For convenience,
       pagekite also includes a basic HTTP server for quickly exposing files and directories to the World Wide Web for casual sharing and
       collaboration.

BASIC USAGE
       Basic usage, gives http://localhost:80/ a public name:
       $ pagekite NAME.pagekite.me

       To expose specific folders, files or use alternate local ports:
       $ pagekite /a/path/ NAME.pagekite.me +indexes  # built-in HTTPD
       $ pagekite *.html   NAME.pagekite.me           # built-in HTTPD
       $ pagekite 3000     NAME.pagekite.me           # HTTPD on 3000

       To expose multiple local servers (SSH and HTTP):
       $ pagekite ssh://NAME.pagekite.me AND 3000 NAME.pagekite.me

SERVICES AND KITES
       The most comman usage of pagekite is as a back-end, where it is used to expose local services to the outside world.

       Examples of services are: a local HTTP server, a local SSH server, a folder or a file.

       A service is exposed by describing it on the command line, along with the desired public kite name. If a kite name is requested which does
       not already exist in the configuration file and program is run interactively, the user will be prompted and given the option of signing up
       and/or creating a new kite using the pagekite.net service.

       Multiple services and kites can be specified on a single command-line, separated by the word 'AND' (note capital letters are required).
       This may cause problems if you have many files and folders by that name, but that should be relatively rare. :-)

KITE CONFIGURATION
       The options --list, --add, --disable and --remove can be used to manipulate the kites and service definitions in your configuration file,
       if you prefer not to edit it by hand.  Examples:

       Adding new kites
       $ pagekite --add /a/path/ NAME.pagekite.me +indexes
       $ pagekite --add 80 OTHER-NAME.pagekite.me

       To display the current configuration
       $ pagekite --list

       Disable or delete kites (--add re-enables)
       $ pagekite --disable OTHER-NAME.pagekite.me
       $ pagekite --remove NAME.pagekite.me

FLAGS
       Flags are used to tune the behavior of a particular kite, for example by enabling access controls or specific features of the built-in HTTP
       server.

   Common flags
       +ip/1.2.3.4
              Enable connections only from this IP address.

       +ip/1.2.3
              Enable connections only from this /24 netblock.

   HTTP protocol flags
       +password/name=pass
              Require a username and password (HTTP Basic Authentication)

       +rewritehost
              Rewrite the incoming Host: header.

       +rewritehost=N
              Replace Host: header value with N.

       +rawheaders
              Do not rewrite (or add) any HTTP headers at all.

       +insecure
              Allow access to phpMyAdmin, /admin, etc. (per kite).

   Built-in HTTPD flags
       +indexes
              Enable directory indexes.

       +indexes=all
              Enable directory indexes including hidden (dot-) files.

       +hide  Obfuscate URLs of shared files.

       +cgi=list
              A list of extensions, for which files should be treated as CGI scripts (example: +cgi=cgi,pl,sh).

OPTIONS
       The full power of pagekite lies in the numerous options which can be specified on the command line or in a configuration file (see below).

       Note that many options, especially the service and domain definitions, are additive and if given multiple options the program will attempt
       to obey them all.  Options are processed in order and if they are not additive then the last option will override all preceding ones.

       Although pagekite accepts a great many options, most of the time the program defaults will Just Work.

   Common options
       --clean
              Skip loading the default configuration file.

       --signup
              Interactively sign up for pagekite.net service.

       --defaults
              Set defaults for use with pagekite.net service.

       --nocrashreport
              Don't send anonymous crash reports to pagekite.net.

   Back-end options
       --shell
              Run PageKite in an interactive shell.

       --nullui
              Silent UI for scripting. Assumes Yes on all questions.

       --list List all configured kites.

       --add  Add (or enable) the following kites, save config.

       --remove
              Remove the following kites, save config.

       --disable
              Disable the following kites, save config.

       --only Disable all but the following kites, save config.

       --insecure
              Allow access to phpMyAdmin, /admin, etc. (global).

       --local=ports
              Configure for local serving only (no remote front-end).

       --watch=N
              Display proxied data (higher N = more verbosity).

       --noproxy
              Ignore system (or config file) proxy settings.

       --proxy=type:server:port, --socksify=server:port, --torify=server:port
              Connect to the front-ends using SSL, an HTTP proxy, a SOCKS proxy, or the Tor anonymity network.  The type can be any of 'ssl',
              'http' or 'socks5'.  The server name can either be a plain hostname, user@hostname or user:password@hostname.  For SSL connections
              the user part may be a path to a client cert PEM file.  If multiple proxies are defined, they will be chained one after another.

       --service_on=proto:kitename:host:port:secret
              Explicit configuration for a service kite.  Generally kites are created on the command-line using the service short-hand described
              above, but this syntax is used in the config file.

       --service_off=proto:kitename:host:port:secret
              Same as --service_on, except disabled by default.

       --service_cfg=..., --webpath=...
              These options are used in the configuration file to store service and flag settings (see above). These are both likely to change in
              the near future, so please just pretend you didn't notice them.

       --frontend=host:port
              Connect to the named front-end server. If this option is repeated, multiple connections will be made.

       --frontends=num:dns-name:port
              Choose num front-ends from the A records of a DNS domain name, using the given port number. Default behavior is to probe all
              addresses and use the fastest one.

       --nofrontend=ip:port
              Never connect to the named front-end server. This can be used to exclude some front-ends from auto-configuration.

       --fe_certname=domain
              Connect using SSL, accepting valid certs for this domain. If this option is repeated, any of the named certificates will be
              accepted, but the first will be preferred.

       --ca_certs=/path/to/file
              Path to your trusted root SSL certificates file.

       --dyndns=X
              Register changes with DynDNS provider X.  X can either be simply the name of one of the 'built-in' providers, or a URL format string
              for ad-hoc updating.

       --all  Terminate early if any tunnels fail to register.

       --new  Don't attempt to connect to any kites' old front-ends.

       --fingerpath=P
              Path recipe for the httpfinger back-end proxy.

       --noprobes
              Reject all probes for service state.

   Front-end options
       --isfrontend
              Enable front-end operation.

       --domain=proto,proto2,pN:domain:secret
              Accept tunneling requests for the named protocols and specified domain, using the given secret.  A * may be used as a wildcard for
              subdomains or protocols.

       --authdomain=auth-domain, --authdomain=target-domain:auth-domain
              Use auth-domain as a remote authentication server for the DNS-based authetication protocol.  If no target-domain is given, use this
              as the default authentication method.

       --motd=/path/to/motd
              Send the contents of this file to new back-ends as a "message of the day".

       --host=hostnameListen on the given hostname only.

       --ports=list
              Listen on a comma-separated list of ports.

       --portalias=A:BReport port A as port B to backends (because firewalls).

       --protos=list
              Accept the listed protocols for tunneling.

       --rawports=list
              Listen for raw connections these ports. The string '%s' allows arbitrary ports in HTTP CONNECT.

       --accept_acl_file=/path/to/file
              Consult an external access control file before accepting an incoming connection. Quick'n'dirty for mitigating abuse. The format is
              one rule per line: `rule policy comment` where a rule is an IP or regexp and policy is 'allow' or 'deny'.

       --client_acl=policy:regexp, --tunnel_acl=policy:regexp
              Add a client connection or tunnel access control rule.  Policies should be 'allow' or 'deny', the regular expression should be
              written to match IPv4 or IPv6 addresses.  If defined, access rules are checkd in order and if none matches, incoming connections
              will be rejected.

       --tls_default=name
              Default name to use for SSL, if SNI (Server Name Indication) is missing from incoming HTTPS connections.

       --tls_endpoint=name:/path/to/file
              Terminate SSL/TLS for a name using key/cert from a file.

   System options
       --optfile=/path/to/file
              Read settings from file X. Default is ~/.pagekite.rc.

       --optdir=/path/to/directory
              Read settings from /path/to/directory/*.rc, in lexicographical order.

       --savefile=/path/to/file
              Saved settings will be written to this file.

       --save Save the current configuration to the savefile.

       --settings
              Dump the current settings to STDOUT, formatted as a configuration file would be.

       --nozchunks
              Disable zlib tunnel compression.

       --sslzlib
              Enable zlib compression in OpenSSL.

       --buffers=N
              Buffer at most N kB of data before blocking.

       --logfile=F
              Log to file F, stdio means standard output.

       --daemonize
              Run as a daemon.

       --runas=U:G
              Set UID:GID after opening our listening sockets.

       --pidfile=P
              Write PID to the named file.

       --errorurl=U
              URL to redirect to when back-ends are not found.

       --selfsign

              Configure the built-in HTTP daemon for HTTPS, first generating a new self-signed certificate using openssl if necessary.

       --httpd=X:P, --httppass=X, --pemfile=X
              Configure the built-in HTTP daemon.  These options are likely to change in the near future, please pretend you didn't see them.

CONFIGURATION FILES
       If you are using pagekite as a command-line utility, it will load its configuration from a file in your home directory.  The file is named
       .pagekite.rc on Unix systems (including Mac OS X), or pagekite.cfg on Windows.

       If you are using pagekite as a system-daemon which starts up when your computer boots, it is generally configured to load settings from
       /etc/pagekite.d/*.rc (in lexicographical order).

       In both cases, the configuration files contain one or more of the same options as are used on the command line, with the difference that at
       most one option may be present on each line, and the parser is more tolerant of white-space.  The leading '--' may also be omitted for
       readability and blank lines and lines beginning with '#' are treated as comments.

       NOTE: When using -o, --optfile or --optdir on the command line, it is advisable to use --clean to suppress the default configuration.

SECURITY
       Please keep in mind, that whenever exposing a server to the public Internet, it is important to think about security. Hacked webservers are
       frequently abused as part of virus, spam or phishing campaigns and in some cases security breaches can compromise the entire operating
       system.

       Some advice:

       * Switch PageKite off when not using it.
       * Use the built-in access controls and SSL encryption.
       * Leave the firewall enabled unless you have good reason not to.
       * Make sure you use good passwords everywhere.
       * Static content is very hard to hack!
       * Always, always make frequent backups of any important work.

       Note that as of version 0.5, pagekite includes a very basic request firewall, which attempts to prevent access to phpMyAdmin and other
       sensitive systems.  If it gets in your way, the +insecure flag or --insecure option can be used to turn it off.

       For more, please visit: <https://pagekite.net/support/security/>

BUGS
       Using pagekite as a front-end relay with the native Python SSL module may result in poor performance.  Please use the pyOpenSSL wrappers
       instead.

SEE ALSO
       lapcat(1), <http://pagekite.org/>, <https://pagekite.net/>

CREDITS
       - Bjarni R. Einarsson <http://bre.klaki.net/>
       - The Beanstalks Project ehf. <https://pagekite.net/company/>
       - The Rannis Technology Development Fund <http://www.rannis.is/>
       - Joar Wandborg <http://wandborg.se/>

       - Luc-Pierre Terral

COPYRIGHT AND LICENSE
       Copyright 2010-2015, the Beanstalks Project ehf. and Bjarni R. Einarsson.

       This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as
       published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details.

       You should have received a copy of the GNU Affero General Public License along with this program.  If not, see:
       <http://www.gnu.org/licenses/>

https://pagekite.net/                                               2016-02-10                                                         PAGEKITE(1)
