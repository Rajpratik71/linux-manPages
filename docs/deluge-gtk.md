DELUGE-GTK(1)                                                 General Commands Manual                                                DELUGE-GTK(1)

NAME
       deluge-gtk - A BitTorrent client Gtk interface

SYNOPSIS
       deluge-gtk [options] [torrent-file]

DESCRIPTION
       Deluge utilizes a client/server model, with deluged being the daemon process and deluge-gtk being used to launch a Gtk user-interface.

       By  default,  Deluge  will  run in Standalone mode where the daemon functionality will be hidden.  You can switch to Thinclient mode in the
       Preferences dialog.

OPTIONS
   Config Options
       -c path, --config=path
              Set the config directory location.

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

   Help Options
       -V, --version
              Show program's version number and exit.

       -h, --help
              Show help message and exit.

SEE ALSO
       deluged(1), deluge-web(1) deluge-console(1),

AUTHORS
       Deluge Team: http://www.deluge-torrent.org

2.0-dev                                                            January 2017                                                      DELUGE-GTK(1)
