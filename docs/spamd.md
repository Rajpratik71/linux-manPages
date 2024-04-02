SPAMD(8p)                                               User Contributed Perl Documentation                                              SPAMD(8p)

NAME
       spamd - daemonized version of spamassassin

SYNOPSIS
       spamd [options]

       Options:

        -l, --allow-tell                  Allow learning/reporting
        -c, --create-prefs                Create user preferences files
        -C path, --configpath=path        Path for default config files
        --siteconfigpath=path             Path for site configs
        --cf='config line'                Additional line of configuration
        -d, --daemonize                   Daemonize
        -h, --help                        Print usage message
        -i [ip_or_name[:port]], --listen=[ip_or_name[:port]] Listen on IP addr and port
        -p port, --port=port              Listen on specified port, may be overridden by -i
        -4, --ipv4-only, --ipv4           Use IPv4 where applicable, disables IPv6
        -6                                Use IPv6 where applicable, disables IPv4
        -A host,..., --allowed-ips=..,..  Restrict to IP addresses which can connect
        -m num, --max-children=num        Allow maximum num children
        --min-children=num                Allow minimum num children
        --min-spare=num                   Lower limit for number of spare children
        --max-spare=num                   Upper limit for number of spare children
        --max-conn-per-child=num          Maximum connections accepted by child
                                          before it is respawned
        --round-robin                     Use traditional prefork algorithm
        --timeout-tcp=secs                Connection timeout for client headers
        --timeout-child=secs              Connection timeout for message checks
        -q, --sql-config                  Enable SQL config (needs -x)
        -Q, --setuid-with-sql             Enable SQL config (needs -x,
                                          enables use of -H)
        --ldap-config                     Enable LDAP config (needs -x)
        --setuid-with-ldap                Enable LDAP config (needs -x,
                                          enables use of -H)
        --virtual-config-dir=dir          Enable pattern based Virtual configs
                                          (needs -x)
        -r pidfile, --pidfile             Write the process id to pidfile
        -s facility, --syslog=facility    Specify the syslog facility
        --syslog-socket=type              How to connect to syslogd
        --log-timestamp-fmt=fmt           strftime(3) format for timestamps, may be
                                          empty to disable timestamps, or 'default'
        -u username, --username=username  Run as username
        -g groupname, --groupname=groupname  Run as groupname
        -v, --vpopmail                    Enable vpopmail config
        -x, --nouser-config               Disable user config files
        --auth-ident                      Use ident to identify spamc user (deprecated)
        --ident-timeout=timeout           Timeout for ident connections
        -D, --debug[=areas]               Print debugging messages (for areas)
        -L, --local                       Use local tests only (no DNS)
        -P, --paranoid                    Die upon user errors
        -H [dir], --helper-home-dir[=dir] Specify a different HOME directory
        --ssl                             Enable SSL on TCP connections
        --ssl-port port                   Override --port setting for SSL connections
        --server-key keyfile              Specify an SSL keyfile
        --server-cert certfile            Specify an SSL certificate
        --socketpath=path                 Listen on a given UNIX domain socket
        --socketowner=name                Set UNIX domain socket file's owner
        --socketgroup=name                Set UNIX domain socket file's group
        --socketmode=mode                 Set UNIX domain socket file's mode
        --timing                          Enable timing and logging
        -V, --version                     Print version and exit

       The --listen option (or -i) may be specified multiple times, its syntax is: [ ssl: ] [ host-name-or-IP-address ] [ : port ]  or an absolute
       path (filename) of a Unix socket.  If port is omitted it defaults to --port or to 783.  Option --ssl implies a prefix 'ssl:'.  An IPv6
       address should be enclosed in square brackets, e.g. [::1]:783, an IPv4 address may be but need not be enclosed in square brackets.  An
       asterisk '*' in place of a hostname implies an unspecified address, ('0.0.0.0' or '::'), i.e. it binds to all interfaces. An empty option
       value implies '*'. A default is '--listen localhost', which binds to a loopback interface only.

