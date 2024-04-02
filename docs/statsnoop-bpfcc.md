statsnoop(8)                                                  System Manager's Manual                                                 statsnoop(8)

NAME
       statsnoop - Trace stat() syscalls. Uses Linux eBPF/bcc.

SYNOPSIS
       statsnoop [-h] [-t] [-x] [-p PID]

DESCRIPTION
       statsnoop  traces  the different stat() syscalls, showing which processes are attempting to read information about which files. This can be
       useful for determining the location of config and log files, or for troubleshooting applications that are failing, especially on startup.

       This works by tracing various kernel sys_stat() functions using dynamic tracing, and will need updating to match any changes to these func‐
       tions.

       This makes use of a Linux 4.5 feature (bpf_perf_event_output()); for kernels older than 4.5, see the version under tools/old, which uses an
       older mechanism.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.

       -t     Include a timestamp column: in seconds since the first event, with decimal places.

       -x     Only print failed stats.

       -p PID Trace this process ID only (filtered in-kernel).

EXAMPLES
       Trace all stat() syscalls:
              # statsnoop

       Trace all stat() syscalls, and include timestamps:
              # statsnoop -t

       Trace only stat() syscalls that failed:
              # statsnoop -x

       Trace PID 181 only:
              # statsnoop -p 181

FIELDS
       TIME(s)
              Time of the call, in seconds.

       PID    Process ID

       COMM   Process name

       FD     File descriptor (if success), or -1 (if failed)

       ERR    Error number (see the system's errno.h)

       PATH   Open path

OVERHEAD
       This traces the kernel stat function and prints output for each event. As the rate of this is generally expected to be low (< 1000/s),  the
       overhead  is  also  expected  to be negligible. If you have an application that is calling a high rate of stat()s, then test and understand
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
       opensnoop(1)

USER COMMANDS                                                       2016-02-08                                                        statsnoop(8)
