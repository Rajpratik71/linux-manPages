biostacks(8)                                                  System Manager's Manual                                                 biostacks(8)

NAME
       biostacks - Show disk I/O latency with initialization stacks. Uses bpftrace/eBPF.

SYNOPSIS
       biostacks

DESCRIPTION
       This  tool  shows  disk I/O latency histograms for each block I/O initialization path. This can help reveal the reason for different laten‐
       cies, as some may be created by log flushing, others by application reads, etc.

       This works by tracing the blk_account_io_start() and the blk_start_request() or blk_mq_start_request() functions using dynamic instrumenta‐
       tion.   Linux  5.0  removed the classic I/O scheduler, so the blk_start_request() probe can be removed from the tool (just delete it). This
       tool may need other maintenance to keep working if these functions change in later kernels.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bpftrace.

EXAMPLES
       Trace disk I/O latency with initialization stacks:
              # biostacks.bt

FIELDS
       0th    An initialization kernel stack trace (shown in "@[...]") is printed before each I/O histogram.

       1st, 2nd
              This is a range of I/O latency, in microseconds (shown in "[...)" set notation).

       3rd    A column showing the count of I/O in this range.

       4th    This is an ASCII histogram representing the count column.

OVERHEAD
       The rate of biostacks should be low (bounded by device IOPS), such that the overhead of this tool is expected to be negligible.

SOURCE
       This tool originated from the book "BPF Performance Tools", published by Addison Wesley (2019):

              http://www.brendangregg.com/bpf-performance-tools-book.html

       See the book for more documentation on this tool.

       This version is in the bpftrace repository:

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

USER COMMANDS                                                       2019-07-12                                                        biostacks(8)
