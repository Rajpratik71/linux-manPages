SYSTEMD-INHIBIT(1)                          systemd-inhibit                         SYSTEMD-INHIBIT(1)

NAME
       systemd-inhibit - Execute a program with an inhibition lock taken

SYNOPSIS
       systemd-inhibit [OPTIONS...] [COMMAND] [ARGUMENTS...]

       systemd-inhibit [OPTIONS...] --list

DESCRIPTION
       systemd-inhibit may be used to execute a program with a shutdown, sleep, or idle inhibitor lock
       taken. The lock will be acquired before the specified command line is executed and released
       afterwards.

       Inhibitor locks may be used to block or delay system sleep and shutdown requests from the user,
       as well as automatic idle handling of the OS. This is useful to avoid system suspends while an
       optical disc is being recorded, or similar operations that should not be interrupted.

       For more information see the Inhibitor Lock Developer Documentation[1].

OPTIONS
       The following options are understood:

       --what=
           Takes a colon-separated list of one or more operations to inhibit: "shutdown", "sleep",
           "idle", "handle-power-key", "handle-suspend-key", "handle-hibernate-key",
           "handle-lid-switch", for inhibiting reboot/power-off/halt/kexec, suspending/hibernating,
           the automatic idle detection, or the low-level handling of the power/sleep key and the lid
           switch, respectively. If omitted, defaults to "idle:sleep:shutdown".

       --who=
           Takes a short, human-readable descriptive string for the program taking the lock. If not
           passed, defaults to the command line string.

       --why=
           Takes a short, human-readable descriptive string for the reason for taking the lock.
           Defaults to "Unknown reason".

       --mode=
           Takes either "block" or "delay" and describes how the lock is applied. If "block" is used
           (the default), the lock prohibits any of the requested operations without time limit, and
           only privileged users may override it. If "delay" is used, the lock can only delay the
           requested operations for a limited time. If the time elapses, the lock is ignored and the
           operation executed. The time limit may be specified in logind.conf(5). Note that "delay" is
           only available for "sleep" and "shutdown".

       --list
           Lists all active inhibition locks instead of acquiring one.

       --no-pager
           Do not pipe output into a pager.

       --no-legend
           Do not print the legend, i.e. column headers and the footer with hints.

       -h, --help
           Print a short help text and exit.

       --version
           Print a short version string and exit.

EXIT STATUS
       Returns the exit status of the executed program.

EXAMPLE
           # systemd-inhibit wodim foobar.iso

       This burns the ISO image foobar.iso on a CD using wodim(1), and inhibits system sleeping,
       shutdown and idle while doing so.

ENVIRONMENT
       $SYSTEMD_PAGER
           Pager to use when --no-pager is not given; overrides $PAGER. If neither $SYSTEMD_PAGER nor
           $PAGER are set, a set of well-known pager implementations are tried in turn, including
           less(1) and more(1), until one is found. If no pager implementation is discovered no pager
           is invoked. Setting this environment variable to an empty string or the value "cat" is
           equivalent to passing --no-pager.

       $SYSTEMD_LESS
           Override the options passed to less (by default "FRSXMK").

           If the value of $SYSTEMD_LESS does not include "K", and the pager that is invoked is less,
           Ctrl+C will be ignored by the executable. This allows less to handle Ctrl+C itself.

       $SYSTEMD_LESSCHARSET
           Override the charset passed to less (by default "utf-8", if the invoking terminal is
           determined to be UTF-8 compatible).

SEE ALSO
       systemd(1), logind.conf(5)

NOTES
        1. Inhibitor Lock Developer Documentation
           https://www.freedesktop.org/wiki/Software/systemd/inhibit

systemd 242                                                                         SYSTEMD-INHIBIT(1)
