DELUGED(1)                              General Commands Manual                             DELUGED(1)

NAME
       deluged - a bittorrent client daemon

SYNOPSIS
       deluged [options]

DESCRIPTION
       Deluge utilizes a client/server model, with 'deluged' being the daemon process and 'deluge' be‐
       ing used to launch a user-interface.

       By default, 'deluged' will run as a daemon, to prevent this you can run deluged with the -d op‐
       tion.  This option is useful for running deluged with the start-stop-daemon.

OPTIONS
   General Options
       -c path, --config=path
              Set the config directory location.

   Daemon Options
       -p port, --port=port
              Port daemon will listen on, default is 58846

       -i ip_address, --interface=ip_address
              Interface daemon will listen for bittorrent connections on, this should be an IP address

       -u ip_address, --ui-interface=ip_address
              Interface daemon will listen for UI connections on, this should be an IP address

       -d, --do-not-daemonize
              Do not daemonize

       -P file, --pidfile=file
              Use pidfile to store process id

   Logging Options
       -l file, --logfile=file
              Output to designated logfile instead of stdout

       -L loglevel, --loglevel=loglevel
              Set the log level (default is error): none, info, warning, error, critical, debug

       -q, --quiet
              Sets the log level to 'none', same as `-L none`

   Help Options
       -v, --version
              Show program's version number and exit.

       -h, --help
              Show help message and exit.

SEE ALSO
       deluge(1), deluge-web(1), deluge-console(1)

AUTHORS
       Deluge Team: http://www.deluge-torrent.org

1.3.15                                         May 2017                                     DELUGED(1)
