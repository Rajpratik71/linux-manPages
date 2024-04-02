writeback(8)                                                  System Manager's Manual                                                 writeback(8)

NAME
       writeback.bt - Trace file system writeback events with details. Uses bpftrace/eBPF.

SYNOPSIS
       writeback.bt

DESCRIPTION
       This  traces  when file system dirtied pages are flushed to disk by kernel writeback, and prints details including when the event occurred,
       and the duration of the event. This can be useful for correlating these times with other performance problems, and if there is a match,  it
       would  be  a clue that the problem may be caused by writeback. How quickly the kernel does writeback can be tuned: see the kernel docs, eg,
       vm.dirty_writeback_centisecs.

       This uses the tracepoint:writeback:writeback_start and tracepoint:writeback:writeback_written tracepoints.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bpftrace.

EXAMPLES
       Trace all writeback events with timestamps and latency details:
              # writeback.bt

FIELDS
       TIME   Time that the writeback event completed, in %H:%M:%S format.

       DEVICE Device name in major:minor number format.

       PAGES  Pages written during writeback.

       REASON Reason for the writeback event. This may be "background", "vmscan", "sync", "periodic", etc.

       ms     Duration of the writeback event in milliseconds.

OVERHEAD
       Since writeback events are expected to be infrequent (<10/sec), the overhead of this tool is expected to be negligible (near 0%).

SOURCE
       This is from bpftrace.

              https://github.com/iovisor/bpftrace

       Also look in the bpftrace distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Brendan Gregg

SEE ALSO
       biosnoop(8)

USER COMMANDS                                                       2018-09-14                                                        writeback(8)
