dcstat(8)                                                     System Manager's Manual                                                    dcstat(8)

NAME
       dcstat - Directory entry cache (dcache) stats. Uses Linux eBPF/bcc.

SYNOPSIS
       dcstat [interval [count]]

DESCRIPTION
       The Linux directory entry cache (dcache) improves the performance of file and directory name lookups. This tool provides per-second summary
       statistics of dcache performance.

       This uses kernel dynamic tracing of kernel functions, lookup_fast() and d_lookup(), which will need to be modified to match kernel changes.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

EXAMPLES
       Print summaries each second:
              # dcstat

       Print output every five seconds, three times:
              # dcstat 5 3

FIELDS
       REFS/s Number dcache lookups (references) per second.

       SLOW/s Number of dcache lookups that failed the lookup_fast() path and executed the lookup_slow() path instead.

       MISS/s Number of dcache misses (failed both fast and slow lookups).

       HIT%   Percentage of dcache hits over total references.

OVERHEAD
       The overhead depends on the frequency of file and directory name lookups.  While the per-event overhead is low, some applications may  make
       over  100k  lookups per second, and the low per-event overhead will begin to add up, and could begin to be measurable (over 10% CPU usage).
       Measure in a test environment.

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
       dcsnoop(8)

USER COMMANDS                                                       2016-02-09                                                           dcstat(8)
