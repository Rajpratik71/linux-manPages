
LSLOCKS(8)                                                                               System Administration                                                                              LSLOCKS(8)

NAME
       lslocks - list local system locks

SYNOPSIS
       lslocks [options]

DESCRIPTION
       lslocks lists information about all the currently held file locks in a Linux system.

OPTIONS
       -i, --noinaccessible
              Ignore lock files which are inaccessible for the current user.

       -J, --json
              Use JSON output format.

       -n, --noheadings
              Do not print a header line.

       -o, --output list
              Specify which output columns to print.  Use --help to get a list of all supported columns.

              The default list of columns may be extended if list is specified in the format +list (e.g. lslocks -o +BLOCKER).

       -p, --pid pid
              Display only the locks held by the process with this pid.

       -r, --raw
              Use the raw output format.

       -u, --notruncate
              Do not truncate text in columns.

       -V, --version
              Display version information and exit.

       -h, --help
              Display help text and exit.

OUTPUT
       COMMAND
              The command name of the process holding the lock.

       PID    The process ID of the process which holds the lock.

       TYPE   The type of lock; can be FLOCK (created with flock(2)), POSIX (created with fcntl(2) and lockf(3)) or OFDLCK (created with fcntl(2).

       SIZE   Size of the locked file.

       MODE   The lock's access permissions (read, write).  If the process is blocked and waiting for the lock, then the mode is postfixed with an '*' (asterisk).

       M      Whether the lock is mandatory; 0 means no (meaning the lock is only advisory), 1 means yes.  (See fcntl(2).)

       START  Relative byte offset of the lock.

       END    Ending offset of the lock.

       PATH   Full  path of the lock.  If none is found, or there are no permissions to read the path, it will fall back to the device's mountpoint and "..." is appended to the path.  The path might
              be truncated; use --notruncate to get the full path.

       BLOCKER
              The PID of the process which blocks the lock.

NOTES
       The lslocks command is meant to replace the lslk(8) command,
       originally written by Victor A. Abell <abe@purdue.edu> and unmaintained
       since 2001.

AUTHORS
       Davidlohr Bueso <dave@gnu.org>

SEE ALSO
       flock(1), fcntl(2), lockf(3)

AVAILABILITY
       The lslocks command is part of the util-linux package and is available from https://www.kernel.org/pub/linux/utils/util-linux/.

util-linux                                                                                   December 2014                                                                                  LSLOCKS(8)
