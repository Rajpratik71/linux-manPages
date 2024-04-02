mountsnoop(8)                                                 System Manager's Manual                                                mountsnoop(8)

NAME
       mountsnoop - Trace mount() and umount() syscalls. Uses Linux eBPF/bcc.

SYNOPSIS
       mountsnoop

DESCRIPTION
       mountsnoop  traces  the  mount() and umount() syscalls, showing which processes are mounting and unmounting filesystems in what mount name‐
       spaces. This can be useful for troubleshooting system and container setup.

       This works by tracing the kernel sys_mount() and sys_umount() functions using dynamic tracing, and will need updating to match any  changes
       to this function.

       This makes use of a Linux 4.4 feature (bpf_perf_event_output()).

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

FIELDS
       COMM   Process name

       PID    Process ID

       TID    Thread ID

       MNT_NS Mount namespace inode number

       CALL   System call, arguments, and return value

OVERHEAD
       This  traces the kernel mount and umount functions and prints output for each event. As the rate of these calls is generally expected to be
       very low, the overhead is also expected to be negligible. If your system calls mount() and umount() at a high rate, then  test  and  under‐
       stand overhead before use.

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Omar Sandoval

SEE ALSO
       mount(2) umount(2)

USER COMMANDS                                                       2016-10-14                                                       mountsnoop(8)
