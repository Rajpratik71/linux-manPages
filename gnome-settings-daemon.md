GNOME-SETTINGS-DAEMON(1)                                      General Commands Manual                                     GNOME-SETTINGS-DAEMON(1)

NAME
       gnome-settings-daemon - Handles the GNOME session settings

SYNOPSIS
       gnome-settings-daemon [--debug] [--no-daemon] [--gconf-prefix] [--display=DISPLAY]

DESCRIPTION
       gnome-settings-daemon  is  responsible for setting the various preference parameters of a GNOME session and the applications that run under
       it.

OPTIONS
       Help options

       -?, --help
              Show this help message

       Application options

       --debug
              Enable debugging code

       --no-daemon
              Do not detach the daemon process from its controlling terminal

       --gconf-prefix
              Specify a custom GConf settings prefix for settings manager plugins

       --display=DISPLAY
              X display to use

AUTHOR
       gnome-settings-daemon was written by Jonathan Blandford <jrb@redhat.com> and William Jon McCann <mccann@jhu.edu>.

       This manual page was originally written by Joshua Cummings <jrac@internode.on.net>.

                                                                   June 25 2009                                           GNOME-SETTINGS-DAEMON(1)
