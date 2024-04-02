RQUOTAD(8)                                                                                 System Manager's Manual                                                                                 RQUOTAD(8)



NAME
       quota_nld - quota netlink message daemon

SYNOPSIS
       quota_nld [[ -D | -C ][ -F ][ -b ]]

DESCRIPTION
       quota_nld listens on netlink socket and processes received quota warnings. By default quota_nld forwards warning messages to both the system's DBUS (so that the desktop manager can display a dialog)
       and the last-accessed terminal of the user to whom each warning is directed. Either of these destinations can be disabled with the -D and -C options, respectively.

       In the case of the user's terminal, quota messages about falling below the hard and soft limits are not sent unless the -b option is specified. In the case of the DBUS, all quota messages are sent.

       Note, that you have to enable the kernel support for sending quota messages over netlink (in Filesystems->Quota menu).


OPTIONS
       -V, --version
              Show version of quota tools and exit.

       -h, --help
              Show a usage message and exit.

       -D, --no-dbus
              Do not forward quota warnings to DBUS.

       -C, --no-console
              Do not print quota warnings to the user's last-accessed terminal.

       -b, --print-below
              If quota warnings are printed to users' terminals, include messages about falling below their hard and soft limits.

       -F, --foreground
              Run daemon in foreground (may be useful for debugging purposes).


SEE ALSO
       quota(1), netlink(7), dbus.freedesktop.org



                                                                                                                                                                                                   RQUOTAD(8)
