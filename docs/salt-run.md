SALT-RUN(1)                                                            Salt                                                            SALT-RUN(1)

NAME
       salt-run - salt-run Documentation

       Execute a Salt runner

SYNOPSIS
          salt-run RUNNER

DESCRIPTION
       salt-run  is the frontend command for executing Salt Runners.  Salt runners are simple modules used to execute convenience functions on the
       master

OPTIONS
       --version
              Print the version of Salt that is running.

       --versions-report
              Show program's dependencies and version number, and then exit

       -h, --help
              Show the help message and exit

       -c CONFIG_DIR, --config-dir=CONFIG_dir
              The location of the Salt configuration directory. This directory contains the configuration files for Salt master and  minions.  The
              default location on most systems is /etc/salt.

       -t TIMEOUT, --timeout=TIMEOUT
              The timeout in seconds to wait for replies from the Salt minions. The timeout number specifies how long the command line client will
              wait to query the minions and check on running jobs. Default: 1

       --hard-crash
              Raise any original exception rather than exiting gracefully. Default is False.

       -d, --doc, --documentation
              Display documentation for runners, pass a module or a runner to see documentation on only that module/runner.

   Logging Options
       Logging options which override any settings defined on the configuration files.

       -l LOG_LEVEL, --log-level=LOG_LEVEL
              Console logging log level. One of all, garbage, trace, debug, info, warning, error, quiet. Default: warning.

       --log-file=LOG_FILE
              Log file path. Default: /var/log/salt/master.

       --log-file-level=LOG_LEVEL_LOGFILE
              Logfile logging log level. One of all, garbage, trace, debug, info, warning, error, quiet. Default: warning.

SEE ALSO
       salt(1) salt-master(1) salt-minion(1)

AUTHOR
       Thomas S. Hatch <thatch45@gmail.com> and many others, please see the Authors file

2019.2.0                                                           Jan 08, 2019                                                        SALT-RUN(1)
