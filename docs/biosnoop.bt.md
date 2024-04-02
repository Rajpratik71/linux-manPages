biosnoop(8)                                                   System Manager's Manual                                                  biosnoop(8)

NAME
       biosnoop.bt - Block I/O tracing tool, showing per I/O latency. Uses bpftrace/eBPF.

SYNOPSIS
       biosnoop.bt

DESCRIPTION
       This  is a basic block I/O (disk I/O) tracing tool, showing each I/O event along with the issuing process ID, and the I/O latency. This can
       be used to investigate disk I/O performance issues.

       This tool currently works by dynamic tracing of the blk_account*() kernel functions, which will need updating to match any changes to these
       functions in future kernels versions.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bpftrace.

EXAMPLES
       Trace block I/O events, printing per-line summaries:
              # biosnoop.bt

FIELDS
       TIME   Time of the I/O completion, in milliseconds since program start.

       COMM   Issuing process name. This often identifies the issuing application process, but I/O may be initiated from kernel threads only.

       PID    Issuing process ID. This often identifies the issuing application process, but I/O may be initiated from kernel threads only.

       ARGS   Process name and arguments (16 word maximum).

OVERHEAD
       Since  block  device  I/O usually has a relatively low frequency (< 10,000/s), the overhead for this tool is expected to be negligible. For
       high IOPS storage systems, test and quantify before use.

SOURCE
       This is from bpftrace.

              https://github.com/iovisor/bpftrace

       Also look in the bpftrace distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

       This is a bpftrace version of the bcc tool of the same name. The bcc tool provides more fields.

              https://github.com/iovisor/bcc

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Brendan Gregg

SEE ALSO
       opensnoop(8)

USER COMMANDS                                                       2018-09-11                                                         biosnoop(8)
