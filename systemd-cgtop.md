SYSTEMD-CGTOP(1)                                                                                systemd-cgtop                                                                                SYSTEMD-CGTOP(1)



NAME
       systemd-cgtop - Show top control groups by their resource usage

SYNOPSIS
       systemd-cgtop [OPTIONS...]

DESCRIPTION
       systemd-cgtop shows the top control groups of the local Linux control group hierarchy, ordered by their CPU, memory, or disk I/O load. The display is refreshed in regular intervals (by default every
       1s), similar in style to top(1). If systemd-cgtop is not connected to a tty, only one iteration is performed and no columns headers are printed. This mode is suitable for scripting.

       Resource usage is only accounted for control groups in the relevant hierarchy, i.e. CPU usage is only accounted for control groups in the "cpuacct" hierarchy, memory usage only for those in "memory"
       and disk I/O usage for those in "blkio". If resource monitoring for these resources is required, it is recommended to add the CPUAccounting=1, MemoryAccounting=1 and BlockIOAccounting=1 settings in
       the unit files in question. See systemd.resource-control(5) for details.

       To emphasize this: unless "CPUAccounting=1", "MemoryAccounting=1" and "BlockIOAccounting=1" are enabled for the services in question, no resource accounting will be available for system services and
       the data shown by systemd-cgtop will be incomplete.

OPTIONS
       The following options are understood:

       -p
           Order by control group path name.

       -t
           Order by number of tasks in control group (i.e. threads and processes).

       -c
           Order by CPU load.

       -m
           Order by memory usage.

       -i
           Order by disk I/O load.

       -b, --batch
           Run in "batch" mode: do not accept input and run until the iteration limit set with --iterations is exhausted or until killed. This mode could be useful for sending output from systemd-cgtop to
           other programs or to a file.

       -n, --iterations=
           Perform only this many iterations.

       -d, --delay=
           Specify refresh delay in seconds (or if one of "ms", "us", "min" is specified as unit in this time unit).

       --depth=
           Maximum control group tree traversal depth. Specifies how deep systemd-cgtop shall traverse the control group hierarchies. If 0 is specified, only the root group is monitored. For 1, only the
           first level of control groups is monitored, and so on. Defaults to 3.

       -h, --help
           Print a short help text and exit.

       --version
           Print a short version string and exit.

KEYS
       systemd-cgtop is an interactive tool and may be controlled via user input using the following keys:

       h
           Shows a short help text.

       SPACE
           Immediately refresh output.

       q
           Terminate the program.

       p, t, c, m, i
           Sort the control groups by path, number of tasks, CPU load, memory usage, or IO load, respectively.

       %
           Toggle between showing CPU time as time or percentage.

       +, -
           Increase or decrease refresh delay, respectively.

EXIT STATUS
       On success, 0 is returned, a non-zero failure code otherwise.

SEE ALSO
       systemd(1), systemctl(1), systemd-cgls(1), systemd.resource-control(5), top(1)



systemd 219                                                                                                                                                                                  SYSTEMD-CGTOP(1)
