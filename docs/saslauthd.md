SASLAUTHD(8)                                                                             BSD System Manager's Manual                                                                             SASLAUTHD(8)

NAME
     saslauthd — sasl authentication server

SYNOPSIS
     saslauthd -a authmech [-Tvdchlr] [-O option] [-m mux_path] [-n threads] [-s size] [-t timeout]

DESCRIPTION
     saslauthd is a daemon process that handles plaintext authentication requests on behalf of the SASL library.

     The server fulfills two roles: it isolates all code requiring superuser privileges into a single process, and it can be used to provide proxy authentication services to clients that do not understand
     SASL based authentication.

     saslauthd should be started from the system boot scripts when going to multi-user mode. When running against a protected authentication database (e.g. the shadow mechanism), it must be run as the
     superuser.

   Options
     Options named by lower-case letters configure the server itself.  Upper-case options control the behavior of specific authentication mechanisms; their applicability to a particular authentication
     mechanism is described in the AUTHENTICATION MECHANISMS section.

     -a authmech
             Use authmech as the authentication mechanism. (See the AUTHENTICATION MECHANISMS section below.) This parameter is mandatory.

     -O option
             A mechanism specific option (e.g. rimap hostname or config file path)

     -H hostname
             The remote host to be contacted by the rimap authentication mechanism. (Deprecated, use -O instead)

     -m path
             Use path as the pathname to the named socket to listen on for connection requests. This must be an absolute pathname, and MUST NOT include the trailing "/mux".  Note that the default for this
             value is "/var/state/saslauthd" (or what was specified at compile time) and that this directory must exist for saslauthd to function.

     -n threads
             Use threads processes for responding to authentication queries. (default: 5)  A value of zero will indicate that saslauthd should fork an individual process for each connection.  This can
             solve leaks that occur in some deployments.

     -s size
             Use size as the table size of the hash table (in kilobytes)

     -t timeout
             Use timeout as the expiration time of the authentication cache (in seconds)

     -T      Honour time-of-day login restrictions.

     -h      Show usage information

     -c      Enable caching of authentication credentials

     -l      Disable the use of a lock file for controlling access to accept().

     -r      Combine the realm with the login (with an '@' sign in between).  e.g.  login: "foo" realm: "bar" will get passed as login: "foo@bar".  Note that the realm will still be passed, which may lead
             to unexpected behavior for authentication mechanisms that make use of the realm, however for mechanisms which don't, such as getpwent, this is the only way to authenticate domain-specific
             users sharing the same userid.

     -v      Print the version number and available authentication mechanisms on standard error, then exit.

     -d      Debugging mode.

   Logging
     saslauthd logs its activities via syslogd using the LOG_AUTH facility.

AUTHENTICATION MECHANISMS
     saslauthd supports one or more "authentication mechanisms", dependent upon the facilities provided by the underlying operating system.  The mechanism is selected by the -a flag from the following list
     of choices:

     dce        (AIX)

                Authenticate using the DCE authentication environment.

     getpwent   (All platforms)

                Authenticate using the getpwent() library function. Typically this authenticates against the local password file. See your system's getpwent(3) man page for details.

     kerberos4  (All platforms)

                Authenticate against the local Kerberos 4 realm. (See the NOTES section for caveats about this driver.)

     kerberos5  (All platforms)

                Authenticate against the local Kerberos 5 realm.

     pam        (Linux, Solaris)

                Authenticate using Pluggable Authentication Modules (PAM).

     rimap      (All platforms)

                Forward authentication requests to a remote IMAP server. This driver connects to a remote IMAP server, specified using the -O flag, and attempts to login (via an IMAP ‘LOGIN’ command) using
                the credentials supplied to the local server. If the remote authentication succeeds the local connection is also considered to be authenticated. The remote connection is closed as soon as
                the tagged response from the ‘LOGIN’ command is received from the remote server.

                The option parameter to the -O flag describes the remote server to forward authentication requests to.  hostname can be a hostname (imap.example.com) or a dotted-quad IP address
                (192.168.0.1). The latter is useful if the remote server is multi-homed and has network interfaces that are unreachable from the local IMAP server. The remote host is contacted on the
                ‘imap’ service port. A non-default port can be specified by appending a slash and the port name or number to the hostname argument.

                The -O flag and argument are mandatory when using the rimap mechanism.

     shadow     (AIX, Irix, Linux, Solaris)

                Authenticate against the local "shadow password file".  The exact mechanism is system dependent.  saslauthd currently understands the getspnam() and getuserpw() library routines. Some sys-
                tems honour the -T flag.

     sasldb     (All platforms)

                Authenticate against the SASL authentication database.  Note that this is probably not what you want to use, and is even disabled at compile-time by default.  If you want to use sasldb with
                the SASL library, you probably want to use the pwcheck_method of "auxprop" along with the sasldb auxprop plugin instead.

     ldap       (All platforms that support OpenLDAP 2.0 or higher)

                Authenticate against an ldap server.  The ldap configuration parameters are read from /usr/local/etc/saslauthd.conf.  The location of this file can be changed with the -O parameter. See the
                LDAP_SASLAUTHD file included with the distribution for the list of available parameters.

     sia        (Digital UNIX)

                Authenticate using the Digital UNIX Security Integration Architecture (a.k.a.  "enhanced security").

NOTES
     The kerberos4 authentication driver consumes considerable resources. To perform an authentication it must obtain a ticket granting ticket from the TGT server on every authentication request. The Ker-
     beros library routines that obtain the TGT also create a local ticket file, on the reasonable assumption that you will want to save the TGT for use by other Kerberos applications. These ticket files
     are unusable by saslauthd , however there is no way not to create them. The overhead of creating and removing these ticket files can cause serious performance degradation on busy servers. (Kerberos
     was never intended to be used in this manner, anyway.)

FILES
     /var/run/saslauthd/mux  The default communications socket.

     /usr/local/etc/saslauthd.conf
                             The default configuration file for ldap support.

SEE ALSO
     passwd(1), getpwent(3), getspnam(3), getuserpw(3), sasl_checkpass(3) sia_authenticate_user(3),

CMU-SASL                                                                                          12 12 2005                                                                                         CMU-SASL
