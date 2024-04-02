ustat(8)                                                      System Manager's Manual                                                     ustat(8)

NAME
       ustat, javastat, nodestat, perlstat, phpstat, pythonstat, rubystat, tclstat - Activity stats from high-level languages.

SYNOPSIS
       javastat [-C] [-S {cload,excp,gc,method,objnew,thread}] [-r MAXROWS] [-d] [interval [count]]
       nodestat [-C] [-S {cload,excp,gc,method,objnew,thread}] [-r MAXROWS] [-d] [interval [count]]
       perlstat [-C] [-S {cload,excp,gc,method,objnew,thread}] [-r MAXROWS] [-d] [interval [count]]
       phpstat [-C] [-S {cload,excp,gc,method,objnew,thread}] [-r MAXROWS] [-d] [interval [count]]
       pythonstat [-C] [-S {cload,excp,gc,method,objnew,thread}] [-r MAXROWS] [-d] [interval [count]]
       rubystat [-C] [-S {cload,excp,gc,method,objnew,thread}] [-r MAXROWS] [-d] [interval [count]]
       tclstat [-C] [-S {cload,excp,gc,method,objnew,thread}] [-r MAXROWS] [-d] [interval [count]]
       ustat [-l {java,node,perl,php,python,ruby,tcl}] [-C] [-S {cload,excp,gc,method,objnew,thread}] [-r MAXROWS] [-d] [interval [count]]

DESCRIPTION
       This  is "top" for high-level language events, such as garbage collections, exceptions, thread creations, object allocations, method calls,
       and more. The events are aggregated for each process and printed in a top-like table, which can be sorted by various fields. Not  all  lan‐
       guage runtimes provide the same set of details.

       This uses in-kernel eBPF maps to store per process summaries for efficiency.

       This  tool relies on USDT probes embedded in many high-level languages, such as Java, Node, Perl, PHP, Python, Ruby, and Tcl. It requires a
       runtime instrumented with these probes, which in some cases requires building from source with a USDT-specific  flag,  such  as  "--enable-
       dtrace"  or  "--with-dtrace".  For  Java, some probes are not enabled by default, and can be turned on by running the Java process with the
       "-XX:+ExtendedDTraceProbes" flag. For PHP processes, the environment variable USE_ZEND_DTRACE must be set to 1.

       Newly-created processes will only be traced at the next interval. If you run this tool with a  short  interval  (say,  1-5  seconds),  this
       should  be virtually unnoticeable. For longer intervals, you might miss processes that were started and terminated during the interval win‐
       dow.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -l {java,node,perl,php,python,ruby,tcl}
              The language to trace. By default, all languages are traced.

       -C     Do not clear the screen between updates.

       -S {cload,excp,gc,method,objnew,thread}
              Sort the output by the specified field.

       -r MAXROWS
              Do not print more than this number of rows.

       -d     Print the resulting BPF program, for debugging purposes.

       interval
              Interval between updates, seconds.

       count  Number of interval summaries.

EXAMPLES
       Summarize activity in high-level languages, 1 second refresh:
              # ustat

       Don't clear the screen, and top 8 rows only:
              # ustat -Cr 8

       5 second summaries, 10 times only:
              # ustat 5 10

FIELDS
       loadavg
              The contents of /proc/loadavg

       PID    Process ID.

       CMDLINE
              Process command line (often the second and following arguments will give you a hint as to which application is being run.

       METHOD/s
              Count of method invocations during interval.

       GC/s   Count of garbage collections during interval.

       OBJNEW/s
              Count of objects allocated during interval.

       CLOAD/s
              Count of classes loaded during interval.

       EXC/s  Count of exceptions thrown during interval.

       THR/s  Count of threads created during interval.

OVERHEAD
       When using this tool with high-frequency events, such as method calls, a very significant slow-down can be expected. However, many  of  the
       high-level  languages  covered  by  this tool already have a fairly high per-method invocation cost, especially when running in interpreted
       mode. For the lower-frequency events, such as garbage collections or thread creations, the overhead should  not  be  significant.  Specifi‐
       cally,  when  probing Java processes and not using the "-XX:+ExtendedDTraceProbes" flag, the most expensive probes are not emitted, and the
       overhead should be acceptable.

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
       trace(8), argdist(8), tplist(8)

USER COMMANDS                                                       2018-10-09                                                            ustat(8)
