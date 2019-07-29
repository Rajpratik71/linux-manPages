GNOME-SESSION(1)                                              General Commands Manual                                             GNOME-SESSION(1)

NAME
       gnome-session - Start the GNOME desktop environment

SYNOPSIS
       gnome-session [-a|--autostart=DIR] [--session=SESSION] [--failsafe|-f] [--debug] [--whale]

DESCRIPTION
       The  gnome-session  program  starts up the GNOME desktop environment. This command is typically executed by your login manager (either gdm,
       xdm, or from your X startup scripts). It will load either your saved session, or it will provide a default session for the user as  defined
       by the system administrator (or the default GNOME installation on your system).

       The  default  session  is  defined  in  gnome.session,  a .desktop-like file that is looked for in $XDG_CONFIG_HOME/gnome-session/sessions,
       $XDG_CONFIG_DIRS/gnome-session/sessions and $XDG_DATA_DIRS/gnome-session/sessions.

       When saving a session, gnome-session saves the currently running applications in  the  $XDG_CONFIG_HOME/gnome-session/saved-session  direc‐
       tory.

       gnome-session is an X11R6 session manager. It can manage GNOME applications as well as any X11R6 SM compliant application.

OPTIONS
       The following options are supported:

       --autostart=DIR
              Start  all  applications defined in DIR, instead of starting the applications defined in gnome.session, or via the --session option.
              Multiple --autostart options can be passed.

       --session=SESSION
              Use the applications defined in SESSION.session. If not specified, gnome.session will be used.

       --failsafe
              Run in fail-safe mode. User-specified applications will not be started.

       --debug
              Enable debugging code.

       --whale
              Show the fail whale in a dialog for debugging it.

SESSION DEFINITION
       Sessions are defined in .session files, that are using a .desktop-like format, with the following keys in the GNOME Session group:

       Name   Name of the session. This can be localized.

       RequiredComponents
              List of component identifiers (desktop files) that are required by the session. The required components will always run in the  ses‐
              sion.

       Here is an example of a session definition:

           [GNOME Session]
           Name=GNOME
           RequiredComponents=gnome-shell;gnome-settings-daemon;

       The   .session   files   are   looked   for   in   $XDG_CONFIG_HOME/gnome-session/sessions,   $XDG_CONFIG_DIRS/gnome-session/sessions   and
       $XDG_DATA_DIRS/gnome-session/sessions.

ENVIRONMENT
       gnome-session sets several environment variables for the use of its child processes:

       SESSION_MANAGER

              This variable is used by session-manager aware clients to contact gnome-session.

       DISPLAY

              This variable is set to the X display being used by gnome-session. Note that if the --display option is used this might be different
              from the setting of the environment variable when gnome-session is invoked.

FILES
       $XDG_CONFIG_HOME/config/autostart $XDG_CONFIG_DIRS/config/autostart /usr/share/gnome/autostart

              The applications defined in those directories will be started on login.  gnome-session-properties(1) can be used to easily configure
              them.

       $XDG_CONFIG_HOME/gnome-session/sessions $XDG_CONFIG_DIRS/gnome-session/sessions $XDG_DATA_DIRS/gnome-session/sessions

              These directories contain the .session files that can be used with the --session option.

       $XDG_CONFIG_HOME/gnome-session/saved-session

              This directory contains the list of applications of the saved session.

BUGS
       If you find bugs in the gnome-session program, please report these on https://bugzilla.gnome.org.

SEE ALSO
       gnome-session-properties(1) gnome-session-quit(1)

                                                                       GNOME                                                      GNOME-SESSION(1)
