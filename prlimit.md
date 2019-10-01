
PRLIMIT(1)                                                                                      User Commands                                                                                      PRLIMIT(1)



NAME
       prlimit - get and set a process resource limits.

SYNOPSIS
       prlimit [options] [--{resource_name}[=limits] [--pid PID]

       prlimit [options] [--{resource_name}[=limits]] command [argument...]


DESCRIPTION
       Given a process id and one or more resources, prlimit tries to retrieve and/or modify the limits.

       When command is given, prlimit will run this command with the given arguments.

       The  limits format is composed by a soft and a hard (ceiling) value, separated by a semicolon (:), in order to modify the existing value(s). If no limits are used, prlimit will only display the cur‐
       rent values. If one of the values is not used, then the existing one will be used. To specify the unlimited or infinity limit (RLIM_INFINITY), the -1 or 'unlimited' string can be passed.

       Because of the nature of limits, the soft value must be lower or equal to the high limit. To see all the available resource limits, refer to the RESOURCE OPTIONS section.


       <soft>:<hard>  Specify both limits

       <soft>:        Specify only the soft limit

       :<hard>        Specify only the hard limit

       <value>        Specify both soft and hard limits to the same value


GENERAL OPTIONS
       -p, --pid
              Specify the process id, if none is given, it will use the running process.

       -o, --output list
              Define the output columns to use. If no output arrangement is specified, then a default set is used.  Use --help to  get list of all supported columns.

       -V, --version
              Output version information and exit.

       --verbose
              Verbose mode.

       --raw  Use the raw output format.

       --noheadings
              Do not print a header line.

       -h, --help
              Print a help text and exit.


RESOURCE OPTIONS
       -c, --core[=limits]
              Maximum size of a core file.

       -d, --data[=limits]
              Maximum data size.

       -e, --nice[=limits]
              Maximum nice priority allowed to raise.

       -f, --fsize[=limits]
              Maximum file size.

       -i, --sigpending[=limits]
              Maximum number of pending signals.

       -l, --memlock[=limits]
              Maximum locked-in-memory address space.

       -m, --rss[=limits]
              Maximum Resident Set Size (RSS).

       -n, --nofile[=limits]
              Maximum number of open files.

       -q, --msgqueue[=limits]
              Maximum number of bytes in POSIX message queues.

       -r, --rtprio[=limits]
              Maximum real-time priority.

       -s, --stack[=limits]
              Maximum size of the stack.

       -t, --cpu[=limits]
              CPU time, in seconds.

       -u, --nproc[=limits]
              Maximum number of processes.

       -v, --as[=limits]
              Address space limit.

       -x, --locks[=limits]
              Maximum number of file locks held.

       -y, --rttime[=limits]
              Timeout for real-time tasks.


EXAMPLES
       prlimit --pid 13134
              Display limit values for all current resources.

       prlimit --pid 13134 --rss --nofile=1024:4095
              Display the limits of the RSS and set the soft and hard limits for the number of open files to 1024 and 4095, respectively.

       prlimit --pid 13134 --nproc=512:
              Modify only the soft limit for the number of processes.

       prlimit --pid $$ --nproc=unlimited
              Set the number of processes for both soft and ceiling values to unlimited.

       prlimit --cpu=10 sort -u hugefile
              Set the soft and hard CPU time limit and run 'sort'.


SEE ALSO
       prlimit(2), ulimit(1)


NOTES
       The prlimit system call is supported since Linux 2.6.36, previous kernels will
       break this program.


AUTHORS
       Davidlohr Bueso <dave@gnu.org> - In memory of Dennis M. Ritchie.

AVAILABILITY
       The prlimit command is part of the util-linux package and is available from ftp://ftp.kernel.org/pub/linux/utils/util-linux/.



util-linux                                                                                       October 2011                                                                                      PRLIMIT(1)
