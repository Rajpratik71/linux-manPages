ucalls(8)                                                     System Manager's Manual                                                    ucalls(8)

NAME
       ucalls,  javacalls,  perlcalls,  phpcalls,  pythoncalls,  rubycalls,  tclcalls - Summarize method calls from high-level languages and Linux
       syscalls.

SYNOPSIS
       javacalls [-h] [-T TOP] [-L] [-S] [-v] [-m] pid [interval]
       perlcalls [-h] [-T TOP] [-L] [-S] [-v] [-m] pid [interval]
       phpcalls [-h] [-T TOP] [-L] [-S] [-v] [-m] pid [interval]
       pythoncalls [-h] [-T TOP] [-L] [-S] [-v] [-m] pid [interval]
       rubycalls [-h] [-T TOP] [-L] [-S] [-v] [-m] pid [interval]
       tclcalls [-h] [-T TOP] [-L] [-S] [-v] [-m] pid [interval]
       ucalls [-l {java,perl,php,python,ruby}] [-h] [-T TOP] [-L] [-S] [-v] [-m] pid [interval]

DESCRIPTION
       This tool summarizes method calls from high-level languages such as Java, Perl, PHP, Python, Ruby, and Tcl. It can also trace Linux  system
       calls. Whenever a method is invoked, ucalls records the call count and optionally the method's execution time (latency) and displays a sum‐
       mary.

       This uses in-kernel eBPF maps to store per process summaries for efficiency.

       This tool relies on USDT probes embedded in many high-level languages, such as Java, Perl, PHP, Python, Ruby, and Tcl. It requires  a  run‐
       time instrumented with these probes, which in some cases requires building from source with a USDT-specific flag, such as "--enable-dtrace"
       or "--with-dtrace". For Java, method probes are not enabled by default, and can be turned on by running the Java process with the "-XX:+Ex‐
       tendedDTraceProbes" flag. For PHP processes, the environment variable USE_ZEND_DTRACE must be set to 1.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -l {java,perl,php,python,ruby,tcl}
              The language to trace. If not provided, only syscalls are traced (when the -S option is used).

       -T TOP Print only the top methods by frequency or latency.

       -L     Collect method invocation latency (duration).

       -S     Collect Linux syscalls frequency and timing.

       -v     Print the resulting BPF program, for debugging purposes.

       -m     Print times in milliseconds (the default is microseconds).

       pid    The process id to trace.

       interval
              Print summary after this number of seconds and then exit. By default, wait for Ctrl+C to terminate.

EXAMPLES
       Trace the top 10 Ruby method calls:
              # ucalls -T 10 -l ruby 1344

       Trace Python method calls and Linux syscalls including latency in milliseconds:
              # ucalls -l python -mL 2020

       Trace only syscalls and print a summary after 10 seconds:
              # ucalls -S 788 10

OVERHEAD
       Tracing  individual method calls will produce a considerable overhead in all high-level languages. For languages with just-in-time compila‐
       tion, such as Java, the overhead can be more considerable than for interpreted languages.  On the other hand, syscall  tracing  will  typi‐
       cally be tolerable for most processes, unless they have a very unusual rate of system calls.

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
       ustat(8), argdist(8)

USER COMMANDS                                                       2018-10-09                                                           ucalls(8)
