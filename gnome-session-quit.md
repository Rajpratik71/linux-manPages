GNOME-SESSION-QUIT(1)                                                                    General Commands Manual                                                                    GNOME-SESSION-QUIT(1)

NAME
       gnome-session-quit - End the current GNOME session

SYNOPSIS
       gnome-session-quit [--logout|--power-off|--reboot] [--force] [--no-prompt]

DESCRIPTION
       The gnome-session-quit program can be used to end a GNOME session.

OPTIONS
       The following options are supported:

       --logout
              Prompt the user to confirm logout. This is the default behavior.

       --power-off
              Prompt the user to confirm system power off.

       --reboot
              Prompt the user to confirm system reboot.

       --force
              Ignore any inhibitors.

       --no-prompt
              End the session without user interaction. This only works with --logout.

BUGS
       If you find bugs in the gnome-session-quit program, please report these on https://bugzilla.gnome.org.

SEE ALSO
       gnome-session(1)

                                                                                                  GNOME                                                                             GNOME-SESSION-QUIT(1)
