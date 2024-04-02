syscount(8)                                                   System Manager's Manual                                                  syscount(8)

NAME
       syscount - Summarize syscall counts and latencies.

SYNOPSIS
       syscount [-h] [-p PID] [-i INTERVAL] [-d DURATION] [-T TOP] [-x] [-e ERRNO] [-L] [-m] [-P] [-l]

DESCRIPTION
       This  tool  traces  syscall entry and exit tracepoints and summarizes either the number of syscalls of each type, or the number of syscalls
       per process. It can also collect latency (invocation time) for each syscall or each process.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc. Linux 4.7+ is required to attach a BPF program to the raw_syscalls:sys_{enter,exit} tracepoints, used by this tool.

OPTIONS
       -h     Print usage message.

       -p PID Trace only this process.

       -i INTERVAL
              Print the summary at the specified interval (in seconds).

       -d DURATION
              Total duration of trace (in seconds).

       -T TOP Print only this many entries. Default: 10.

       -x     Trace only failed syscalls (i.e., the return value from the syscall was < 0).

       -e ERRNO
              Trace only syscalls that failed with that error (e.g. -e EPERM or -e 1).

       -m     Display times in milliseconds. Default: microseconds.

       -P     Summarize by process and not by syscall.

       -l     List the syscalls recognized by the tool (hard-coded list). Syscalls beyond this list will still be displayed, as  "[unknown:  nnn]"
              where nnn is the syscall number.

EXAMPLES
       Summarize all syscalls by syscall:
              # syscount

       Summarize all syscalls by process:
              # syscount -P

       Summarize only failed syscalls:
              # syscount -x

       Summarize only syscalls that failed with EPERM:
              # syscount -e EPERM

       Trace PID 181 only:
              # syscount -p 181

       Summarize syscalls counts and latencies:
              # syscount -L

FIELDS
       PID    Process ID

       COMM   Process name

       SYSCALL
              Syscall name, or "[unknown: nnn]" for syscalls that aren't recognized

       COUNT  The number of events

       TIME   The total elapsed time (in us or ms)

OVERHEAD
       For  most applications, the overhead should be manageable if they perform 1000's or even 10,000's of syscalls per second. For higher rates,
       the overhead may become considerable. For example, tracing a loop of 4 million calls to geteuid(), slows it down by 1.85x when tracing only
       syscall  counts,  and slows it down by more than 5x when tracing syscall counts and latencies. However, this represents a rate of >3.5 mil‐
       lion syscalls per second, which should not be typical.

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Sasha Goldshtein

SEE ALSO
       funccount(8), ucalls(8), argdist(8), trace(8), funclatency(8)

USER COMMANDS                                                       2017-02-15                                                         syscount(8)
