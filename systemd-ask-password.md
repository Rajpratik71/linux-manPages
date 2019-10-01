SYSTEMD-ASK-PASSWORD(1)                                                                      systemd-ask-password                                                                     SYSTEMD-ASK-PASSWORD(1)



NAME
       systemd-ask-password - Query the user for a system password

SYNOPSIS
       systemd-ask-password [OPTIONS...] [MESSAGE]

DESCRIPTION
       systemd-ask-password may be used to query a system password or passphrase from the user, using a question message specified on the command line. When run from a TTY it will query a password on the
       TTY and print it to standard output. When run with no TTY or with --no-tty it will query the password system-wide and allow active users to respond via several agents. The latter is only available
       to privileged processes.

       The purpose of this tool is to query system-wide passwords -- that is passwords not attached to a specific user account. Examples include: unlocking encrypted hard disks when they are plugged in or
       at boot, entering an SSL certificate passphrase for web and VPN servers.

       Existing agents are: a boot-time password agent asking the user for passwords using Plymouth; a boot-time password agent querying the user directly on the console; an agent requesting password input
       via a wall(1) message; an agent suitable for running in a GNOME session; a command line agent which can be started temporarily to process queued password requests; a TTY agent that is temporarily
       spawned during systemctl(1) invocations.

       Additional password agents may be implemented according to the systemd Password Agent Specification[1].

       If a password is queried on a TTY, the user may press TAB to hide the asterisks normally shown for each character typed. Pressing Backspace as first key achieves the same effect.

OPTIONS
       The following options are understood:

       --icon=
           Specify an icon name alongside the password query, which may be used in all agents supporting graphical display. The icon name should follow the XDG Icon Naming Specification[2].

       --timeout=
           Specify the query timeout in seconds. Defaults to 90s. A timeout of 0 waits indefinitely.

       --echo
           Echo the user input instead of masking it. This is useful when using systemd-ask-password to query for usernames.

       --no-tty
           Never ask for password on current TTY even if one is available. Always use agent system.

       --accept-cached
           If passed, accept cached passwords, i.e. passwords previously typed in.

       --multiple
           When used in conjunction with --accept-cached accept multiple passwords. This will output one password per line.

       -h, --help
           Print a short help text and exit.

EXIT STATUS
       On success, 0 is returned, a non-zero failure code otherwise.

SEE ALSO
       systemd(1), systemctl(1), plymouth(8), wall(1)

NOTES
        1. systemd Password Agent Specification
           http://www.freedesktop.org/wiki/Software/systemd/PasswordAgents

        2. XDG Icon Naming Specification
           http://standards.freedesktop.org/icon-naming-spec/icon-naming-spec-latest.html



systemd 219                                                                                                                                                                           SYSTEMD-ASK-PASSWORD(1)
