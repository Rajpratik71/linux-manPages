DELUGED(1)                                                             2099"                                                            DELUGED(1)

NAME
       deluged - A BitTorrent client daemon

SYNOPSIS
       deluged [options]

DESCRIPTION
       Deluge utilizes a client/server model, with deluged being the daemon process and deluge being used to launch a user-interface.

       By default deluged will run as a background daemon, use the -d option to run process in foreground.

OPTIONS
   Config Options
       -c path, --config=path
              Set the config directory location.

   Daemon Options
       -p port, --port=port
              Port daemon will listen on, default is 58846

       -i ip_address, --interface=ip_address
              Interface daemon will listen for bittorrent connections on, this should be an IP address

       -u ip_address, --ui-interface=ip_address
              Interface daemon will listen for UI connections on, this should be an IP address

   Logging Options
       -l file, --logfile=file
              Output to specified logfile instead of stdout

       -L loglevel, --loglevel=loglevel
              Set the log level (default is error): none, info, warning, error, debug

       -q, --quiet
              Sets the log level to none, same as -L none

       --logrotate[=max-size]
              Enable logfile rotation, with optional maximum logfile size, default: 2M (Logfile rotation count is 5)

       --profile[=file]
              Profile with cProfile. Outputs to stdout unless a filename is specified

   Process Control Options:
       -P file, --pidfile=file
              Pidfile to store the process id

       -d, --do-not-daemonize
              Do not daemonize (fork) this process

       -U, --user=user
              Change to this user on startup (Requires root)

       -g, --group=group
              Change to this group on startup (Requires root)

   Help Options
       -V, --version
              Show program's version number and exit.

       -h, --help
              Show help message and exit.

SEE ALSO
       deluge(1), deluge-web(1), deluge-console(1)

AUTHORS
       Deluge Team: http://www.deluge-torrent.org

January                                                                                                                                 DELUGED(1)
