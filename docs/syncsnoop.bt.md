syncsnoop(8)                                                  System Manager's Manual                                                 syncsnoop(8)

NAME
       syncsnoop.bt - Trace the sync() variety of syscalls. Uses bpftrace/eBPF.

SYNOPSIS
       syncsnoop.bt

DESCRIPTION
       syncsnoop  traces calls to sync() syscalls (sync(), fsync(), msync(), etc), which flushes file system cache and buffers to storage devices.
       These calls can cause performance perturbations, and it can be useful to know if they are happening, when they happen, and how frequently.

       This works by tracing the sync() variety of syscalls via tracepoints.

       This program is also a basic example of eBPF/bcc.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bpftrace.

EXAMPLES
       Trace calls to sync() syscalls:
              # syncsnoop.bt

FIELDS
       TIME   A timestamp on the output, in "HH:MM:SS" format.

       PID    The process ID that was on-CPU during the event.

       COMM   The process name that was on-CPU during the event.

       EVENT  The tracepoint name for the sync event.

OVERHEAD
       This traces sync syscalls and prints output for each event. As the rate of this is generally expected to be low (<< 100/s), the overhead is
       also expected to be negligible.

SOURCE
       This is from bpftrace.

              https://github.com/iovisor/bpftrace

       Also look in the bpftrace distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

       This is a bpftrace version of the bcc tool of the same name.

              https://github.com/iovisor/bcc

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Brendan Gregg

SEE ALSO
       iostat(1)

USER COMMANDS                                                       2018-09-06                                                        syncsnoop(8)
