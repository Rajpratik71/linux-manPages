CGMANAGER(8)                                                                         System Administration Utilities                                                                         CGMANAGER(8)

NAME
       cgmanager - a daemon to manage cgroups

SYNOPSIS
       cgmanager [OPTION]...

DESCRIPTION
       cgmanager is a daemon to manage cgroups.  Programs and users can make D-Bus requests to administer cgroups over which they have privilege.  To ensure that users may not exceed their privilege in
       manipulating cgroups, the cgroup manager accepts regular D-Bus requests only from tasks within its own process-id and user namespaces.  For tasks in private namespaces (such as containers), SCM-
       enhanced  D-Bus  calls are available.  Using these manually is not recommended.  Rather, each container is advised to run a cgproxy, which will forward plain D-Bus requests as SCM-enhanced D-Bus
       requests to the host cgmanager.

       Control group manager

OPTIONS
       --max-depth
              Maximum cgroup depth

       -M, --skip=subsystems to mount
              Subsystems to not mount

       -m, --mount=subsystems to mount
              Extra subsystems to mount

       --daemon
              Detach and run in the background

       --sigstop
              Raise SIGSTOP when ready

       -q, --quiet
              reduce output to errors only

       -v, --verbose
              increase output to include informational messages

       --help display this help and exit

       --version
              output version information and exit

       The cgroup manager daemon

EXAMPLES
       To create a new memory cgroup called 'compute', you can use:
       dbus-send --print-reply --address=unix:path=/sys/fs/cgroup/cgmanager/sock --type=method_call /org/linuxcontainers/cgmanager org.linuxcontainers.cgmanager0_0.Create  string:'memory'  string:"com‐
       pute" > /dev/null 2>&1
       To set a limit of 100000,
       dbus-send --print-reply --address=unix:path=/sys/fs/cgroup/cgmanager/sock --type=method_call /org/linuxcontainers/cgmanager org.linuxcontainers.cgmanager0_0.SetValue string:'memory' string:"com‐
       pute" string:memory.limit_in_bytes int32:100000 > /dev/null 2>&1

REPORTING BUGS
       Report bugs to <cgmanager-devel@lists.linuxcontainers.org>

       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       cgproxy(8), credentials(7), dbus-send(1)

cgmanager 0.39                                                                                 January 2016                                                                                  CGMANAGER(8)
