HWLOC-PS(1)                                                            hwloc                                                           HWLOC-PS(1)

NAME
       hwloc-ps - List currently-running processes or threads that are bound

SYNOPSIS
       hwloc-ps [options]

OPTIONS
       -a        list all processes, even those that are not bound to any specific part of the machine.

       -p --physical
                 report OS/physical indexes instead of logical indexes

       -l --logical
                 report logical indexes instead of physical/OS indexes (default)

       -c --cpuset
                 show process bindings as cpusets instead of objects.

       -t --threads
                 show threads inside processes.  If -a is given as well, list all threads within each process.  Otherwise, show all threads inside
                 each process where at least one thread is bound.

       -e --get-last-cpu-location
                 Report  the last processors where the process/thread ran.  Note that the result may already be outdated when reported  since  the
                 operating system may move the tasks to other processors at any time according to the binding.

       --whole-system
                 Do not consider administration limitations.

       --pid-cmd <cmd>
                 Append  the  output  of  the  given command to each PID line.  For each displayed process ID, execute the command <cmd> <pid> and
                 append the first line of its output to the regular hwloc-ps line.

DESCRIPTION
       By default, hwloc-ps lists only those currently-running processes that are bound. If -t is given, processes that are not bound but  contain
       at least one bound thread are also displayed, as well as all their threads.

       hwloc-ps displays process identifier, command-line and binding.  The binding may be reported as objects or cpusets.

       By  default,  process  bindings  are restricted to the currently available topology. If some processes are bound to processors that are not
       available to the current process, they are ignored unless --whole-system is given.

       The output is a plain list. If you wish to annotate the hierarchical topology with processes so as to see how they are  actual  distributed
       on the machine, you might want to use lstopo --ps instead (which also only shows processes that are bound).

       The -a switch can be used to show all processes, if desired.

EXAMPLES
       If a process is bound, it appears in the default output:

           $ utils/hwloc-ps
           4759  Core:0         myprogram

       If a process is not bound but 3 of his 4 threads are bound, it only appears in the thread-aware output:

           $ utils/hwloc-ps

           $ utils/hwloc-ps -t
           4759  Machine:0      myprogram
            4759 Machine:0
            4761 PU:0
            4762 PU:2
            4765 PU:1

       To display the binding of already running MPI processes (launched by Open MPI) and append their MPI rank (in MPI_COMM_WORLD) to each line:

           $ utils/hwloc-ps --pid-cmd myscript
           29093 L1dCache:0     myprogram OMPI_COMM_WORLD_RANK=0
           29094 L1dCache:2     myprogram OMPI_COMM_WORLD_RANK=1
           29095 L1dCache:1     myprogram OMPI_COMM_WORLD_RANK=2
           29096 L1dCache:3     myprogram OMPI_COMM_WORLD_RANK=3

       where myscript is a bash script doing:

           #!/bin/sh
           cat /proc/$1/environ 2>/dev/null | xargs --null --max-args=1 echo | grep OMPI_COMM_WORLD_RANK

SEE ALSO
       hwloc(7), lstopo(1), hwloc-calc(1), hwloc-distrib(1)

1.11.2                                                             Dec 17, 2015                                                        HWLOC-PS(1)
