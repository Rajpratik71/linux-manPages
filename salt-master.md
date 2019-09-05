SALT-MASTER(1)                                                         Salt                                                         SALT-MASTER(1)

NAME
       salt-master - salt-master Documentation

       The Salt master daemon, used to control the Salt minions

SYNOPSIS
          salt-master [ options ]

DESCRIPTION
       The master daemon controls the Salt minions

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
              Specify user to run salt-master

       -d, --daemon
              Run salt-master as a daemon

       --pid-file PIDFILE
              Specify the location of the pidfile. Default: /var/run/salt-master.pid

   Logging Options
       Logging options which override any settings defined on the configuration files.

       -l LOG_LEVEL, --log-level=LOG_LEVEL
              Console logging log level. One of all, garbage, trace, debug, info, warning, error, quiet. Default: warning.

       --log-file=LOG_FILE
              Log file path. Default: /var/log/salt/master.

       --log-file-level=LOG_LEVEL_LOGFILE
              Logfile logging log level. One of all, garbage, trace, debug, info, warning, error, quiet. Default: warning.

SEE ALSO
       salt(1) salt(7) salt-minion(1)

AUTHOR
       Thomas S. Hatch <thatch45@gmail.com> and many others, please see the Authors file

2019.2.0                                                           Jan 08, 2019                                                     SALT-MASTER(1)
