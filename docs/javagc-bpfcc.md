ugc(8)                                                        System Manager's Manual                                                       ugc(8)

NAME
       ugc, javagc, nodegc, pythongc, rubygc - Trace garbage collection events in high-level languages.

SYNOPSIS
       javagc [-h] [-v] [-m] [-M MINIMUM] [-F FILTER] pid
       nodegc [-h] [-v] [-m] [-M MINIMUM] [-F FILTER] pid
       pythongc [-h] [-v] [-m] [-M MINIMUM] [-F FILTER] pid
       rubygc [-h] [-v] [-m] [-M MINIMUM] [-F FILTER] pid
       ugc [-h] [-v] [-m] [-M MINIMUM] [-F FILTER] [-l {java,node,python,ruby}] pid

DESCRIPTION
       This  traces garbage collection events as they occur, including their duration and any additional information (such as generation collected
       or type of GC) provided by the respective language's runtime.

       This tool relies on USDT probes embedded in many high-level languages, such as Java, Node, Python, and Ruby. It requires a runtime  instru‐
       mented  with  these  probes,  which  in  some  cases  requires building from source with a USDT-specific flag, such as "--enable-dtrace" or
       "--with-dtrace".

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -v     Print the resulting BPF program, for debugging purposes.

       -m     Print times in milliseconds. The default is microseconds.

       -M MINIMUM
              Display only collections that are longer than this threshold. The value is given in milliseconds. The default is to display all col‐
              lections.

       -F FILTER
              Display  only  collections whose textual description matches (contains) this string. The default is to display all collections. Note
              that the filtering here is performed in user-space, and not as part of the BPF program. This means that if  you  have  thousands  of
              collection  events, specifying this filter will not reduce the amount of data that has to be transferred from the BPF program to the
              user-space script.

       {java,node,python,ruby}
              The language to trace.

       pid    The process id to trace.

EXAMPLES
       Trace garbage collections in a specific Node process:
              # ugc node 148

       Trace garbage collections in a specific Java process, and print GC times in
              milliseconds: # ugc -m java 6004

       Trace garbage collections in a specific Java process, and display them only if
              they are longer than 10ms and have the string "Tenured" in their detailed description: # ugc -M 10 -F Tenured java 6004

FIELDS
       START  The start time of the GC, in seconds from the beginning of the trace.

       TIME   The duration of the garbage collection event.

       DESCRIPTION
              The runtime-provided description of this garbage collection event.

OVERHEAD
       Garbage collection events, even if frequent, should not produce a considerable overhead when traced because they are still not very common.
       Even hundreds of GCs per second (which is a very high rate) will still produce a fairly negligible overhead.

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
       trace(8), ustat(8), uobjnew(8)

USER COMMANDS                                                       2018-10-09                                                              ugc(8)
