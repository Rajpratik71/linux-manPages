ORAGE(1)                                                                             [FIXME: manual]                                                                             ORAGE(1)

NAME
       orage - Calendar for the Xfce Desktop Environment

SYNOPSIS
       orage [options] [[FILE]...]

DESCRIPTION
       orage is a fast and easy to use graphical calendar for the Xfce Desktop Environment. It uses portable ical format and includes common calendar features like repeating
       appointments and multiple alarming possibilities.  orage does not have group calendar features, but can only be used for single user.

       orage takes a list of FILEs for ical files that should be imported. Contents of those files are read and converted into orage, but those files are left untouched.

       For a more detailed explanation of orage, please see the Help menu.

OPTIONS
       -v, --version
           Print version information and exit.

       -?, --help
           Print brief help and exit.

       -p, --preferences
           Open the preferences setting window.

       -t, --toggle
           Hide orage if it is visible and show it if it is hidden.

       -a, --add-foreign file [RW]
           Add a foreign file into orage. By default this file is read-only but adding RW after the filename makes it writeable.

       -r, --remove-foreign file
           Remove foreign file from orage. The file itself is not removed or modified. If you want to remove it, you need to do that separately using proper operating system command.

FILES
       All orage datafiles are by default in ~/.local/share/orage and all configuration files are in ~/.config/orage. (Note that you can change these locations, so if you do not find
       them, check from the UI.)

BUGS
       Please report any bugs and enhancement requests to http://bugzilla.xfce.org/. Usage related questions can be sent to xfce@xfce.org email list.

HOMEPAGE
       http://www.xfce.org/projects/orage/

AUTHOR
       orage was originally written by Mickael Graf and is now being maintained by Juha Kautto <juha@xfce.org>.

       This manual page was written by Juha Kautto <juha@xfce.org>.

[FIXME: source]                                                                         04/10/2015                                                                               ORAGE(1)
