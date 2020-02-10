
MODEMMANAGER(8)                                                                          System Manager's Manual                                                                          MODEMMANAGER(8)

NAME
       ModemManager - mobile broadband modem management daemon

SYNOPSIS
       ModemManager [OPTION...]

DESCRIPTION
       ModemManager  provides a unified high level API for communicating with mobile broadband modems, regardless of the protocol used to communicate with the actual device (Generic AT, vendor-specific
       AT, QCDM, QMI, MBIM...).

       ModemManager is a DBus-based system daemon and is not meant to be used directly from the command line.

HELP OPTIONS
       -V, --version
              Print the ModemManager software version and exit.

       -h, --help
              Show application options.

       --help-all
              Show application and test options.

       --help-test
              Show test options.

APPLICATION OPTIONS
       --debug Runs ModemManager with "DEBUG" log level and without daemonizing. This is useful for debugging, as it directs log output to the controlling terminal in addition to syslog.

       --log-level=<level>
              Sets how much information ModemManager sends to the log destination (usually syslog's "daemon" facility). By default, only informational, warning, and error  messages  are  logged.  Given
              level must be one of "ERR", "WARN", "INFO" or "DEBUG".

       --log-file=<filename>
              Specify location of the file where ModemManager will dump its log messages, instead of syslog.

       --timestamps
              Include absolute timestamps in the log output.

       --relative-timestamps
              Include timestamps, relative to the start time of the daemon, in the log output.

TEST OPTIONS
       --test-session
              Run the ModemManager daemon in the Session bus instead of the System bus.

       --test-no-auto-scan
              Fully disable udev-based auto-scan looking for devices.

       --test-enable
              Enable the Test DBus interface in the daemon.

       --test-plugin-dir=[PATH]
              Specify an alternate directory where the daemon should look for vendor plugins.

AUTHOR
       Aleksander Morgado <aleksander@aleksander.es>

SEE ALSO
       mmcli(8), NetworkManager(8)

                                                                                             5 September 2014                                                                             MODEMMANAGER(8)