DESCRIPTION
       The purpose of this program is to provide a daemonized version of the spamassassin executable.  The goal is improving throughput
       performance for automated mail checking.

       This is intended to be used alongside "spamc", a fast, low-overhead C client program.

       See the README file in the "spamd" directory of the SpamAssassin distribution for more details.

       Note: Although "spamd" will check per-user config files for every message, any changes to the system-wide config files will require either
       restarting spamd or forcing it to reload itself via SIGHUP for the changes to take effect.

       Note: If "spamd" receives a SIGHUP, it internally reloads itself, which means that it will change its pid and might not restart at all if
       its environment changed  (ie. if it can't change back into its own directory).  If you plan to use SIGHUP, you should always start "spamd"
       with the -r switch to know its current pid.

OPTIONS
       Options of the long form can be shortened as long as they remain unambiguous.  (i.e. --dae can be used instead of --daemonize) Also,
       boolean options (like --user-config) can be negated by adding no (--nouser-config), however, this is usually unnecessary.

       -l, --allow-tell
           Allow learning and forgetting (to a local Bayes database), reporting and revoking (to a remote database) by spamd. The client issues a
           TELL command to tell what type of message is being processed and whether local (learn/forget) or remote (report/revoke) databases
           should be updated.

           Note that spamd always trusts the username passed in (unless --auth-ident is used) so clients could maliciously learn messages for
           other users. (This is not ususally a concern with an SQL Bayes store as users will typically have read-write access directly to the
           database, and can also use "sa-learn" with the -u option to achieve the same result.)

       -c, --create-prefs
           Create user preferences files if they don't exist (default: don't).

       -C path, --configpath=path
           Use the specified path for locating the distributed configuration files.  Ignore the default directories (usually
           "/usr/share/spamassassin" or similar).

       --siteconfigpath=path
           Use the specified path for locating site-specific configuration files.  Ignore the default directories (usually "/etc/spamassassin" or
           similar).

       --cf='config line'
           Add additional lines of configuration directly from the command-line, parsed after the configuration files are read.   Multiple --cf
           arguments can be used, and each will be considered a separate line of configuration.

       -d, --daemonize
           Detach from starting process and run in background (daemonize).

       -h, --help
           Print a brief help message, then exit without further action.

       -V, --version
           Print version information, then exit without further action.

       -i [ipaddress[:<port>]], --listen[=ipaddress[:<port>]]
           Additional alias names for this option are --listen-ip and --ip-address.  Tells spamd to listen on the specified IP address, defaults
           to a loopback interface, i.e. "--listen localhost").  If no value is specified after the switch, or if an asterisk '*' stands in place
           of an <ipaddress>, spamd will listen on all interfaces - this is equivalent to address '0.0.0.0' for IPv4 and to '::' for IPv6. You can
           also use a valid hostname which will make spamd listen on all addresses that a name resolves to. The option may be specified multiple
           times. See also options -4 and -6 for restricting address family to IPv4 or to IPv6. If a port is specified it overrides for this
           socket the global --port (and --ssl-port) setting. An IPv6 addresses should be enclosed in square brackets, e.g. [::1]:783. For
           compatibility square brackets on an IPv6 address may be omitted if a port number specification is also omitted.

       -p port, --port=port
           Optionally specifies the port number for the server to listen on (default: 783).

           If the --ssl switch is used, and --ssl-port is not supplied, then this port will be used to accept SSL connections instead of
           unencrypted connections.  If the --ssl switch is used, and --ssl-port is set, then unencrypted connections will be accepted on the
           --port at the same time as encrypted connections are accepted at --ssl-port.

       -q, --sql-config
           Turn on SQL lookups even when per-user config files have been disabled with -x. this is useful for spamd hosts which don't have user's
           home directories but do want to load user preferences from an SQL database.

           If your spamc client does not support sending the "User:" header, like "exiscan", then the SQL username used will always be nobody.

           This inhibits the setuid() behavior, so the "-u" option is required. If you want the setuid() behaviour, use "-Q" or
           "--setuid-with-sql" instead.

       --ldap-config
           Turn on LDAP lookups. This is completely analog to "--sql-config", only it is using an LDAP server.

           Like "--sql-config", this disables the setuid behavior, and requires "-u". If you want it, use "--setuid-with-ldap" instead.

       -Q, --setuid-with-sql
           Turn on SQL lookups even when per-user config files have been disabled with -x and also setuid to the user.  This is useful for spamd
           hosts which want to load user preferences from an SQL database but also wish to support the use of -H (Helper home directories.)

       --setuid-with-ldap
           Turn on LDAP lookups even when per-user config files have been disabled with -x and also setuid to the user.  This is again completely
           analog to "--setuid-with-sql", only it is using an LDAP server.

       --virtual-config-dir=pattern
           This option specifies where per-user preferences can be found for virtual users, for the -x switch. The pattern is used as a base
           pattern for the directory name.  Any of the following escapes can be used:

           %u -- replaced with the full name of the current user, as sent by spamc.
           %l -- replaced with the 'local part' of the current username.  In other words, if the username is an email address, this is the part
           before the "@" sign.
           %d -- replaced with the 'domain' of the current username.  In other words, if the username is an email address, this is the part after
           the "@" sign.
           %x -- replaced with the full name of the current user, as sent by spamc. If the resulting config directory does not exist, replace with
           the domain part to use a domain-wide default.
           %% -- replaced with a single percent sign (%).

           So for example, if "/vhome/users/%u/spamassassin" is specified, and spamc sends a virtual username of "jm@example.com", the directory
           "/vhome/users/jm@example.com/spamassassin" will be used.

           The set of characters allowed in the virtual username for this path are restricted to:

                   A-Z a-z 0-9 - + _ . , @ =

           All others will be replaced by underscores ("_").

           This path must be a writable directory.  It will be created if it does not already exist.  If a file called user_prefs exists in this
           directory (note: not in a ".spamassassin" subdirectory!), it will be loaded as the user's preferences.  The Bayes databases for that
           user will be stored in this directory.

           Note that this requires that -x is used, and cannot be combined with SQL- or LDAP-based configuration.

           The pattern must expand to an absolute directory when spamd is running daemonized (-d).

           Currently, use of this without -u is not supported. This inhibits setuid.

       -r pidfile, --pidfile=pidfile
           Write the process ID of the spamd parent to the file specified by pidfile.  The file will be unlinked when the parent exits.  Note that
           when running with the -u option, the file must be writable by that user.

       -v, --vpopmail
           Enable vpopmail config.  If specified with with -u set to the vpopmail user, this allows spamd to lookup/create user_prefs in the
           vpopmail user's own maildir.  This option is useful for vpopmail virtual users who do not have an entry in the system /etc/passwd file.

           Currently, use of this without -u is not supported. This inhibits setuid.

       -s facility, --syslog=facility
           Specify the syslog facility to use (default: mail).  If "stderr" is specified, output will be written to stderr. (This is useful if
           you're running "spamd" under the "daemontools" package.) With a facility of "file", all output goes to spamd.log. facility is
           interpreted as a file name to log to if it contains any characters except a-z and 0-9. "null" disables logging completely (used
           internally).

           Examples:      spamd -s mail                 # use syslog, facility mail (default)      spamd -s ./mail               # log to file
           ./mail      spamd -s stderr 2>/dev/null   # log to stderr, throw messages away      spamd -s null                 # the same as above
                spamd -s file                 # log to file ./spamd.log      spamd -s /var/log/spamd.log   # log to file /var/log/spamd.log

           If logging to a file is enabled and that log file is rotated, the spamd server must be restarted with a SIGHUP. (If the log file is
           just truncated, this is not needed but still recommended.)

           Note that logging to a file does not use locking, so you cannot intermix logging from spamd and other processes into the same file.  If
           you want to mix logging like this, use syslog instead.

           If you use syslog logging, it is essential to send a SIGHUP to the spamd daemon when you restart the syslogd daemon.  (This is due to a
           shortcoming in Perl's syslog handling, where the disappearance of the connection to the syslogd is considered a fatal error.)

       --syslog-socket=type
           Specify how spamd should send messages to syslogd. The type can be any of the socket types or logging mechanisms as accepted by the
           subroutine Sys::Syslog::setlogsock(). Depending on a version of Sys::Syslog and on the underlying operating system, one of the
           following values (or their subset) can be used: "native", "eventlog", "tcp", "udp", "inet", "unix", "stream", "pipe", or "console".
           The value "eventlog" is specific to Win32 events logger and requires a perl module Win32::EventLog to be installed.  For more
           information please consult the Sys::Syslog documentation.

           A historical setting --syslog-socket=none is mapped to --syslog=stderr.

           A default for Windows platforms is "none", otherwise the default is to try "unix" first, falling back to "inet" if perl detects errors
           in its "unix" support.

           Some platforms, or versions of perl, are shipped with old or dysfunctional versions of the Sys::Syslog module which do not support some
           socket types, so you may need to set this option explicitly.  If you get error messages regarding __PATH_LOG or similar spamd, try
           changing this setting.

           The socket types "file" is used internally and should not be specified.  Use the "-s" switch instead.

       --log-timestamp-fmt=format
           The --log-timestamp-fmt option can provide a POSIX strftime(3) format for timestamps included in each logged message. Each logger
           (stderr, file, syslog) has its own default value for a timestamp format, which applies when --log-timestamp-fmt option is not given, or
           with --log-timestamp-fmt=default .  Timestamps can be turned off by specifying an empty string with this option, e.g.
           --log-timestamp-fmt='' or just --log-timestamp-fmt= .  Typical use: --log-timestamp-fmt='%a %b %e %H:%M:%S %Y' (provides localized
           weekday and month names in the ctime(3) style), or '%a, %e %b %Y %H:%M:%S %z (%Z)' for a RFC 2822 format, or maybe '%Y-%m-%d
           %H:%M:%S%z' for an ISO 8601 (EN 28601) format, or just '%Y%m%dT%H%M%S' .

       -u username, --username=username
           Run as the named user.  If this option is not set, the default behaviour is to setuid() to the user running "spamc", if "spamd" is
           running as root.

           Note: "--username=root" is not a valid option.  If specified, "spamd" will exit with a fatal error on startup.

       -g groupname, --groupname=groupname
           Run as the named group if --username is being used. If this option is not set when --username is used then the primary group for the
           user given to --username is used.

       -x, --nouser-config, --user-config
           Turn off (on) reading of per-user configuration files (user_prefs) from the user's home directory.  The default behaviour is to read
           per-user configuration from the user's home directory (--user-config).

           This option does not disable or otherwise influence the SQL, LDAP or Virtual Config Dir settings.

       --auth-ident
           Verify the username provided by spamc using ident.  This is only useful if connections are only allowed from trusted hosts (because an
           identd that lies is trivial to create) and if spamc REALLY SHOULD be running as the user it represents.  Connections are terminated
           immediately if authentication fails.  In this case, spamc will pass the mail through unchecked.  Failure to connect to an ident server,
           and response timeouts are considered authentication failures.  This requires that Net::Ident be installed. Deprecated.

       --ident-timeout=timeout
           Wait at most timeout seconds for a response to ident queries.  Ident query that takes longer that timeout seconds will fail, and mail
           will not be processed.  Setting this to 0.0 or less results in no timeout, which is STRONGLY discouraged.  The default is 5 seconds.

       -A host,..., --allowed-ips=host,...
           Specify a comma-separated list of authorized hosts or networks which can connect to this spamd instance. Each element of the list is
           either a single IP addresses, or a range of IP addresses in address/masklength CIDR notation, or ranges of IPv4 addresses by specifying
           3 or less octets with a trailing dot.  Hostnames are not supported, only IPv4 or IPv6 addresses.  This option can be specified multiple
           times, or can take a list of addresses separated by commas.  IPv6 addresses may be (but need not be) enclosed in square brackets for
           consistency with option --listen.  Examples:

           -A 10.11.12.13 -- only allow connections from 10.11.12.13.

           -A 10.11.12.13,10.11.12.14 -- only allow connections from 10.11.12.13 and 10.11.12.14.

           -A 10.200.300.0/24 -- allow connections from any machine in the range "10.200.300.*".

           -A 10. -- allow connections from any machine in the range "10.*.*.*".

           -A [2001:db8::]/32,192.0.2.0/24,::1,127.0.0.0/8 -- only accept connections from specified test networks and from localhost.

           In absence of the -A option, connections are only accepted from IP address 127.0.0.1 or ::1, i.e. from localhost on a loopback
           interface.

       -D [area,...], --debug [area,...]
           Produce debugging output. If no areas are listed, all debugging information is printed. Diagnostic output can also be enabled for each
           area individually; area is the area of the code to instrument. For example, to produce diagnostic output on bayes, learn, and dns, use:

                   spamassassin -D bayes,learn,dns

           Higher priority informational messages that are suitable for logging in normal circumstances are available with an area of "info".

           For more information about which areas (also known as channels) are available, please see the documentation at:

                   C<http://wiki.apache.org/spamassassin/DebugChannels>

       -4, --ipv4only, --ipv4-only, --ipv4
           Use IPv4 where applicable, do not use IPv6.  The option affects a set of listen sockets (see option "--listen") and disables IPv6 for
           DNS tests.

       -6  Use IPv6 where applicable, do not use IPv4.  The option affects a set of listen sockets (see option "--listen") and disables IPv4 for
           DNS tests. Installing a module IO::Socket::IP is recommended if spamd is expected to receive requests over IPv6.

       -L, --local
           Perform only local tests on all mail.  In other words, skip DNS and other network tests.  Works the same as the "-L" flag to
           spamassassin(1).

       -P, --paranoid
           Die on user errors (for the user passed from spamc) instead of falling back to user nobody and using the default configuration.

       -m number , --max-children=number
           This option specifies the maximum number of children to spawn.  Spamd will spawn that number of children, then sleep in the background
           until a child dies, wherein it will go and spawn a new child.

           Incoming connections can still occur if all of the children are busy, however those connections will be queued waiting for a free
           child.  The minimum value is 1, the default value is 5.

           Please note that there is a OS specific maximum of connections that can be queued (Try "perl -MSocket -e'print SOMAXCONN'" to find this
           maximum).

           Note that if you run too many servers for the amount of free RAM available, you run the danger of hurting performance by causing a high
           swap load as server processes are swapped in and out continually.

       --min-children=number
           The minimum number of children that will be kept running.  The minimum value is 1, the default value is 1.  If you have lots of free
           RAM, you may want to increase this.

       --min-spare=number
           The lower limit for the number of spare children allowed to run.  A spare, or idle, child is one that is not handling a scan request.
           If there are too few spare children available, a new server will be started every second or so.  The default value is 1.

       --max-spare=number
           The upper limit for the number of spare children allowed to run.  If there are too many spare children, one will be killed every second
           or so until the number of idle children is in the desired range.  The default value is 2.

       --max-conn-per-child=number
           This option specifies the maximum number of connections each child should process before dying and letting the master spamd process
           spawn a new child.  The minimum value is 1, the default value is 200.

       --round-robin
           By default, "spamd" will attempt to keep a small number of "hot" child processes as busy as possible, and keep any others as idle as
           possible, using something similar to the Apache httpd server scaling algorithm.  This is accomplished by the master process
           coordinating the activities of the children.  This switch will disable this scaling algorithm, and the behaviour seen in the 3.0.x
           versions will be used instead, where all processes receive an equal load and no scaling takes place.

       --timeout-tcp=number
           This option specifies the number of seconds to wait for headers from a client (spamc) before closing the connection.  The minimum value
           is 1, the default value is 30, and a value of 0 will disable socket timeouts completely.

       --timeout-child=number
           This option specifies the number of seconds to wait for a spamd child to process or check a message.  The minimum value is 1, the
           default value is 300, and a value of 0 will disable child timeouts completely.

       -H directory, --helper-home-dir=directory
           Specify that external programs such as Razor, DCC, and Pyzor should have a HOME environment variable set to a specific directory.  The
           default is to use the HOME environment variable setting from the shell running spamd.  By specifying no argument, spamd will use the
           spamc caller's home directory instead.

       --ssl
           Accept only SSL connections on the associated port.  The IO::Socket::SSL perl module must be installed.

           If the --ssl switch is used, and --ssl-port is not supplied, then --port port will be used to accept SSL connections instead of
           unencrypted connections.  If the --ssl switch is used, and --ssl-port is set, then unencrypted connections will be accepted on the
           --port, at the same time as encrypted connections are accepted at --ssl-port.

       --ssl-port=port
           Optionally specifies the port number for the server to listen on for SSL connections (default: whatever --port uses).  See --ssl for
           more details.

       --server-key keyfile
           Specify the SSL key file to use for SSL connections.

       --server-cert certfile
           Specify the SSL certificate file to use for SSL connections.

       --socketpath pathname
           Listen on a UNIX domain socket at path pathname, in addition to sockets specified with a "--listen" option. This option is provided for
           compatibility with older versions of spamd. Starting with version 3.4.0 the "--listen" option can also take a UNIX domain socket as its
           value (an absolute path name). Unlike "--socketpath", the "--listen" option may be specified multiple times if spamd needs to listen on
           multiple UNIX or INET or INET6 sockets.

           Warning: the Perl support on BSD platforms for UNIX domain sockets seems to have a bug regarding paths of over 100 bytes or so
           (SpamAssassin bug 4380).  If you see a 'could not find newly-created UNIX socket' error message, and the path appears truncated, this
           may be the cause.  Try using a shorter path to the socket.

           By default, use of --socketpath without --listen will inhibit SSL connections and unencrypted TCP connections.  To add other sockets,
           specify them with --listen, e.g. '--listen=:' or '--listen=*:'

       --socketowner name
           Set UNIX domain socket to be owned by the user named name.  Note that this requires that spamd be started as "root", and if "-u" is
           used, that user should have write permissions to unlink the file later, for when the "spamd" server is killed.

       --socketgroup name
           Set UNIX domain socket to be owned by the group named name.  See "--socketowner" for notes on ownership and permissions.

       --socketmode mode
           Set UNIX domain socket to use the octal mode mode.  Note that if "-u" is used, that user should have write permissions to unlink the
           file later, for when the "spamd" server is killed.

       --timing
             Enable timing measurements and output the information for logging.  This
             is the same information as provided by the TIMING tag.

SEE ALSO
       spamc(1) spamassassin(1) Mail::SpamAssassin::Conf(3) Mail::SpamAssassin(3)

PREREQUISITES
       "Mail::SpamAssassin"

AUTHORS
       The SpamAssassin(tm) Project (http://spamassassin.apache.org/)

LICENSE
       SpamAssassin is distributed under the Apache License, Version 2.0, as described in the file "LICENSE" included with the distribution.

perl v5.22.1                                                        2018-11-06                                                           SPAMD(8p)
