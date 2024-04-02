cachestat(8)                                                  System Manager's Manual                                                 cachestat(8)

NAME
       cachestat - Statistics for linux page cache hit/miss ratios. Uses Linux eBPF/bcc.

SYNOPSIS
       cachestat [-T] [interval [count]]

DESCRIPTION
       This  traces  four  kernel functions and prints per-second summaries. This can be useful for general workload characterization, and looking
       for patterns in operation usage over time.

       This works by tracing kernel page cache functions using dynamic tracing, and will need updating to match any changes  to  these  functions.
       Edit the script to customize which functions are traced.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

EXAMPLES
       Print summaries every second:
              # cachestat

       Print summaries every second with timestamp:
              # cachestat -T

       Print output every five seconds, three times:
              # cachestat 5 3

       Print output with timestamp every five seconds, three times:
              # cachestat -T 5 3

FIELDS
       TIME   Timestamp.

       HITS   Number of page cache hits.

       MISSES Number of page cache misses.

       DIRTIES
              Number of dirty pages added to the page cache.

       HITRATIO
              The hit ratio as a percentage.

       READ_HIT%
              Read hit percent of page cache usage.

       WRITE_HIT%
              Write hit percent of page cache usage.

       BUFFERS_MB
              Buffers size taken from /proc/meminfo.

       CACHED_MB
              Cached amount of data in current page cache taken from /proc/meminfo.

OVERHEAD
       This  traces  various  kernel page cache functions and maintains in-kernel counts, which are asynchronously copied to user-space. While the
       rate of operations can be very high (>1G/sec) we can have up to 34% overhead, this is still a  relatively  efficient  way  to  trace  these
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
       Allan McAleavy

SEE ALSO
       https://github.com/brendangregg/perf-tools/blob/master/fs/cachestat

USER COMMANDS                                                       2016-01-30                                                        cachestat(8)
