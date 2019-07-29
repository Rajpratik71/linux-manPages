GNOME-KEYRING-DAEM(1)                                              User Commands                                             GNOME-KEYRING-DAEM(1)

NAME
       gnome-keyring-daemon - The gnome-keyring daemon

SYNOPSIS
       gnome-keyring-daemon [OPTION...]

DESCRIPTION
       The gnome-keyring-daemon is a service that stores your passwords and secrets. It is normally started automatically when a user logs into a
       desktop session.

       The gnome-keyring-daemon implements the DBus Secret Service API, and you can use tools like seahorse or secret-tool to interact with it.

       The daemon also implements a GnuPG and SSH agent both of which automatically load the user's keys, and prompt for passwords when necessary.

       The daemon will print out various environment variables which should be set in the user's environment, in order to interact with the
       daemon.

OPTIONS
       The various startup arguments below can be used:

       -c, --components=ssh,secrets,pkcs11
           Ask the daemon to only initialize certain components. Valid components are ssh, secrets, pkcs11.

           By default all components are initialized.

       -C, --control-directory=/path/to/directory
           Use this directory for creating communication sockets. By default a temporary directory is automatically created.

       -d, --daemonize
           Run as a real daemon, disconnected from the terminal.

       -f, --foreground
           Run in the foreground, and do not fork or become a daemon.

       -l, --login
           This argument tells the daemon it is being run by PAM. It reads all of stdin (including any newlines) as a login password and does not
           complete actual initialization.

           The daemon should later be initialized with a gnome-keyring-daemon --start invocation.

           This option implies --unlock. It may not be used together with either the --replace or --start arguments.

       -r, --replace
           Try to replace a running keyring daemon, and assume its environment variables. A successful replacement depends on the
           GNOME_KEYRING_CONTROL environment variable being set by an earlier daemon.

           This option may not be used together with either the --login or --start arguments.

       -s, --start
           Connect to an already running daemon and initialize it. This is often used to complete initialization of a daemon that was started by
           PAM using the --login argument.

           This option may not be used together with either the --login or --replace arguments.

       --unlock
           Read a password from stdin, and use it to unlock the login keyring or create it if the login keyring does not exist.

       -V, --version
           Print out the gnome-keyring version and then exit.

       -h, --help
           Show help options and exit.

BUGS
       Please send bug reports to either the distribution bug tracker or the upstream bug tracker at
       https://bugzilla.gnome.org/enter_bug.cgi?product=gnome-keyring

SEE ALSO
       secret-tool(1), seahorse(1)

       Further details available in the gnome-keyring online documentation at https://wiki.gnome.org/GnomeKeyring and in the secret-service online
       documentation at http://standards.freedesktop.org/secret-service/

gnome-keyring                                                                                                                GNOME-KEYRING-DAEM(1)
