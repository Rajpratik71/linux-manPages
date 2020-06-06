LIGHTDM(1)                                                                               General Commands Manual                                                                               LIGHTDM(1)

NAME
       lightdm - a display manager

SYNOPSIS
       lightdm [ OPTION ]

DESCRIPTION
       lightdm is a display manager.

OPTIONS
       -h, --help
              Show help options

       -c, --config=FILE
              Use configuration file

       -d, --debug
              Print debugging messages

       --test-mode
              Run as unprivileged user, skipping things that require root access

       --pid-file=FILE
              File to write PID into

       --xsessions-dir=DIRECTORY
              Directory to load X sessions from

       --xgreeters-dir=DIRECTORY
              Directory to load X greeters from

       --log-dir=DIRECTORY
              Directory to write logs to

       --run-dir=DIRECTORY
              Directory to store running state

       --cache-dir=DIRECTORY
              Directory to cached information

       -v, --version
              Show release version

FILES
       /etc/lightdm/lightdm.conf
              Configuration

       /etc/lightdm/users.conf
              User list configuration (if not using Accounts Service)

       /etc/lightdm/keys.conf
              XDMCP keys

SEE ALSO
       dm-tool(1)

                                                                                             7 November 2013                                                                                   LIGHTDM(1)
