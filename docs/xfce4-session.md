xfce4-session(1)                                                                 General Commands Manual                                                                 xfce4-session(1)

NAME
       xfce4-session - Starts up the Xfce Desktop Environment

SYNOPSIS
       xfce4-session

DESCRIPTION
       This manual page documents briefly the xfce4-session command.

       The xfce4-session program starts up the Xfce Desktop Environment and is typically executed by your login manager (e.g. xdm, gdm, kdm, wdm or from your X startup scripts). It will
       load your last session or a default session that includes the standard Xfce programs if no saved session is available.

       xfce4-session is an standard X11R6 session manager that can manage any X11R6 SM compliant program, including GNOME and KDE programs.

       xfce4-session uses the contents of the ~/.cache/sessions/ directory for starting previously saved sessions.

OPTIONS
       xfce4-session takes the following command line options:

       --disable-tcp
              Disable binding to TCP ports in the ICE layer. This is not possible on every platform. If you use this option on a platform that does not support  it,  xfce4-session  will
              print a warning message and ignore the setting.

       --help Print a help screen and exit.

       --version
              Output version information and exit.

ENVIRONMENT
       xfce4-session's behaviour is affected by the following environment variables.

       XDG_CONFIG_HOME
              Specifies the root for all user-specific configuration files. If this environment variable is unset, it defaults to ~/.config/

       XDG_CONFIG_DIRS
              Set  of  preference  ordered  base directories relative to which configuration files should be searched in addition to the $XDG_CONFIG_HOME base directory. The directories
              should be separated with a colon.

       XDG_CACHE_HOME
              Specifies the root for all user-specific cache data. If this environment variable is unset, it defaults to ~/.cache/

       XFSM_VERBOSE
              When defined, this environment variable enables debugging messages to be saved to ~/.xfce4-session.verbose-log The log file from the last session run with this environment
              variable set is retained at ~/.xfce4-session.verbose-log.last These debugging messages are useful for troubleshooting and development.

FILES
       xfce4-session reads its configuration from Xfconf.  xfce4-session stores its session data into $XDG_CACHE_HOME/sessions/.

AUTHOR
       xfce4-session  was  written  by  Benedikt  Meurer <benny@xfce.org> as part of the Xfce project.  This manual page was written by Oliver M. Bolzer <oliver@debian.org> and Benedikt
       Meurer <benny@xfce.org>.

REPORTING BUGS
       Report bugs to http://bugzilla.xfce.org/.

COPYRIGHT
       Copyright © 2003-2014 Benedikt Meurer.

                                                                                       Sep 28, 2014                                                                      xfce4-session(1)
