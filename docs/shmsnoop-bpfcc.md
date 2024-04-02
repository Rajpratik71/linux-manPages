shmsnoop(8)                                                   System Manager's Manual                                                  shmsnoop(8)

NAME
       shmsnoop - Trace System V shared memory syscalls. Uses Linux eBPF/bcc.

SYNOPSIS
       shmsnoop [-h] [-T] [-p] [-t] [-d DURATION] [-n NAME]

DESCRIPTION
       shmsnoop traces System V shared memory syscalls: shmget, shmat, shmdt, shmctl

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.

       -T     Include a timestamp column.

       -p PID Trace this process ID only (filtered in-kernel).

       -t TID Trace this thread ID only (filtered in-kernel).

       -d DURATION
              Total duration of trace in seconds.

       -n NAME
              Only print command lines matching this command name (regex)

EXAMPLES
       Trace all shm* syscalls:
              # shmsnoop

       Trace all shm* syscalls, and include timestamps:
              # shmsnoop -T

       Only trace shm* syscalls where the process contains "server":
              # shmsnoop -n server

FIELDS
       TIME(s)
              Time of shm syscall return, in seconds.

       PID    Process ID

       COMM   Process/command name.

       RET    Return value of shm syscall.

       ARGS   "arg: value" couples that represent given syscall arguments as described in their manpage

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Jiri Olsa

SEE ALSO
       opensnoop(1)

USER COMMANDS                                                       2018-09-24                                                         shmsnoop(8)
