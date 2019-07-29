XFCE4-TERMINAL(1)                                                      Xfce                                                      XFCE4-TERMINAL(1)

NAME
       xfce4-terminal - A Terminal emulator for X

SYNOPSIS
       xfce4-terminal [OPTION...]

DESCRIPTION
       xfce4-terminal is what is known as an X terminal emulator, often referred to as terminal or shell. It provides an equivalent to the
       old-fashioned text screen on your desktop, but one which can easily share the screen with other graphical applications. Windows users may
       already be familiar with the MS-DOS Prompt utility, which has the analogous function of offering a DOS command-line under Windows, though
       one should note that the UNIX CLI offer far more power and ease of use than does DOS.

       xfce4-terminal emulates the xterm application developed by the X Consortium. In turn, the xterm application emulates the DEC VT102 terminal
       and also supports the DEC VT220 escape sequences. An escape sequence is a series of characters that start with the Esc character.
       xfce4-terminal accepts all of the escape sequences that the VT102 and VT220 terminals use for functions such as to position the cursor and
       to clear the screen.

OPTIONS
   Option Summary
       Here is a summary of all the options, grouped by type. Explanations are in the following sections.

       General Options
           -h, --help; -V, --version; --disable-server; --color-table; --default-display=display; --default-working-directory=directory

       Window or Tab Separators
           --tab; --window

       Tab Options
           -x, --execute; -e, --command=command; --working-directory=directory; -T, --title=title; -H, --hold

       Window Options
           --display=display; --drop-down; --geometry=geometry; --role=role; --startup-id=string; -I, --icon=icon; --fullscreen; --maximize;
           --show-menubar, --hide-menubar; --show-borders, --hide-borders; --show-toolbar, --hide-toolbar

   General Options
       -h, --help
           List the various command line options supported by xfce4-terminal and exit

       -V, --version
           Display version information and exit

       --disable-server
           Do not register with the D-BUS session message bus

       --color-table
           Echo the color codes

       --default-display=display
           Default X display to use.

       --default-working-directory=directory
           Set directory as the default working directory for the terminal

   Window or Tab Separators
       --tab
           Open a new tab in the last-specified window; more than one of these options can be provided.

           If you use this as the first option, without --window separators, the last window will be re-used.

       --window
           Open a new window containing one tab; more than one of these options can be provided.

   Tab Options
       -x, --execute
           Execute the remainder of the command line inside the terminal

       -e, --command=command
           Execute command inside the terminal

       --working-directory=directory
           Set directory as the working directory for the terminal

       -T, --title=title
           Set title as the initial window title for the terminal

       -H, --hold
           Causes the terminal to be kept around after the child command has terminated

   Window Options
       --display=display
           X display to use for the last- specified window.

       --drop-down
           Will start the window in drop-down mode (also called a Quake-style terminal). This will only apply to the first window started with
           this option. It is advised to bind this to a shortcut in the keyboard preferences.

       --geometry=geometry
           Sets the geometry of the last-specified window to geometry. Read X(7) for more information on how to specify window geometries.

       --role=role
           Sets the window role of the last-specified window to role. Applies to only one window and can be specified once for each window you
           create from the command line. The role is a unique identifier for the window to be used when restoring a session.

       --startup-id=string
           Specifies the startup notification id for the last-specified window. Used internally to forward the startup notification id when using
           the D-BUS service.

       -I, --icon=icon
           Set the terminal's icon as an icon name or filename.

       --fullscreen
           Set the last-specified window into fullscreen mode; applies to only one window; can be specified once for each window you create from
           the command line.

       --maximize
           Set the last-specified window into maximized mode; applies to only one window; can be specified once for each window you create from
           the command line.

       --show-menubar
           Turn on the menubar for the last-specified window. Can be specified once for each window you create from the command line.

       --hide-menubar
           Turn off the menubar for the last-specified window. Can be specified once for each window you create from the command line.

       --show-borders
           Turn on the window decorations for the last-specified window. Applies to only one window. Can be specified once for each window you
           create from the command line.

       --hide-borders
           Turn off the window decorations for the last-specified window. Applies to only one window. Can be specified once for each window you
           create from the command line.

       --show-toolbar
           Turn on the toolbar for the last-specified window. Applies to only one window. Can be specified once for each window you create from
           the command line.

       --hide-toolbar
           Turn off the toolbar for the last-specified window. Applies to only one window. Can be specified once for each window you create from
           the command line.

EXAMPLES
       xfce4-terminal --geometry 80x40 --command mutt --tab --command mc
           Opens a new terminal window with a geometry of 80 columns and 40 rows and two tabs in it, where the first tab runs mutt and the second
           tab runs mc.

ENVIRONMENT
       xfce4-terminal uses the Basedir Specification as defined on Freedesktop.org[1] to locate its data and configuration files. This means that
       file locations will be specified as a path relative to the directories described in the specification.

       ${XDG_CONFIG_HOME}
           The first base directory to look for configuration files. By default this is set to ~/.config/.

       ${XDG_CONFIG_DIRS}
           A colon separated list of base directories that contain configuration data. By default the application will look in ${sysconfdir}/xdg/.
           The value of ${sysconfdir} depends on how the program was build and will often be /etc/ for binary packages.

       ${XDG_DATA_HOME}
           The root for all user-specific data files. By default this is set to ~/.local/share/.

       ${XDG_DATA_DIRS}
           A set of preference ordered base directories relative to which data files should be searched in addition to the ${XDG_DATA_HOME} base
           directory. The directories should be separated with a colon.

FILES
       ${XDG_CONFIG_DIRS}/xfce4/terminal/terminalrc
           This is the location of the configuration file that includes the preferences which control the look and feel of xfce4-terminal.

SEE ALSO
       bash(1), X(7)

AUTHORS
       Nick Schermer <nick@xfce.org>
           Developer

       Benedikt Meurer <benny@xfce.org>
       Software developer, os-cillation, System development,
           Developer

NOTES
        1. Freedesktop.org
           http://freedesktop.org/

xfce4-terminal 0.6.3                                                12/26/2013                                                   XFCE4-TERMINAL(1)
