opensnoop(8)                                                  System Manager's Manual                                                 opensnoop(8)

NAME
       opensnoop - Trace open() syscalls. Uses Linux eBPF/bcc.

SYNOPSIS
       opensnoop.py [-h] [-T] [-U] [-x] [-p PID] [-t TID] [-u UID]
                    [-d DURATION] [-n NAME] [-e] [-f FLAG_FILTER]

DESCRIPTION
       opensnoop traces the open() syscall, showing which processes are attempting to open which files. This can be useful for determining the lo‐
       cation of config and log files, or for troubleshooting applications that are failing, specially on startup.

       This works by tracing the kernel sys_open() function using dynamic tracing, and will need updating to match any changes to this function.

       This makes use of a Linux 4.5 feature (bpf_perf_event_output()); for kernels older than 4.5, see the version under tools/old, which uses an
       older mechanism.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.

       -T     Include a timestamp column.

       -U     Show UID.

       -x     Only print failed opens.

       -p PID Trace this process ID only (filtered in-kernel).

       -t TID Trace this thread ID only (filtered in-kernel).

       -u UID Trace this UID only (filtered in-kernel).

       -d DURATION
              Total duration of trace in seconds.

       -n name
              Only print processes where its name partially matches 'name'

       -e     Show extended fields.

       -f FLAG
              Filter on open() flags, e.g., O_WRONLY.

EXAMPLES
       Trace all open() syscalls:
              # opensnoop

       Trace all open() syscalls, for 10 seconds only:
              # opensnoop -d 10

       Trace all open() syscalls, and include timestamps:
              # opensnoop -T

       Show UID:
              # opensnoop -U

       Trace only open() syscalls that failed:
              # opensnoop -x

       Trace PID 181 only:
              # opensnoop -p 181

       Trace UID 1000 only:
              # opensnoop -u 1000

       Trace all open() syscalls from processes where its name partially matches 'ed':
              # opensnoop -n ed

       Show extended fields:
              # opensnoop -e

       Only print calls for writing:
              # opensnoop -f O_WRONLY -f O_RDWR

FIELDS
       TIME(s)
              Time of the call, in seconds.

       UID    User ID

       PID    Process ID

       TID    Thread ID

       COMM   Process name

       FD     File descriptor (if success), or -1 (if failed)

       ERR    Error number (see the system's errno.h)

       FLAGS  Flags passed to open(2), in octal

       PATH   Open path

OVERHEAD
       This  traces the kernel open function and prints output for each event. As the rate of this is generally expected to be low (< 1000/s), the
       overhead is also expected to be negligible. If you have an application that is calling a high rate of open()s,  then  test  and  understand
       overhead before use.

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Brendan Gregg

SEE ALSO
       funccount(1)

USER COMMANDS                                                       2015-08-18                                                        opensnoop(8)
