LXCFS(1)                      User Commands                     LXCFS(1)

NAME
       lxcfs - Set up cgroup fs for containers

DESCRIPTION
       lxcfs implements a FUSE fs which allows containers to have virtu‐
       alized cgroup filesystems and virtualized views of  /proc/cpuinfo
       and /proc/meminfo.

       Usage:

       lxcfs [-f|-d] [-p pidfile] mountpoint

       -f running foreground by default; -d enable debug output

              Default pidfile is /run/lxcfs.pid

       lxcfs -h

SEE ALSO
       cgmanager(1), lxc(1)

lxcfs 2.0.8                   November 2017                     LXCFS(1)
