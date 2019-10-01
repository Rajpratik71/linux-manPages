numad(8)                                                                                        Administration                                                                                       numad(8)



NAME
       numad - A user-level daemon that provides placement advice and process management for efficient use of CPUs and memory on systems with NUMA topology.

SYNOPSIS
       numad [-dhvV]

       numad  [-C 0|1]

       numad  [-H THP_hugepage_scan_sleep_ms]

       numad  [-i [min_interval:]max_interval]

       numad  [-K 0|1]

       numad  [-l log_level]

       numad  [-m target_memory_locality]

       numad  [-p PID]

       numad  [-r PID]

       numad  [-R reserved-CPU-list]

       numad  [-S 0|1]

       numad  [-t logical_CPU_percent]

       numad  [-u target_utilization]

       numad  [-w NCPUS[:MB]]

       numad  [-x PID]

DESCRIPTION
       Numad is a system daemon that monitors NUMA topology and resource usage. It will attempt to locate processes for efficient NUMA locality and affinity, dynamically adjusting to changing system condi‐
       tions.  Numad also provides guidance to assist management applications with initial manual binding of CPU and memory resources for their processes.  Note that numad is primarily intended for  server
       consolidation  environments,  where  there might be multiple applications or multiple virtual guests running on the same server system.  Numad is most likely to have a positive effect when processes
       can be localized in a subset of the system's NUMA nodes.  If the entire system is dedicated to a large in-memory database application, for example -- especially if memory accesses will likely remain
       unpredictable -- numad will probably not improve performance.

