ps_mem(1)                                                                                                                                                                                           ps_mem(1)



NAME
       ps_mem - Memory profiling tool

SYNOPSIS
       ps_mem [-h|--help] [-s|--show-cmdline] [-p PID] [-w N]

DESCRIPTION
       The ps_mem tool can determine how much RAM is used per program (not per process).

       In detail it reports:

              sum(private RAM for program processes) + sum(Shared RAM for program processes).

       The shared RAM is problematic to calculate, and the tool automatically selects the most accurate method available for the running kernel.

OPTIONS
       -h --help
              Show this help

       -s --show-cmdline
              Show complete program path with options

       -p <pid>[,pid2,...pidN]
              Only show memory usage PIDs in the specified list

       -w N   Measure and show process memory every N seconds

AUTHOR
       Pádraig Brady <P@draigBrady.com>



                                                                                                 31 July 2013                                                                                       ps_mem(1)
