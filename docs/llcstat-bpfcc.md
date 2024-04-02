llcstat(8)                                                    System Manager's Manual                                                   llcstat(8)

NAME
       llcstat - Summarize CPU cache references and misses by process. Uses Linux eBPF/bcc.

SYNOPSIS
       llcstat [-h] [-c SAMPLE_PERIOD] [duration]

DESCRIPTION
       llcstat  instruments  CPU  cache  references  and cache misses system-side, and summarizes them by PID and CPU. These events have different
       meanings on different architecture. For x86-64, they mean misses and references to LLC.  This can be useful to locate and debug performance
       issues caused by cache hit rate.

       This   works   by   sampling   corresponding   events   defined   in  uapi/linux/perf_event.h,  namely  PERF_COUNT_HW_CACHE_REFERENCES  and
       PERF_COUNT_HW_CACHE_MISSES, using BPF perf event tracing. Upon each sampled event, the attached BPF program records the PID and CPU  ID  on
       which the event happened, and stores it in table.

       This makes use of a Linux 4.9 feature (BPF_PROG_TYPE_PERF_EVENT).

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.

       -c SAMPLE_PERIOD
              Sample one in this many cache reference and cache miss events.

       duration
              Duration to trace, in seconds.

EXAMPLES
       Sample one in 100 events, trace for 20 seconds:
              # llcstat -c 100 20

FIELDS
       PID    Process ID

       NAME   Process name

       CPU    CPU ID

       REFERENCE
              Number of cache reference events

       MISS   Number of cache miss events

       HIT%   Cache hit ratio

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Teng Qin

SEE ALSO
       Perf can be used as a generic event counter tool. An example for LLC:
              # perf top -e cache-misses -e cache-references -a -ns pid,cpu,comm

USER COMMANDS                                                       2015-08-18                                                          llcstat(8)
