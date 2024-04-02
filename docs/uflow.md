uflow(8)                                                      System Manager's Manual                                                     uflow(8)

NAME
       uflow, javaflow, perlflow, phpflow, pythonflow, rubyflow, tclflow - Print a flow graph of method calls in high-level languages.

SYNOPSIS
       javaflow [-h] [-M METHOD] [-C CLAZZ] [-v] pid
       perlflow [-h] [-M METHOD] [-C CLAZZ] [-v] pid
       phpflow [-h] [-M METHOD] [-C CLAZZ] [-v] pid
       pythonflow [-h] [-M METHOD] [-C CLAZZ] [-v] pid
       rubyflow [-h] [-M METHOD] [-C CLAZZ] [-v] pid
       tclflow [-h] [-M METHOD] [-C CLAZZ] [-v] pid
       uflow [-h] [-M METHOD] [-C CLAZZ] [-v] [-l {java,perl,php,python,ruby,tcl}] pid

DESCRIPTION
       uflow  traces  method calls and prints them in a flow graph that can facilitate debugging and diagnostics by following the program's execu‐
       tion (method flow).

       This tool relies on USDT probes embedded in many high-level languages, such as Java, Perl, PHP, Python, Ruby, and Tcl. It requires  a  run‐
       time instrumented with these probes, which in some cases requires building from source with a USDT-specific flag, such as "--enable-dtrace"
       or "--with-dtrace". For Java processes, the startup flag "-XX:+ExtendedDTraceProbes" is required. For PHP processes, the environment  vari‐
       able USE_ZEND_DTRACE must be set to 1.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -M METHOD
              Print only method calls where the method name begins with this string.

       -C CLAZZ
              Print  only  method  calls  where the class name begins with this string. The class name interpretation strongly depends on the lan‐
              guage. For example, in Java use "package/subpackage/ClassName" to refer to classes.

       -v     Print the resulting BPF program, for debugging purposes.

       {java,perl,php,python,ruby,tcl}
              The language to trace.

       pid    The process id to trace.

EXAMPLES
       Follow method flow in a Ruby process:
              # uflow ruby 148

       Follow method flow in a Java process where the class name is java.lang.Thread:
              # uflow -C java/lang/Thread java 1802

FIELDS
       CPU    The CPU number on which the method was invoked. This is useful to easily see where the output skips to a different CPU.

       PID    The process id.

       TID    The thread id.

       TIME   The duration of the method call.

       METHOD The method name.

OVERHEAD
       This tool has extremely high overhead because it prints every method call. For some scenarios, you might see lost samples in the output  as
       the  tool is unable to keep up with the rate of data coming from the kernel. Filtering by class or method prefix can help reduce the amount
       of data printed, but there is still a very high overhead in the collection mechanism. Do not use for performance- sensitive production sce‐
       narios, and always test first.

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
       trace(8), ustat(8)

USER COMMANDS                                                       2018-10-09                                                            uflow(8)
