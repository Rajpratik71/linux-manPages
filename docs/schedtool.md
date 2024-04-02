SCHEDTOOL(8)                            System Manager's Manual                           SCHEDTOOL(8)

NAME
       schedtool - query and set CPU scheduling parameters

SYNOPSIS
       schedtool
              [-0|-N] [-1|-F] [-2|-R] [-3|-B] [-4|-I] [-5|-D]
              [-M policy]
              [-a affinity]
              [-p prio]
              [-n nice_level]
              [-e command [arg ...]]
              [-r]
              [-v]
              [-h]
              [LIST OF PIDs]

DESCRIPTION
       schedtool  can set all CPU scheduling parameters Linux is capable of or display information for
       given processes.

       Long-running, non-interactive tasks may benefit from SCHED_BATCH as timeslices are longer, less
       system-time is wasted by computing the next runnable process and the caches stay stable.

       Audio/video  or other near-realtime applications may run with less skipping if set to SCHED_RR.
       Use the static priority-switch -p to designate inter-process-hierarchies.

       schedtool now supports setting the CPU-affinity introduced in linux 2.5.8.

OPTIONS
       -N or -0
              set all PIDs to SCHED_NORMAL/OTHER

       -F or -1
              to SCHED_FIFO   root-credentials required

       -R or -2
              to SCHED_RR     root-credentials required

       -B or -3
              to SCHED_BATCH

       -I or -4
              to SCHED_ISO

       -D or -5
              to SCHED_IDLEPRIO

       -M policy
              for manual/raw mode; policy is the number of the scheduling policy (see above for  0-4).
              This option is mostly for kernel guys that want to test their new implementations.

       -p prio
              specify static priority required for SCHED_FIFO and SCHED_RR. Usually ranged from 1-99.

       -a affinity
              set the PID's affinity to this bitmask (hexadecimal); alternatively, a list mode is sup‐
              ported.

       -n nice_level
              set the PID's nice level; see nice(2), nice(1).

       -e command [arg ...]
              execute command with given scheduling parameters (overwrites schedtool's process image).
              See EXAMPLES.

       -r     display min and max priority for each policy.

       -v     be verbose.

       -h     help

EXAMPLES
       To query the $SHELL's policies:

           #> schedtool $$

       To query some PIDs, namely 1 2 and 3:

           #> schedtool 1 2 3

       To  execute  mplayer in SCHED_RR with priority 20. The priority arg is needed for both SCHED_RR
       and SCHED_FIFO.

           #> schedtool -R -p 20 -e mplayer -quiet some_file.avi

       To set current shell to SCHED_BATCH, which all programs the shell starts will inherit:

           #> schedtool -3 $$

       To set all processes with the name 'cpu_hog' to SCHED_BATCH:

           #> schedtool -3 `pidof cpu_hog`

       To set a process' affinity to only the first CPU (CPU0):

           #> schedtool -a 0x1 <PID>

       Using the list mode and affinty of CPU0 and CPU3:

           #> schedtool -a 0,3 <PID>

       A combination of an affinity and a policy-argument is - of course - always possible.

          #> schedtool -B -a 0x1 <PID>

AFFINITY MASK
       The affinity-argument determines on which CPUs a process is allowed to run. It  consists  of  a
       simple  bitmask represented in hexadecimal.  CPU0 is denoted by the least-significant bit, CPU1
       by the second least-significant and so on, thus giving:

           0x1 -> only run on CPU0

           0x2 -> only run on CPU1

           0x4 -> only run on CPU2

           0x8 -> only run on CPU3 ... and so on.

       Multi-target CPUs may be specified using bitwise OR of the values:

           0x7 -> run on CPUs 0, 1, 2 but NOT on 4

           0x3 -> run only on CPUs 0 and 1

       The default is to run a process on all CPUs, giving a mask of

           0xf for all 4 CPUs

           0xff for all 8 CPUs

AFFINITY MASK - LIST MODE
       Alternatively a list mode is supported where you can specify the CPUs delimited  by  ",".   The
       following runs <PID> on CPU0 and CPU1 (equivalent to 0x3):

          #> schedtool -a 0,1 <PID>

POLICY OVERVIEW
       SCHED_NORMAL / SCHED_OTHER This is the default policy and for the average program with some in‐
       teraction. Does preemption of other processes.

       SCHED_FIFO First-In, First Out Scheduler, used only for real-time  constraints.   Processes  in
       this  class  are usually not preempted by others, they need to free themselves from the CPU via
       sched_yield() and as such you need special designed applications. Use with extreme care.  ROOT-
       credentials required.

       SCHED_RR Round-Robin Scheduler, also used for real-time constraints. CPU-time is assigned in an
       round-robin fashion with a much smaller timeslice than with SCHED_NORMAL and processes in  this
       group are favoured over SCHED_NORMAL. Usable for audio/video applications near peak rate of the
       system.  ROOT-credentials required.

       SCHED_BATCH [ since 2.6.16 in mainline ] SCHED_BATCH was  designed  for  non-interactive,  CPU-
       bound applications.  It uses longer timeslices (to better exploit the cache), but can be inter‐
       rupted anytime by other processes in other classes to guaratee interaction of the system.  Pro‐
       cesses  in this class are selected last but may result in a considerable speed-up (up to 300%).
       No interactive boosting is done.

       SCHED_ISO [ patch needed ] SCHED_ISO was designed to give users a SCHED_RR-similar  class.   To
       quote  Con  Kolivas: "This is a non-expiring scheduler policy designed to guarantee a timeslice
       within a reasonable latency while preventing starvation.  Good for gaming, video at the  limits
       of hardware, video capture etc."

       SCHED_IDLEPRIO  [  patch  needed ] SCHED_IDLEPRIO is similar to SCHED_BATCH, but was explicitly
       designed to consume only the time the CPU is idle. No interactive boosting  is  done.   If  you
       used SCHED_BATCH in the -ck kernels this is what you want since 2.6.16

HINTS
       PID 0 means "current process", in our case, schedtool. May occur when using the -e switch.

       Be  careful  with  SCHED_FIFO!  You  may  lock out other processes from the CPU, including your
       shell.

       For SCHED_BATCH you certainly need the a recent 2.6 kernel.

       A short overview is given in SCHED_DESIGN and the README contains thourough discussion. The IN‐
       STALL file also lists all prerequisites and where you can get patches.

       Affinity 0x0 should never be used.

SEE ALSO
       sched_setscheduler(2), sched_setaffinity(2), nice(2), nice(1), renice(3).

BUGS
       You need some knowledge about the kernel and scheduling. The author is a grumpy little elitist.

AUTHOR
       Freek

       Please    contact    me    via    freshmeat.net's   "contact   author"-feature   (http://fresh‐
       meat.net/projects/schedtool).

                                            1 November 2006                               SCHEDTOOL(8)
