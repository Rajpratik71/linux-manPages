PERF(1)                                                                          General Commands Manual                                                                          PERF(1)

NAME
       perf - performance analysis tools for Linux

SYNOPSIS
       perf [--version] [--help] COMMAND [ARGS]

DESCRIPTION
       Performance  counters for Linux are are a new kernel-based subsystem that provide a framework for all things performance analysis.  It covers hardware level (CPU/PMU, Performance
       Monitoring Unit) features and software features (software counters, tracepoints) as well.

       Each version of the perf tools may depend on new kernel features, so you must install a different version for each kernel version.  The perf command will  automatically  run  the
       correct version for the running kernel version.

SEE ALSO
       perf_version(1)

                                                                                       4 July 2010                                                                                PERF(1)
