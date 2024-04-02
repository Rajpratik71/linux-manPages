tai64n(8)                                                     System Manager's Manual                                                    tai64n(8)

NAME
       tai64n - puts a precise timestamp on each line.

SYNOPSIS
       tai64n

DESCRIPTION
       tai64n reads lines from stdin. For each line, it writes

       1      an @,

       2.     a precise timestamp,

       3.     a space, and

       4.     a copy of the input line

              to stdout. The timestamp indicates the moment that tai64n read the first character of the line.

              tai64n does not allocate any memory after it starts.

TIMESTAMPS
       Timestamps  used by tai64n are 12-byte TAI64N labels in external TAI64N format, printed as 24 lowercase hexadecimal characters. You can use
       tai64nlocal(8) to convert the timestamps to a human-readable format.

       For example, the timestamp 4000000037c219bf2ef02e94 refers to the nanosecond beginning exactly 935467455.787492500 seconds after the begin‐
       ning of 1970 TAI; 37c219bf hexadecimal is 935467455, and 2ef02e94 hexadecimal is 787492500.

       The  current  implementation of tai64n relies on the UNIX gettimeofday library routine to return the current time as the number of TAI sec‐
       onds since 1970-01-01 00:00:10 TAI. Beware that most gettimeofday implementations are not Y2038-compliant. Furthermore, most clocks are not
       set accurately.

EXIT CODES
       tai64n exits 0 when it sees end of input. It exits 111 without an error message if it has trouble reading stdin or writing stdout.

SEE ALSO
       supervise(8),  svc(8), svok(8), svstat(8), svscanboot(8), svscan(8), readproctitle(8), fghack(8), pgrphack(8), multilog(8), tai64nlocal(8),
       setuidgid(8), envuidgid(8), envdir(8), softlimit(8), setlock(8)

       http://cr.yp.to/daemontools.html

                                                                                                                                         tai64n(8)
