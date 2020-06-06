certmonger(8)                                                                              System Manager's Manual                                                                              certmonger(8)



NAME
       certmonger


SYNOPSIS
       certmonger [-s|-S] [-L|-l] [-P SOCKET] [-b TIMEOUT|-B] [-n|-f] [-d LEVEL] [-p FILE] [-F] [-c cmd] [-v]


DESCRIPTION
       The  certmonger  daemon monitors certificates for impending expiration, and can optionally refresh soon-to-be-expired certificates with the help of a CA.  If told to, it can drive the entire enroll‐
       ment process from key generation through enrollment and refresh.

       The daemon provides a control interface via the org.fedorahosted.certmonger service, with which client tools such as getcert(1) interact.


OPTIONS
       -s     Listen on the session bus rather than the system bus.

       -S     Listen on the system bus rather than the session bus.  This is the default.

       -l     Also listen on a private socket for connections from clients running under the same UID.

       -L     Listen only on a private socket for connections from clients running under the same UID, and skip connecting to a bus.

       -P     Specify a location for the private listening socket.  If the location beings with a '/' character, it will be prefixed with 'unix:path=', otherwise it will be prefixed with 'unix:'.  If  this
              option is not specified, the listening socket, if one is created, will be placed in the abstract namespace.

       -b TIMEOUT
              Behave as a bus-activated service: if there are no certificates to be monitored or obtained, and no requests are received within TIMEOUT seconds, exit.  Not compatible with the -c option.

       -B     Don't behave as a bus-activated service.  This is the default.

       -n     Don't fork, and log messages to stderr rather than syslog.

       -f     Do fork, and log messages to syslog rather than stderr.  This is the default.

       -d LEVEL
              Set debugging level.  Higher values produce more debugging output.  Implies -n.

       -p FILE
              Store the daemon's process ID in the named file.

       -F     Force NSS to be initialized in FIPS mode.  The default behavior is to heed the setting stored in /proc/sys/crypto/fips_enabled.

       -c cmd After  the service has initialized, run the specified command, then shut down the service after the command exits.  If the -l or -L option was also specified, the command will be run with the
              CERTMONGER_PVT_ADDRESS environment variable set to the listening socket's location.  Not compatible with the -b option.

       -v     Print version information and exit.


FILES
       The set of certificates being monitored or signed is tracked using files stored under /var/lib/certmonger/requests, or in a directory named by the CERTMONGER_REQUESTS_DIR environment variable.

       The set of known CAs is tracked using files stored under /var/lib/certmonger/cas, or in a directory named by the CERTMONGER_CAS_DIR environment variable.

       Temporary files will be stored in "/var/run/certmonger", or in the directory named by the CERTMONGER_TMPDIR environment variable if that value was not given at compile time.


BUGS
       Please file tickets for any that you find at https://fedorahosted.org/certmonger/


SEE ALSO
       getcert(1) getcert-add-ca(1)  getcert-add-scep-ca(1)  getcert-list-cas(1)  getcert-list(1)  getcert-modify-ca(1)  getcert-refresh-ca(1)  getcert-remove-ca(1)  getcert-request(1)  getcert-resubmit(1)
       getcert-start-tracking(1)  getcert-status(1) getcert-stop-tracking(1) certmonger-certmaster-submit(8) certmonger-dogtag-ipa-renew-agent-submit(8) certmonger-dogtag-submit(8) certmonger-ipa-submit(8)
       certmonger-local-submit(8) certmonger-scep-submit(8) certmonger_selinux(8)



certmonger Manual                                                                                14 June 2015                                                                                   certmonger(8)
