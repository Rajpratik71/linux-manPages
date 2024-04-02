slabratetop(8)                                                System Manager's Manual                                               slabratetop(8)

NAME
       slabratetop - Kernel SLAB/SLUB memory cache allocation rate top.  Uses Linux BPF/bcc.

SYNOPSIS
       slabratetop [-h] [-C] [-r MAXROWS] [interval] [count]

DESCRIPTION
       This  is top for the the rate of kernel SLAB/SLUB memory allocations.  It works by tracing kmem_cache_alloc() calls, a commonly used inter‐
       face for kernel memory allocation (SLAB or SLUB). It summarizes the rate and total bytes allocated of these calls per interval: the  activ‐
       ity. Compare this to slabtop(1), which shows the current static volume of the caches.

       This tool uses kernel dynamic tracing of the kmem_cache_alloc() function.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -C     Don't clear the screen.

       -r MAXROWS
              Maximum number of rows to print. Default is 20.

       interval
              Interval between updates, seconds.

       count  Number of interval summaries.

EXAMPLES
       Summarize active kernel SLAB/SLUB calls (kmem_cache_alloc()), showing the top 20 caches every second:
              # slabratetop

       Don't clear the screen, and top 8 rows only:
              # slabratetop -Cr 8

       5 second summaries, 10 times only:
              # slabratetop 5 10

FIELDS
       loadavg:
              The contents of /proc/loadavg

       CACHE  Kernel cache name.

       ALLOCS Allocations (number of calls).

       BYTES  Total bytes allocated.

OVERHEAD
       If  kmem_cache_alloc()  is called at a high rate (eg, >100k/second) the overhead of this tool might begin to be measurable. The rate can be
       seen in the ALLOCS column of the output.

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
       slabtop(1)

USER COMMANDS                                                       2016-10-17                                                      slabratetop(8)
