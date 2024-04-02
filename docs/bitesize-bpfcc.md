bitesize(8)                                                   System Manager's Manual                                                  bitesize(8)

NAME
       bitesize - Summarize block device I/O size as a histogram - Linux eBPF/bcc.

SYNOPSIS
       bitesize

DESCRIPTION
       Show I/O distribution for requested block sizes, by process name.

       This works by tracing block:block_rq_issue and prints a historgram of I/O size.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

EXAMPLES
       Count I/O size per process until Ctrl-C is hit:
              # bitesize

FIELDS
       Kbtes  Size in kilobytes of range

       count  How many I/O fell into this range

       distribution
              An ASCII bar chart to visualize the distribution (count column)

OVERHEAD
       This  traces a block I/O tracepoint to update a histogram, which is asynchronously copied to user-space. This method is very efficient, and
       the overhead for most storage I/O rates (< 10k IOPS) should be negligible.  If you have a higher IOPS storage environment, test  and  quan‐
       tify the overhead before use.

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Allan McAleavy

SEE ALSO
       https://github.com/brendangregg/systemtap-lwtools/blob/master/disk/bitesize-nd.stp

USER COMMANDS                                                       2016-02-05                                                         bitesize(8)
