funcslower(8)                                                 System Manager's Manual                                                funcslower(8)

NAME
       funcslower - Trace slow kernel or user function calls.

SYNOPSIS
       funcslower [-hf] [-p PID] [-U | -K] [-m MIN_MS] [-u MIN_US] [-a ARGUMENTS] [-T] [-t] [-v] function [function ...]

DESCRIPTION
       This script traces a kernel or user function's entry and return points, and prints a message when the function's latency exceeded the spec‐
       ified threshold.  Multiple functions are supported, and you can mix kernel functions with user functions in different libraries.

       WARNING: See the OVERHEAD section.

       By default, a minimum millisecond threshold of 1 is used. Recursive functions are not supported: only the inner-most  recursive  invocation
       will be traced.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -p PID Trace this PID only.

       -m MIN_NS
              Minimum duration to trace, in milliseconds. Default is 1 ms.

       -u MIN_US
              Minimum duration to trace, in microseconds.

       -a ARGUMENTS
              Print the function's arguments, up to 6.

       -T     Print a HH:MM:SS timestamp with each entry.

       -t     Print a seconds timestamp with each entry, at microsecond resolution.

       -f     Print output in folded stack format.

       -U     Show stacks from user space only (no kernel space stacks).

       -K     Show stacks from kernel space only (no user space stacks).

       -v     Print the resulting BPF program, for debugging purposes.

       function
              The  function  to  trace  -- multiple functions are supported. If a plain function name is provided, the function is assumed to be a
              kernel function. For user functions, provide the library name and the function name, e.g. bash:readline or c:malloc.

EXAMPLES
       Trace vfs_write calls slower than 1ms:
              # funcslower vfs_write

       Trace open() calls in libc slower than 10us:
              # funcslower -u 10 c:open

       Trace both malloc() and free() slower than 10us, in pid 135 only:
              # funcslower -p 135 -u 10 c:malloc c:free

       Trace the write syscall and print its first 4 arguments:
              # funcslower -a 4 SyS_write

       Trace opens from libc and print the user and kernel stack frames:
              # funcslower -UK c:open

FIELDS
       TIME   Time of the event as a human-readable HH:MM:SS format, or a timestamp in seconds at microsecond-accuracy from the first event seen.

       COMM   Process name.

       PID    Process ID.

       LAT    Latency of the operation in either microseconds (us) or milliseconds (ms).

       RVAL   The return value from the function. Often useful for diagnosing a relationship between slow and failed function calls.

       FUNC   The function name, followed by its arguments if requested.

OVERHEAD
       Depending on the function(s) being traced, overhead can become severe. For example, tracing a common function like malloc() can slow down a
       C/C++ program by a factor of 2 or more. On the other hand, tracing a low-frequency event like the SyS_setreuid() function will probably not
       be as prohibitive, and in fact negligible for functions that are called up to 100-1000 times per second.

       You should first use the funclatency and argdist tools for investigation, because they summarize data in-kernel and have a much lower over‐
       head  than  this  tool.  To  get a general idea of the number of times a particular function is called (and estimate the overhead), use the
       funccount tool, e.g.:

       # funccount c:open

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Sasha Goldshtein

SEE ALSO
       funccount(8), funclatency(8), argdist(8), trace(8)

USER COMMANDS                                                       2017-03-30                                                       funcslower(8)
