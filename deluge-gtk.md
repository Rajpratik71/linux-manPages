DELUGE-GTK(1)                           General Commands Manual                          DELUGE-GTK(1)

NAME
       deluge-gtk - a bittorrent client gtk interface

SYNOPSIS
       deluge-gtk [options] [torrent-file]

DESCRIPTION
       Deluge utilizes a client/server model, with 'deluged' being the daemon process and 'deluge-gtk'
       being used to launch a GTK+ user-interface.

       By default, Deluge will run in 'Classic' mode where the daemon functionality  will  be  hidden.
       You can turn this off in the Preferences dialog.

OPTIONS
   General Options
       -c path, --config=path
              Set the config directory location.

   UI Options
       -u ui, --ui=ui
              The UI that you wish to launch, current options include: gtk, web or console

       -s default_ui, --set-default-ui=default_ui
              Sets the default UI to be run when no UI is specified

       -a args, --args=args
              Arguments to pass to a UI, -a '--option args'

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
       deluged(1), deluge-web(1), deluge-console(1)

AUTHORS
       Deluge Team: http://www.deluge-torrent.org

1.3.15                                         May 2017                                  DELUGE-GTK(1)
