syscount(8)                                                   System Manager's Manual                                                  syscount(8)

NAME
       syscount.bt - Count system calls. Uses bpftrace/eBPF.

SYNOPSIS
       syscount.bt

DESCRIPTION
       This counts system calls (syscalls), printing a summary of the top ten syscall IDs, and the top ten process names making syscalls. This can
       be helpful for characterizing the kernel and resource workload, and finding applications who are using syscalls inefficiently.

       This works by using the tracepoint:raw_syscalls:sys_enter tracepoint.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bpftrace.

EXAMPLES
       Count all VFS calls until Ctrl-C is hit:
              # syscount.bt

OUTPUT
       Top 10 syscalls IDs:
              This shows the syscall ID number (in @syscall[]) followed by a count for this syscall during tracing. To see the  syscall  name  for
              that ID, you can use "ausyscall --dump", or the bcc version of this tool that does translations.

       Top 10 processes:
              This shows the process name (in @process[]) followed by a count of syscalls during tracing.

OVERHEAD
       For  most applications, the overhead should be manageable if they perform 1000's or even 10,000's of syscalls per second. For higher rates,
       the overhead may become considerable. For example, tracing a microbenchmark loop of 4 million calls to geteuid(), slows it  down  by  2.4x.
       However, this represents tracing a workload that has a syscall rate of over 4 million syscalls per second per CPU, which should not be typ‐
       ical (in one large cloud production environment, rates of between 10k and 50k are typical, where the application overhead is expected to be
       closer to 1%).

       For  comparison,  strace(1) in its current ptrace-based implementation (which it has had for decades) runs the same geteuid() workload 102x
       slower (that's one hundred and two times slower).

SOURCE
       This is from bpftrace.

              https://github.com/iovisor/bpftrace

       Also look in the bpftrace distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

       This is a bpftrace version of the bcc tool of the same name.  The bcc version provides different command line options, and  translates  the
       syscall IDs to their syscall names.

              https://github.com/iovisor/bcc

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Brendan Gregg

SEE ALSO
       strace(1)

USER COMMANDS                                                       2018-09-06                                                         syscount(8)
