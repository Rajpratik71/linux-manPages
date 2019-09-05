gpa(1)                                                             User Commands                                                            gpa(1)

NAME
       gpa - graphical frontend for the GNU Privacy Guard

SYNOPSIS
       gpa [OPTION(S)] [FILE(S)]

DESCRIPTION
       The GNU Privacy Assistant (GPA) is a graphical user interface for the GNU Privacy Guard (GnuPG).

       gpa can be used to encrypt, decrypt, and sign files, to verify signatures and to manage the private and public keys.

OPTIONS
       -c, --clipboard
              Open the clipboard.  This is the default action if no arguments are given and a key has already been created.

       -C, --card
              Start with the card-manager open.

       -d, --daemon
              Only start the UI server and no user interface.

       --no-remote
              Do not connect to a running instance but start a new one.  This can also be used to not start an UI server.

       --debug-edit-fsm
              Debug the Finite State Machine (FSM).

       --disable-ticker
              Disable ticker used for card operations.

       --disable-x509
              Disable support for X.509.

       --enable-logging
              Enable logging on Win32 systems.

       -f, --files
              Start with the file-manager open. This is the default if one or more FILE(S) are added to the command arguments.

       -k, --keyring
              Start with the keyring editor. This is the default for a new installation.

       -o, --options=FILE
              Read options from the specified file instead of ~/.gnupg/gpa.conf.

       -s, --settings
              Open the settings dialog.

       -v, --version
              Print version information and exit.

       --help-gtk
              Print options related to GTK. See also gtk-options(7).

       -?, --help, --help-all
              Print usage information and exit.

FILES
       ~/.gnupg/gpa.conf
              Standard user configuration file read by gpa on startup.

       ~/.gnupg/S.uiserver
              Socket listening for commands to the UI server.

BUGS
       Please report bugs to http://bugs.gnupg.org/.

AUTHORS
       gpa   was   mainly   written   by   Bernhard   Herzog,   Marcus   Brinkmann,  Miguel  Coca,  and  Werner  Koch.   See  the  help  menu  and
       http://gitstats.gnupg.org/gpa/authors.html for a detailed list.

       This manual page was written by Arthur de Jong <adejong@debian.org> and Daniel Leidert <daniel.leidert@wgdd.de> for  the  Debian  GNU/Linux
       system (but may be used by others).

SEE ALSO
       gpg(1), gpg2(1), gpgconf(1), gpgsm(1), gtk-options(7)

                                                                                                                                            gpa(1)
