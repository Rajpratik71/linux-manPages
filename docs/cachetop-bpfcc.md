cachetop(8)                                                   System Manager's Manual                                                  cachetop(8)

NAME
       cachetop - Statistics for linux page cache hit/miss ratios per processes. Uses Linux eBPF/bcc.

SYNOPSIS
       cachetop [interval]

DESCRIPTION
       This  traces  four  kernel  functions  and prints per-processes summaries every interval seconds. This can be useful for processes workload
       characterization, and looking for patterns in operation usage over time. It provides a top-like interface which by default sorts by HITS in
       ascending order.

       This  works  by  tracing kernel page cache functions using dynamic tracing, and will need updating to match any changes to these functions.
       Edit the script to customize which functions are traced.

       Since this uses BPF, only the root user can use this tool.

KEYBINDINGS
       The following keybindings can be used to control the output of cachetop.

       <      Use the previous column for sorting.

       >      Use the next column for sorting.

       r      Toggle sorting order (default ascending).

       q      Quit cachetop.

REQUIREMENTS
       CONFIG_BPF and bcc.

EXAMPLES
       Update summaries every five second:
              # cachetop

       Print summaries each second:
              # cachetop 1

FIELDS
       PID    Process ID of the process causing the cache activity.

       UID    User ID of the process causing the cache activity.

       HITS   Number of page cache hits.

       MISSES Number of page cache misses.

       DIRTIES
              Number of dirty pages added to the page cache.

       READ_HIT%
              Read hit percent of page cache usage.

       WRITE_HIT%
              Write hit percent of page cache usage.

       BUFFERS_MB
              Buffers size taken from /proc/meminfo.

       CACHED_MB
              Cached amount of data in current page cache taken from /proc/meminfo.

OVERHEAD
       This traces various kernel page cache functions and maintains in-kernel counts, which are asynchronously copied to  user-space.  While  the
       rate  of  operations  can  be  very  high (>1G/sec) we can have up to 34% overhead, this is still a relatively efficient way to trace these
       events, and so the overhead is expected to be small for normal workloads.  Measure in a test environment.

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Emmanuel Bretelle

SEE ALSO
       cachestat (8)

USER COMMANDS                                                       2016-01-30                                                         cachetop(8)
