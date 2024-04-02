oomkill(8)                                                    System Manager's Manual                                                   oomkill(8)

NAME
       oomkill.bt - Trace OOM killer. Uses bpftrace/eBPF.

SYNOPSIS
       oomkill.bt

DESCRIPTION
       This traces the kernel out-of-memory killer, and prints basic details, including the system load averages at the time of the OOM kill. This
       can provide more context on the system state at the time: was it getting busier or steady, based on the load averages? This tool  may  also
       be useful to customize for investigations; for example, by adding other task_struct details at the time of OOM, or by adding other commands
       to run at the shell.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bpftrace.

EXAMPLES
       Trace OOM kill events:
              # oomkill.bt

FIELDS
       Triggered by ...
              The process ID and process name of the task that was running when another task was OOM killed.

       OOM kill of ...
              The process ID and name of the target process that was OOM killed.

       loadavg
              Contents of /proc/loadavg. The first three numbers are 1, 5, and 15 minute load averages (where  the  average  is  an  exponentially
              damped moving sum, and those numbers are constants in the equation); then there is the number of running tasks, a slash, and the to‐
              tal number of tasks; and then the last number is the last PID to be created.

OVERHEAD
       Negligible.

SOURCE
       This is from bpftrace.

              https://github.com/iovisor/bpftrace

       Also look in the bpftrace distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

       This is a bpftrace version of the bcc tool of the same name. The bcc tool may provide more options and customizations.

              https://github.com/iovisor/bcc

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Brendan Gregg

SEE ALSO
       dmesg(1)

USER COMMANDS                                                       2018-09-07                                                          oomkill(8)
