oomkill(8)                                                    System Manager's Manual                                                   oomkill(8)

NAME
       oomkill - Trace oom_kill_process(). Uses Linux eBPF/bcc.

SYNOPSIS
       oomkill

DESCRIPTION
       This traces the kernel out-of-memory killer, and prints basic details, including the system load averages at the time of the OOM kill. This
       can provide more context on the system state at the time: was it getting busier or steady, based on the load averages? This tool  may  also
       be useful to customize for investigations; for example, by adding other task_struct details at the time of OOM.

       This program is also a basic example of eBPF/bcc.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

EXAMPLES
       Trace OOM kill events:
              # oomkill

FIELDS
       Triggered by ...
              The process ID and process name of the task that was running when another task was OOM killed.

       OOM kill of ...
              The process ID and name of the target process that was OOM killed.

       loadavg
              Contents  of  /proc/loadavg.  The  first  three numbers are 1, 5, and 15 minute load averages (where the average is an exponentially
              damped moving sum, and those numbers are constants in the equation); then there is the number of running tasks, a slash, and the to‐
              tal number of tasks; and then the last number is the last PID to be created.

OVERHEAD
       Negligible.

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
       memleak(8)

USER COMMANDS                                                       2016-02-09                                                          oomkill(8)
