softirqs(8)                                                   System Manager's Manual                                                  softirqs(8)

NAME
       softirqs - Measure soft IRQ (soft interrupt) event time. Uses Linux eBPF/bcc.

SYNOPSIS
       softirqs [-h] [-T] [-N] [-d] [interval] [count]

DESCRIPTION
       This summarizes the time spent servicing soft IRQs (soft interrupts), and can show this time as either totals or histogram distributions. A
       system-wide summary of this time is shown by the %soft column of mpstat(1), and soft IRQ event counts (but  not  times)  are  available  in
       /proc/softirqs.

       This  tool uses the irq:softirq_enter and irq:softirq_exit kernel tracepoints, which is a stable tracing mechanism. BPF programs can attach
       to tracepoints from Linux 4.7 only. An older version of this tool is available in tools/old, and uses kprobes instead of tracepoints.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.

       -T     Include timestamps on output.

       -N     Output in nanoseconds

       -d     Show IRQ time distribution as histograms

EXAMPLES
       Sum soft IRQ event time until Ctrl-C:
              # softirqs

       Show soft IRQ event time as histograms:
              # softirqs -d

       Print 1 second summaries, 10 times:
              # softirqs 1 10

       1 second summaries, printed in nanoseconds, with timestamps:
              # softirqs -NT 1

FIELDS
       SOFTIRQ
              The kernel function name that performs the soft IRQ action.

       TOTAL_usecs
              Total time spent in this soft IRQ function in microseconds.

       TOTAL_nsecs
              Total time spent in this soft IRQ function in nanoseconds.

       usecs  Range of microseconds for this bucket.

       nsecs  Range of nanoseconds for this bucket.

       count  Number of soft IRQs in this time range.

       distribution
              ASCII representation of the distribution (the count column).

OVERHEAD
       This traces kernel functions and maintains in-kernel counts, which are asynchronously copied to user-space. While the rate of interrupts be
       very high (>1M/sec), this is a relatively efficient way to trace these events, and so the overhead is expected to be small for normal work‐
       loads, but could become noticeable for heavy workloads. Measure in a test environment before use.

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHORS
       Brendan Gregg, Sasha Goldshtein

SEE ALSO
       hardirqs(8)

USER COMMANDS                                                       2015-10-20                                                         softirqs(8)
