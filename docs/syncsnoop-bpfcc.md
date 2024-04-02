syncsnoop(8)                                                  System Manager's Manual                                                 syncsnoop(8)

NAME
       syncsnoop - Trace sync() syscall. Uses Linux eBPF/bcc.

SYNOPSIS
       syncsnoop

DESCRIPTION
       syncsnoop  traces  calls  to sync(), which flushes file system buffers to storage devices. These calls can cause performance perturbations,
       and it can be useful to know if they are happening and how frequently.

       This works by tracing the kernel sys_sync() function using dynamic tracing, and will need updating to match any changes to this function.

       This makes use of a Linux 4.5 feature (bpf_perf_event_output()); for kernels older than 4.5, see the version under tools/old, which uses an
       older mechanism.

       This program is also a basic example of eBPF/bcc.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

EXAMPLES
       Trace calls to sync():
              # syncsnoop

FIELDS
       TIME(s)
              Time of the call, in seconds.

       CALL   Call traced.

OVERHEAD
       This  traces the kernel sync function and prints output for each event. As the rate of this is generally expected to be low (<< 100/s), the
       overhead is also expected to be negligible.

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
       iostat(1)

USER COMMANDS                                                       2015-08-18                                                        syncsnoop(8)
