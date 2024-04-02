dcsnoop(8)                                                    System Manager's Manual                                                   dcsnoop(8)

NAME
       dcsnoop - Trace directory entry cache (dcache) lookups. Uses Linux eBPF/bcc.

SYNOPSIS
       dcsnoop [-h] [-a]

DESCRIPTION
       By  default, this traces every failed dcache lookup (cache miss), and shows the process performing the lookup and the filename requested. A
       -a option can be used to show all lookups, not just failed ones.

       The output of this tool can be verbose, and is intended for further investigations of dcache performance  beyond  dcstat(8),  which  prints
       per-second summaries.

       This uses kernel dynamic tracing of the d_lookup() function, and will need and will need updating to match any changes to this function.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.

       -a     Trace references, not just failed lookups.

EXAMPLES
       Trace failed dcache lookups:
              # dcsnoop

       Trace all dcache lookups:
              # dcsnoop -a

FIELDS
       TIME(s)
              Time of lookup, in seconds.

       PID    Process ID.

       COMM   Process name.

       T      Type: R == reference (only visible with -a), M == miss. A miss will print two lines, one for the reference, and one for the miss.

       FILE   The  file name component that was being looked up. This contains trailing pathname components (after '/'), which will be the subject
              of subsequent lookups.

OVERHEAD
       File name lookups can be frequent (depending on the workload), and this tool prints a line for each failed lookup, and with -a, each refer‐
       ence as well. The output may be verbose, and the incurred overhead, while optimized to some extent, may still be from noticeable to signif‐
       icant. This is only really intended for deeper investigations beyond dcstat(8), when absolutely necessary.  Measure and quantify the  over‐
       head in a test environment before use.

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
       dcstat(1)

USER COMMANDS                                                       2016-02-10                                                          dcsnoop(8)
