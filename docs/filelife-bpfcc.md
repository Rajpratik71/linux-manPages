filelife(8)                                                   System Manager's Manual                                                  filelife(8)

NAME
       filelife - Trace the lifespan of short-lived files. Uses Linux eBPF/bcc.

SYNOPSIS
       filelife [-h] [-p PID]

DESCRIPTION
       This  traces the creation and deletion of files, providing information on who deleted the file, the file age, and the file name. The intent
       is to provide information on short-lived files, for debugging or performance analysis.

       This works by tracing the kernel vfs_create() and vfs_delete() functions (and maybe more, see the source) using dynamic tracing,  and  will
       need updating to match any changes to these functions.

       This makes use of a Linux 4.5 feature (bpf_perf_event_output()); for kernels older than 4.5, see the version under tools/old, which uses an
       older mechanism.

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.

       -p PID Trace this process ID only (filtered in-kernel).

EXAMPLES
       Trace all short-lived files, and print details:
              # filelife

       Trace all short-lived files created AND deleted by PID 181:
              # filelife -p 181

FIELDS
       TIME   Time of the deletion.

       PID    Process ID that deleted the file.

       COMM   Process name for the PID.

       AGE(s) Age of the file, from creation to deletion, in seconds.

       FILE   Filename.

OVERHEAD
       This traces the kernel VFS file create and delete functions and prints output for each delete. As the rate of this is generally expected to
       be low (< 1000/s), the overhead is also expected to be negligible.  This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Brendan Gregg

SEE ALSO
       opensnoop(1)

USER COMMANDS                                                       2016-02-08                                                         filelife(8)
