drsnoop(8)                                                    System Manager's Manual                                                   drsnoop(8)

NAME
       drsnoop - Trace direct reclaim events. Uses Linux eBPF/bcc.

SYNOPSIS
       drsnoop.py [-h] [-T] [-U] [-p PID] [-t TID] [-u UID] [-d DURATION] [-n name] [-v]

DESCRIPTION
       drsnoop  trace direct reclaim events, showing which processes are allocing pages with direct reclaiming. This can be useful for discovering
       when allocstall (/p- roc/vmstat) continues to increase, whether it is caused by some critical proc- esses or not.

       This works by tracing the direct reclaim events using kernel tracepoints.

       This makes use of a Linux 4.5 feature (bpf_perf_event_output()); for kernels older than 4.5, see the version under tools/old, which uses an
       older mechanism.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.

       -T     Include a timestamp column.

       -U     Show UID.

       -p PID Trace this process ID only (filtered in-kernel).

       -t TID Trace this thread ID only (filtered in-kernel).

       -u UID Trace this UID only (filtered in-kernel).

       -d DURATION
              Total duration of trace in seconds.

       -n name
              Only print processes where its name partially matches 'name' -v verbose Run in verbose mode. Will output system memory state

EXAMPLES
       Trace all direct reclaim events:
              # drsnoop

       Trace all direct reclaim events, for 10 seconds only:
              # drsnoop -d 10

       Trace all direct reclaim events, and include timestamps:
              # drsnoop -T

       Show UID:
              # drsnoop -U

       Trace PID 181 only:
              # drsnoop -p 181

       Trace UID 1000 only:
              # drsnoop -u 1000

       Trace all direct reclaim events from processes where its name partially match-
              es 'mond': # drnsnoop -n mond

FIELDS
       TIME(s)
              Time of the call, in seconds.

       UID    User ID

       PID    Process ID

       TID    Thread ID

       COMM   Process name

OVERHEAD
       This  traces the kernel direct reclaim tracepoints and prints output for each event. As the rate of this is generally expected to be low (<
       1000/s), the overhead is also expected to be negligible.

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Ethercflow

USER COMMANDS                                                       2019-02-20                                                          drsnoop(8)
