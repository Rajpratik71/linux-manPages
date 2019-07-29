DIRMNGR(1)                                                                                    GNU Privacy Guard                                                                                    DIRMNGR(1)



NAME
       dirmngr - CRL and OCSP daemon

SYNOPSIS
       dirmngr [options] command [args]



DESCRIPTION
       Dirmngr  is a server for managing and downloading certificate revocation lists (CRLs) for X.509 certificates and for downloading the certificates themselves. Dirmngr also handles OCSP requests as an
       alternative to CRLs. Dirmngr is either invoked internally by gpgsm (from GnuPG 2) or when running as a system daemon through the dirmngr-client tool.


COMMANDS
       Commands are not distinguished from options execpt for the fact that only one command is allowed.


       --version
              Print the program version and licensing information.  Note that you can abbreviate this command.


       --help, -h
              Print a usage message summarizing the most useful command-line options.  Not that you can abbreviate this command.


       --server
              Run in server mode and wait for commands on the stdin.  The default mode is to create a socket and listen for commands there.


       --daemon
              Run in background daemon mode and listen for commands on a socket.  Note that this also changes the default home directory and enables the internal certificate validation code.


       --list-crls
              List the contents of the CRL cache on stdout. This is probably only useful for debugging purposes.


       --load-crl file
              This command requires a filename as additional argument, and it will make dirmngr try to import the CRL in file into it's cache.  Note, that this is  only  possible  if  Dirmngr  is  able  to
              retrieve the CA's certificate directly by its own means.  In general it is better to use gpgsm's --call-dirmngr loadcrl filename command so that gpgsm can help dirmngr.


       --fetch-crl url
              This  command  requires an URL as additional argument, and it will make dirmngr try to retrieve an import the CRL from that url into it's cache.  This is mainly useful for debugging purposes.
              The dirmngr-client provides the same feature for a running dirmngr.


       --shutdown
              This commands shuts down an running instance of Dirmngr.  This command has corrently no effect.


       --flush
              This command removes all CRLs from Dirmngr's cache.  Client requests will thus trigger reading of fresh CRLs.




