ABRT-ACTION-ANALYZ(1)                                                                            ABRT Manual                                                                            ABRT-ACTION-ANALYZ(1)



NAME
       abrt-action-analyze-vmcore - Extracts the oops message from the kernel core and install the kernel debuginfo if needed

SYNOPSIS
       abrt-action-analyze-vmcore [-v] [-d PROBLEM_DIR] [--tmpdir=TMPDIR] [--cache=DIR1[:DIR2]]

DESCRIPTION
       The tool reads the file named vmcore from a problem data directory, processes it and the oops message from it. Then it saves this data as new element backtrace.

   Integration with ABRT events
       abrt-action-analyze-vmcore can be used as an analyzer for critical kernel crashes which dump core.

       Example usage in report_event.conf:

           EVENT=analyze_VMcore analyzer=vmcore
                   abrt-action-analyze-vmcore

OPTIONS
       -d DIR
           Path to a problem directory. Current working directory is used when this option is not provided.

       -v
           Be more verbose. Can be given multiple times.

       --core=VMCORE
           Path to vmcore to analyze (Default: ./vmcore)

AUTHORS
       ·   ABRT team



abrt 2.1.11                                                                                       08/12/2019                                                                            ABRT-ACTION-ANALYZ(1)
