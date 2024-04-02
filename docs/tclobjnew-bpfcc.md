uobjnew(8)                                                    System Manager's Manual                                                   uobjnew(8)

NAME
       uobjnew, cobjnew, javaobjnew, rubyobjnew, tclobjnew - Summarize object allocations in high-level languages.

SYNOPSIS
       cobjnew [-h] [-C TOP_COUNT] [-S TOP_SIZE] [-v] pid [interval]
       javaobjnew [-h] [-C TOP_COUNT] [-S TOP_SIZE] [-v] pid [interval]
       rubyobjnew [-h] [-C TOP_COUNT] [-S TOP_SIZE] [-v] pid [interval]
       tclobjnew [-h] [-C TOP_COUNT] [-S TOP_SIZE] [-v] pid [interval]
       uobjnew [-h] [-C TOP_COUNT] [-S TOP_SIZE] [-v] [-l {c,java,ruby,tcl}] pid [interval]

DESCRIPTION
       uobjnew  traces object allocations in high-level languages (including "malloc") and prints summaries of the most frequently allocated types
       by number of objects or number of bytes.

       This tool relies on USDT probes embedded in many high-level languages, such as C, Java, Ruby, and Tcl. It requires a  runtime  instrumented
       with  these  probes,  which  in  some  cases requires building from source with a USDT-specific flag, such as "--enable-dtrace" or "--with-
       dtrace". For Java, the Java process must be started with the "-XX:+ExtendedDTraceProbes" flag.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -C TOP_COUNT
              Print the top object types sorted by number of instances.

       -S TOP_SIZE
              Print the top object types sorted by size.

       -v     Print the resulting BPF program, for debugging purposes.

       {c,java,ruby,tcl}
              The language to trace.

       pid    The process id to trace.

       interval
              Wait this many seconds and then print the summary and exit. By default, wait for Ctrl+C to exit.

EXAMPLES
       Trace object allocations in a Ruby process:
              # uobjnew ruby 148

       Trace object allocations from "malloc" and print the top 10 by total size:
              # uobjnew -S 10 c 1788

FIELDS
       TYPE   The object type being allocated. For C (malloc), this is the block size.

       ALLOCS The number of objects allocated.

       BYTES  The number of bytes allocated.

OVERHEAD
       Object allocation events are quite frequent, and therefore the overhead from running this tool can be considerable. Use  with  caution  and
       make  sure  to  test  before using in a production environment. Nonetheless, even thousands of allocations per second will likely produce a
       reasonable overhead when investigating a problem.

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _example.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Sasha Goldshtein

SEE ALSO
       ustat(8), ugc(8), memleak(8)

USER COMMANDS                                                       2018-10-09                                                          uobjnew(8)
