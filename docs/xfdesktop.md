XFDESKTOP(1)                                                                     General Commands Manual                                                                     XFDESKTOP(1)

NAME
       xfdesktop - The Xfce 4 Desktop Environment's desktop manager

SYNOPSIS
       xfdesktop
       xfdesktop [options]

DESCRIPTION
       xfdesktop manages the desktop itself in the Xfce 4 Desktop Environment.  This includes drawing the desktop backdrop and providing a right-click applications menu and middle-click
       window list menu, as well as drawing icons on the desktop.  Only one instance of xfdesktop can be running at a time, and should be started by running xfdesktop without any  argu‐
       ments.

OPTIONS
   HELP OPTIONS:
       -h, --help
              Show help options

       --help-all
              Show all help options

       --help-gtk
              Show GTK+ Options

       --help-sm-client
              Show session management options

   APPLICATION OPTIONS:
       -V, --version
              Display version information

       -R, --reload
              Causes an already-running instance of xfdesktop to reload all its settings and redraws the desktop background.

       -N, --next
              Causes an already-running instance of xfdesktop to advance to the next wallpaper on the current workspace.

       -M, --menu
              Causes an already-running instance of xfdesktop to pop up the applications menu at the current position of the mouse cursor.

       -W, --windowlist
              Causes an already-running instance of xfdesktop to pop up the window list menu at the current position of the mouse cursor.

       -A, --arrange
              Automatically arrange all the icons on the desktop

       -D, --disable-wm-check
              Do not wait for a window manager on startup

       -e, --enable-debug
              Enable debug messages

       -d, --disable-debug
              Disable debug messages

       -Q, --quit
              Cause xfdesktop to quit

       --display=[DISPLAY]
              X display to use

ENVIRONMENT
       xfdesktop's behavior is affected by the following environment variables.

       XDG_CONFIG_HOME
              Specifies the root for all user-specific configuration files.  If this environment variable is not present, it defaults to ~/.config

       XDG_CONFIG_DIRS
              Specifies a colon-separated list of system directories in which to search for configuration data.  If this environment variable is not present, it defaults to /etc/xdg

FILES
       xfdesktop searches for a menu description file in $XDG_CONFIG_DIRS/menus/xfce-applications.menu.  xfdesktop can also use a user-customized menu in $XDG_CONFIG_HOME/menus/.

BUGS
       Please report any bugs to http://bugzilla.xfce.org/.
       Development discussion should be conducted on the xfce4-dev@xfce.org mailing list.
       Usage-related questions should be directed to the xfce@xfce.org mailing list.

HOMEPAGE
       http://xfce.org/

AUTHOR
       Jasper Huijsmans <huysmans@users.sourceforge.net>, Benedikt Meurer <benny@xfce.org>, Brian Tarricone <bjt23@cornell.edu>, and Eric Koegel <eric@xfce.org>.

       This manual page was originally written by Brian Tarricone <bjt23@cornell.edu>.

                                                                                       August 2014                                                                           XFDESKTOP(1)
