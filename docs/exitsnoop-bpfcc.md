exitsnoop(8)                                                  System Manager's Manual                                                 exitsnoop(8)

NAME
       exitsnoop - Trace all process termination (exit, fatal signal). Uses Linux eBPF/bcc.

SYNOPSIS
       exitsnoop [-h] [-t] [--utc] [-x] [-p PID] [--label LABEL]

DESCRIPTION
       exitsnoop traces process termination, showing the command name and reason for termination, either an exit or a fatal signal.

       It catches processes of all users, processes in containers, as well as processes that become zombie.

       This  works  by tracing the kernel sched_process_exit() function using dynamic tracing, and will need updating to match any changes to this
       function.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.

       -t     Include a timestamp column.

       --utc  Include a timestamp column, use UTC timezone.

       -x     Exclude successful exits, exit( 0 )

       -p PID Trace this process ID only (filtered in-kernel).

       --label LABEL
              Label each line with LABEL (default 'exit') in first column (2nd if timestamp is present).

EXAMPLES
       Trace all process termination
              # exitsnoop

       Trace all process termination, and include timestamps:
              # exitsnoop -t

       Exclude successful exits, only include non-zero exit codes and fatal signals:
              # exitsnoop -x

       Trace PID 181 only:
              # exitsnoop -p 181

       Label each output line with 'EXIT':
              # exitsnoop --label EXIT

FIELDS
       TIME-TZ
              Time of process termination HH:MM:SS.sss with milliseconds, where TZ is the local time zone, 'UTC' with --utc option.

       LABEL  The optional label if --label option is used.  This is useful with the -t option for timestamps when the output of  several  tracing
              tools is sorted into one combined output.

       PCOMM  Process/command name.

       PID    Process ID

       PPID   The process ID of the process that will be notified of PID termination.

       TID    Thread ID.

       EXIT_CODE
              The exit code for exit() or the signal number for a fatal signal.

OVERHEAD
       This traces the kernel sched_process_exit() function and prints output for each event.  As the rate of this is generally expected to be low
       (< 1000/s), the overhead is also expected to be negligible. If you have an application that has a high rate of  process  termination,  then
       test and understand overhead before use.

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Arturo Martin-de-Nicolas

SEE ALSO
       execsnoop(8)

USER COMMANDS                                                       2019-05-28                                                        exitsnoop(8)