OPTIONS
       --options file
              Reads configuration from file instead of from the default per-user configuration file.  The default configuration file is named `dirmngr.conf' and expected in the home directory.


       --homedir dir
              Set the name of the home directory to dir.  This option is only effective when used on the command line.  The default depends on the running mode:



              With --daemon given on the commandline
                     the directory named `/etc/dirmngr' for configuration files, `/var/lib/dirmngr/' for extra data and `/var/cache/dirmngr' for cached CRLs.


              Without --daemon given on the commandline
                     the directory named `.gnupg' directly below the home directory of the user unless the environment variable GNUPGHOME has been set in which case its value will be  used.   All  kind  of
                     data is stored below this directory.



       -v

       --verbose
              Outputs additional information while running.  You can increase the verbosity by giving several verbose commands to dirmngr, such as -vv.




       --log-file file
              Append all logging output to file.  This is very helpful in seeing what the agent actually does.


       --debug-level level
              Select the debug level for investigating problems.  level may be a numeric value or by a keyword:


              none   No debugging at all.  A value of less than 1 may be used instead of the keyword.

              basic  Some basic debug messages.  A value between 1 and 2 may be used instead of the keyword.

              advanced
                     More verbose debug messages.  A value between 3 and 5 may be used instead of the keyword.

              expert Even more detailed messages.  A value between 6 and 8 may be used instead of the keyword.

              guru   All of the debug messages you can get. A value greater than 8 may be used instead of the keyword.  The creation of hash tracing files is only enabled if the keyword is used.

       How these messages are mapped to the actual debugging flags is not specified and may change with newer releases of this program. They are however carefully selected to best aid in debugging.


       --debug flags
              This option is only useful for debugging and the behaviour may change at any time without notice.  FLAGS are bit encoded and may be given in usual C-Syntax.


       --debug-all
              Same as --debug=0xffffffff


       --debug-wait n
              When running in server mode, wait n seconds before entering the actual processing loop and print the pid.  This gives time to attach a debugger.


       -s

       --sh

       -c

       --csh  Format  the  info  output in daemon mode for use with the standard Bourne shell respective the C-shell . The default ist to guess it based on the environment variable SHELL which is in almost
              all cases sufficient.


       --force
              Enabling this option forces loading of expired CRLs; this is only useful for debugging.


       --disable-ldap
              Entirely disables the use of LDAP.


       --disable-http
              Entirely disables the use of HTTP.


       --ignore-http-dp
              When looking for the location of a CRL, the to be tested certificate usually contains so called CRL Distribution Point (DP) entries which are URLs describing the way to access the  CRL.   The
              first found DP entry is used.  With this option all entries using the HTTP scheme are ignored when looking for a suitable DP.


       --ignore-ldap-dp
              This is similar to --ignore-http-dp but ignores entries using the LDAP scheme.  Both options may be combined resulting in ignoring DPs entirely.


       --ignore-ocsp-service-url
              Ignore all OCSP URLs contained in the certificate.  The effect is to force the use of the default responder.


       --honor-http-proxy
              If the environment variable `http_proxy' has been set, use its value to access HTTP servers.


       --http-proxy host[:port]
              Use host and port to access HTTP servers.  The use of this options overrides the environment variable `http_proxy' regardless whether --honor-http-proxy has been set.



       --ldap-proxy host[:port]
              Use host and port to connect to LDAP servers.  If port is ommitted, port 389 (standard LDAP port) is used.  This overrides any specified host and port part in a LDAP URL and will also be used
              if host and port have been ommitted from the URL.


       --only-ldap-proxy
              Never use anything else but the LDAP "proxy" as configured with --ldap-proxy.  Usually dirmngr tries to use other configured LDAP server if the connection using the "proxy" failed.



       --ldapserverlist-file file
              Read the list of LDAP servers to consult for CRLs and certificates from file instead of the default per-user ldap server list file. The default value for file is `dirmngr_ldapservers.conf' or
              `ldapservers.conf' when running in --daemon mode.

              This server list file contains one LDAP server per line in the format

              hostname:port:username:password:base_dn

              Lines starting with a  '#' are comments.

              Note  that as usual all strings entered are expected to be UTF-8 encoded.  Obviously this will lead to problems if the password has orginally been encoded as Latin-1.  There is no other solu-
              tion here than to put such a password in the binary encoding into the file (i.e. non-ascii characters won't show up readable). ([The gpgconf tool might be helpful for frontends as  it  allows
              to edit this configuration file using percent escaped strings.])



       --ldaptimeout secs
              Specify the number of seconds to wait for an LDAP query before timing out. The default is currently 100 seconds.  0 will never timeout.



       --add-servers
              This options makes dirmngr add any servers it discovers when validating certificates against CRLs to the internal list of servers to consult for certificates and CRLs.

              This options is useful when trying to validate a certificate that has a CRL distribution point that points to a server that is not already listed in the ldapserverlist. Dirmngr will always go
              to this server and try to download the CRL, but chances are high that the certificate used to sign the CRL is located on the same server. So if dirmngr doesn't add that new server to list, it
              will often not be able to verify the signature of the CRL unless the --add-servers option is used.

              Note: The current version of dirmngr has this option disabled by default.



       --allow-ocsp
              This option enables OCSP support if requested by the client.

              OCSP requests are rejected by default because they may violate the privacy of the user; for example it is possible to track the time when a user is reading a mail.



       --ocsp-responder url
              Use url as the default OCSP Responder if the certificate does not contain information about an assigned responder.  Note, that --ocsp-signer must also be set to a valid certificate.


       --ocsp-signer fpr|file
              Use the certificate with the fingerprint fpr to check the responses of the default OCSP Responder.  Alternativly a filename can be given in which case the respinse is expected to be signed by
              one of the certificates described in that file.  Any argument which contains a slash, dot or tilde is considered a filename.  Usual filename expansion takes place: A tilde at the  start  fol-
              lowed by a slash is replaced by the content of `HOME', no slash at start describes a relative filename which will be searched at the home directory.  To make sure that the file is searched in
              the home directory, either prepend the name with "./" or use a name which contains a dot.

              If a response has been signed by a certificate described by these fingerprints no further check upon the validity of this certificate is done.

              The format of the FILE is a list of SHA-1 fingerprint, one per line with optional colons between the bytes.  Empty lines and lines prefix with a hash mark are ignored.



       --ocsp-max-clock-skew n
              The number of seconds a skew between the OCSP responder and them local clock is accepted.  Default is 600 (20 minutes).


       --ocsp-max-period n
              Seconds a response is at maximum considered valid after the time given in the thisUpdate field.  Default is 7776000 (90 days).


       --ocsp-current-period n
              The number of seconds an OCSP response is considered valid after the time given in the NEXT_UPDATE datum.  Default is 10800 (3 hours).



       --max-replies n
              Do not return more that n items in one query.  The default is 10.


       --ignore-cert-extension oid
              Add oid to the list of ignored certificate extensions.  The oid is expected to be in dotted decimal form, like 2.5.29.3.  This option may be used more than once.  Critical flagged certificate
              extensions  matching  one of the OIDs in the list are treated as if they are actually handled and thus the certificate won't be rejected due to an unknown critical extension.  Use this option
              with care because extensions are usually flagged as critical for a reason.





SIGNALS
       A running dirmngr may be controlled by signals, i.e. using the kill command to send a signal to the process.

       Here is a list of supported signals:



       SIGHUP This signals flushes all internally cached CRLs as well as any cached certificates.  Then the certificate cache is reinitialized as on startup.  Options are  re-read  from  the  configuration
              file.


       SIGTERM
              Shuts down the process but waits until all current requests are fulfilled.  If the process has received 3 of these signals and requests are still pending, a shutdown is forced.


       SIGINT Shuts down the process immediately.



       SIGUSR1
              This prints some caching statistics to the log file.






EXAMPLES
       The way to start the dirmngr in the foreground (as done by tools if no dirmngr is running in the background) is to use:

           dirmngr --server -v

       If a dirmngr is supposed to be used as a system wide daemon, it should be started like:

           dirmngr --daemon

       This will force it to go into the backround, read the default certificates (including the trusted root certificates) and listen on a socket for client requests.  It does also print information about
       the socket used but they are only for compatibilty reasons with old GnuPG versions and may be ignored.



FILES
       Dirmngr makes use of several directories when running in daemon mode:



       /etc/dirmngr
              This is where all the configuration files are expected by default.


       /etc/dirmngr/trusted-certs
              This directory should be filled with certificates of Root CAs you are trusting in checking the CRLS and signing OCSP Reponses.  Usually these are the same certificates you use with the appli-
              cations  making  use  of  dirmngr.   It is expected that each of these certificate files contain exactly one DER encoded certificate in a file with the suffix `.crt' or `.der'.  dirmngr reads
              those certificates on startup and when given a SIGHUP.  Certificates which are not readable or do not make up a proper X.509 certificate are ignored; see the log file for details.

              Note that for OCSP responses the certificate specified using the option --ocsp-signer is always considered valid to sign OCSP requests.



       /var/lib/dirmngr/extra-certs
              This directory may contain extra certificates which are preloaded into the interal cache on startup.  This is convenient in cases you have a couple intermediate CA  certificates  or  certifi-
              cates  ususally  used  to  sign OCSP reponses.  These certificates are first tried before going out to the net to look for them.  These certificates must also be DER encoded and suffixed with
              `.crt' or `.der'.


       /var/run/dirmngr
              This directory keeps the socket file for accsing dirmngr services.  The name of the socket file will be `socket'.  Make sure that this directory has the proper permissions to let dirmngr cre-
              ate the socket file and that eligible users may read and write to that socket.


       /var/cache/dirmngr/crls.d
              This directory is used to store cached CRLs.  The `crls.d' part will be created by dirmngr if it does not exists but you need to make sure that the upper directory exists.



SEE ALSO
       gpgsm(1), dirmngr-client(1)

       The full documentation for this tool is maintained as a Texinfo manual.  If dirmngr and the info program are properly installed at your site, the command

         info dirmngr

       should give you access to the complete manual including a menu structure and an index.






Dirmngr 1.1.1                                                                                     2017-06-29                                                                                       DIRMNGR(1)
