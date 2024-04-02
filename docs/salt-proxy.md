SALT-PROXY(1)                                                          Salt                                                          SALT-PROXY(1)

NAME
       salt-proxy - salt-proxy Documentation

       Receives commands from a Salt master and proxies these commands to devices that are unable to run a full minion.

SYNOPSIS
          salt-proxy [ options ]

DESCRIPTION
       The  Salt proxy minion receives commands from a Salt master, transmits appropriate commands to devices that are unable to run a minion, and
       replies with the results of said commands.

OPTIONS
       --proxyid
              The minion id that this proxy will assume.  This is required.

       --version
              Print the version of Salt that is running.

       --versions-report
              Show program's dependencies and version number, and then exit

       -h, --help
              Show the help message and exit

       -c CONFIG_DIR, --config-dir=CONFIG_dir
              The location of the Salt configuration directory. This directory contains  the  configuration  files for Salt  master  and  minions.
              The default location on most systems is /etc/salt.

       -u USER, --user=USER
              Specify user to run salt-proxy

       -d, --daemon
              Run salt-proxy as a daemon

       --pid-file PIDFILE
              Specify the location of the pidfile. Default: /var/run/salt-proxy-<id>.pid

   Logging Options
       Logging options which override any settings defined on the configuration files.

       -l LOG_LEVEL, --log-level=LOG_LEVEL
              Console logging log level. One of all, garbage, trace, debug, info, warning, error, quiet. Default: warning.

       --log-file=LOG_FILE
              Log file path. Default: /var/log/salt/minion.

       --log-file-level=LOG_LEVEL_LOGFILE
              Logfile logging log level. One of all, garbage, trace, debug, info, warning, error, quiet. Default: warning.

SEE ALSO
       salt(1) salt(7) salt-master(1) salt-minion(1)

AUTHOR
       Thomas S. Hatch <thatch45@gmail.com> and many others, please see the Authors file

2019.2.0                                                           Jan 08, 2019                                                      SALT-PROXY(1)
