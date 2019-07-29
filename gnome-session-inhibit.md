GNOME-SESSION-INHI(1)                                              User Commands                                             GNOME-SESSION-INHI(1)

NAME
       gnome-session-inhibit - inhibit gnome-session functionality

SYNOPSIS
       gnome-session-inhibit [OPTION...] [COMMAND]

DESCRIPTION
       gnome-session-inhibit can inhibit certain gnome-session functionality while executing the given COMMAND. To achieve this, it calls the
       Inhibit() method of the gnome-session D-Bus API and creates an inhibitor. The inhibitor is automatically removed when gnome-session-inhibit
       exits.

       A typical use case is to prevent the session from going idle (and thus locking the screen) while a movie player is running.

OPTIONS
       -h, --help
           print help and exit

       --version
           print version information and exit

       --app-id ID
           The application id to use when calling the gnome-session Inhibit() method. If this option is not specified, "unknown" is used.

       --reason REASON
           A human-readable reason to pass along when calling the gnome-session Inhibit() method. If this option is not specified, "not specified"
           is used.

       --inhibit ARG
           ARG specifies the things to inhibit, as a colon-separated list. The possible values are logout, switch-user, suspend, idle, automount.
           If this option is used more than once, the values are combined. If this option is not specified, "idle" is assumed.

       --inhibit-only
           Do not launch COMMAND and wait forever instead

SEE ALSO
       systemd-inhibit(1)

gnome-session                                                                                                                GNOME-SESSION-INHI(1)
