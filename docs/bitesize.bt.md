bitesize(8)                                                   System Manager's Manual                                                  bitesize(8)

NAME
       bitesize.bt - Show disk I/O size as a histogram. Uses bpftrace/eBPF.

SYNOPSIS
       bitesize.bt

DESCRIPTION
       This  can  be  used  to characterize the distribution of block device (disk) I/O sizes. To study block device I/O in more detail, see bios‐
       noop(8).

       This uses the tracepoint:block:block_rq_issue tracepoint, and is a simple example of bpftrace.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bpftrace.

EXAMPLES
       Trace block I/O and summarize as a histogram by process:
              # bitesize.bt

FIELDS
       0th    A process name (shown in "@[...]") is printed before each I/O histogram.

       1st, 2nd
              This is a range of I/O sizes, in Kbytes (shown in "[...)" set notation).

       3rd    A column showing the count of I/O in this range.

       4th    This is an ASCII histogram representing the count column.

OVERHEAD
       Since block device I/O usually has a relatively low frequency (< 10,000/s), the overhead for this tool is expected to be low or negligible.
       For high IOPS storage systems, test and quantify before use.

SOURCE
       This is from bpftrace.

              https://github.com/iovisor/bpftrace

       Also look in the bpftrace distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

       This is a bpftrace version of the bcc tool of the same name.

              https://github.com/iovisor/bcc

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Brendan Gregg

SEE ALSO
       biosnoop.bt(8)

USER COMMANDS                                                       2018-09-07                                                         bitesize(8)
