gnome-screensaver-command(1)                                                             General Commands Manual                                                             gnome-screensaver-command(1)

NAME
       gnome-screensaver-command - controls GNOME screensaver

SYNOPSIS
       gnome-screensaver-command [OPTION...]

DESCRIPTION
       gnome-screensaver-command is a tool for controlling an already running instance of gnome-screensaver.

OPTIONS
       --exit Causes the screensaver to exit gracefully

       -q, --query
              Query the state of the screensaver

       -t, --time
              Query the length of time the screensaver has been active

       -l, --lock
              Tells the running screensaver process to lock the screen immediately

       -a, --activate
              Turn the screensaver on (blank the screen)

       -d, --deactivate
              If the screensaver is active then deactivate it (un-blank the screen)

       -V, --version
              Version of this application

AUTHORS
       gnome-screensaver-command is written by William Jon McCann <mccann@jhu.edu>.

       This manual page was written by Sven Arvidsson <sa@whiz.se>.

SEE ALSO
       gnome-screensaver(1)

GNOME                                                                                           2007-09-27                                                                   gnome-screensaver-command(1)
