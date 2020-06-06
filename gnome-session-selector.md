GNOME-SESSION-SELE(1)                                                                           User Commands                                                                           GNOME-SESSION-SELE(1)



NAME
       gnome-session-selector - Selects a session to use with gnome-session

SYNOPSIS
       gnome-session-selector [session]

DESCRIPTION
       gnome-session-selector can be used from a xsession desktop file to select a session before gnome-session is run. gnome-session reads and stores its session in the
       $XDG_DATA_HOME/gnome-session/saved-session directory.  gnome-session-selector works by replacing the saved-session directory by a symlink to another directory. Since the session name is used as the
       directory name, it may not contain '/' characters or begin with a '.'.

       When a session name is specified, gnome-session-selector will create a symlink to select this session.

       When started without arguments, gnome-session-selector will present a dialog that allows to choose one of the existing sessions or create a new one.

SEE ALSO
       gnome-session(1)



gnome-session                                                                                                                                                                           GNOME-SESSION-SELE(1)
