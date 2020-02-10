CGPROXY(8)                                                                           System Administration Utilities                                                                           CGPROXY(8)

NAME
       cgproxy - a proxy for cgmanager

SYNOPSIS
       cgproxy [OPTION]...

DESCRIPTION
       cgproxy  is the D-Bus proxy for cgmanager.  Since a process in a non-initial process-id or user namespace will refer to tasks, user-ids or group-ids which are wrong in the initial namespace, the
       proxy will send these as SCM credentials to the cgmanager, relying on the kernel to translate the identifiers.  In this way, programs and users in a  container  can  make  cgroup  administration
       requests using the same simply D-Bus calls over a proxy as they would on the base host to the cgmanager directly.

       Control group proxy

OPTIONS
       --daemon
              Detach and run in the background

       --sigstop
              Raise SIGSTOP when ready

       --check-master
              Check whether cgmanager is running

       -q, --quiet
              reduce output to errors only

       -v, --verbose
              increase output to include informational messages

       --help display this help and exit

       --version
              output version information and exit

       The cgroup manager proxy

REPORTING BUGS
       Report bugs to <cgmanager-devel@lists.linuxcontainers.org>

       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       cgmanager(8)

cgproxy (cgmanager 0.39)                                                                       January 2016                                                                                    CGPROXY(8)
