runqslower(8)                                                 System Manager's Manual                                                runqslower(8)

NAME
       runqslower - Trace long process scheduling delays.

SYNOPSIS
       runqslower [-p PID] [min_us]

DESCRIPTION
       This  measures  the  time a task spends waiting on a run queue (or equivalent scheduler data structure) for a turn on-CPU, and shows occur‐
       rences of time exceeding passed threshold. This time should be small, but a task may need to wait its turn due to CPU load. The higher  the
       CPU load, the longer a task will generally need to wait its turn.

       This tool measures two types of run queue latency:

       1. The time from a task being enqueued on a run queue to its context switch and execution. This traces ttwu_do_wakeup(), wake_up_new_task()
       -> finish_task_switch() with either raw tracepoints (if supported) or kprobes and instruments the run queue latency after a voluntary  con‐
       text switch.

       2.  The  time  from when a task was involuntary context switched and still in the runnable state, to when it next executed. This is instru‐
       mented from finish_task_switch() alone.

       The overhead of this tool may become significant for some workloads: see the OVERHEAD section.

       This works by tracing various kernel scheduler functions using dynamic tracing, and will need updating to match any changes to these  func‐
       tions.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.

       -p PID Only show this PID (filtered in kernel for efficiency).

       min_us Minimum scheduling delay in microseconds to output.

EXAMPLES
       Show scheduling delays longer than 10ms:
              # runqslower

       Show scheduling delays longer than 1ms for process with PID 123:
              # runqslower -p 123 1000

FIELDS
       TIME   Time of when scheduling event occurred.

       COMM   Process name.

       PID    Process ID.

       LAT(us)
              Scheduling latency from time when task was ready to run to the time it was assigned to a CPU to run.

OVERHEAD
       This  traces  scheduler  functions, which can become very frequent. While eBPF has very low overhead, and this tool uses in-kernel maps for
       efficiency, the frequency of scheduler events for some workloads may be high enough that the overhead of  this  tool  becomes  significant.
       Measure in a lab environment to quantify the overhead before use.

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Ivan Babrou

SEE ALSO
       runqlen(8), runqlat(8), pidstat(1)

USER COMMANDS                                                       2016-02-07                                                       runqslower(8)