OPTIONS
       -C <0|1>
              This  option  controls  whether  or  not  numad  treats  inactive  file cache as available memory. By default, numad assumes it can count inactive file cache as "free" memory when considering
              resources to match with processes.  Specify -C 0 if numad should instead consider inactive file cache as a consumed resource.

       -d     Debug output in log, sets the log level to LOG_DEBUG.  Same effect as -l 7.

       -h     Display usage help information and then exit.

       -H  <THP_scan_sleep_ms>
              Set the desired transparent hugepage scan interval in ms.  The /sys/kernel/mm/tranparent_hugepage/khugepaged/scan_sleep_millisecs tunable is usually set to 10000ms by  the  operating  system.
              The  default  is changed by numad to be 1000ms since it is helpful for the hugepage daemon to be more aggressive when memory moves between nodes.  Specifying (-H 0) will cause numad to retain
              the system default value.  You can also make the hugepage daemon more or less aggressive by specifying an alternate value with this option.  For example, setting this value to 100ms (-H  100)
              might improve the performance of workloads which use many transparent hugepages.

       -i <[min_interval:]max_interval>
              Sets  the  time interval that numad waits between system scans, in seconds to <max_interval>. Default <max_interval> is 15 seconds, default <min_interval> is 5 seconds.  Setting a <max_inter‐
              val> of zero will cause the daemon to exit.  (This is the normal mechanism to terminate the daemon.)  A bigger <max_interval> will decrease numad overhead but also decrease responsiveness  to
              changing loads.  The default numad max_interval can be changed in the numad.conf file.

       -K <0|1>
              This option controls whether numad keeps interleaved memory spread across NUMA nodes, or attempts to merge interleaved memory to local NUMA nodes.  The default is to merge interleaved memory.
              This is the appropriate setting to localize processes in a subset of the system's NUMA nodes.  If you are running a  large,  single-instance  application  that  allocates  interleaved  memory
              because  the  workload  will  have continuous unpredictable memory access patterns (e.g. a large in-memory database), you might get better results by specifying -K 1 to instruct numad to keep
              interleaved memory distributed.

       -l <log_level>
              Sets the log level to <log_level>.  Reasonable choices are 5, 6, or 7.  The default value is 5.  Note that CPU values are scaled by a factor of 100 internally and  in  the  numad  log  files.
              Unfortunately, you don't actually have that many CPUs.

       -m  <target_memory_locality>
              Set  the  desired  memory  locality  threshold  to  stop moving process memory.  Numad might stop retrying to coalesce process memory when more than this percentage of the process's memory is
              already localized in the target node(s).  The default is 90%. Numad will frequently localize more than the localization threshold percent, but it will not necessarily  do  so.   Decrease  the
              threshold to allow numad to leave more process memory distributed on various nodes.  Increase the threshold to instruct numad to try to localize more memory.  Acceptable values are between 50
              and 100 percent.  Note that setting the target memory locality to 100% might cause numad to continually retry to move memory that the kernel will never succesfully move.

       -p <PID>
              Add PID to explicit inclusion list of processes to consider for managing, if the process also uses significant resources.  Multiple -p PID options can be specified at daemon start, but  after
              daemon start, only one PID can be added to the inclusion list per subsequent numad invocation.  Use with -S to precisely control the scope of processes numad can manage.  Note that the speci‐
              fied process will not necessarily be actively managed unless it also meets numad's significance threshold -- which is currently 300MB and half of a CPU.

       -r <PID>
              Remove PID from both the explicit inclusion and the exclusion lists of processes.  After daemon start, only one PID can be removed from the explicit process lists per subsequent numad invoca‐
              tion.  Use with -S and -p and -x to precisely control the scope of processes numad can manage.

       -R <CPU_LIST>
              Specify a list of CPUs that numad should assume are reserved for non-numad use.  No processes will be bound to the specified CPUs by numad.  This option is effective only when starting numad.
              You cannot change reserved CPUs dynamically while numad is already running.

       -S <0|1>
              This option controls whether numad scans all system processes or only the processes on the explicit inclusion PID list.  The default is to scan all processes.  Use  -S  0  to  scan  only  the
              explicit inclusion PID list.  Use -S 1 to again scan all system processes (excepting those on the explicit exclusion list).  Starting numad as
              numad -S 0 -p <PID-1> -p <PID-2> -p <PID-3>
              will limit scanning, and thus also automatic NUMA management, to only those three explicitly specified processes.

       -t  <logical_CPU_percent>
              Specify  the  resource value of logical CPUs.  Hardware threads typically share most core resources, and so logical CPUs add only a fraction of CPU power for many workloads.  By default numad
              considers logical CPUs to be only 20 percent of a dedicated hardware core.

       -u  <target_utilization>
              Set the desired maximum consumption percentage of a node. Default is 85%.  Decrease the target value to maintain more available resource margin on each node.  Increase  the  target  value  to
              more  exhaustively  consume  node resources.  If you have sized your workloads to precisely fit inside a NUMA node, specifying (-u 100) might improve system performance by telling numad to go
              ahead and consume all the resources in each node.  It is possible to specify values up to 130 percent to oversubscribe CPUs in the nodes, but memory utilization is always capped at 100%.  Use
              oversubscription values very carefully.

       -v     Verbose output in log, sets the log level to LOG_INFO.  Same effect as -l 6.

       -V     Display version information and exit.

       -w <NCPUS[:MB]>
              Queries  numad  for the best NUMA nodes to bind an entity that needs <NCPUS>.  The amount of memory (in MBs) is optional, but should normally be specified as well <:MB> so numad can recommend
              NUMA nodes with available CPU capacity and adequate free memory.  This query option can be used regardless of whether numad is running as a daemon.  (An  invocation  using  this  option  when
              numad  is not running as a daemon, will not cause the daemon to start.) Output of this option is a string that contains a NUMA node list.  For example: 2-3,6.  The recommended node list could
              be saved in a shell variable (e.g., NODES) and then used as the node list parameter in a
              numactl -m $NODES -N $NODES ...
              command.  See numactl(8).

       -x <PID>
              Add PID to explicit exclusion list of processes to blacklist from managing.  Multiple -x PID options can be specified at daemon start, but after daemon start, only one PID can be added to the
              exclusion list per subsequent numad invocation.  Use with -S to precisely control the scope of processes numad can manage.

FILES
       /usr/bin/numad
       /etc/numad.conf
       /var/log/numad.log
       /var/run/numad.pid

ENVIRONMENT VARIABLES
       None.

EXAMPLES
       Numad can be run as a system daemon and can be managed by the standard init mechanisms of the host.

       If interactive (manual) control is desired, you can start the daemon manually by typing:

       /usr/bin/numad

       Subsequent numad invocations while the daemon is running can be used to dynamically change most run-time options.

       You can terminate numad from running by typing:

       /usr/bin/numad -i0

AUTHORS
       Bill Gray <bgray@redhat.com>

SEE ALSO
       numactl(8)



Bill Gray                                                                                           1.0.0                                                                                            numad(8)
