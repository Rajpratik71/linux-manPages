SALT-MINION(1)                                                         Salt                                                         SALT-MINION(1)

NAME
       salt-minion - salt-minion Documentation

       The Salt minion daemon, receives commands from a remote Salt master.

SYNOPSIS
          salt-minion [ options ]

DESCRIPTION
       The Salt minion receives commands from the central Salt master and replies with the results of said commands.

OPTIONS
       --version
              Print the version of Salt that is running.

       --versions-report
              Show program's dependencies and version number, and then exit

       -h, --help
              Show the help message and exit

       -c CONFIG_DIR, --config-dir=CONFIG_dir
              The  location  of the Salt configuration directory. This directory contains the configuration files for Salt master and minions. The
              default location on most systems is /etc/salt.

       -u USER, --user=USER
              Specify user to run salt-minion

       -d, --daemon
              Run salt-minion as a daemon

       --pid-file PIDFILE
              Specify the location of the pidfile. Default: /var/run/salt-minion.pid

   Logging Options
       Logging options which override any settings defined on the configuration files.

       -l LOG_LEVEL, --log-level=LOG_LEVEL
              Console logging log level. One of all, garbage, trace, debug, info, warning, error, quiet. Default: warning.

       --log-file=LOG_FILE
              Log file path. Default: /var/log/salt/minion.

       --log-file-level=LOG_LEVEL_LOGFILE
              Logfile logging log level. One of all, garbage, trace, debug, info, warning, error, quiet. Default: warning.

SEE ALSO
       salt(1) salt(7) salt-master(1)

AUTHOR
       Thomas S. Hatch <thatch45@gmail.com> and many others, please see the Authors file

2019.2.0                                                           Jan 08, 2019                                                     SALT-MINION(1)
